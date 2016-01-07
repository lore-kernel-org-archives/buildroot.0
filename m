From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  7 Jan 2016 11:32:36 -0300
Subject: [Buildroot] [PATCH v2 1/2] webkitgtk24: add multimedia option
Message-ID: <1452177157-6029-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a BR2_PACKAGE_WEBKITGTK24_MULTIMEDIA option that will select/pull in
the basic required components in order for a few multimedia websites
(HTML5 video) to work.
Tested with videojs.com & youtube.com

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
Changes for v2: be more explicit for the dependencies, even though
some plugins are 'default y' a user might disable them and bring
unintended consequences (non-working multimedia).

 package/webkitgtk24/Config.in      | 24 ++++++++++++++++++++++++
 package/webkitgtk24/webkitgtk24.mk |  4 ++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/package/webkitgtk24/Config.in b/package/webkitgtk24/Config.in
index 0a30bac..f89c3c1 100644
--- a/package/webkitgtk24/Config.in
+++ b/package/webkitgtk24/Config.in
@@ -48,3 +48,27 @@ config BR2_PACKAGE_WEBKITGTK24
 	  WebKit is an open source, standards compliant web browser engine.
 
 	  http://www.webkitgtk.org/
+
+if BR2_PACKAGE_WEBKITGTK24
+
+config BR2_PACKAGE_WEBKITGTK24_MULTIMEDIA
+	bool "multimedia support"
+	select BR2_PACKAGE_GSTREAMER1
+	select BR2_PACKAGE_GST1_PLUGINS_BASE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_APP
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOCONVERT
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PLAYBACK
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOCONVERT
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
+	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ISOMP4
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTSP
+	select BR2_PACKAGE_GST1_LIBAV
+	help
+	  This option pulls in all of the required dependencies
+	  to enable basic multimedia (video/audio) support.
+
+endif
diff --git a/package/webkitgtk24/webkitgtk24.mk b/package/webkitgtk24/webkitgtk24.mk
index 712120c..8a831d9 100644
--- a/package/webkitgtk24/webkitgtk24.mk
+++ b/package/webkitgtk24/webkitgtk24.mk
@@ -42,11 +42,11 @@ WEBKITGTK24_CONF_OPTS = \
 	--disable-gtk-doc-html \
 	--disable-wayland-target
 
-ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
+ifeq ($(BR2_PACKAGE_WEBKITGTK24_MULTIMEDIA),y)
 WEBKITGTK24_CONF_OPTS += \
 	--enable-video \
 	--enable-web-audio
-WEBKITGTK24_DEPENDENCIES += gst1-plugins-good
+WEBKITGTK24_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-base gst1-plugins-good
 else
 WEBKITGTK24_CONF_OPTS += \
 	--disable-video \
-- 
2.4.10
