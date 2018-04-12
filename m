From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 12 Apr 2018 22:45:41 +0200
Subject: [Buildroot] [PATCH v4 09/11] gst1-plugins-bad: re-add wayland option
In-Reply-To: <20180412204543.25535-1-ps.report@gmx.net>
References: <20180412204543.25535-1-ps.report@gmx.net>
Message-ID: <20180412204543.25535-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- re-add the legacy (1.12.x) behaviour

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Note: The BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND help text
'Wayland Video Sink' is still not accurate, the gst1-plugins-bad
configure option --disable/enable-wayland has more influence than
only disable/enable the waylandsink plugin in
gst1-plugins-bad-1.14.0/ext/wayland, see e.g.:

	$ grep -R USE_WAYLAND build/gst1-plugins-bad-1.14.0
[...]
build/gst1-plugins-bad-1.14.0/ext/Makefile.am:if USE_WAYLAND
build/gst1-plugins-bad-1.14.0/ext/Makefile.in:@USE_WAYLAND_FALSE at WAYLAND_DIR =
build/gst1-plugins-bad-1.14.0/ext/Makefile.in:@USE_WAYLAND_TRUE at WAYLAND_DIR = wayland
build/gst1-plugins-bad-1.14.0/ext/vulkan/Makefile.am:if USE_WAYLAND
build/gst1-plugins-bad-1.14.0/ext/vulkan/Makefile.in:@USE_WAYLAND_TRUE at am__append_3 = wayland
build/gst1-plugins-bad-1.14.0/ext/vulkan/Makefile.in:@USE_WAYLAND_TRUE at am__append_4 = wayland/libgstvulkan-wayland.la
build/gst1-plugins-bad-1.14.0/gst-libs/gst/Makefile.am:if USE_WAYLAND
build/gst1-plugins-bad-1.14.0/gst-libs/gst/Makefile.in:@USE_WAYLAND_TRUE at WAYLAND_DIR = wayland
[...]
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 8 ++++++++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 3284b07b97..a2ceeb9035 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -544,6 +544,14 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC
 	bool "voaacenc"
 	select BR2_PACKAGE_VO_AACENC
 
+config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND
+	bool "wayland"
+	default y
+	depends on BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+	help
+	  Wayland Video Sink
+
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBP
 	bool "webp"
 	select BR2_PACKAGE_WEBP
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 7a027aef2e..4927b23990 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -71,6 +71,13 @@ GST1_PLUGINS_BAD_CONF_ENV += \
 	-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux"
 endif
 
+ifneq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND),)
+GST1_PLUGINS_BAD_CONF_OPTS += --enable-wayland
+GST1_PLUGINS_BAD_DEPENDENCIES += wayland wayland-protocols
+else
+GST1_PLUGINS_BAD_CONF_OPTS += --disable-wayland
+endif
+
 ifeq ($(BR2_PACKAGE_ORC),y)
 GST1_PLUGINS_BAD_DEPENDENCIES += orc
 GST1_PLUGINS_BAD_CONF_OPTS += --enable-orc
-- 
2.16.3
