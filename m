From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 23 Sep 2020 22:20:41 +0200
Subject: [Buildroot] [git commit] package/gst1-plugins-base: bump version to
 1.18.0
Message-ID: <20200923201700.2AF548756F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41f0fff587d00cf2057e9a64c23caa527516f65b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- change home page url to https

- remove 0001-meson-static-linkig-of-tools-needs-gmodule_dep.patch
  (upstream [1])

- remove 0002-meson-build-gir-even-when-cross-compiling-if-introspection.patch
  (upstream [2])

- meson options: remove gtk_doc, add doc=disabled

- add option for new plugin gio-typefinder

[1] https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/commit/51253830f3e9dad108baa07c87ed62509ee3123f.patch
[2] https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/commit/30672ba7d134553e59935ddc875104adba26f25c.patch

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-static-linkig-of-tools-needs-gmodule_dep.patch | 38 ----------------------
 ...ven-when-cross-compiling-if-introspection.patch | 35 --------------------
 package/gstreamer1/gst1-plugins-base/Config.in     |  7 +++-
 .../gst1-plugins-base/gst1-plugins-base.hash       |  6 ++--
 .../gst1-plugins-base/gst1-plugins-base.mk         | 10 ++++--
 5 files changed, 17 insertions(+), 79 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-base/0001-meson-static-linkig-of-tools-needs-gmodule_dep.patch b/package/gstreamer1/gst1-plugins-base/0001-meson-static-linkig-of-tools-needs-gmodule_dep.patch
