From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  3 Mar 2020 17:30:45 +0100
Subject: [Buildroot] [PATCH v1] package/gst1-plugins-base: fix static linking
Message-ID: <20200303163045.13431-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to fix static linking of tools.

Fixes:

  http://autobuild.buildroot.net/results/b33019b3c9ad856aced34215c69bb292b536e25e

  .../bin/ld: .../usr/lib/libgstreamer-1.0.a(gstplugin.c.o): in function `gst_plugin_register_func':
  gstplugin.c:(.text+0x3bc): undefined reference to `g_module_make_resident'
  .../bin/ld: .../usr/lib/libgstreamer-1.0.a(gstplugin.c.o): in function `_priv_gst_plugin_load_file_for_registry':
  gstplugin.c:(.text+0x1228): undefined reference to `g_module_supported'
  .../bin/ld: gstplugin.c:(.text+0x126c): undefined reference to `g_module_open'
  .../bin/ld: gstplugin.c:(.text+0x1368): undefined reference to `g_module_symbol'
  .../bin/ld: gstplugin.c:(.text+0x1494): undefined reference to `g_module_supported'
  .../bin/ld: gstplugin.c:(.text+0x17f4): undefined reference to `g_module_close'
  .../bin/ld: gstplugin.c:(.text+0x1a2c): undefined reference to `g_module_error'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...ic-linkig-of-tools-needs-gmodule_dep.patch | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/gstreamer1/gst1-plugins-base/0001-meson-static-linkig-of-tools-needs-gmodule_dep.patch

diff --git a/package/gstreamer1/gst1-plugins-base/0001-meson-static-linkig-of-tools-needs-gmodule_dep.patch b/package/gstreamer1/gst1-plugins-base/0001-meson-static-linkig-of-tools-needs-gmodule_dep.patch
new file mode 100644
index 0000000000..b778f7a12c
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-base/0001-meson-static-linkig-of-tools-needs-gmodule_dep.patch
@@ -0,0 +1,38 @@
+From 443244e54d1e2813560d364b44b35d49b3987b67 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 3 Mar 2020 17:07:24 +0100
+Subject: [PATCH] meson: static linkig of tools needs gmodule_dep
+
+Add gmodule_dep (analog to gstreamer/tools/meson.build).
+
+Fixes:
+
+.../bin/ld: .../usr/lib/libgstreamer-1.0.a(gstplugin.c.o): in function `gst_plugin_register_func':
+gstplugin.c:(.text+0x3bc): undefined reference to `g_module_make_resident'
+.../bin/ld: .../usr/lib/libgstreamer-1.0.a(gstplugin.c.o): in function `_priv_gst_plugin_load_file_for_registry':
+gstplugin.c:(.text+0x1228): undefined reference to `g_module_supported'
+.../bin/ld: gstplugin.c:(.text+0x126c): undefined reference to `g_module_open'
+.../bin/ld: gstplugin.c:(.text+0x1368): undefined reference to `g_module_symbol'
+.../bin/ld: gstplugin.c:(.text+0x1494): undefined reference to `g_module_supported'
+.../bin/ld: gstplugin.c:(.text+0x17f4): undefined reference to `g_module_close'
+.../bin/ld: gstplugin.c:(.text+0x1a2c): undefined reference to `g_module_error'
+
+[Upstream suggested: https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/merge_requests/587 ]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ tools/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/meson.build b/tools/meson.build
+index 57595fb47..bcbe11ca1 100644
+--- a/tools/meson.build
++++ b/tools/meson.build
+@@ -1,4 +1,4 @@
+-tool_deps = glib_deps + [pbutils_dep, audio_dep, video_dep, tag_dep, gst_dep, gst_base_dep]
++tool_deps = glib_deps + [pbutils_dep, audio_dep, video_dep, tag_dep, gst_dep, gst_base_dep, gmodule_dep]
+ 
+ executable('gst-device-monitor- at 0@'.format(api_version),
+   'gst-device-monitor.c',
+-- 
+2.25.1
+
-- 
2.25.1
