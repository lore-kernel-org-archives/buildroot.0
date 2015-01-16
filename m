From: Steve Kenton <skenton@ou.edu>
Date: Fri, 16 Jan 2015 12:13:20 -0600
Subject: [Buildroot] [PATCH] mjpegtools: new package
Message-ID: <54B954C0.4010503@ou.edu>
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
Build tested with both uClibc and glibc against last nights snapshot

Every buildroot patch I generate turns out to be a learning experience
So, let's see what I don't know this time ...

Finding the higher level dependencies is still beyond me, so I think
I'll concentrate on learning to use git as a next step. Thanks for
all the help getting these packages in shape. Obviously I'm working
on multi-media stuff. If there is a wish list for other related
packages let me know and I'll try and work them up for submission.

diff -pruN buildroot.ori/package/Config.in buildroot/package/Config.in
--- buildroot.ori/package/Config.in	2015-01-15 02:41:42.000000000 -0600
+++ buildroot/package/Config.in	2015-01-16 11:37:56.681909014 -0600
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
