From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 May 2016 08:29:04 +0200
Subject: [Buildroot] [git commit] gst1-plugins-bad: remove mpg123 plugin
	option
Message-ID: <20160505063137.4849581D7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4196cf902b2ccb82902720ae254f444bafac8e71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The plugin was moved from -bad to -ugly so remove the option.
Support in -ugly was added via 30cde9a3.
Add legacy entry to notify users of this, however we can't automatically
select the ugly variant since ugly might be disabled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
