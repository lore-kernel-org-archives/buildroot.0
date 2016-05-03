From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 May 2016 16:44:14 -0300
Subject: [Buildroot] [PATCH 1/3] gst1-plugins-bad: remove mpg123 plugin
	option
Message-ID: <1462304656-17156-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The plugin was moved from -bad to -ugly so remove the option.
Support in -ugly was added via 30cde9a3.
Add legacy entry to notify users of this, however we can't automatically
select the ugly variant since ugly might be disabled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in.legacy                                        | 7 +++++++
 package/gstreamer1/gst1-plugins-bad/Config.in           | 7 -------
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 7 -------
 3 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9f694f8..9901cf6 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.05"
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPG123
+	bool "gst1-plugins-bad mpg123 plugin moved to ugly"
+	select BR2_LEGACY
+	help
+	  The mpg123 plugin has been moved from gst1-plugins-bad to
+	  gst1-plugins-ugly.
+
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC
 	bool "PowerPC Sourcery toolchain has been removed"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index a9667af..16bb36d 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -553,13 +553,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEG2ENC
 	help
 	  High-quality MPEG-1/2 video encoder
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPG123
-	bool "mpg123"
-	select BR2_PACKAGE_MPG123
-	depends on BR2_USE_MMU # mpg123
-	help
-	  mp3 decoding based on the mpg123 library
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MUSEPACK
 	bool "musepack"
 	select BR2_PACKAGE_MUSEPACK
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index a92c4a6..80bdee8 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -692,13 +692,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-mpeg2enc
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPG123),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-mpg123
-GST1_PLUGINS_BAD_DEPENDENCIES += mpg123
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-mpg123
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MUSEPACK),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-musepack
 GST1_PLUGINS_BAD_DEPENDENCIES += musepack
-- 
2.7.3
