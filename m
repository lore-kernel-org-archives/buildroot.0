From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 May 2016 16:44:15 -0300
Subject: [Buildroot] [PATCH 2/3] gst1-plugins-bad: remove rtp plugin option
In-Reply-To: <1462304656-17156-1-git-send-email-gustavo@zacarias.com.ar>
References: <1462304656-17156-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1462304656-17156-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The plugin was moved from -bad to -good so remove the option.
Support in -good was added via 301e8ffb.
Add legacy entry to notify users of this, however we can't automatically
select the good variant since good might be disabled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 Config.in.legacy                                        | 7 +++++++
 package/gstreamer1/gst1-plugins-bad/Config.in           | 3 ---
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 6 ------
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 9901cf6..5317dde 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.05"
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTP
+	bool "gst1-plugins-bad rtp plugin moved to good"
+	select BR2_LEGACY
+	help
+	  The rtp plugin has been moved from gst1-plugins-base to
+	  gst1-plugins-good.
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPG123
 	bool "gst1-plugins-bad mpg123 plugin moved to ugly"
 	select BR2_LEGACY
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 16bb36d..53ce589 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -382,9 +382,6 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REMOVESILENCE
 	help
 	  Removes silence from an audio stream
 
-config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTP
-	bool "rtp"
-
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI
 	bool "sdi"
 
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 80bdee8..6d8cac7 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -479,12 +479,6 @@ else
 GST1_PLUGINS_BAD_CONF_OPTS += --disable-removesilence
 endif
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTP),y)
-GST1_PLUGINS_BAD_CONF_OPTS += --enable-rtp
-else
-GST1_PLUGINS_BAD_CONF_OPTS += --disable-rtp
-endif
-
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI),y)
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-sdi
 else
-- 
2.7.3
