From: Steve Kenton <skenton@ou.edu>
Date: Sun, 18 Jan 2015 10:37:16 -0600
Subject: [Buildroot] [PATCH  V2] mjpegtools: new package
Message-ID: <54BBE13C.7000600@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mjpegtools programs are a set of tools
that can do recording of videos and playback,
simple cut-and-paste editing and the MPEG
compression of audio and video under Linux.

http://mjpeg.sourceforge.net

Signed-off-by Stephen M. Kenton <skenton@ou.edu>
---
V2 Added hash file
Build tested with both uClibc and glibc against last nights snapshot

diff -pruN buildroot.ori/package/Config.in buildroot/package/Config.in
--- buildroot.ori/package/Config.in	2015-01-16 15:37:56.000000000 -0600
+++ buildroot/package/Config.in	2015-01-18 10:33:32.020756992 -0600
@@ -19,6 +19,7 @@ menu "Audio and video applications"
 	source "package/lame/Config.in"
 	source "package/libvpx/Config.in"
 	source "package/madplay/Config.in"
+	source "package/mjpegtools/Config.in"
 	source "package/modplugtools/Config.in"
 	source "package/mpd/Config.in"
 	source "package/mpd-mpc/Config.in"
diff -pruN buildroot.ori/package/mjpegtools/Config.in buildroot/package/mjpegtools/Config.in
--- buildroot.ori/package/mjpegtools/Config.in	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/mjpegtools/Config.in	2015-01-16 11:05:54.949872151 -0600
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_MJPEGTOOLS
+	bool "mjpegtools"
+	select BR2_PACKAGE_JPEG
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  The mjpegtools programs are a set of tools
+	  that can do recording of videos and playback,
+	  simple cut-and-paste editing and the MPEG
+	  compression of audio and video under Linux.
+
+	  http://mjpeg.sourceforge.net
+
+comment "mjpegtools needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff -pruN buildroot.ori/package/mjpegtools/mjpegtools.hash buildroot/package/mjpegtools/mjpegtools.hash
--- buildroot.ori/package/mjpegtools/mjpegtools.hash	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/mjpegtools/mjpegtools.hash	2015-01-18 10:27:16.696749792 -0600
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/mjpeg/files/mjpegtools/2.1.0/
+md5	57bf5dd78976ca9bac972a6511b236f3	mjpegtools-2.1.0.tar.gz
+sha1	b9effa86280e23d67369e842e5cb645948583097	mjpegtools-2.1.0.tar.gz
diff -pruN buildroot.ori/package/mjpegtools/mjpegtools.mk buildroot/package/mjpegtools/mjpegtools.mk
--- buildroot.ori/package/mjpegtools/mjpegtools.mk	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/mjpegtools/mjpegtools.mk	2015-01-16 11:05:03.121871157 -0600
@@ -0,0 +1,13 @@
+###############################################################################
+#
+# mjpegtools
+#
+###############################################################################
+
+MJPEGTOOLS_VERSION = 2.1.0
+MJPEGTOOLS_SITE = http://sourceforge.net/projects/mjpeg/files/mjpegtools/$(MJPEGTOOLS_VERSION)
+MJPEGTOOLS_DEPENDENCIES = jpeg
+MJPEGTOOLS_LICENSE = GPLv2
+MJPEGTOOLS_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
