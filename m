From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 15 Mar 2020 13:10:28 -0700
Subject: [Buildroot] [PATCH 1/6] package/gstreamer1/gstreamer1: add
 introspection support
Message-ID: <20200315201034.1552960-1-aduskett@gmail.com>
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
 ...hen-cross-compiling-if-introspection.patch | 36 +++++++++++++++++++
 package/gstreamer1/gstreamer1/gstreamer1.mk   |  8 ++++-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 package/gstreamer1/gstreamer1/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch

diff --git a/package/gstreamer1/gstreamer1/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch b/package/gstreamer1/gstreamer1/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch
new file mode 100644
index 0000000000..fc290f6cc0
--- /dev/null
+++ b/package/gstreamer1/gstreamer1/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch
@@ -0,0 +1,36 @@
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
+Fixes #454 and #381.
+
+Upstream commit: 35db4a2433fbdf8612cf98b5aab5b14aeb5372f8
+Signed-off-by: Tim Philipp <tim@centricular.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 90d98d8eb00..a47e7f34e8a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -453,7 +453,7 @@ rt_lib = cc.find_library('rt', required : false)
+ gir = find_program('g-ir-scanner', required : get_option('introspection'))
+ gnome = import('gnome')
+ 
+-build_gir = gir.found() and not meson.is_cross_build()
++build_gir = gir.found() and (not meson.is_cross_build() or get_option('introspection').enabled())
+ 
+ gir_init_section = [ '--add-init-section=extern void gst_init(gint*,gchar**);' + \
+     'g_setenv("GST_REGISTRY_DISABLE", "yes", TRUE);' + \
+-- 
+2.24.1
+
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 4eb3158b8f..47615aad1f 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -16,7 +16,6 @@ GSTREAMER1_CONF_OPTS = \
 	-Dtests=disabled \
 	-Dbenchmarks=disabled \
 	-Dgtk_doc=disabled \
-	-Dintrospection=disabled \
 	-Dglib-asserts=disabled \
 	-Dglib-checks=disabled \
 	-Dgobject-cast-checks=disabled \
@@ -36,6 +35,13 @@ GSTREAMER1_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_VALGRIND),valgrind) \
 	$(TARGET_NLS_DEPENDENCIES)
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GSTREAMER1_CONF_OPTS += -Dintrospection=enabled
+GSTREAMER1_DEPENDENCIES += gobject-introspection
+else
+GSTREAMER1_CONF_OPTS += -Dintrospection=disabled
+endif
+
 GSTREAMER1_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 $(eval $(meson-package))
-- 
2.24.1
