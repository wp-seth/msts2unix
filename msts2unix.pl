#!/usr/bin/perl
use warnings;
use strict;
use POSIX qw(strftime);
use DateTime::Format::Epoch::Unix qw( );

sub msTimeStamp2Unix_wtf{
	my ($lo, $hi) = unpack 'V2', $_[0];
	my $nanosecs =  $hi * 2**32 + $lo;
	return msTimeStamp2Unix($nanosecs);
}

sub msTimeStamp2Unix{
	return int($_[0]/1e7 - 11644473600); #  or 11644473601?
}

die "missing param" if @ARGV == 0;
my $unix_timestamp = msTimeStamp2Unix(@ARGV);
print "$unix_timestamp\n";
#print POSIX::strftime("%Y-%m-%d %H:%M:%S\n", localtime $unix_timestamp);
my $dt = DateTime::Format::Epoch::Unix->parse_datetime($unix_timestamp);
print $dt->strftime("%Y-%m-%d %H:%M:%S UTC\n");
