From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 Sep 2014 21:43:24 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: bump version
Message-ID: <20140909205923.B5F1D9D64B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=83e29f2656a237e2c300d523776868837d3bc646
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch is now upstream.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in      |   20 ++++++------
 .../gst1-plugins-bad-fix-dfb-example.patch         |   33 --------------------
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |   20 ++++++++++--
 3 files changed, 27 insertions(+), 46 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 054ed87..816de35 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -41,6 +41,16 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOFXBAD
 	help
 	  Audio filters plugin
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXER
+	bool "audiomixer"
+	help
+	  Audio mixer plugin
+
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR
+	bool "compositor"
+	help
+	  Video compositor plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOVISUALIZERS
 	bool "audiovisualizers"
 	help
@@ -332,10 +342,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BZ2
 	help
 	  Compress or decompress streams
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CDAUDIO
-	bool "cdaudio"
-	select BR2_PACKAGE_LIBCDAUDIO
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_CURL
 	bool "curl"
 	select BR2_PACKAGE_LIBCURL
@@ -464,12 +470,6 @@ comment "rsvg plugin needs a toolchain w/ C++, wchar, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_EGLGLES
-	bool "eglgles"
-	depends on BR2_PACKAGE_HAS_LIBEGL && BR2_PACKAGE_HAS_LIBGLES
-	help
-	  EGL/GLES sink
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDL
 	bool "sdl"
 	select BR2_PACKAGE_SDL
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad-fix-dfb-example.patch b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad-fix-dfb-example.patch
deleted file mode 100644
index b1f06ff..0000000
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad-fix-dfb-example.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-[PATCH] work around dfb-example build issue
-
-directfb.h defines a number of macros which conflicts with gst/gst.h:
-
-In file included from ../sysroot/usr/include/gstreamer-1.0/gst/gst.h:50:0,
-                 from dfb-example.c:4:
-../sysroot/usr/include/gstreamer-1.0/gst/gstinfo.h:295:69: error: expected ???)??? before ???__attribute__???
-../sysroot/usr/include/gstreamer-1.0/gst/gstinfo.h:295:69: error: expected ???,??? or ???;??? before ???)??? token
-
-As mentioned in the upstream bug report:
-
-https://bugzilla.gnome.org/show_bug.cgi?id=685609
-
-A workaround is to simply swap the include order around.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- ext/directfb/dfb-example.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: gst1-plugins-bad-1.2.1/ext/directfb/dfb-example.c
-===================================================================
---- gst1-plugins-bad-1.2.1.orig/ext/directfb/dfb-example.c
-+++ gst1-plugins-bad-1.2.1/ext/directfb/dfb-example.c
-@@ -1,7 +1,7 @@
- 
--#include <directfb.h>
- #include <stdio.h>
- #include <gst/gst.h>
-+#include <directfb.h>
- 
- static IDirectFB *dfb = NULL;
- static IDirectFBSurface *primary = NULL;
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index e7d265f..0e3e64b 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BAD_VERSION = 1.2.4
+GST1_PLUGINS_BAD_VERSION = 1.4.1
 GST1_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST1_PLUGINS_BAD_VERSION).tar.xz
 GST1_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
 GST1_PLUGINS_BAD_LICENSE_FILES = COPYING COPYING.LIB
@@ -25,7 +25,7 @@ GST1_PLUGINS_BAD_CONF_OPT = \
 	--disable-direct3d \
 	--disable-directdraw \
 	--disable-direct3d9 \
-	--disable-directshow \
+	--disable-winks \
 	--disable-android_media \
 	--disable-apple_media \
 	--disable-osx_video \
@@ -37,7 +37,6 @@ GST1_PLUGINS_BAD_CONF_OPT = \
 GST1_PLUGINS_BAD_CONF_OPT += \
 	--disable-avc \
 	--disable-quicktime \
-	--disable-mfc \
 	--disable-opensles \
 	--disable-uvch264 \
 	--disable-voamrwbenc \
@@ -62,8 +61,11 @@ GST1_PLUGINS_BAD_CONF_OPT += \
 	--disable-nas \
 	--disable-ofa \
 	--disable-openal \
+	--disable-openexr \
 	--disable-openjpeg \
+	--disable-openni2 \
 	--disable-pvr \
+	--disable-libvisual \
 	--disable-timidity \
 	--disable-teletextdec \
 	--disable-wildmidi \
@@ -132,6 +134,18 @@ else
 GST1_PLUGINS_BAD_CONF_OPT += --disable-audiofxbad
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOMIXER),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-audiomixer
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-audiomixer
+endif
+
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR),y)
+GST1_PLUGINS_BAD_CONF_OPT += --enable-compositor
+else
+GST1_PLUGINS_BAD_CONF_OPT += --disable-compositor
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_AUDIOVISUALIZERS),y)
 GST1_PLUGINS_BAD_CONF_OPT += --enable-audiovisualizers
 GST1_PLUGINS_BAD_HAS_GPL_LICENSE = y
