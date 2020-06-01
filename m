From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon,  1 Jun 2020 13:43:21 -0300
Subject: [Buildroot] [PATCH v2] package/gstreamer1/gst1-plugins-good: Select
 GUDEV if available
Message-ID: <20200601164321.12806-1-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Using udev for probes (such as Video4Linux2 devices probes)
and device monitor greatly improves load time and monitoring performance.

It also enables hotplug monitoring for cameras.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
v2:
* Enable/disable v4l2-gudev explicitly

 package/gstreamer1/gst1-plugins-good/Config.in           | 1 +
 .../gstreamer1/gst1-plugins-good/gst1-plugins-good.mk    | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 20aebc473e89..be77f5a82e3d 100644
--- a/package/gstreamer1/gst1-plugins-good/Config.in
+++ b/package/gstreamer1/gst1-plugins-good/Config.in
@@ -295,6 +295,7 @@ config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_SHOUT2
 config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2
 	bool "v4l2"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # multi planar api
+	select BR2_PACKAGE_LIBGUDEV if BR2_PACKAGE_HAS_UDEV
 	help
 	  elements for Video 4 Linux
 
diff --git a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
index 223af9850897..bd4bdcbc1ff1 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -40,6 +40,10 @@ else
 GST1_PLUGINS_GOOD_CONF_OPTS += -Djack=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
+GST1_PLUGINS_GOOD_DEPENDENCIES += libgudev
+endif
+
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dv4l2-libv4l2=enabled
 GST1_PLUGINS_GOOD_DEPENDENCIES += libv4l
@@ -355,6 +359,11 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dv4l2=enabled
+ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dv4l2-gudev=enabled
+else
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dv4l2-gudev=disabled
+endif
 else
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dv4l2=disabled
 endif
-- 
2.26.0.rc2
