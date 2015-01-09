From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  9 Jan 2015 23:46:19 +0100
Subject: [Buildroot] [PATCH 1/5 v2] package/rpi-firmware: add DT-aware
	marking script
In-Reply-To: <cover.1420843412.git.yann.morin.1998@free.fr>
References: <cover.1420843412.git.yann.morin.1998@free.fr>
Message-ID: <229e6ff3973e6e08dd3905bf6d6d35622e8d288d.1420843412.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Raspberry Pi can boot a kernel with device tree support. But at the
same time, the RPi folks wante to keep the old-fashioned, ATAG-based way
of booting (don't ask...).

So, the bootloader needs to know whether the kernel it is loading has DT
support or not. For that, it looks at the end of the kernel image for a
magic footer. If found, it loads a device tree and sets the registers
appropriately so that the kernel finds the DTB. If not found, it loads
the kernel with the traditional ATAGS.

Where it becomes a bit tricky, is that the DTB is different for models
A/B and A+/B+ (that is A and B use the same DTB, while the A+ and B+ use
a second DTB). The bootloader is capable to load the correct DTB from a
specially named file. That is:
  - on A/B, it loads bcm2708-rpi-b.dtb
  - on A+/B+, it loads bcm2708-rpi-b-plus.dtb

If the DTB is differently named, the bootloader won't find it, will not
load any DTB at all, and revert to booting with ATAGS.

It is possible to specify what DTB to load, by adding an new config
option 'device_tree=file.dtb' in config.txt, but then the firmware on
the SDcard is no longer bootable on both the original models and the
Plus models.

So, add a script that appends the appropriate footer to the kernel
image. The script is vampirised from the RPi's tools repository, but a
new package is *not* added just for that script: the whole repository is
300+ MiB, and a checkout is 600+ MiB; it is not pertinent to add this as
a new package for a script that weights a few KiB...

Install that script as a host utility, too.

Notes: lots of information is available in this thread on the RPi forums:
    http://www.raspberrypi.org/forums/viewtopic.php?f=29&t=93015

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/rpi-firmware/mkknlimg        | 227 +++++++++++++++++++++++++++++++++++
 package/rpi-firmware/rpi-firmware.mk |  10 ++
 2 files changed, 237 insertions(+)
 create mode 100755 package/rpi-firmware/mkknlimg

diff --git a/package/rpi-firmware/mkknlimg b/package/rpi-firmware/mkknlimg
new file mode 100755
index 0000000..f377947
--- /dev/null
+++ b/package/rpi-firmware/mkknlimg
@@ -0,0 +1,227 @@
+#!/usr/bin/env perl
+#
+# Originaly from: https://github.com/raspberrypi/tools/blob/master/mkimage/mkknlimg
+# Original cset : 92a2df13b887f4799554bf92c4fc78d53668c868
+
+use strict;
+use integer;
+
+my $trailer_magic = 'RPTL';
+
+my $tmpfile1 = "/tmp/mkknlimg_$$.1";
+my $tmpfile2 = "/tmp/mkknlimg_$$.2";
+
+my $dtok = 0;
+
+while ($ARGV[0] =~ /^-/)
+{
+    my $arg = shift(@ARGV);
+    if ($arg eq '--dtok')
+    {
+	$dtok = 1;
+    }
+    else
+    {
+	print ("* Unknown option '$arg'\n");
+	usage();
+    }
+}
+
+usage() if (@ARGV != 2);
+
+my $kernel_file = $ARGV[0];
+my $out_file = $ARGV[1];
+
+my @wanted_config_lines =
+(
+	'CONFIG_BCM2708_DT'
+);
+
+my @wanted_strings =
+(
+	'bcm2708_fb',
+	'brcm,bcm2708-pinctrl',
+	'brcm,bcm2835-gpio',
+	'of_find_property'
+);
+
+my $res = try_extract($kernel_file, $tmpfile1);
+
+$res = try_decompress('\037\213\010', 'xy',    'gunzip', 0,
+		      $kernel_file, $tmpfile1, $tmpfile2) if (!$res);
+$res = try_decompress('\3757zXZ\000', 'abcde', 'unxz --single-stream', -1,
+		      $kernel_file, $tmpfile1, $tmpfile2) if (!$res);
+$res = try_decompress('BZh',          'xy',    'bunzip2', 0,
+		      $kernel_file, $tmpfile1, $tmpfile2) if (!$res);
+$res = try_decompress('\135\0\0\0',   'xxx',   'unlzma', 0,
+		      $kernel_file, $tmpfile1, $tmpfile2) if (!$res);
+$res = try_decompress('\211\114\132', 'xy',    'lzop -d', 0,
+		      $kernel_file, $tmpfile1, $tmpfile2) if (!$res);
+
+my $append_trailer;
+my $trailer;
+
+if ($res)
+{
+    print("Version: $res->{''}\n");
+
+    $append_trailer = $dtok;
+    if (!$dtok)
+    {
+	if (config_bool($res, 'bcm2708_fb'))
+	{
+	    $dtok ||= config_bool($res, 'CONFIG_BCM2708_DT');
+	    $dtok ||= config_bool($res, 'brcm,bcm2708-pinctrl');
+	    $dtok ||= config_bool($res, 'brcm,bcm2835-gpio');
+	    $append_trailer = 1;
+	}
+	else
+	{
+	    print ("* This doesn't look like a Raspberry Pi kernel. In pass-through mode.\n");
+	}
+    }
+}
+else
+{
+    print ("* Is this a valid kernel? In pass-through mode.\n");
+}
+
+if ($append_trailer)
+{
+    printf("DT: %s\n", $dtok ? "y" : "n");
+
+    my @atoms;
+
+    push @atoms, [ $trailer_magic, pack('V', 0) ];
+    push @atoms, [ 'KVer', $res->{''} ];
+    push @atoms, [ 'DTOK', pack('V', $dtok) ];
+
+    $trailer = pack_trailer(\@atoms);
+    $atoms[0]->[1] = pack('V', length($trailer));
+
+    $trailer = pack_trailer(\@atoms);
+}
+
+die "* Failed to open '$kernel_file'\n" if (!open(my $ifh, '<', $kernel_file));
+die "* Failed to create '$out_file'\n" if (!open(my $ofh, '>', $out_file));
+
+my $copybuf;
+my $total_len = 0;
+while (1)
+{
+	my $bytes = sysread($ifh, $copybuf, 64*1024);
+	last if (!$bytes);
+	syswrite($ofh, $copybuf, $bytes);
+	$total_len += $bytes;
+}
+
+if ($trailer)
+{
+    # Pad to word-alignment
+    syswrite($ofh, "\x000\x000\x000", (-$total_len & 0x3));
+    syswrite($ofh, $trailer);
+}
+
+close($ifh);
+close($ofh);
+
+exit($trailer ? 0 : 1);
+
+END {
+	unlink($tmpfile1) if ($tmpfile1);
+	unlink($tmpfile2) if ($tmpfile2);
+}
+
+
+sub usage
+{
+	print ("Usage: mkknlimg [--dtok] <vmlinux|zImage|bzImage> <outfile>\n");
+	exit(1);
+}
+
+sub try_extract
+{
+	my ($knl, $tmp) = @_;
+
+	my $ver = `strings "$knl" | grep -a -E "^Linux version [1-9]"`;
+
+	return undef if (!$ver);
+
+	chomp($ver);
+
+	my $res = { ''=>$ver };
+	my $string_pattern = '^('.join('|', @wanted_strings).')$';
+
+	my @matches = `strings \"$knl\" | grep -E \"$string_pattern\"`;
+	foreach my $match (@matches)
+	{
+	    chomp($match);
+	    $res->{$match} = 1;
+	}
+
+	my $config_pattern = '^('.join('|', @wanted_config_lines).')=(.*)$';
+	my $cf1 = 'IKCFG_ST\037\213\010';
+	my $cf2 = '0123456789';
+
+	my $pos = `tr "$cf1\n$cf2" "\n$cf2=" < "$knl" | grep -abo "^$cf2"`;
+	if ($pos)
+	{
+		$pos =~ s/:.*[\r\n]*$//s;
+		$pos += 8;
+		my $err = (system("tail -c+$pos \"$knl\" | zcat > $tmp 2> /dev/null") >> 8);
+		if (($err == 0) || ($err == 2))
+		{
+			if (open(my $fh, '<', $tmp))
+			{
+				while (my $line = <$fh>)
+				{
+					chomp($line);
+					$res->{$1} = $2 if ($line =~ /$config_pattern/);
+				}
+
+				close($fh);
+			}
+		}
+	}
+
+	return $res;
+}
+
+
+sub try_decompress
+{
+	my ($magic, $subst, $zcat, $idx, $knl, $tmp1, $tmp2) = @_;
+
+	my $pos = `tr "$magic\n$subst" "\n$subst=" < "$knl" | grep -abo "^$subst"`;
+	if ($pos)
+	{
+		chomp($pos);
+		$pos = (split(/[\r\n]+/, $pos))[$idx];
+		$pos =~ s/:.*[\r\n]*$//s;
+		my $cmd = "tail -c+$pos \"$knl\" | $zcat > $tmp2 2> /dev/null";
+		my $err = (system($cmd) >> 8);
+		return undef if (($err != 0) && ($err != 2));
+
+		return try_extract($tmp2, $tmp1);
+	}
+
+	return undef;
+}
+
+sub pack_trailer
+{
+	my ($atoms) = @_;
+	my $trailer = pack('VV', 0, 0);
+	for (my $i = $#$atoms; $i>=0; $i--)
+	{
+		my $atom = $atoms->[$i];
+		$trailer .= pack('a*x!4Va4', $atom->[1], length($atom->[1]), $atom->[0]);
+	}
+	return $trailer;
+}
+
+sub config_bool
+{
+	my ($configs, $wanted) = @_;
+	return (($configs->{$wanted} eq 'y') || ($configs->{$wanted} eq '1'));
+}
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 571a546..eb835ee 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -19,4 +19,14 @@ define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
 	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
 endef
 
+# We have no host sources to get, since we already
+# bundle the script we want to install.
+HOST_RPI_FIRMWARE_SOURCE =
+HOST_RPI_FIRMWARE_DEPENDENCIES =
+
+define HOST_RPI_FIRMWARE_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 package/rpi-firmware/mkknlimg $(HOST_DIR)/usr/bin/mkknlimg
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.9.1
