From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 25 Nov 2019 09:47:31 +0100
Subject: [Buildroot] [RFC v1] package/gst1-plugins-bad: wayland plugin needs
 libdrm
Message-ID: <20191125084731.29623-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  Run-time dependency wayland-client found: YES 1.17.0
  Run-time dependency libdrm found: NO (tried pkgconfig)
  gst-libs/gst/wayland/meson.build:3:0: ERROR: Dependency "libdrm" not found, tried pkgconfig

[1] http://autobuild.buildroot.net/results/e06fbed25fc8369c2ff1f3d89b8800766e365ea3

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:
  - sent as RFC, not sure about the (silent) 'depends on BR2_PACKAGE_LIBDRM'
    but I think a 'select BR2_PACKAGE_LIBDRM' is wrong as not all wayland
    implementation are based on libdrm
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 1 +
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index e79f266ad0..ead1180476 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -554,6 +554,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VOAACENC
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND
 	bool "wayland"
 	default y
+	depends on BR2_PACKAGE_LIBDRM
 	depends on BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	help
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 856db88e49..4be16fd3db 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -74,7 +74,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dwayland=enabled
-GST1_PLUGINS_BAD_DEPENDENCIES += wayland wayland-protocols
+GST1_PLUGINS_BAD_DEPENDENCIES += libdrm wayland wayland-protocols
 else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dwayland=disabled
 endif
-- 
2.24.0
