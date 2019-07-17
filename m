From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 08:40:44 +0200
Subject: [Buildroot] [git commit] package/gstreamer1: fix static build break
 after change to meson build
Message-ID: <20190717064009.02ECC811F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ffee67ab44865fa58e6c21175f62e2d3a1b37d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patch to work around meson bug with linking static
libraries, fixes [1]:

.../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgstreamer-1.0.a(gstelement.c.o): In function `_gst_element_error_printf':
gstelement.c:(.text+0x3fe8): undefined reference to `__gst_vasprintf'
.../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgstreamer-1.0.a(gstinfo.c.o): In function `gst_debug_message_get':
gstinfo.c:(.text+0x1df0): undefined reference to `__gst_vasprintf'
.../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgstreamer-1.0.a(gstinfo.c.o): In function `_priv_gst_debug_init':
gstinfo.c:(.text+0x34a4): undefined reference to `__gst_printf_pointer_extension_set_func'
.../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgstreamer-1.0.a(gstinfo.c.o): In function `gst_info_vasprintf':
gstinfo.c:(.text+0x40b4): undefined reference to `__gst_vasprintf'
collect2: error: ld returned 1 exit status

[1] http://autobuild.buildroot.net/results/9f92b180835df9ed580fe2420687a3632d08b3e4

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...to-objects-instea-of-static-helper-librar.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/gstreamer1/gstreamer1/0001-meson-Link-to-objects-instea-of-static-helper-librar.patch b/package/gstreamer1/gstreamer1/0001-meson-Link-to-objects-instea-of-static-helper-librar.patch
new file mode 100644
index 0000000000..2bbc069f2b
--- /dev/null
+++ b/package/gstreamer1/gstreamer1/0001-meson-Link-to-objects-instea-of-static-helper-librar.patch
@@ -0,0 +1,42 @@
+From 060fef075d6e614cc4dabb6d4fe62ce9b3e0f299 Mon Sep 17 00:00:00 2001
+From: Nirbheek Chauhan <nirbheek@centricular.com>
+Date: Mon, 13 May 2019 13:24:42 +0530
+Subject: [PATCH] meson: Link to objects instea of static helper library
+
+Otherwise the objects from that static helper library are not included
+in the gstreamer-1.0 static library. This was supposed to be fixed in
+Meson, but the pull request hasn't been merged yet:
+https://github.com/mesonbuild/meson/pull/3939
+
+Closes https://gitlab.freedesktop.org/gstreamer/gstreamer/issues/398
+
+Upstream: https://cgit.freedesktop.org/gstreamer/gstreamer/commit/?id=b19de413b94d228b1460b0899f9b41b2b5233943
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ gst/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst/meson.build b/gst/meson.build
+index 145e97a89..c753ff5e3 100644
+--- a/gst/meson.build
++++ b/gst/meson.build
+@@ -237,6 +237,7 @@ gst_incdirs = [configinc]
+ gst_gen_sources = [gstenum_h]
+ libgst = library('gstreamer-1.0', gst_sources,
+   gstenum_h, gstenum_c, gst_parse_sources, gst_registry_sources,
++  objects : printf_lib.extract_all_objects(),
+   version : libversion,
+   soversion : soversion,
+   darwin_versions : osxversion,
+@@ -244,7 +245,6 @@ libgst = library('gstreamer-1.0', gst_sources,
+   include_directories : [configinc,
+     # HACK, change include paths in .y and .l in final version.
+     include_directories('parse')],
+-  link_with : printf_lib,
+   install : true,
+   dependencies : [gobject_dep, gmodule_dep, glib_dep, mathlib, dl_dep] + backtrace_deps
+                    + platform_deps,
+--
+2.22.0
+
