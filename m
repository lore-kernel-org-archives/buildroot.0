From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun,  7 Jun 2020 21:00:26 -0300
Subject: [Buildroot] [PATCH v3] package/gstreamer1/gst1-plugins-good: Enable
 GUDEV for V4L2 if available
Message-ID: <20200608000026.4237-1-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Video4Linux2 plugins can udev for device probing and monitor.
This greatly improves load time and monitoring performance.

It also enables hotplug monitoring for cameras.

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
v3:
* Apply the dependency only if V4L2 plugins are enabled
v2:
* Enable/disable v4l2-gudev explicitly

 package/gstreamer1/gst1-plugins-good/Config.in            | 1 +
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 7 +++++++
 2 files changed, 8 insertions(+)

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
index 223af9850897..7bb2fa5f3720 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -355,6 +355,13 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_V4L2),y)
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dv4l2=enabled
+# Enable use of gudev if available, for device probing and monitoring.
+ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
+GST1_PLUGINS_GOOD_DEPENDENCIES += libgudev
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dv4l2-gudev=enabled
+else
+GST1_PLUGINS_GOOD_CONF_OPTS += -Dv4l2-gudev=disabled
+endif
 else
 GST1_PLUGINS_GOOD_CONF_OPTS += -Dv4l2=disabled
 endif
-- 
2.26.0.rc2
