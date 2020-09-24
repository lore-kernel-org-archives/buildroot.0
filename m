From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 24 Sep 2020 21:06:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/harfbuzz: add introspection support
Message-ID: <20200924190614.1409319-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add introspection support to harfbuzz otherwise activation of
introspection in pango 1.46.1 will fail on:

Couldn't find include 'HarfBuzz-0.0.gir' (search path: '['/home/naourr/work/instance-2/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/../share/gir-1.0', '/home/naourr/work/instance-2/output-1/host/share/gir-1.0', '/home/naourr/work/instance-2/output-1/host/share', '/home/naourr/.local/share/flatpak/exports/share/gir-1.0', '/var/lib/flatpak/exports/share/gir-1.0', '/usr/local/share/gir-1.0', '/usr/share/gir-1.0', '/home/naourr/work/instance-2/output-1/host/share/gir-1.0', '/usr/share/gir-1.0']')

Fixes:
 - http://autobuild.buildroot.org/results/3357225ee2d8392bfd57af91cde04a1113e03493

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...allow-introspection-when-cross-compi.patch | 33 +++++++++++++++++++
 package/harfbuzz/harfbuzz.mk                  | 13 ++++++--
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 package/harfbuzz/0001-src-meson.build-allow-introspection-when-cross-compi.patch

diff --git a/package/harfbuzz/0001-src-meson.build-allow-introspection-when-cross-compi.patch b/package/harfbuzz/0001-src-meson.build-allow-introspection-when-cross-compi.patch
new file mode 100644
index 0000000000..700f6f85e4
--- /dev/null
+++ b/package/harfbuzz/0001-src-meson.build-allow-introspection-when-cross-compi.patch
@@ -0,0 +1,33 @@
+From 432dfd0a1d8fe0a8df89e7ce828c520c7758f10c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 24 Sep 2020 21:00:34 +0200
+Subject: [PATCH] src/meson.build: allow introspection when cross-compiling
+
+introspection can be enabled when cross-compiling on certains conditions
+(for example it is supported by buildroot)
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/harfbuzz/harfbuzz/pull/2692]
+---
+ src/meson.build | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index 19290245..7db43508 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -637,11 +637,6 @@ if have_gobject
+   gir = find_program('g-ir-scanner', required: get_option('introspection'))
+   build_gir = gir.found()
+ 
+-  build_gir = build_gir and not meson.is_cross_build()
+-  if not build_gir and get_option('introspection').enabled()
+-    error('Introspection support is requested but it isn\'t available in cross builds')
+-  endif
+-
+   build_gir = build_gir and get_option('default_library') != 'static'
+   if not build_gir and get_option('introspection').enabled()
+     error('Introspection support is requested but the default library option should be shared or both')
+-- 
+2.28.0
+
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 6d35e8b65e..fae9278b7c 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -11,13 +11,11 @@ HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
 HARFBUZZ_LICENSE_FILES = COPYING
 HARFBUZZ_INSTALL_STAGING = YES
 HARFBUZZ_CONF_OPTS = \
-	-Dgobject=disabled \
 	-Dfontconfig=disabled \
 	-Dgdi=disabled \
 	-Ddirectwrite=disabled \
 	-Dcoretext=disabled \
 	-Dtests=disabled \
-	-Dintrospection=disabled \
 	-Ddocs=disabled \
 	-Dbenchmark=disabled \
 	-Dicu_builtin=false \
@@ -61,6 +59,17 @@ else
 HARFBUZZ_CONF_OPTS += -Dfreetype=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
+HARFBUZZ_DEPENDENCIES += gobject-introspection
+HARFBUZZ_CONF_OPTS += \
+	-Dgobject=enabled \
+	-Dintrospection=enabled
+else
+HARFBUZZ_CONF_OPTS += \
+	-Dgobject=disabled \
+	-Dintrospection=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GRAPHITE2),y)
 HARFBUZZ_DEPENDENCIES += graphite2
 HARFBUZZ_CONF_OPTS += -Dgraphite=enabled
-- 
2.28.0
