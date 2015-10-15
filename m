From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 15 Oct 2015 21:42:43 +0200
Subject: [Buildroot] [PATCH v2] gst1-plugins-bad: update configure options
Message-ID: <1444938163-6487-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- add new onvif option
- add new dtls option
- add new openh264 option
- add new x265 option
- removed real plugin option
- add new rtp option
- remove always disabled legacy options: directdraw, osx_video,
  quicktime and mythtv
- add '--disable-bs2b' and '--disable-libde265' to options
  which require currently unpackaged libraries
- add '--disable-gtk3' and '--disable-qt'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - add legacy entry for removed real option
  - fix rtp option comment
  - clarify remove always disabled legacy options (no legacy entry)
  - disable gtk3/qt for the momment (suggested by Arnout Vandecappelle)
---
 Config.in.legacy                                   |  6 ++++
 package/gstreamer1/gst1-plugins-bad/Config.in      | 24 +++++++++++--
 .../gst1-plugins-bad/gst1-plugins-bad.mk           | 41 ++++++++++++++++------
 3 files changed, 57 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7d2d63f..ad7d31a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,12 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.11"
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REAL
+	bool "real plugin has been removed"
+	select BR2_LEGACY
+	help
+	  real plugin has been removed.
+
 config BR2_PACKAGE_MEDIA_CTL
 	bool "media-ctl package has been removed"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index a778843..a28243b 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -219,6 +219,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
 	help
 	  Collection of elements that may or may not be useful for debugging
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DTLS
+	bool "dtls"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  DTLS plugin
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY
 	bool "dvdsuboverlay"
 	help
@@ -347,6 +353,9 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MXF
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_NUVDEMUX
 	bool "nuvdemux"
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ONVIF
+	bool "onvif"
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PATCHDETECT
 	bool "patchdetect"
 
@@ -365,14 +374,14 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RAWPARSE
 	help
 	  Parses byte streams into raw frames
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REAL
-	bool "real"
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REMOVESILENCE
 	bool "removesilence"
 	help
 	  Removes silence from an audio stream
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTP
+	bool "rtp"
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI
 	bool "sdi"
 
@@ -574,6 +583,10 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
 comment "opencv plugin needs OpenCV-2.4"
 	depends on !BR2_PACKAGE_OPENCV
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENH264
+	bool "openh264"
+	select BR2_PACKAGE_LIBOPENH264
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPUS
 	bool "opus"
 	select BR2_PACKAGE_OPUS
@@ -620,4 +633,9 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_HLS
 	help
 	  Fragmented streaming plugins
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265
+	bool "x265"
+	help
+	  x265 plugin
+
 endif
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 2fbd49b..fe5f242 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -22,12 +22,10 @@ GST1_PLUGINS_BAD_CONF_OPTS = \
 	--disable-directsound \
 	--disable-wsapi \
 	--disable-direct3d \
-	--disable-directdraw \
 	--disable-direct3d9 \
 	--disable-winks \
 	--disable-android_media \
 	--disable-apple_media \
-	--disable-osx_video \
 	--disable-sdltest \
 	--disable-wininet \
 	--disable-acm
@@ -35,10 +33,10 @@ GST1_PLUGINS_BAD_CONF_OPTS = \
 # Options which require currently unpackaged libraries
 GST1_PLUGINS_BAD_CONF_OPTS += \
 	--disable-avc \
-	--disable-quicktime \
 	--disable-opensles \
 	--disable-uvch264 \
 	--disable-voamrwbenc \
+	--disable-bs2b \
 	--disable-chromaprint \
 	--disable-dash \
 	--disable-dc1394 \
@@ -51,12 +49,12 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	--disable-kate \
 	--disable-ladspa \
 	--disable-lv2 \
+	--disable-libde265 \
 	--disable-strp \
 	--disable-linsys \
 	--disable-modplug \
 	--disable-mimic \
 	--disable-mplex \
-	--disable-mythtv \
 	--disable-nas \
 	--disable-ofa \
 	--disable-openal \
@@ -81,7 +79,9 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 	--disable-spandsp \
 	--disable-gsettings \
 	--disable-sndio \
-	--disable-hls
+	--disable-hls \
+	--disable-gtk3 \
+	--disable-qt
 
 GST1_PLUGINS_BAD_DEPENDENCIES = gst1-plugins-base gstreamer1
 
@@ -261,6 +261,13 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-debugutils
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DTLS),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-dtls
+GST1_PLUGINS_BAD_DEPENDENCIES += openssl
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-dtls
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-dvbsuboverlay
 else
@@ -431,6 +438,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-nuvdemux
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ONVIF),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-onvif
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-onvif
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PATCHDETECT),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-patchdetect
 else
@@ -455,18 +468,18 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-rawparse
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REAL),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-real
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-real
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REMOVESILENCE),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-removesilence
 else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-removesilence
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTP),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-rtp
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-rtp
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-sdi
 else
@@ -745,6 +758,12 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-hls
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_X265),y)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-x265
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-x265
+endif
+
 # Add GPL license if GPL licensed plugins enabled.
 ifeq ($(GST1_PLUGINS_BAD_HAS_GPL_LICENSE),y)
 GST1_PLUGINS_BAD_LICENSE += GPL
-- 
2.1.4
