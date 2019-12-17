From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Dec 2019 20:15:01 +0100
Subject: [Buildroot] [PATCH v3] package/gst1-plugins-bad: wayland plugin
 needs libdrm
Message-ID: <20191217191501.4848-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/e06fbed25fc8369c2ff1f3d89b8800766e365ea3
  http://autobuild.buildroot.net/results/252d2d247339ee6f89ae2b813d33518d612dd9b3

  Run-time dependency wayland-client found: YES 1.17.0
  Run-time dependency libdrm found: NO (tried pkgconfig)
  gst-libs/gst/wayland/meson.build:3:0: ERROR: Dependency "libdrm" not found, tried pkgconfig

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - changed from depends to select libdrm as the alternative patch which
    removes the wayland plugin dependency did not please upstream
    (see [2] and [3]) with the argument all wayland implementation do/will
    depend on libdrm

Changes v2 -> v3:
  - add second autobuild failure link, and add missing references

[2] http://lists.busybox.net/pipermail/buildroot/2019-December/269009.html
[3] https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/merge_requests/919
---
 package/gstreamer1/gst1-plugins-bad/Config.in           | 2 ++
 package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 08952f70cb..393950ef2f 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -555,6 +555,8 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND
 	bool "wayland"
 	default y
 	depends on BR2_PACKAGE_WAYLAND
+	depends on BR2_TOOLCHAIN_HAS_THREADS #  libdrm -> libpthread-stubs
+	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 	help
 	  Wayland Video Sink
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index 1d4ba62bd2..259f00cdbb 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -66,7 +66,7 @@ GST1_PLUGINS_BAD_DEPENDENCIES = gst1-plugins-base gstreamer1
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dwayland=enabled
-GST1_PLUGINS_BAD_DEPENDENCIES += wayland wayland-protocols
+GST1_PLUGINS_BAD_DEPENDENCIES += libdrm wayland wayland-protocols
 else
 GST1_PLUGINS_BAD_CONF_OPTS += -Dwayland=disabled
 endif
-- 
2.24.0
