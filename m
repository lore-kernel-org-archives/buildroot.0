From: Vincent Dehors <vincent.dehors@openwide.fr>
Date: Wed, 30 Dec 2015 16:26:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1: Allow to build OpenJPEG
	plugin
Message-ID: <1451489205-4560-1-git-send-email-vincent.dehors@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The OpenJPEG library is packaged in buildroot (version 1) and there is a
plugin "openjpeg" using it in gst1-plugins-bad. This commit add the option
for building this plugin. It provide a JPEG2000 encoder and decoder.

Signed-off-by: Vincent Dehors <vincent.dehors@openwide.fr>
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 9 +++++++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 8 +++++++-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index a834f13..8bc4df1 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -593,6 +593,15 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
 comment "opencv plugin needs OpenCV-2.4"
 	depends on !BR2_PACKAGE_OPENCV
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENJPEG
+	bool "openjpeg"
+	depends on BR2_PACKAGE_OPENJPEG
+	help
+	  GStreamer OpenJPEG Plugin
+
+comment "openjpeg plugin needs OpenJPEG library"
+	depends on !BR2_PACKAGE_OPENJPEG
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENH264
 	bool "openh264"
 	select BR2_PACKAGE_LIBOPENH264
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 64760a8..5a913a3 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -58,7 +58,6 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	--disable-nas \
 	--disable-ofa \
 	--disable-openexr \
-	--disable-openjpeg \
 	--disable-openni2 \
 	--disable-pvr \
 	--disable-libvisual \
@@ -715,6 +714,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-opencv
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENJPEG),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-openjpeg
+GST1_PLUGINS_BAD_DEPENDENCIES += openjpeg
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-openjpeg
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPUS),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-opus
 GST1_PLUGINS_BAD_DEPENDENCIES += opus
-- 
2.1.4
