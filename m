From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  9 Nov 2020 00:09:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/glmark2: fix wayland build
Message-ID: <20201108230932.465941-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

wayland-protocols is needed since
https://github.com/glmark2/glmark2/commit/58763e2c13db39ad7c1a994c261146154e4f0afa

Fixes:
 - http://autobuild.buildroot.org/results/6106f07602c014897331daac3de01ac4a74e2016
 - http://autobuild.buildroot.org/results/b8d43fad291022cbc6e43988fe6bec14f594591a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...find_program-to-find-wayland-scanner.patch | 50 +++++++++++++++++++
 package/glmark2/Config.in                     |  2 +
 package/glmark2/glmark2.mk                    |  4 +-
 3 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 package/glmark2/0001-wscript-use-find_program-to-find-wayland-scanner.patch

diff --git a/package/glmark2/0001-wscript-use-find_program-to-find-wayland-scanner.patch b/package/glmark2/0001-wscript-use-find_program-to-find-wayland-scanner.patch
new file mode 100644
index 0000000000..681f0c6794
--- /dev/null
+++ b/package/glmark2/0001-wscript-use-find_program-to-find-wayland-scanner.patch
@@ -0,0 +1,50 @@
+From 303d5c4fef1760ede5786bc62c7012dd7ae93722 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 8 Nov 2020 23:46:49 +0100
+Subject: [PATCH] wscript: use find_program to find wayland-scanner
+
+Use find_program instead of check_cfg to find wayland-scanner. This will
+fix the following build failure when cross-compiling:
+
+[ 3/73] Compiling doc/glmark2.1.in
+/bin/sh: 1: /usr/bin/wayland-scanner: not found
+
+Fixes:
+ - http://autobuild.buildroot.org/results//361dc40e558e2646cb93f405c7b1f621d400fea3
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/wscript_build | 2 +-
+ wscript           | 3 +--
+ 2 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/src/wscript_build b/src/wscript_build
+index bbe7a77..ed3e8d6 100644
+--- a/src/wscript_build
++++ b/src/wscript_build
+@@ -51,7 +51,7 @@ else:
+ 
+ if 'WAYLAND_SCANNER_wayland_scanner' in bld.env.keys():
+     def wayland_scanner_cmd(arg, src):
+-        return '%s %s < %s > ${TGT}' % (bld.env['WAYLAND_SCANNER_wayland_scanner'], arg, src)
++        return '%s %s < %s > ${TGT}' % (bld.env['WAYLAND_SCANNER_wayland_scanner'][0], arg, src)
+ 
+     def wayland_proto_src_path(proto, ver):
+         wp_dir = bld.env['WAYLAND_PROTOCOLS_pkgdatadir']
+diff --git a/wscript b/wscript
+index e09fa78..fe2494f 100644
+--- a/wscript
++++ b/wscript
+@@ -227,8 +227,7 @@ def configure_linux(ctx):
+         # wayland-protocols >= 1.12 required for xdg-shell stable
+         ctx.check_cfg(package = 'wayland-protocols', atleast_version = '1.12',
+                       variables = ['pkgdatadir'], uselib_store = 'WAYLAND_PROTOCOLS')
+-        ctx.check_cfg(package = 'wayland-scanner', variables = ['wayland_scanner'],
+-                      uselib_store = 'WAYLAND_SCANNER')
++        ctx.find_program('wayland-scanner', var = 'WAYLAND_SCANNER_wayland_scanner')
+ 
+     # Prepend CXX flags so that they can be overriden by the
+     # CXXFLAGS environment variable
+-- 
+2.28.0
+
diff --git a/package/glmark2/Config.in b/package/glmark2/Config.in
index 153eb3b0af..40d0adcc8a 100644
--- a/package/glmark2/Config.in
+++ b/package/glmark2/Config.in
@@ -24,6 +24,7 @@ config BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GLESV2
 	depends on BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_GLMARK2_FLAVOR_ANY
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 
 config BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GL
 	bool
@@ -32,6 +33,7 @@ config BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GL
 	depends on BR2_PACKAGE_HAS_LIBGL
 	depends on BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_GLMARK2_FLAVOR_ANY
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 
 config BR2_PACKAGE_GLMARK2_FLAVOR_X11_GLESV2
 	bool
diff --git a/package/glmark2/glmark2.mk b/package/glmark2/glmark2.mk
index ec62faada2..9e47b426fe 100644
--- a/package/glmark2/glmark2.mk
+++ b/package/glmark2/glmark2.mk
@@ -31,12 +31,12 @@ GLMARK2_FLAVORS += x11-gl
 endif
 
 ifeq ($(BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GLESV2),y)
-GLMARK2_DEPENDENCIES += libgles wayland
+GLMARK2_DEPENDENCIES += libgles wayland wayland-protocols
 GLMARK2_FLAVORS += wayland-glesv2
 endif
 
 ifeq ($(BR2_PACKAGE_GLMARK2_FLAVOR_WAYLAND_GL),y)
-GLMARK2_DEPENDENCIES += libgl wayland
+GLMARK2_DEPENDENCIES += libgl wayland wayland-protocols
 GLMARK2_FLAVORS += wayland-gl
 endif
 
-- 
2.28.0
