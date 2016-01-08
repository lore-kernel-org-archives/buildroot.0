From: Vincent Dehors <vincent.dehors@openwide.fr>
Date: Fri,  8 Jan 2016 15:32:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1: Add option for building
	x264 plugin
Message-ID: <1452263539-29288-1-git-send-email-vincent.dehors@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As x264 is packaged, we can also build the gstreamer plugin using it.
This commit adds the option in menuconfig and make sure it is built if
selected.

A typo has been corrected, other unhandled plugins (like cdio, twolame,
...) are now disabled.

Signed-off-by: Vincent Dehors <vincent.dehors@openwide.fr>
---
 package/gstreamer1/gst1-plugins-ugly/Config.in            |  6 ++++++
 package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk | 12 +++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-ugly/Config.in b/package/gstreamer1/gst1-plugins-ugly/Config.in
index f33e258..9cfc662 100644
--- a/package/gstreamer1/gst1-plugins-ugly/Config.in
+++ b/package/gstreamer1/gst1-plugins-ugly/Config.in
@@ -67,6 +67,12 @@ config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPEG2DEC
 	help
 	  LibMpeg2 decoder
 
+config BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_X264
+	bool "x264"
+	select BR2_PACKAGE_X264
+	help
+	  x264 decoder
+
 # Note: to get descriptions use the following.
 # # find . -name 'plugin-*.xml' | xargs grep -m 1 description
 endif
diff --git a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
index 4d13b7b..475add4 100644
--- a/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
+++ b/package/gstreamer1/gst1-plugins-ugly/gst1-plugins-ugly.mk
@@ -13,14 +13,13 @@ GST1_PLUGINS_UGLY_LICENSE = LGPLv2.1+
 
 GST1_PLUGINS_UGLY_CONF_OPTS = --disable-examples --disable-valgrind
 
-GST_PLUGINS_BAD1_CONF_OPTS += \
+GST1_PLUGINS_UGLY_CONF_OPTS += \
 	--disable-a52dec \
 	--disable-amrnb \
 	--disable-amrwb \
 	--disable-cdio \
 	--disable-sidplay \
-	--disable-twolame \
-	--disable-x264
+	--disable-twolame
 
 GST1_PLUGINS_UGLY_DEPENDENCIES = gstreamer1 gst1-plugins-base
 
@@ -90,6 +89,13 @@ else
 GST1_PLUGINS_UGLY_CONF_OPTS += --disable-mpeg2dec
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_X264),y)
+GST1_PLUGINS_UGLY_CONF_OPTS += --enable-x264
+GST1_PLUGINS_UGLY_DEPENDENCIES += x264
+else
+GST1_PLUGINS_UGLY_CONF_OPTS += --disable-x264
+endif
+
 # Add GPL license if GPL plugins enabled.
 ifeq ($(GST1_PLUGINS_UGLY_HAS_GPL_LICENSE),y)
 GST1_PLUGINS_UGLY_LICENSE += GPLv2
-- 
2.1.4
