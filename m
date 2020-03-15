From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 15 Mar 2020 13:10:31 -0700
Subject: [Buildroot] [PATCH 4/6] package/gstreamer1/gst1-rtsp-server: add
 introspection support
In-Reply-To: <20200315201034.1552960-1-aduskett@gmail.com>
References: <20200315201034.1552960-1-aduskett@gmail.com>
Message-ID: <20200315201034.1552960-4-aduskett@gmail.com>
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
 .../gst1-rtsp-server/gst1-rtsp-server.mk      |  8 ++++-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 package/gstreamer1/gst1-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch

diff --git a/package/gstreamer1/gst1-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch b/package/gstreamer1/gst1-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch
new file mode 100644
index 0000000000..0adf6d4e47
--- /dev/null
+++ b/package/gstreamer1/gst1-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch
@@ -0,0 +1,36 @@
+From 35db4a2433fbdf8612cf98b5aab5b14aeb5372f8 Mon Sep 17 00:00:00 2001
+From: Tim Philipp <tim@centricular.com>
+Date:  Fri, 18 Oct 2019 00:42:12 +0100
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
+Upstream commit: 95ce953e34cd0e9f5d42ce7900a9572e7bc8ca47
+Signed-off-by: Tim Philipp <tim@centricular.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index e1e3b1d..3f45f0e 100644
+--- a/meson.build
++++ b/meson.build
+@@ -173,7 +173,7 @@ endif
+ 
+ gir = find_program('g-ir-scanner', required : get_option('introspection'))
+ gnome = import('gnome')
+-build_gir = gir.found() and not meson.is_cross_build()
++build_gir = gir.found() and (not meson.is_cross_build() or get_option('introspection').enabled())
+ gir_init_section = [ '--add-init-section=extern void gst_init(gint*,gchar**);' + \
+     'g_setenv("GST_REGISTRY_1.0", "@0@", TRUE);'.format(meson.current_build_dir() + '/gir_empty_registry.reg') + \
+     'g_setenv("GST_PLUGIN_PATH_1_0", "", TRUE);' + \
+-- 
+2.24.1
+
diff --git a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
index df873ad732..13653565bd 100644
--- a/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
+++ b/package/gstreamer1/gst1-rtsp-server/gst1-rtsp-server.mk
@@ -25,11 +25,17 @@ GST1_RTSP_SERVER_CONF_OPTS = \
 GST1_RTSP_SERVER_CONF_OPTS += \
 	-Dexamples=disabled \
 	-Dtests=disabled \
-	-Dintrospection=disabled \
 	-Dgobject-cast-checks=disabled \
 	-Dglib-asserts=disabled \
 	-Dglib-checks=disabled
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GST1_RTSP_SERVER_CONF_OPTS += -Dintrospection=enabled
+GST1_RTSP_SERVER_DEPENDENCIES += gobject-introspection
+else
+GST1_RTSP_SERVER_CONF_OPTS += -Dintrospection=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCGROUP),y)
 GST1_RTSP_SERVER_DEPENDENCIES += libcgroup
 endif
-- 
2.24.1
