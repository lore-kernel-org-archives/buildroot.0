From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 17 Apr 2019 23:43:47 +0200
Subject: [Buildroot] [RFC v2 6/7] package/mesa3d: switch build system to
 meson
In-Reply-To: <20190417214348.15685-1-romain.naour@smile.fr>
References: <20190417214348.15685-1-romain.naour@smile.fr>
Message-ID: <20190417214348.15685-6-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Add a new patch to remove host-python-mako dependency [1].

Update patches for meson:
0002-configure.ac-invert-order-for-wayland-scanner-check.patch
0003-set-LIBCLC_INCLUDEDIR.patch

Disable unused options that are set to "auto" mode.
(valgrind, gallium-omx, power8).

Remove --disable-static option since there is no meson equivalent.
Remove --disable-mangling since it's not yet supported by meson.

Use r100 instead of radeon as DRI name for BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON.

[1] http://patchwork.ozlabs.org/patch/1084248/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
patch 0002-meson-use-generated-files-if-already-present-in-the-.patch may not work at 100%.
---
 ...vert-order-for-wayland-scanner-check.patch |  51 --------
 ...ted-files-if-already-present-in-the-.patch |  81 +++++++++++++
 ...t-proper-value-for-LIBCLC_INCLUDEDIR.patch |  39 ++++++
 .../mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch   |  37 ------
 ...d-scanner-provided-by-wayland-scanne.patch |  52 ++++++++
 package/mesa3d/Config.in                      |   3 +-
 package/mesa3d/mesa3d.mk                      | 113 ++++++++----------
 7 files changed, 225 insertions(+), 151 deletions(-)
 delete mode 100644 package/mesa3d/0002-configure.ac-invert-order-for-wayland-scanner-check.patch
 create mode 100644 package/mesa3d/0002-meson-use-generated-files-if-already-present-in-the-.patch
 create mode 100644 package/mesa3d/0003-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
 delete mode 100644 package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch
 create mode 100644 package/mesa3d/0004-meson-use-wayland-scanner-provided-by-wayland-scanne.patch

