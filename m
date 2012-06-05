From: spdawson at gmail.com <spdawson@gmail.com>
Date: Tue,  5 Jun 2012 07:11:42 +0100
Subject: [Buildroot] [PATCH] gstreamer: add xorg support
Message-ID: <1338876702-5506-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

GStreamer requires xorg support in order for the ximagesink and xvimagesink
plugins to be available.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/multimedia/gst-plugins-base/Config.in      |    3 +++
 .../gst-plugins-base/gst-plugins-base.mk           |   16 +++++++++++++---
 .../gst-plugins-good/gst-plugins-good.mk           |   16 +++++++++++++---
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/package/multimedia/gst-plugins-base/Config.in b/package/multimedia/gst-plugins-base/Config.in
index 851337b..5d82533 100644
--- a/package/multimedia/gst-plugins-base/Config.in
+++ b/package/multimedia/gst-plugins-base/Config.in
@@ -1,6 +1,9 @@
 menuconfig BR2_PACKAGE_GST_PLUGINS_BASE
 	bool "gst-plugins-base"
 	depends on BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXV if BR2_PACKAGE_XORG7
 	help
 	  A basic set of well-supported plug-ins for GStreamer.
 
diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
index 848eaf2..e35a606 100644
--- a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
+++ b/package/multimedia/gst-plugins-base/gst-plugins-base.mk
@@ -17,15 +17,25 @@ GST_PLUGINS_BASE_CONF_ENV =
 
 GST_PLUGINS_BASE_CONF_OPT = \
 		--disable-examples \
-		--disable-x \
-		--disable-xvideo \
-		--disable-xshm \
 		--disable-oggtest \
 		--disable-vorbistest \
 		--disable-freetypetest
 
 GST_PLUGINS_BASE_DEPENDENCIES = gstreamer
 
+ifeq ($(BR2_PACKAGE_XORG7),y)
+GST_PLUGINS_BASE_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXv
+GST_PLUGINS_BASE_CONF_OPT += \
+	--enable-x \
+	--enable-xshm \
+	--enable-xvideo
+else
+GST_PLUGINS_BASE_CONF_OPT += \
+	--disable-x \
+	--disable-xshm \
+	--disable-xvideo
+endif
+
 ifeq ($(BR2_PACKAGE_ORC),y)
 GST_PLUGINS_BASE_DEPENDENCIES += orc
 endif
diff --git a/package/multimedia/gst-plugins-good/gst-plugins-good.mk b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
index 4e6b73e..ebd463b 100644
--- a/package/multimedia/gst-plugins-good/gst-plugins-good.mk
+++ b/package/multimedia/gst-plugins-good/gst-plugins-good.mk
@@ -14,9 +14,6 @@ GST_PLUGINS_GOOD_CONF_OPT = \
 		--disable-sunaudio \
 		--disable-osx_audio \
 		--disable-osx_video \
-		--disable-x \
-		--disable-xshm \
-		--disable-xvideo \
 		--disable-aalib \
 		--disable-aalibtest \
 		--disable-esd \
@@ -25,6 +22,19 @@ GST_PLUGINS_GOOD_CONF_OPT = \
 
 GST_PLUGINS_GOOD_DEPENDENCIES = gstreamer gst-plugins-base
 
+ifeq ($(BR2_PACKAGE_XORG7),y)
+GST_PLUGINS_GOOD_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXv
+GST_PLUGINS_GOOD_CONF_OPT += \
+	--enable-x \
+	--enable-xshm \
+	--enable-xvideo
+else
+GST_PLUGINS_GOOD_CONF_OPT += \
+	--disable-x \
+	--disable-xshm \
+	--disable-xvideo
+endif
+
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_GOOD_JPEG),y)
 GST_PLUGINS_GOOD_CONF_OPT += --enable-jpeg
 GST_PLUGINS_GOOD_DEPENDENCIES += jpeg
-- 
1.7.9.5