deleted file mode 100644
index b778f7a12c..0000000000
--- a/package/gstreamer1/gst1-plugins-base/0001-meson-static-linkig-of-tools-needs-gmodule_dep.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 443244e54d1e2813560d364b44b35d49b3987b67 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Tue, 3 Mar 2020 17:07:24 +0100
-Subject: [PATCH] meson: static linkig of tools needs gmodule_dep
-
-Add gmodule_dep (analog to gstreamer/tools/meson.build).
-
-Fixes:
-
-.../bin/ld: .../usr/lib/libgstreamer-1.0.a(gstplugin.c.o): in function `gst_plugin_register_func':
-gstplugin.c:(.text+0x3bc): undefined reference to `g_module_make_resident'
-.../bin/ld: .../usr/lib/libgstreamer-1.0.a(gstplugin.c.o): in function `_priv_gst_plugin_load_file_for_registry':
-gstplugin.c:(.text+0x1228): undefined reference to `g_module_supported'
-.../bin/ld: gstplugin.c:(.text+0x126c): undefined reference to `g_module_open'
-.../bin/ld: gstplugin.c:(.text+0x1368): undefined reference to `g_module_symbol'
-.../bin/ld: gstplugin.c:(.text+0x1494): undefined reference to `g_module_supported'
-.../bin/ld: gstplugin.c:(.text+0x17f4): undefined reference to `g_module_close'
-.../bin/ld: gstplugin.c:(.text+0x1a2c): undefined reference to `g_module_error'
-
-[Upstream suggested: https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/merge_requests/587 ]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- tools/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/meson.build b/tools/meson.build
-index 57595fb47..bcbe11ca1 100644
---- a/tools/meson.build
-+++ b/tools/meson.build
-@@ -1,4 +1,4 @@
--tool_deps = glib_deps + [pbutils_dep, audio_dep, video_dep, tag_dep, gst_dep, gst_base_dep]
-+tool_deps = glib_deps + [pbutils_dep, audio_dep, video_dep, tag_dep, gst_dep, gst_base_dep, gmodule_dep]
- 
- executable('gst-device-monitor- at 0@'.format(api_version),
-   'gst-device-monitor.c',
--- 
-2.25.1
-
diff --git a/package/gstreamer1/gst1-plugins-base/0002-meson-build-gir-even-when-cross-compiling-if-introspection.patch b/package/gstreamer1/gst1-plugins-base/0002-meson-build-gir-even-when-cross-compiling-if-introspection.patch
deleted file mode 100644
index a6cca0a4be..0000000000
--- a/package/gstreamer1/gst1-plugins-base/0002-meson-build-gir-even-when-cross-compiling-if-introspection.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 35db4a2433fbdf8612cf98b5aab5b14aeb5372f8 Mon Sep 17 00:00:00 2001
-From: Tim Philipp <tim@centricular.com>
-Date: Thu, 17 Oct 2019 12:13:35 +0100
-Subject: [PATCH] meson: build gir even when cross-compiling if introspection
- was enabled explicitly
-
-This can be made to work in certain circumstances when
-cross-compiling, so default to not building g-i stuff
-when cross-compiling, but allow it if introspection was
-enabled explicitly via -Dintrospection=enabled.
-
-See gstreamer/gstreamer#454 and gstreamer/gstreamer#381.
-
-Upstream commit: 30672ba7d134553e59935ddc875104adba26f25c
-Signed-off-by: Tim Philipp <tim@centricular.com>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 264d84c9e..c8147c224 100644
---- a/meson.build
-+++ b/meson.build
-@@ -371,7 +371,7 @@ endif
- 
- gir = find_program('g-ir-scanner', required : get_option('introspection'))
- gnome = import('gnome')
--build_gir = gir.found() and not meson.is_cross_build()
-+build_gir = gir.found() and (not meson.is_cross_build() or get_option('introspection').enabled())
- gir_init_section = [ '--add-init-section=extern void gst_init(gint*,gchar**);' + \
-     'g_setenv("GST_REGISTRY_DISABLE", "yes", TRUE);' + \
-     'g_setenv("GST_REGISTRY_1.0", "@0@", TRUE);'.format(meson.current_build_dir() + '/gir_empty_registry.reg') + \
--- 
-2.24.1
diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index db916ed219..ceed55890c 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -6,7 +6,7 @@ menuconfig BR2_PACKAGE_GST1_PLUGINS_BASE
 	help
 	  A basic set of well-supported plug-ins for GStreamer.
 
-	  http://gstreamer.freedesktop.org/
+	  https://gstreamer.freedesktop.org/
 
 if BR2_PACKAGE_GST1_PLUGINS_BASE
 
@@ -69,6 +69,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO
 	help
 	  GIO elements
 
+config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO_TYPEFINDER
+	bool "gio-typefinder"
+	help
+	  GIO typefinder elements
+
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OVERLAYCOMPOSITION
 	bool "overlaycomposition"
 	help
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
index 2074c0272b..74438e0a3c 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.16.2.tar.xz.sha256sum
-sha256 b13e73e2fe74a4166552f9577c3dcb24bed077021b9c7fa600d910ec6987816a gst-plugins-base-1.16.2.tar.xz
-sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
+# From https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.18.0.tar.xz.sha256sum
+sha256  762abdd1a950809a1cea62fff7f86b5f7d6bd5f6841e3e585c700b823cdb7897  gst-plugins-base-1.18.0.tar.xz
+sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index f0c14bc190..965e56942d 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PLUGINS_BASE_VERSION = 1.16.2
+GST1_PLUGINS_BASE_VERSION = 1.18.0
 GST1_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST1_PLUGINS_BASE_VERSION).tar.xz
 GST1_PLUGINS_BASE_SITE = https://gstreamer.freedesktop.org/src/gst-plugins-base
 GST1_PLUGINS_BASE_INSTALL_STAGING = YES
@@ -17,7 +17,7 @@ GST1_PLUGINS_BASE_CONF_OPTS = \
 	-Dgobject-cast-checks=disabled \
 	-Dglib-asserts=disabled \
 	-Dglib-checks=disabled \
-	-Dgtk_doc=disabled
+	-Ddoc=disabled
 
 # Options which require currently unpackaged libraries
 GST1_PLUGINS_BASE_CONF_OPTS += \
@@ -156,6 +156,12 @@ else
 GST1_PLUGINS_BASE_CONF_OPTS += -Dgio=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_GIO_TYPEFINDER),y)
+GST1_PLUGINS_BASE_CONF_OPTS += -Dgio-typefinder=enabled
+else
+GST1_PLUGINS_BASE_CONF_OPTS += -Dgio-typefinder=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OVERLAYCOMPOSITION),y)
 GST1_PLUGINS_BASE_CONF_OPTS += -Doverlaycomposition=enabled
 else
