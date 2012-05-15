From: Ron Eggler <reggler@semiosbio.com>
Date: Tue, 15 May 2012 14:52:31 -0700
Subject: [Buildroot] (newbie question)
In-Reply-To: <4FB2CADD.9040001@mind.be>
References: <CAFC29aU6nfLkHpbs1mKhV13aVdtskqtKtCpURpzi-gQErviriQ@mail.gmail.com>
 <20120515224254.6bff263a@skate>
 <CAFC29aUwvGS-tsbLiCe7=7W1HZ0UZ409BMhf5Y73r289FSuNUA@mail.gmail.com>
 <4FB2CADD.9040001@mind.be>
Message-ID: <CAFC29aVzYKupB7RKHOL1kiUOC6C=ySGdO9XzGvG5FAvo4pnLkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 15, 2012 at 2:30 PM, Arnout Vandecappelle <arnout@mind.be>wrote:

> On 05/15/12 23:13, Ron Eggler wrote:
>
>> I've been trying to get some diff going with this commmand but somehow I
>> don't get a good result, why's that?
>> reg at desktop-reg:/usr/local/**src/E10-buildroot/br1202-main/**package$
>> diff -r ./ ../../../E10orig_clone/br1202-**main/package/
>>
>
>  See 'diff --help':
>
>  -N, --new-file                  treat absent files as empty
>
>  You also want the -u option to diff, that gives much more readable output.
> Also the -p option is very useful: it gives the current 'function' as
> context.
> In this case it doesn't matter, but it's good to know in general.  So:
>
> diff -Nrup . ../../....
>
>
>  Please remove the wview-5.20.2.tar.gz file first, though.
>

Why, that's my actual driver, for it I need to recompile with all the other
required packages added

Yep, Thanks Arnout! Looks much better:
diff -Nrup ./Config.in ../../../E10orig_clone/br1202-main/package/Config.in
--- ./Config.in 2012-05-15 13:00:29.803848668 -0700
+++ ../../../E10orig_clone/br1202-main/package/Config.in 2012-05-15
14:00:02.971941323 -0700
@@ -6,12 +6,6 @@ source "package/customize/Config.in"
 # Audio and video applications
 source "package/multimedia/Config.in"

-#WView
-source "package/radlib/Config.in"
-source "package/gd/Config.in"
-source "package/libreadline5/Config.in"
-source "package/wview/Config.in"
-
 menu "Compressors and decompressors"
 source "package/bzip2/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
@@ -225,8 +219,8 @@ source "package/ti-utils/Config.in"
 source "package/uboot-tools/Config.in"
 source "package/udev/Config.in"
 source "package/unionfs/Config.in"
-source "package/usb_\modeswitch/Config.in"
-source "package/usb_\modeswitch_data/Config.in"
+source "package/usb_modeswitch/Config.in"
+source "package/usb_modeswitch_data/Config.in"
 source "package/usbmount/Config.in"
 source "package/usbutils/Config.in"
 source "package/wipe/Config.in"
diff -Nrup ./gd/Config.in
../../../E10orig_clone/br1202-main/package/gd/Config.in
--- ./gd/Config.in 2012-05-15 09:43:49.631542682 -0700
+++ ../../../E10orig_clone/br1202-main/package/gd/Config.in 1969-12-31
16:00:00.000000000 -0800
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_GD
- bool "gd"
- help
-  gd is a prerequisite for the WView
-
-  https://bitbucket.org/pierrejoye/gd-libgd/
diff -Nrup ./gd/gdlib2 ../../../E10orig_clone/br1202-main/package/gd/gdlib2
--- ./gd/gdlib2 2012-05-15 09:41:49.439539566 -0700
+++ ../../../E10orig_clone/br1202-main/package/gd/gdlib2 1969-12-31
16:00:00.000000000 -0800
@@ -1,13 +0,0 @@
-#############################################################
-#
-# GD
-#
-#############################################################
-
-GD_VERSION = 2.0.33
-GD_SITE = https://bitbucket.org/pierrejoye/gd-libgd/get/
-
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
-
diff -Nrup ./libreadline5/Config.in
../../../E10orig_clone/br1202-main/package/libreadline5/Config.in
--- ./libreadline5/Config.in 2012-05-15 10:55:16.179653835 -0700
+++ ../../../E10orig_clone/br1202-main/package/libreadline5/Config.in
1969-12-31
16:00:00.000000000 -0800
@@ -1,6 +0,0 @@
-config BR2_LIBREADLINE5
- bool "libreadline5"
- help
-  libreadline5 is required by WView
-
-  http://mirror.anl.gov/pub/cygwin/release-legacy/readline/libreadline5/
diff -Nrup ./libreadline5/libreadline5.mk../../../E10orig_clone/br1202-main/package/libreadline5/
libreadline5.mk
--- ./libreadline5/libreadline5.mk 2012-05-15 10:57:54.035657928 -0700
+++ ../../../E10orig_clone/br1202-main/package/libreadline5/libreadline5.mk
1969-12-31
16:00:00.000000000 -0800
@@ -1,13 +0,0 @@
-#############################################################
-#
-# libreadline5
-#
-#############################################################
-
-RADLIB_VERSION = 4.3-5
-RADLIB_SITE =
http://mirror.anl.gov/pub/cygwin/release-legacy/readline/libreadline5/
-
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
-
diff -Nrup ./radlib/Config.in
../../../E10orig_clone/br1202-main/package/radlib/Config.in
--- ./radlib/Config.in 2012-05-14 14:41:50.842348693 -0700
+++ ../../../E10orig_clone/br1202-main/package/radlib/Config.in 1969-12-31
16:00:00.000000000 -0800
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_RADLIB
- bool "radlib"
- help
-  radlib is a prerequisite for the WView
-
-  http://www.radlib.teel.ws
diff -Nrup ./radlib/radlib.mk../../../E10orig_clone/br1202-main/package/radlib/
radlib.mk
--- ./radlib/radlib.mk 2012-05-14 15:10:06.646392668 -0700
+++ ../../../E10orig_clone/br1202-main/package/radlib/radlib.mk 1969-12-31
16:00:00.000000000 -0800
@@ -1,13 +0,0 @@
-#############################################################
-#
-# radlib
-#
-#############################################################
-
-RADLIB_VERSION = 2.12.0
-RADLIB_SITE =
http://downloads.sourceforge.net/project/radlib/radlib/radlib-2.12.0/
-
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
-
diff -Nrup ./wview/Config.in
../../../E10orig_clone/br1202-main/package/wview/Config.in
--- ./wview/Config.in 2012-05-15 11:04:37.639668394 -0700
+++ ../../../E10orig_clone/br1202-main/package/wview/Config.in 1969-12-31
16:00:00.000000000 -0800
@@ -1,6 +0,0 @@
-config BR2_WVIEW
- bool "vwiew"
- help
-  Driver for DAVIS weather station
-
-  http://www.wviewweather.com/
diff -Nrup ./wview/wview.mk../../../E10orig_clone/br1202-main/package/wview/
wview.mk
--- ./wview/wview.mk 2012-05-15 11:08:16.191674061 -0700
+++ ../../../E10orig_clone/br1202-main/package/wview/wview.mk 1969-12-31
16:00:00.000000000 -0800
@@ -1,13 +0,0 @@
-#############################################################
-#
-# WView
-#
-#############################################################
-
-WVIEW_VERSION = 5.20.2
-WVIEW_SITE =
http://sourceforge.net/projects/wview/files/wview/wview-5.20.2/
-WVIEW_DEPENCIES = libz libpng libreadline5 gawk sqlite libgd2 libusb radlib
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
-
Binary files ./wview-5.20.2.tar.gz and
../../../E10orig_clone/br1202-main/package/wview-5.20.2.tar.gz differ


 > BTW, is there anything wrong with the readline library and zlib library
already
> available in buildroot?

Not sure, just tried to follow the instructions I had from
http://www.wviewweather.com/release-notes/wview-User-Manual.html#Installation-build
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120515/dc4b87c5/attachment-0001.html>
