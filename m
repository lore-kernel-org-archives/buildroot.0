From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 11:51:12 +0100
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-bad: add
 introspection support
Message-ID: <20200322130149.F0D1E83D71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4cbe598a9f286a8e1ad54564829eba594ff64327
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If gobject-introspection is selected, explicitly set -Dintrospection=enabled in
the configure options and add a dependency for gobject-introspection.

This feature requires an upstream patch that allows introspection support even
when cross-compiling.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ven-when-cross-compiling-if-introspection.patch | 36 ++++++++++++++++++++++
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |  8 ++++-
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch b/package/gstreamer1/gst1-plugins-bad/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch
new file mode 100644
index 0000000000..dd3b6eca7d
--- /dev/null
+++ b/package/gstreamer1/gst1-plugins-bad/0001-meson-build-gir-even-when-cross-compiling-if-introspection.patch
@@ -0,0 +1,36 @@
+From 35db4a2433fbdf8612cf98b5aab5b14aeb5372f8 Mon Sep 17 00:00:00 2001
+From: Tim Philipp <tim@centricular.com>
+Date: Fri, 18 Oct 2019 00:39:12 +0100
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
+Upstream commit: 97a4d0cd7de8cfbf983acc7e37ba2f8fb73c3e19
+Signed-off-by: Tim Philipp <tim@centricular.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 67aeeb4d03..7b3314bd9f 100644
+--- a/meson.build
++++ b/meson.build
+@@ -405,7 +405,7 @@ python3 = import('python').find_installation()
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
diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
index ef36e4dc0a..e020c587d3 100644
--- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
+++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
@@ -23,7 +23,6 @@ GST1_PLUGINS_BAD_CONF_OPTS = \
 	-Dwinks=disabled \
 	-Dandroidmedia=disabled \
 	-Dapplemedia=disabled \
-	-Dintrospection=disabled \
 	-Dgobject-cast-checks=disabled \
 	-Dglib-asserts=disabled \
 	-Dglib-checks=disabled
@@ -63,6 +62,13 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
 
 GST1_PLUGINS_BAD_DEPENDENCIES = gst1-plugins-base gstreamer1
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+GST1_PLUGINS_BAD_CONF_OPTS += -Dintrospection=enabled
+GST1_PLUGINS_BAD_DEPENDENCIES += gobject-introspection
+else
+GST1_PLUGINS_BAD_CONF_OPTS += -Dintrospection=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WAYLAND),y)
 GST1_PLUGINS_BAD_CONF_OPTS += -Dwayland=enabled
 GST1_PLUGINS_BAD_DEPENDENCIES += libdrm wayland wayland-protocols
