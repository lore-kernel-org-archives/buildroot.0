From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Dec 2019 23:10:51 +0100
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-bad:
 wayland plugin needs libdrm
Message-ID: <20191225220153.12E2E8E546@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9944b3313801e87f7cf2a4fae1444e11d70dd362
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.net/results/e06fbed25fc8369c2ff1f3d89b8800766e365ea3
  http://autobuild.buildroot.net/results/252d2d247339ee6f89ae2b813d33518d612dd9b3

  Run-time dependency wayland-client found: YES 1.17.0
  Run-time dependency libdrm found: NO (tried pkgconfig)
  gst-libs/gst/wayland/meson.build:3:0: ERROR: Dependency "libdrm" not found, tried pkgconfig

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
