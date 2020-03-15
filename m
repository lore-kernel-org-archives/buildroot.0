From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 15 Mar 2020 13:10:29 -0700
Subject: [Buildroot] [PATCH 2/6] package/gstreamer1/gst1-plugins-base: add
 introspection support
In-Reply-To: <20200315201034.1552960-1-aduskett@gmail.com>
References: <20200315201034.1552960-1-aduskett@gmail.com>
Message-ID: <20200315201034.1552960-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If gobject-introspection is selected, explicitly set -Dintrospection=enabled in
the configure options and add a dependency for gobject-introspection.

This feature requires an upstream patch that allows introspection support even
when cross-compiling.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 ...hen-cross-compiling-if-introspection.patch | 35 +++++++++++++++++++
 .../gst1-plugins-base/gst1-plugins-base.mk    | 11 ++++--
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 package/gstreamer1/gst1-plugins-base/0002-meson-build-gir-even-when-cross-compiling-if-introspection.patch

diff --git a/package/gstreamer1/gst1-plugins-base/0002-meson-build-gir-even-when-cross-compiling-if-introspection.patch b/package/gstreamer1/gst1-plugins-base/0002-meson-build-gir-even-when-cross-compiling-if-introspection.patch
new file mode 100644
index 0000000000..a6cca0a4be
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-base/0002-meson-build-gir-even-when-cross-compiling-if-introspection.patch
@@ -0,0 +1,35 @@
+From 35db4a2433fbdf8612cf98b5aab5b14aeb5372f8 Mon Sep 17 00:00:00 2001
+From: Tim Philipp <tim@centricular.com>
+Date: Thu, 17 Oct 2019 12:13:35 +0100
+Subject: [PATCH] meson: build gir even when cross-compiling if introspection
+ was enabled explicitly
+
+This can be made to work in certain circumstances when
+cross-compiling, so default to not building g-i stuff
+when cross-compiling, but allow it if introspection was
+enabled explicitly via -Dintrospection=enabled.
+
+See gstreamer/gstreamer#454 and gstreamer/gstreamer#381.
+
+Upstream commit: 30672ba7d134553e59935ddc875104adba26f25c
+Signed-off-by: Tim Philipp <tim@centricular.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 264d84c9e..c8147c224 100644
+--- a/meson.build
++++ b/meson.build
+@@ -371,7 +371,7 @@ endif
+ 
+ gir = find_program('g-ir-scanner', required : get_option('introspection'))
+ gnome = import('gnome')
+-build_gir = gir.found() and not meson.is_cross_build()
++build_gir = gir.found() and (not meson.is_cross_build() or get_option('introspection').enabled())
+ gir_init_section = [ '--add-init-section=extern void gst_init(gint*,gchar**);' + \
+     'g_setenv("GST_REGISTRY_DISABLE", "yes", TRUE);' + \
+     'g_setenv("GST_REGISTRY_1.0", "@0@", TRUE);'.format(meson.current_build_dir() + '/gir_empty_registry.reg') + \
+-- 
+2.24.1
diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index ccecbb3c08..fe80f4751c 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -17,8 +17,7 @@ GST1_PLUGINS_BASE_CONF_OPTS = \
 	-Dgobject-cast-checks=disabled \
 	-Dglib-asserts=disabled \
 	-Dglib-checks=disabled \
-	-Dgtk_doc=disabled \
-	-Dintrospection=disabled
+	-Dgtk_doc=disabled
 
 # Options which require currently unpackaged libraries
 GST1_PLUGINS_BASE_CONF_OPTS += \
@@ -37,6 +36,14 @@ GST1_PLUGINS_BASE_DEPENDENCIES = gstreamer1 $(TARGET_NLS_DEPENDENCIES)
 GST1_PLUGINS_BASE_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 # These plugins are listed in the order from ./configure --help
+
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GST1_PLUGINS_BASE_CONF_OPTS += -Dintrospection=enabled
+GST1_PLUGINS_BASE_DEPENDENCIES += gobject-introspection
+else
+GST1_PLUGINS_BASE_CONF_OPTS += -Dintrospection=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_ORC),y)
 GST1_PLUGINS_BASE_DEPENDENCIES += orc
 GST1_PLUGINS_BASE_CONF_OPTS += -Dorc=enabled
-- 
2.24.1
