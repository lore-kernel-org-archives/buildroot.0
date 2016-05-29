From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 May 2016 14:38:57 +0200
Subject: [Buildroot] [PATCH 1/2] package/gstreamer/gst-ffmpeg: needs gcc >=
	5.x on SuperH
Message-ID: <1464525538-27915-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Compilation triggers an ICE in gcc with gcc <= 4.9 using this defconfig

BR2_sh=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PACKAGE_GSTREAMER=y
BR2_PACKAGE_GST_FFMPEG=y
BR2_PACKAGE_GST_FFMPEG_GPL=y

The problem is known upstream, a fix was never committed to gcc <= 4.9:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=65151

Compiling gst-ffmpeg with gcc5 works fine using this defconfig:

BR2_sh=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_GCC_VERSION_5_X=y
BR2_PACKAGE_GSTREAMER=y
BR2_PACKAGE_GST_FFMPEG=y
BR2_PACKAGE_GST_FFMPEG_GPL=y

This patch adds a dependency to gcc >= 5.x to fix the problem as
suggested by Thomas:
http://lists.busybox.net/pipermail/buildroot/2016-February/152724.html

Fixes
http://autobuild.buildroot.net/results/939/939da0c7771ddd97c05cedc0a7afc0ad34a21312/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gstreamer/gst-ffmpeg/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gstreamer/gst-ffmpeg/Config.in b/package/gstreamer/gst-ffmpeg/Config.in
index 004ec1c..15dc721 100644
--- a/package/gstreamer/gst-ffmpeg/Config.in
+++ b/package/gstreamer/gst-ffmpeg/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_GST_FFMPEG
 	# doesn't have support for MIPS R6.
 	depends on !BR2_mips_32r6 && !BR2_mips_64r6
 	select BR2_PACKAGE_GST_PLUGINS_BASE
+	depends on !BR2_sh || (BR2_TOOLCHAIN_GCC_AT_LEAST_5 && BR2_sh)
 	help
 	  GStreamer plugin containing one plugin with a set of elements using
 	  the Libav library. It contains most popular decoders as well as
@@ -23,3 +24,6 @@ config BR2_PACKAGE_GST_FFMPEG_GPL
 	  be under GPL.
 
 endif
+
+comment "gst-ffmpeg needs a toolchain w/ gcc >= 5"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5 && BR2_sh
-- 
2.8.1
