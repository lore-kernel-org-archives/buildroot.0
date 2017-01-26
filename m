From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 26 Jan 2017 07:36:07 +0200
Subject: [Buildroot] [PATCH 3/4] rpi-firmware: remove mkknlimg
In-Reply-To: <50eb8d771ad78ed54338e29b393808d251366102.1485408968.git.baruch@tkos.co.il>
References: <50eb8d771ad78ed54338e29b393808d251366102.1485408968.git.baruch@tkos.co.il>
Message-ID: <2668c6510e9a426778c5ae241bc5769c810435e8.1485408968.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This kernel marking script is no longer used.

Remove build for host as well, since it's only use was to install mkknlimg.

Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/rpi-firmware/mkknlimg        | 299 -----------------------------------
 package/rpi-firmware/rpi-firmware.mk |  11 --
 2 files changed, 310 deletions(-)
 delete mode 100644 package/rpi-firmware/mkknlimg

diff --git a/package/rpi-firmware/mkknlimg b/package/rpi-firmware/mkknlimg
deleted file mode 100644
index 33f81874bf1c..000000000000
--- a/package/rpi-firmware/mkknlimg
+++ /dev/null
@@ -1,299 +0,0 @@
-#!/usr/bin/env perl
-#
-# Originaly from: https://github.com/raspberrypi/tools/blob/master/mkimage/mkknlimg
-# Original cset : f5642106425d430e1f82ee064121a5fd0e05a386
-#
-# ----------------------------------------------------------------------
-# mkknlimg by Phil Elwell for Raspberry Pi
-# based on extract-ikconfig by Dick Streefland
-#
-# (c) 2009,2010 Dick Streefland <dick@streefland.net>
-# (c) 2014,2015 Raspberry Pi (Trading) Limited <info@raspberrypi.org>
-#
-# Licensed under the terms of the GNU General Public License.
-# ----------------------------------------------------------------------
-
-use strict;
-use warnings;
-use integer;
-
-use constant FLAG_PI   => 1;
-use constant FLAG_DTOK => 2;
-use constant FLAG_DDTK => 4;
-use constant FLAG_283X => 8;
-
-my $trailer_magic = 'RPTL';
-
-my $tmpfile1 = "/tmp/mkknlimg_$$.1";
-my $tmpfile2 = "/tmp/mkknlimg_$$.2";
-
-my $dtok = 0;
-my $ddtk = 0;
-my $is_283x = 0;
-
-while (@ARGV && ($ARGV[0] =~ /^-/))
-{
-    my $arg = shift(@ARGV);
-    if ($arg eq '--dtok')
-    {
-	$dtok = 1;
-    }
-    elsif ($arg eq '--ddtk')
-    {
-	$ddtk = 1;
-    }
-    elsif ($arg eq '--283x')
-    {
-	$is_283x = 1;
-    }
-    else
-    {
-	print ("* Unknown option '$arg'\n");
-	usage();
-    }
-}
-
-usage() if (@ARGV != 2);
-
-my $kernel_file = $ARGV[0];
-my $out_file = $ARGV[1];
-
-if (! -r $kernel_file)
-{
-    print ("* File '$kernel_file' not found\n");
-    usage();
-}
-
-my $wanted_configs =
-{
-	'CONFIG_BCM2708_DT' => FLAG_PI | FLAG_DTOK,
-	'CONFIG_ARCH_BCM2835' => FLAG_PI | FLAG_DTOK | FLAG_283X,
-};
-
-my $wanted_strings =
-{
-	'bcm2708_fb' => FLAG_PI,
-	'brcm,bcm2835-mmc' => FLAG_PI,
-	'brcm,bcm2835-sdhost' => FLAG_PI,
-	'brcm,bcm2708-pinctrl' => FLAG_PI | FLAG_DTOK,
-	'brcm,bcm2835-gpio' => FLAG_PI | FLAG_DTOK,
-	'brcm,bcm2835-pm-wdt' => FLAG_PI | FLAG_DTOK | FLAG_283X,
-	'of_overlay_apply' => FLAG_DTOK | FLAG_DDTK,
-};
-
-my $res = try_extract($kernel_file, $tmpfile1);
-$res ||= try_decompress('\037\213\010', 'xy',    'gunzip', 0,
-			$kernel_file, $tmpfile1, $tmpfile2);
-$res ||= try_decompress('\3757zXZ\000', 'abcde', 'unxz --single-stream', -1,
-			$kernel_file, $tmpfile1, $tmpfile2);
-$res ||= try_decompress('BZh',          'xy',    'bunzip2', 0,
-			$kernel_file, $tmpfile1, $tmpfile2);
-$res ||= try_decompress('\135\0\0\0',   'xxx',   'unlzma', 0,
-			$kernel_file, $tmpfile1, $tmpfile2);
-$res ||= try_decompress('\211\114\132', 'xy',    'lzop -d', 0,
-			$kernel_file, $tmpfile1, $tmpfile2);
-$res ||= try_decompress('\002\041\114\030', 'xy',    'lz4 -d', 1,
-			$kernel_file, $tmpfile1, $tmpfile2);
-
-my $append_trailer;
-my $trailer;
-my $kver = '?';
-
-$append_trailer = $dtok;
-
-if ($res)
-{
-    $kver = $res->{'kver'} || '?';
-    my $flags = $res->{'flags'};
-    print("Version: $kver\n");
-
-    if ($flags & FLAG_PI)
-    {
-	$append_trailer = 1;
-	$dtok ||= ($flags & FLAG_DTOK) != 0;
-	$is_283x ||= ($flags & FLAG_283X) != 0;
-	$ddtk ||= ($flags & FLAG_DDTK) != 0;
-    }
-    else
-    {
-	print ("* This doesn't look like a Raspberry Pi kernel. In pass-through mode.\n");
-    }
-}
-elsif (!$dtok)
-{
-    print ("* Is this a valid kernel? In pass-through mode.\n");
-}
-
-if ($append_trailer)
-{
-    printf("DT: %s\n", $dtok ? "y" : "n");
-    printf("DDT: %s\n", $ddtk ? "y" : "n");
-    printf("283x: %s\n", $is_283x ? "y" : "n");
-
-    my @atoms;
-
-    push @atoms, [ $trailer_magic, pack('V', 0) ];
-    push @atoms, [ 'KVer', $kver ];
-    push @atoms, [ 'DTOK', pack('V', $dtok) ];
-    push @atoms, [ 'DDTK', pack('V', $ddtk) ];
-    push @atoms, [ '283x', pack('V', $is_283x) ];
-
-    $trailer = pack_trailer(\@atoms);
-    $atoms[0]->[1] = pack('V', length($trailer));
-
-    $trailer = pack_trailer(\@atoms);
-}
-
-my $ofh;
-my $total_len = 0;
-
-if ($out_file eq $kernel_file)
-{
-    die "* Failed to open '$out_file' for append\n"
-	if (!open($ofh, '>>', $out_file));
-    $total_len = tell($ofh);
-}
-else
-{
-    die "* Failed to open '$kernel_file'\n"
-	if (!open(my $ifh, '<', $kernel_file));
-    die "* Failed to create '$out_file'\n"
-	if (!open($ofh, '>', $out_file));
-
-    my $copybuf;
-    while (1)
-    {
-	my $bytes = sysread($ifh, $copybuf, 64*1024);
-	last if (!$bytes);
-	syswrite($ofh, $copybuf, $bytes);
-	$total_len += $bytes;
-    }
-    close($ifh);
-}
-
-if ($trailer)
-{
-    # Pad to word-alignment
-    syswrite($ofh, "\x000\x000\x000", (-$total_len & 0x3));
-    syswrite($ofh, $trailer);
-}
-
-close($ofh);
-
-exit($trailer ? 0 : 1);
-
-END {
-	unlink($tmpfile1) if ($tmpfile1);
-	unlink($tmpfile2) if ($tmpfile2);
-}
-
-
-sub usage
-{
-	print ("Usage: mkknlimg [--dtok] [--283x] <vmlinux|zImage|bzImage> <outfile>\n");
-	exit(1);
-}
-
-sub try_extract
-{
-	my ($knl, $tmp) = @_;
-
-	my $ver = `strings "$knl" | grep -a -E "^Linux version [1-9]"`;
-
-	return undef if (!$ver);
-
-	chomp($ver);
-
-	my $res = { 'kver'=>$ver };
-	$res->{'flags'} = strings_to_flags($knl, $wanted_strings) |
-			  configs_to_flags($knl, $tmp, $wanted_configs);
-
-	return $res;
-}
-
-
-sub try_decompress
-{
-	my ($magic, $subst, $zcat, $idx, $knl, $tmp1, $tmp2) = @_;
-
-	my $pos = `tr "$magic\n$subst" "\n$subst=" < "$knl" | grep -abo "^$subst"`;
-	if ($pos)
-	{
-		chomp($pos);
-		$pos = (split(/[\r\n]+/, $pos))[$idx];
-		return undef if (!defined($pos));
-		$pos =~ s/:.*[\r\n]*$//s;
-		my $cmd = "tail -c+$pos \"$knl\" | $zcat > $tmp2 2> /dev/null";
-		my $err = (system($cmd) >> 8);
-		return undef if (($err != 0) && ($err != 2));
-
-		return try_extract($tmp2, $tmp1);
-	}
-
-	return undef;
-}
-
-
-sub strings_to_flags
-{
-	my ($knl, $strings) = @_;
-	my $string_pattern = '^('.join('|', keys(%$strings)).')$';
-	my $flags = 0;
-
-	my @matches = `strings \"$knl\" | grep -E \"$string_pattern\"`;
-	foreach my $match (@matches)
-	{
-	    chomp($match);
-	    $flags |= $strings->{$match};
-	}
-
-	return $flags;
-}
-
-sub configs_to_flags
-{
-	my ($knl, $tmp, $configs) = @_;
-	my $config_pattern = '^('.join('|', keys(%$configs)).')=(.*)$';
-	my $cf1 = 'IKCFG_ST\037\213\010';
-	my $cf2 = '0123456789';
-	my $flags = 0;
-
-	my $pos = `tr "$cf1\n$cf2" "\n$cf2=" < "$knl" | grep -abo "^$cf2"`;
-	if ($pos)
-	{
-		$pos =~ s/:.*[\r\n]*$//s;
-		$pos += 8;
-		my $err = (system("tail -c+$pos \"$knl\" | zcat > $tmp 2> /dev/null") >> 8);
-		if (($err == 0) || ($err == 2))
-		{
-			if (open(my $fh, '<', $tmp))
-			{
-				while (my $line = <$fh>)
-				{
-					chomp($line);
-					if (($line =~ /$config_pattern/) &&
-					    (($2 eq 'y') || ($2 eq 'm')))
-					{
-					    $flags |= $configs->{$1};
-					}
-				}
-
-				close($fh);
-			}
-		}
-	}
-
-	return $flags;
-}
-
-sub pack_trailer
-{
-	my ($atoms) = @_;
-	my $trailer = pack('VV', 0, 0);
-	for (my $i = $#$atoms; $i>=0; $i--)
-	{
-		my $atom = $atoms->[$i];
-		$trailer .= pack('a*x!4Va4', $atom->[1], length($atom->[1]), $atom->[0]);
-	}
-	return $trailer;
-}
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 2fd51d01873a..f46da4a9bd19 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -10,8 +10,6 @@ RPI_FIRMWARE_LICENSE = BSD-3c
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
 RPI_FIRMWARE_INSTALL_IMAGES = YES
 
-RPI_FIRMWARE_DEPENDENCIES += host-rpi-firmware
-
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS),y)
 define RPI_FIRMWARE_INSTALL_DTB
 	$(INSTALL) -D -m 0644 $(@D)/boot/bcm2708-rpi-b.dtb $(BINARIES_DIR)/rpi-firmware/bcm2708-rpi-b.dtb
@@ -46,13 +44,4 @@ define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
 endef
 
-# We have no host sources to get, since we already
-# bundle the script we want to install.
-HOST_RPI_FIRMWARE_SOURCE =
-
-define HOST_RPI_FIRMWARE_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 package/rpi-firmware/mkknlimg $(HOST_DIR)/usr/bin/mkknlimg
-endef
-
 $(eval $(generic-package))
-$(eval $(host-generic-package))
-- 
2.11.0
