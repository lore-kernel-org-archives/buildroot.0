From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 13 Dec 2019 23:15:45 +0100
Subject: [Buildroot] [PATCH v1] package/gst1-plugins-bad: remove wayland
 plugin meson build libdrm dependency
Message-ID: <20191213221545.27349-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change gst1-plugins-bad wayland plugin to use the drm/drm_fourcc.h
header provided by the linux kernel (and not the libdrm one) and remove
the meson build system libdrm dependency.

Fixes:
  http://autobuild.buildroot.net/results/252d2d247339ee6f89ae2b813d33518d612dd9b3

  Run-time dependency libdrm found: NO (tried pkgconfig)
  gst-libs/gst/wayland/meson.build:3:0: ERROR: Dependency "libdrm" not found, tried pkgconfig

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...001-wayland-remove-libdrm-dependency.patch | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 package/gstreamer1/gst1-plugins-bad/0001-wayland-remove-libdrm-dependency.patch

diff --git a/package/gstreamer1/gst1-plugins-bad/0001-wayland-remove-libdrm-dependency.patch b/package/gstreamer1/gst1-plugins-bad/0001-wayland-remove-libdrm-dependency.patch
new file mode 100644
index 0000000000..0362968384
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-bad/0001-wayland-remove-libdrm-dependency.patch
@@ -0,0 +1,67 @@
+From 7f68b24af0b8d8d0765ca7a6e5bd2f76d0dc5460 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 13 Dec 2019 22:10:34 +0100
+Subject: [PATCH] wayland: remove libdrm dependency
+
+Use drm/drm_fourcc.h linux kernel header instead of the libdrm
+provided one (drm_fourcc.h) and remove libdrm dependency.
+---
+ ext/wayland/meson.build          | 4 +---
+ ext/wayland/wlvideoformat.h      | 2 +-
+ gst-libs/gst/wayland/meson.build | 3 +--
+ 3 files changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/ext/wayland/meson.build b/ext/wayland/meson.build
+index 3c377ee..9796048 100644
+--- a/ext/wayland/meson.build
++++ b/ext/wayland/meson.build
+@@ -8,8 +8,6 @@ wl_sources = [
+     'wllinuxdmabuf.c'
+ ]
+ 
+-libdrm_dep = dependency('libdrm', version: '>= 2.4.55', required:get_option('wayland'))
+-
+ if use_wayland
+     protocols_datadir = wl_protocol_dep.get_pkgconfig_variable('pkgdatadir')
+ 
+@@ -42,7 +40,7 @@ if use_wayland
+         c_args : gst_plugins_bad_args + ['-DGST_USE_UNSTABLE_API'],
+         include_directories : [configinc],
+         dependencies : [gst_dep, gstvideo_dep, gstwayland_dep, gstallocators_dep,
+-                        wl_client_dep, wl_protocol_dep, libdrm_dep],
++                        wl_client_dep, wl_protocol_dep],
+         install : true,
+         install_dir : plugins_install_dir,
+     )
+diff --git a/ext/wayland/wlvideoformat.h b/ext/wayland/wlvideoformat.h
+index 331f582..a0a1537 100644
+--- a/ext/wayland/wlvideoformat.h
++++ b/ext/wayland/wlvideoformat.h
+@@ -26,7 +26,7 @@
+ 
+ #include <wayland-client-protocol.h>
+ #include <gst/video/video.h>
+-#include <drm_fourcc.h>
++#include <drm/drm_fourcc.h>
+ 
+ G_BEGIN_DECLS
+ 
+diff --git a/gst-libs/gst/wayland/meson.build b/gst-libs/gst/wayland/meson.build
+index b1ede41..4073d21 100644
+--- a/gst-libs/gst/wayland/meson.build
++++ b/gst-libs/gst/wayland/meson.build
+@@ -1,10 +1,9 @@
+ wl_req = '>= 1.15'
+ wl_client_dep = dependency('wayland-client', version: wl_req, required: get_option('wayland'))
+-libdrm_dep = dependency('libdrm', version: '>= 2.4.55', required: get_option('wayland'))
+ wl_protocol_dep = dependency('wayland-protocols', version: wl_req, required: get_option('wayland'))
+ wl_scanner = find_program('wayland-scanner', required: get_option('wayland'))
+ # Also used in ext/wayland
+-use_wayland = wl_protocol_dep.found() and wl_client_dep.found() and wl_scanner.found() and libdrm_dep.found()
++use_wayland = wl_protocol_dep.found() and wl_client_dep.found() and wl_scanner.found()
+ 
+ if use_wayland
+   gstwayland = library('gstwayland-' + api_version,
+-- 
+2.24.0
+
-- 
2.24.0
