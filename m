From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 7 Oct 2010 16:00:41 +0200
Subject: [Buildroot] [git commit master 1/1] package: add gst-ffmpeg
Message-ID: <20101007140137.03A6D8BE96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=55cc1fd5510fbf70ba5433f70c15c02e1c0de1a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ffmpeg plugin for gstreamer.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                     |    2 +-
 package/multimedia/Config.in                |    1 +
 package/multimedia/gst-ffmpeg/Config.in     |   16 ++++++++++++++++
 package/multimedia/gst-ffmpeg/gst-ffmpeg.mk |   18 ++++++++++++++++++
 4 files changed, 36 insertions(+), 1 deletions(-)
 create mode 100644 package/multimedia/gst-ffmpeg/Config.in
 create mode 100644 package/multimedia/gst-ffmpeg/gst-ffmpeg.mk

diff --git a/CHANGES b/CHANGES
index c96bc4d..41406b8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -21,7 +21,7 @@
 
 	Alpha, Cris, IA64 and Sparc64 architecture support removed.
 
-	New packages: libmpeg2, librsvg, xz
+	New packages: gst-ffmpeg, libmpeg2, librsvg, xz
 
 	Updated/fixed packages: acpid, alsa-lib, argus, at, autoconf,
 	automake, avahi, axel, beecrypt, berkeleydb, bind, bmon, boa,
diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 91def57..da50dbb 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -5,6 +5,7 @@ source "package/multimedia/aumix/Config.in"
 source "package/multimedia/flac/Config.in"
 source "package/multimedia/ffmpeg/Config.in"
 source "package/multimedia/gstreamer/Config.in"
+source "package/multimedia/gst-ffmpeg/Config.in"
 source "package/multimedia/gst-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
diff --git a/package/multimedia/gst-ffmpeg/Config.in b/package/multimedia/gst-ffmpeg/Config.in
new file mode 100644
index 0000000..f5d01b9
--- /dev/null
+++ b/package/multimedia/gst-ffmpeg/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_GST_FFMPEG
+	bool "gst-ffmpeg"
+	depends on BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_GST_PLUGINS_BASE
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_GPL
+	select BR2_PACKAGE_FFMPEG_POSTPROC
+	select BR2_PACKAGE_FFMPEG_SWSCALE
+	depends on BR2_LARGEFILE
+	help
+	  GStreamer plugin using FFmpeg.
+
+	  http://gstreamer.freedesktop.org/
+
+comment "gst-ffmpeg requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
new file mode 100644
index 0000000..557c146
--- /dev/null
+++ b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# gst-ffmpeg
+#
+#############################################################
+GST_FFMPEG_VERSION = 0.10.9
+GST_FFMPEG_SOURCE = gst-ffmpeg-$(GST_FFMPEG_VERSION).tar.bz2
+GST_FFMPEG_SITE = http://gstreamer.freedesktop.org/src/gst-ffmpeg
+GST_FFMPEG_INSTALL_STAGING = YES
+GST_FFMPEG_LIBTOOL_PATCH = NO
+GST_FFMPEG_DEPENDENCIES = gstreamer gst-plugins-base ffmpeg
+GST_FFMPEG_CONF_OPT = --with-system-ffmpeg
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+GST_FFMPEG_DEPENDENCIES += bzip2
+endif
+
+$(eval $(call AUTOTARGETS,package/multimedia,gst-ffmpeg))
-- 
1.7.1
