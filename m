From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jul 2020 08:16:14 +0200
Subject: [Buildroot] [git commit branch/2020.05.x]
 package/gstreamer1/gst1-plugins-good: Enable GUDEV for V4L2 if available
Message-ID: <20200720064220.9B5D6811AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a5b9dc6f11bf6b61bfc86f07a2d871dc29d50f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Video4Linux2 plugins can udev for device probing and monitor.
This greatly improves load time and monitoring performance.

It also enables hotplug monitoring for cameras.

gstreamer is libglib2-based; libgudev is libnglib2-based. So they both
have the same basic dependencies as liblib2 has, and thus propagating
the dependencies of libgudev is not necessary (but might be confusing in
the future, even though such a change is highly unlikely...)

Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f50086e59fe997cdeb3da381cfdefc1bd41d305c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gst1-plugins-good/Config.in            | 1 +
 package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
index 20aebc473e..be77f5a82e 100644
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
index 6709f14cca..eed4bfe117 100644
--- a/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
+++ b/package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk
@@ -354,6 +354,13 @@ endif
 
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