diff --git a/package/mesa3d/0002-configure.ac-invert-order-for-wayland-scanner-check.patch b/package/mesa3d/0002-configure.ac-invert-order-for-wayland-scanner-check.patch
deleted file mode 100644
index 5135528795..0000000000
--- a/package/mesa3d/0002-configure.ac-invert-order-for-wayland-scanner-check.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From ef96bac7cbbb11b98606864ead0f731dd5b71d5a Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Thu, 17 Nov 2016 15:36:54 -0300
-Subject: [PATCH] configure.ac: invert order for wayland-scanner check
-
-When cross-compiling the .pc file might point to the wrong
-wayland-scanner binary (target rather than host) resulting in a
-non-executable and wrong scanner.
-Try searching the PATH first, and if that fails fall back into
-pkg-config.
-
-[Vincent: tweak patch for 17.1.1 version]
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-[Romain: rebase on 18.1]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
-[Bernd rebase on 18.3]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure.ac | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index f1fbdcc6c7..dcf87e7dd6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1841,17 +1841,16 @@
-         fi
-         WAYLAND_PROTOCOLS_DATADIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
- 
--        PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
-+        AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
-+        if test "x$WAYLAND_SCANNER" = x; then
-+                PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
-                           WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`,
-                           WAYLAND_SCANNER='')
-+        fi
-         PKG_CHECK_EXISTS([wayland-scanner >= 1.15],
-                           AC_SUBST(SCANNER_ARG, 'private-code'),
-                           AC_SUBST(SCANNER_ARG, 'code'))
- 
--        if test "x$WAYLAND_SCANNER" = x; then
--            AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
--        fi
--
-         if test "x$WAYLAND_SCANNER" = "x:"; then
-                 AC_MSG_ERROR([wayland-scanner is needed to compile the wayland platform])
-         fi
--- 
-2.14.3
diff --git a/package/mesa3d/0002-meson-use-generated-files-if-already-present-in-the-.patch b/package/mesa3d/0002-meson-use-generated-files-if-already-present-in-the-.patch
new file mode 100644
index 0000000000..0350d07b08
--- /dev/null
+++ b/package/mesa3d/0002-meson-use-generated-files-if-already-present-in-the-.patch
@@ -0,0 +1,81 @@
+From 56a9b8964435e88ad869a149cc8f087eea7c4aa6 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Sun, 14 Apr 2019 19:57:25 +0200
+Subject: [PATCH] meson: use generated files if already present in the release
+ archive
+
+meson buildsystem behaviour doesn't is not the same as for autotools
+buildsystem about generated files. With autotools if a generated file
+exist it is not regenerated but with meson it is unconditionnaly
+generated. These files are provided as part of a release archive.
+
+Modify the custom_target using ir_expression_operation.py in order to
+use generated files present in the release archive.
+
+The python script ir_expression_operation.py used to build the header
+file ir_expression_operation_constant.h is using python mako module.
+This module must be installed in order to be able to build mesa from
+the git repository.
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ meson.build                   | 8 +++++++-
+ src/compiler/glsl/meson.build | 2 ++
+ src/compiler/meson.build      | 1 +
+ 3 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 53d02e31097..6c4f1508855 100644
+--- a/meson.build
++++ b/meson.build
+@@ -728,8 +728,14 @@ from distutils.version import StrictVersion
+ import mako
+ assert StrictVersion(mako.__version__) > StrictVersion("0.8.0")
+   ''')
++
++# Check if we build from a release archive that already contains pregenerated source files.
++has_pregenerated_files = run_command('[', '-f', join_paths(meson.source_root(), 'src/mesa/main/format_unpack.c'), ']')
++
+ if has_mako.returncode() != 0
+-  error('Python (3.x) mako module >= 0.8.0 required to build mesa.')
++  if has_pregenerated_files.returncode() != 0
++    error('Python (3.x) mako module >= 0.8.0 required to build mesa.')
++  endif
+ endif
+ 
+ if cc.get_id() == 'gcc' and cc.version().version_compare('< 4.4.6')
+diff --git a/src/compiler/glsl/meson.build b/src/compiler/glsl/meson.build
+index 8096f2d048e..3b3ec274785 100644
+--- a/src/compiler/glsl/meson.build
++++ b/src/compiler/glsl/meson.build
+@@ -43,6 +43,7 @@ ir_expression_operation_constant_h = custom_target(
+   output : 'ir_expression_operation_constant.h',
+   command : [prog_python, '@INPUT@', 'constant'],
+   capture : true,
++  build_always_stale : false,
+ )
+ 
+ ir_expression_operation_strings_h = custom_target(
+@@ -51,6 +52,7 @@ ir_expression_operation_strings_h = custom_target(
+   output : 'ir_expression_operation_strings.h',
+   command : [prog_python, '@INPUT@', 'strings'],
+   capture : true,
++  build_always_stale : false,
+ )
+ 
+ float64_glsl_h = custom_target(
+diff --git a/src/compiler/meson.build b/src/compiler/meson.build
+index 0f8f3c12966..ff254b65051 100644
+--- a/src/compiler/meson.build
++++ b/src/compiler/meson.build
+@@ -42,6 +42,7 @@ ir_expression_operation_h = custom_target(
+   output : 'ir_expression_operation.h',
+   command : [prog_python, '@INPUT@', 'enum'],
+   capture : true,
++  build_always_stale : false,
+ )
+ 
+ libcompiler = static_library(
+-- 
+2.20.1
+
diff --git a/package/mesa3d/0003-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch b/package/mesa3d/0003-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
new file mode 100644
index 0000000000..072d79a213
--- /dev/null
+++ b/package/mesa3d/0003-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
@@ -0,0 +1,39 @@
+From 7b46756a99aca7f27a45c3b99460f088570f6f53 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Wed, 17 Apr 2019 23:07:42 +0200
+Subject: [PATCH] meson: Set proper value for LIBCLC_INCLUDEDIR
+
+LIBCLC_INCLUDEDIR is the location where mesa3d OpenCL implementation
+will look for OpenCL "headers" on the target, when building the OpenCL
+kernels.
+
+The value returned by pkg-config for includedir is relevant when
+cross-compiling, on the build machine. But in this specific case, we
+really need a value that is valid on the target.
+
+Those headers are installed by the libclc package in /usr/share so
+that they are not removed by Buildroot target-finalize logic.
+
+Based on the patch for autotools provided by Valentin Korenblit.
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ src/gallium/state_trackers/clover/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gallium/state_trackers/clover/meson.build b/src/gallium/state_trackers/clover/meson.build
+index 62ac5f5278d..ecdeb39669c 100644
+--- a/src/gallium/state_trackers/clover/meson.build
++++ b/src/gallium/state_trackers/clover/meson.build
+@@ -49,7 +49,7 @@ libclllvm = static_library(
+   include_directories : clover_incs,
+   cpp_args : [
+     cpp_vis_args,
+-    '-DLIBCLC_INCLUDEDIR="@0@/"'.format(dep_clc.get_pkgconfig_variable('includedir')),
++    '-DLIBCLC_INCLUDEDIR="/usr/share"',
+     '-DLIBCLC_LIBEXECDIR="@0@/"'.format(dep_clc.get_pkgconfig_variable('libexecdir')),
+     '-DCLANG_RESOURCE_DIR="@0@"'.format(join_paths(
+       dep_llvm.get_configtool_variable('libdir'), 'clang',
+-- 
+2.20.1
+
diff --git a/package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch b/package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch
deleted file mode 100644
index 42ae826a36..0000000000
--- a/package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 94bceeb621e36f3188c6246a763def8695526578 Mon Sep 17 00:00:00 2001
-From: Valentin Korenblit <valentinkorenblit@gmail.com>
-Date: Sat, 20 Oct 2018 10:56:23 +0200
-Subject: [PATCH] Set proper value for LIBCLC_INCLUDEDIR
-
-LIBCLC_INCLUDEDIR is the location where mesa3d OpenCL implementation
-will look for OpenCL "headers" on the target, when building the OpenCL
-kernels.
-
-The value returned by pkg-config for includedir is relevant when
-cross-compiling, on the build machine. But in this specific case, we
-really need a value that is valid on the target.
-
-Those headers are installed by the libclc package in /usr/share so
-that they are not removed by Buildroot target-finalize logic.
-
-Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 864dcae..cc2390b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2429,7 +2429,7 @@ if test "x$enable_opencl" = xyes; then
-                     PKG_CONFIG_PATH environment variable.
-                     By default libclc.pc is installed to /usr/local/share/pkgconfig/])
-     else
--        LIBCLC_INCLUDEDIR=`$PKG_CONFIG --variable=includedir libclc`
-+        LIBCLC_INCLUDEDIR="/usr/share"
-         LIBCLC_LIBEXECDIR=`$PKG_CONFIG --variable=libexecdir libclc`
-         AC_SUBST([LIBCLC_INCLUDEDIR])
-         AC_SUBST([LIBCLC_LIBEXECDIR])
--- 
-2.7.4
-
diff --git a/package/mesa3d/0004-meson-use-wayland-scanner-provided-by-wayland-scanne.patch b/package/mesa3d/0004-meson-use-wayland-scanner-provided-by-wayland-scanne.patch
new file mode 100644
index 0000000000..784b27c4a2
--- /dev/null
+++ b/package/mesa3d/0004-meson-use-wayland-scanner-provided-by-wayland-scanne.patch
@@ -0,0 +1,52 @@
+From 0e107f7bac8d84d8fb2bb5b83bfb4474348a82c1 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Wed, 17 Apr 2019 22:47:05 +0200
+Subject: [PATCH] meson: use wayland-scanner provided by wayland-scanner-path
+
+When cross-compiling the .pc file might point to the wrong
+wayland-scanner binary (target rather than host) resulting in a
+non-executable and wrong scanner.
+First try by using the path provided by wayland-scanner-path,
+and if that fails fall back into pkg-config.
+
+Based on the patch for autotools provided by Gustavo Zacarias.
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ meson.build       | 5 ++++-
+ meson_options.txt | 6 ++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 6c4f1508855..ef0532b2cfb 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1319,7 +1319,10 @@ endif
+ 
+ if with_platform_wayland
+   dep_wl_scanner = dependency('wayland-scanner', native: true)
+-  prog_wl_scanner = find_program(dep_wl_scanner.get_pkgconfig_variable('wayland_scanner'))
++  prog_wl_scanner = get_option('wayland-scanner-path')
++  if prog_wl_scanner == ''
++    prog_wl_scanner = find_program(dep_wl_scanner.get_pkgconfig_variable('wayland_scanner'))
++  endif
+   if dep_wl_scanner.version().version_compare('>= 1.15')
+     wl_scanner_arg = 'private-code'
+   else
+diff --git a/meson_options.txt b/meson_options.txt
+index ccf70659ff7..59ff8df8337 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -324,3 +324,9 @@ option(
+   value : true,
+   description : 'Enable direct rendering in GLX and EGL for DRI',
+ )
++option(
++  'wayland-scanner-path',
++  type : 'string',
++  value : '',
++  description : 'Locations to wayland-scanner binary. Default: use path from pkg-config'
++)
+-- 
+2.20.1
+
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index eba218efb2..df24acea21 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -87,8 +87,7 @@ config BR2_PACKAGE_MESA3D_NEEDS_XA
 	bool
 
 # Quote from mesa3d meson.build: "kmsro driver requires one or more
-# renderonly drivers (vc4, etnaviv, freedreno)". But only vc4 support
-# is available by using the (deprecated) autotools build system.
+# renderonly drivers (vc4, etnaviv, freedreno)".
 config BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	bool
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index c8ca9a0d0f..5244545584 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -25,27 +25,19 @@ MESA3D_DEPENDENCIES = \
 	libdrm \
 	zlib
 
-# Disable assembly usage.
-MESA3D_CONF_OPTS = --disable-asm
-
-# autotools are deprecated in favour of meson, for now force autotools
-MESA3D_CONF_OPTS += --enable-autotools
-
-# Disable static, otherwise configure will fail with: "Cannot enable both static
-# and shared."
-ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-MESA3D_CONF_OPTS += --disable-static
-endif
+MESA3D_CONF_OPTS = \
+	-Dasm=false \
+	-Dgallium-omx=disabled \
+	-Dpower8=false \
+	-Dvalgrind=false
 
 ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
 MESA3D_DEPENDENCIES += host-llvm llvm
-MESA3D_CONF_OPTS += \
-	--with-llvm-prefix=$(STAGING_DIR)/usr \
-	--enable-llvm-shared-libs \
-	--enable-llvm
+MESA3D_CONF_ENV += LLVM_CONFIG=$(STAGING_DIR)/usr/bin/llvm-config
+MESA3D_CONF_OPTS += -Dllvm=true
 else
 # Avoid automatic search of llvm-config
-MESA3D_CONF_OPTS += --disable-llvm
+MESA3D_CONF_OPTS += -Dllvm=false
 endif
 
 # Disable opencl-icd: OpenCL lib will be named libOpenCL instead of
@@ -53,11 +45,9 @@ endif
 ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
 MESA3D_PROVIDES += libopencl
 MESA3D_DEPENDENCIES += clang libclc
-MESA3D_CONF_OPTS += --enable-opencl \
-	--disable-opencl-icd \
-	--with-clang-libdir=$(STAGING_DIR)/usr/lib
+MESA3D_CONF_OPTS += -Dgallium-opencl=standalone
 else
-MESA3D_CONF_OPTS += --disable-opencl
+MESA3D_CONF_OPTS += -Dgallium-opencl=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS),y)
@@ -82,16 +72,17 @@ MESA3D_DEPENDENCIES += \
 	xlib_libXxf86vm \
 	xorgproto \
 	libxcb
-MESA3D_CONF_OPTS += --enable-glx --disable-mangling
+# Disable-mangling not yet supported by meson build system.
+MESA3D_CONF_OPTS += -Dglx=auto
 ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_XA),y)
-MESA3D_CONF_OPTS += --enable-xa
+MESA3D_CONF_OPTS += -Dgallium-xa=true
 else
-MESA3D_CONF_OPTS += --disable-xa
+MESA3D_CONF_OPTS += -Dgallium-xa=false
 endif
 else
 MESA3D_CONF_OPTS += \
-	--disable-glx \
-	--disable-xa
+	-Dglx=disabled \
+	-Dgallium-xa=false
 endif
 
 # Drivers
@@ -111,63 +102,62 @@ MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST) += swrast
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I915)   += i915
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965)   += i965
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU) += nouveau
-MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += radeon
+MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += r100
 # Vulkan Drivers
 MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
 
 ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER),)
 MESA3D_CONF_OPTS += \
-	--without-gallium-drivers \
-	--disable-gallium-extra-hud
+	-Dgallium-drivers= \
+	-Dgallium-extra-hud=false
 else
 MESA3D_CONF_OPTS += \
-	--enable-shared-glapi \
-	--with-gallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y)) \
-	--enable-gallium-extra-hud
+	-Dshared-glapi=true \
+	-Dgallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y)) \
+	-Dgallium-extra-hud=true
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
 MESA3D_CONF_OPTS += \
-	--without-dri-drivers --disable-dri3
+	-Ddri-drivers= -Ddri3=false
 else
 ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE),y)
 MESA3D_DEPENDENCIES += xlib_libxshmfence
-MESA3D_CONF_OPTS += --enable-dri3
+MESA3D_CONF_OPTS += -Ddri3=true
 else
-MESA3D_CONF_OPTS += --disable-dri3
+MESA3D_CONF_OPTS += -Ddri3=false
 endif
 MESA3D_CONF_OPTS += \
-	--enable-shared-glapi \
-	--enable-driglx-direct \
-	--with-dri-driverdir=/usr/lib/dri \
-	--with-dri-drivers=$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
+	-Dshared-glapi=true \
+	-Dglx-direct=true \
+	-Ddri-drivers=$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
 MESA3D_CONF_OPTS += \
-	--without-vulkan-drivers
+	-Dvulkan-drivers=
 else
 MESA3D_DEPENDENCIES += xlib_libxshmfence
 MESA3D_CONF_OPTS += \
-	--enable-dri3 \
-	--with-vulkan-drivers=$(subst $(space),$(comma),$(MESA3D_VULKAN_DRIVERS-y))
+	-Ddri3=true \
+	-Dvulkan-drivers=$(subst $(space),$(comma),$(MESA3D_VULKAN_DRIVERS-y))
 endif
 
 # APIs
 
 ifeq ($(BR2_PACKAGE_MESA3D_OSMESA_CLASSIC),y)
-MESA3D_CONF_OPTS += --enable-osmesa
+MESA3D_CONF_OPTS += -Dosmesa=classic
 else
-MESA3D_CONF_OPTS += --disable-osmesa
+MESA3D_CONF_OPTS += -Dosmesa=none
 endif
 
 # Always enable OpenGL:
-#   - it is needed for GLES (mesa3d's ./configure is a bit weird)
-MESA3D_CONF_OPTS += --enable-opengl --enable-dri
+#   - it is needed for GLES (mesa3d's meson.build is a bit weird)
+MESA3D_CONF_OPTS += -Dopengl=true -Dglx=dri
 
 # libva and mesa3d have a circular dependency
 # we do not need libva support in mesa3d, therefore disable this option
-MESA3D_CONF_OPTS += --disable-va
+MESA3D_CONF_OPTS += -Dgallium-va=false
 
 # libGL is only provided for a full xorg stack
 ifeq ($(BR2_PACKAGE_XORG7),y)
@@ -194,57 +184,58 @@ endif
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 MESA3D_DEPENDENCIES += wayland wayland-protocols
 MESA3D_PLATFORMS += wayland
+MESA3D_CONF_OPTS += -Dwayland-scanner-path=$(HOST_DIR)/bin/wayland-scanner
 endif
 ifeq ($(BR2_PACKAGE_XORG7),y)
 MESA3D_PLATFORMS += x11
 endif
 
 MESA3D_CONF_OPTS += \
-	--with-platforms=$(subst $(space),$(comma),$(MESA3D_PLATFORMS))
+	-Dplatforms=$(subst $(space),$(comma),$(MESA3D_PLATFORMS))
 
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 MESA3D_PROVIDES += libegl
 MESA3D_CONF_OPTS += \
-	--enable-gbm \
-	--enable-egl
+	-Dgbm=true \
+	-Degl=true
 else
 MESA3D_CONF_OPTS += \
-	--disable-egl
+	-Degl=true=false
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_ES),y)
 MESA3D_PROVIDES += libgles
-MESA3D_CONF_OPTS += --enable-gles1 --enable-gles2
+MESA3D_CONF_OPTS += -Dgles1=true -Dgles2=true
 else
-MESA3D_CONF_OPTS += --disable-gles1 --disable-gles2
+MESA3D_CONF_OPTS += -Dgles1=false -Dgles2=false
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_XVMC),y)
 MESA3D_DEPENDENCIES += xlib_libXvMC
-MESA3D_CONF_OPTS += --enable-xvmc
+MESA3D_CONF_OPTS += -Dgallium-xvmc=true
 else
-MESA3D_CONF_OPTS += --disable-xvmc
+MESA3D_CONF_OPTS += -Dgallium-xvmc=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
-MESA3D_CONF_OPTS += --enable-libunwind
+MESA3D_CONF_OPTS += -Dlibunwind=true
 MESA3D_DEPENDENCIES += libunwind
 else
-MESA3D_CONF_OPTS += --disable-libunwind
+MESA3D_CONF_OPTS += -Dlibunwind=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBVDPAU),y)
 MESA3D_DEPENDENCIES += libvdpau
-MESA3D_CONF_OPTS += --enable-vdpau
+MESA3D_CONF_OPTS += -Dgallium-vdpau=true
 else
-MESA3D_CONF_OPTS += --disable-vdpau
+MESA3D_CONF_OPTS += -Dgallium-vdpau=false
 endif
 
 ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
-MESA3D_CONF_OPTS += --enable-lmsensors
+MESA3D_CONF_OPTS += -Dlmsensors=true
 MESA3D_DEPENDENCIES += lm-sensors
 else
-MESA3D_CONF_OPTS += --disable-lmsensors
+MESA3D_CONF_OPTS += -Dlmsensors=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.20.1
