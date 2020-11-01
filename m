From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  1 Nov 2020 09:46:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: bump version to 20.2.1
Message-ID: <20201101084657.755734-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rebased patch 0002 & 0003, added patch 0004 to fix build error.

Switched license file to license.rst due to upstream commit
https://cgit.freedesktop.org/mesa/mesa/commit/?id=4d066836e3cf307431a74eafcc8a404ce5ccea69
"No modification to the generated results have been done."

Switched true/false configure option values to enabled/disabled due to
upstream commit:
https://cgit.freedesktop.org/mesa/mesa/commit/?id=138c003d22739b0d1e6860ed398dd511a44cde04

Remove "MESA3D_PLATFORMS += drm", this platform is now automatically
selected:
https://cgit.freedesktop.org/mesa/mesa/commit/?id=e00adef34a5ce485e2c9216a268ca05e89a5fc98

Remove "MESA3D_PLATFORMS += surfaceless", this platform is now
automatically selected:
https://cgit.freedesktop.org/mesa/mesa/commit/?id=a38e21d6683aeecb51aea4f933a77c6e7f1a6179

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
 ...t-proper-value-for-LIBCLC_INCLUDEDIR.patch | 14 +--
 ...tion-to-disable-optional-neon-suppor.patch |  8 +-
 ...r-Include-stddef.h-to-fix-build-erro.patch | 40 +++++++++
 package/mesa3d/mesa3d.hash                    |  8 +-
 package/mesa3d/mesa3d.mk                      | 86 +++++++------------
 6 files changed, 90 insertions(+), 68 deletions(-)
 create mode 100644 package/mesa3d/0004-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 572b7ccc8c..67dc765840 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 20.1.10
+MESA3D_HEADERS_VERSION = 20.2.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0002-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch b/package/mesa3d/0002-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
index 6293b8fba4..b1bb2678b4 100644
--- a/package/mesa3d/0002-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
+++ b/package/mesa3d/0002-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
@@ -17,18 +17,20 @@ that they are not removed by Buildroot target-finalize logic.
 Based on the patch for autotools provided by Valentin Korenblit.
 
 Signed-off-by: Romain Naour <romain.naour@smile.fr>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[rebased for 20.02.0]
 ---
- src/gallium/state_trackers/clover/meson.build | 2 +-
+ src/gallium/frontends/clover/meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/gallium/state_trackers/clover/meson.build b/src/gallium/state_trackers/clover/meson.build
+diff --git a/src/gallium/frontends/clover/meson.build b/src/gallium/frontends/clover/meson.build
 index 62ac5f5278d..ecdeb39669c 100644
---- a/src/gallium/state_trackers/clover/meson.build
-+++ b/src/gallium/state_trackers/clover/meson.build
-@@ -64,7 +64,7 @@
+--- a/src/gallium/frontends/clover/meson.build
++++ b/src/gallium/frontends/clover/meson.build
+@@ -63,7 +63,7 @@
+     clover_cpp_args,
      clover_opencl_cpp_args,
      clover_spirv_cpp_args,
-     cpp_vis_args,
 -    '-DLIBCLC_INCLUDEDIR="@0@/"'.format(dep_clc.get_pkgconfig_variable('includedir')),
 +    '-DLIBCLC_INCLUDEDIR="/usr/share"',
      '-DLIBCLC_LIBEXECDIR="@0@/"'.format(dep_clc.get_pkgconfig_variable('libexecdir')),
diff --git a/package/mesa3d/0003-vc4-add-meson-option-to-disable-optional-neon-suppor.patch b/package/mesa3d/0003-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
index 138f145af5..4b9878fb90 100644
--- a/package/mesa3d/0003-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
+++ b/package/mesa3d/0003-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
@@ -9,6 +9,8 @@ to force disabling it at compile time.
 
 [Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4114]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[rebased for 20.2.0]
 ---
  meson_options.txt                    | 7 +++++++
  src/gallium/drivers/vc4/meson.build  | 4 ++--
@@ -19,9 +21,9 @@ diff --git a/meson_options.txt b/meson_options.txt
 index a39596a6f19..0f6b6c62b55 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -117,6 +117,13 @@ option(
-   choices : ['auto', 'true', 'false'],
-   description : 'enable gallium va state tracker.',
+@@ -124,6 +124,13 @@ option(
+   choices : ['auto', 'true', 'false', 'enabled', 'disabled'],
+   description : 'enable gallium va frontend.',
  )
 +option(
 +  'gallium-vc4-neon',
diff --git a/package/mesa3d/0004-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch b/package/mesa3d/0004-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch
new file mode 100644
index 0000000000..538aa74e0c
--- /dev/null
+++ b/package/mesa3d/0004-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch
@@ -0,0 +1,40 @@
+From fdc8b5a205e2116408aeb9fd305e57f656e2e89d Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 9 Aug 2020 17:06:26 +0200
+Subject: [PATCH] src/util/rand_xor: Include stddef.h to fix build error
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes
+
+In file included from ../src/util/rand_xor.c:29:
+output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:27:35:
+ error: unknown type name ?size_t?
+ extern int getrandom(void *__buf, size_t count, unsigned int flags)
+
+seen with gcc version 8.3.0 (Buildroot 2020.02) and uClibc.
+
+Patch sent upstream:
+https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6248
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/util/rand_xor.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/util/rand_xor.c b/src/util/rand_xor.c
+index 81b64f1ea71..fcb481487fa 100644
+--- a/src/util/rand_xor.c
++++ b/src/util/rand_xor.c
+@@ -25,6 +25,7 @@
+ #include "detect_os.h"
+ 
+ #if !DETECT_OS_WINDOWS
++#include <stddef.h>
+ #if defined(HAVE_GETRANDOM)
+ #include <sys/random.h>
+ #endif
+-- 
+2.27.0
+
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 69f387a45e..287ddc1c0e 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2020-October/000603.html
-sha256  b1dba69910adac9fcb4cbdfd7833d99a4a8c75b91f3d2e97f0fd0a3cd8c6ee9f  mesa-20.1.10.tar.xz
-sha512  0d4016abfcc733c853d7b6c3c997ddc554a44088c0a4d9a7edb51ab5ad7d9e1234728b61ffcb9c82a6c5fee1429091a1c31cbeabcb1b50411337b99ee550d28a  mesa-20.1.10.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2020-October/000602.html
+sha256  d1a46d9a3f291bc0e0374600bdcb59844fa3eafaa50398e472a36fc65fd0244a  mesa-20.2.1.tar.xz
+sha512  5d609359754db3e3679bffd5306c1f1d1cf46a2ea98428a9451fe0d99bbf73da863c5d94e6561712cd2012ad13615666cf3d712e54f379b34c091fead39d4795  mesa-20.2.1.tar.xz
 
 # License
-sha256  1ddae7da415352a5b5360ff3a9d7ecf23ba81408f62eeecce0011f32e3ef9da6  docs/license.html
+sha256  1361129baa4519b6ed27a1bf4aeee33a58b060bf7bb9b6ea415ecede04e35e46  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 4a1939f1f6..620a6eece3 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,11 +5,11 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 20.1.10
+MESA3D_VERSION = 20.2.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-MESA3D_LICENSE_FILES = docs/license.html
+MESA3D_LICENSE_FILES = docs/license.rst
 
 MESA3D_INSTALL_STAGING = YES
 
@@ -25,7 +25,7 @@ MESA3D_DEPENDENCIES = \
 
 MESA3D_CONF_OPTS = \
 	-Dgallium-omx=disabled \
-	-Dpower8=false
+	-Dpower8=disabled
 
 # Codesourcery ARM 2014.05 fail to link libmesa_dri_drivers.so with --as-needed linker
 # flag due to a linker bug between binutils 2.24 and 2.25 (2.24.51.20140217).
@@ -36,10 +36,10 @@ endif
 ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
 MESA3D_DEPENDENCIES += host-llvm llvm
 MESA3D_MESON_EXTRA_BINARIES += llvm-config='$(STAGING_DIR)/usr/bin/llvm-config'
-MESA3D_CONF_OPTS += -Dllvm=true
+MESA3D_CONF_OPTS += -Dllvm=enabled
 else
 # Avoid automatic search of llvm-config
-MESA3D_CONF_OPTS += -Dllvm=false
+MESA3D_CONF_OPTS += -Dllvm=disabled
 endif
 
 # Disable opencl-icd: OpenCL lib will be named libOpenCL instead of
@@ -64,9 +64,9 @@ ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
 #  gallium-xlib : Gallium-xlib based GLX requires at least one gallium driver || Gallium-xlib based GLX requires softpipe or llvmpipe || gallium-xlib conflicts with any dri driver.
 MESA3D_CONF_OPTS += -Dglx=dri
 ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_XA),y)
-MESA3D_CONF_OPTS += -Dgallium-xa=true
+MESA3D_CONF_OPTS += -Dgallium-xa=enabled
 else
-MESA3D_CONF_OPTS += -Dgallium-xa=false
+MESA3D_CONF_OPTS += -Dgallium-xa=disabled
 endif
 else
 MESA3D_CONF_OPTS += \
@@ -115,23 +115,23 @@ MESA3D_CONF_OPTS += \
 	-Dgallium-extra-hud=false
 else
 MESA3D_CONF_OPTS += \
-	-Dshared-glapi=true \
+	-Dshared-glapi=enabled \
 	-Dgallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y)) \
 	-Dgallium-extra-hud=true
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
 MESA3D_CONF_OPTS += \
-	-Ddri-drivers= -Ddri3=false
+	-Ddri-drivers= -Ddri3=disabled
 else
 ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE),y)
 MESA3D_DEPENDENCIES += xlib_libxshmfence
-MESA3D_CONF_OPTS += -Ddri3=true
+MESA3D_CONF_OPTS += -Ddri3=enabled
 else
-MESA3D_CONF_OPTS += -Ddri3=false
+MESA3D_CONF_OPTS += -Ddri3=disabled
 endif
 MESA3D_CONF_OPTS += \
-	-Dshared-glapi=true \
+	-Dshared-glapi=enabled \
 	-Dglx-direct=true \
 	-Ddri-drivers=$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
 endif
@@ -142,7 +142,7 @@ MESA3D_CONF_OPTS += \
 else
 MESA3D_DEPENDENCIES += xlib_libxshmfence
 MESA3D_CONF_OPTS += \
-	-Ddri3=true \
+	-Ddri3=enabled \
 	-Dvulkan-drivers=$(subst $(space),$(comma),$(MESA3D_VULKAN_DRIVERS-y))
 endif
 
@@ -160,7 +160,7 @@ MESA3D_CONF_OPTS += -Dopengl=true
 
 # libva and mesa3d have a circular dependency
 # we do not need libva support in mesa3d, therefore disable this option
-MESA3D_CONF_OPTS += -Dgallium-va=false
+MESA3D_CONF_OPTS += -Dgallium-va=disabled
 
 # libGL is only provided for a full xorg stack
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
@@ -189,96 +189,74 @@ ifeq ($(BR2_PACKAGE_WAYLAND),y)
 MESA3D_DEPENDENCIES += wayland wayland-protocols
 MESA3D_PLATFORMS += wayland
 endif
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
-MESA3D_PLATFORMS += drm
-else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D),y)
-MESA3D_PLATFORMS += drm
-else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4),y)
-MESA3D_PLATFORMS += drm
-else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV),y)
-MESA3D_PLATFORMS += drm
-else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO),y)
-MESA3D_PLATFORMS += drm
-else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS),y)
-MESA3D_PLATFORMS += drm
-else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA),y)
-MESA3D_PLATFORMS += drm
-else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST),y)
-MESA3D_PLATFORMS += drm
-else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL),y)
-MESA3D_PLATFORMS += drm
-else ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI),y)
-MESA3D_PLATFORMS += drm
-endif
-MESA3D_PLATFORMS += surfaceless
 
 MESA3D_CONF_OPTS += \
 	-Dplatforms=$(subst $(space),$(comma),$(MESA3D_PLATFORMS))
 
 ifeq ($(BR2_PACKAGE_MESA3D_GBM),y)
 MESA3D_CONF_OPTS += \
-	-Dgbm=true
+	-Dgbm=enabled
 else
 MESA3D_CONF_OPTS += \
-	-Dgbm=false
+	-Dgbm=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 MESA3D_PROVIDES += libegl
 MESA3D_CONF_OPTS += \
-	-Degl=true
+	-Degl=enabled
 else
 MESA3D_CONF_OPTS += \
-	-Degl=false
+	-Degl=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_ES),y)
 MESA3D_PROVIDES += libgles
-MESA3D_CONF_OPTS += -Dgles1=true -Dgles2=true
+MESA3D_CONF_OPTS += -Dgles1=enabled -Dgles2=enabled
 else
-MESA3D_CONF_OPTS += -Dgles1=false -Dgles2=false
+MESA3D_CONF_OPTS += -Dgles1=disabled -Dgles2=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_XVMC),y)
 MESA3D_DEPENDENCIES += xlib_libXv xlib_libXvMC
-MESA3D_CONF_OPTS += -Dgallium-xvmc=true
+MESA3D_CONF_OPTS += -Dgallium-xvmc=enabled
 else
-MESA3D_CONF_OPTS += -Dgallium-xvmc=false
+MESA3D_CONF_OPTS += -Dgallium-xvmc=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_VALGRIND),y)
-MESA3D_CONF_OPTS += -Dvalgrind=true
+MESA3D_CONF_OPTS += -Dvalgrind=enabled
 MESA3D_DEPENDENCIES += valgrind
 else
-MESA3D_CONF_OPTS += -Dvalgrind=false
+MESA3D_CONF_OPTS += -Dvalgrind=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
-MESA3D_CONF_OPTS += -Dlibunwind=true
+MESA3D_CONF_OPTS += -Dlibunwind=enabled
 MESA3D_DEPENDENCIES += libunwind
 else
-MESA3D_CONF_OPTS += -Dlibunwind=false
+MESA3D_CONF_OPTS += -Dlibunwind=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_VDPAU),y)
 MESA3D_DEPENDENCIES += libvdpau
-MESA3D_CONF_OPTS += -Dgallium-vdpau=true
+MESA3D_CONF_OPTS += -Dgallium-vdpau=enabled
 else
-MESA3D_CONF_OPTS += -Dgallium-vdpau=false
+MESA3D_CONF_OPTS += -Dgallium-vdpau=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
-MESA3D_CONF_OPTS += -Dlmsensors=true
+MESA3D_CONF_OPTS += -Dlmsensors=enabled
 MESA3D_DEPENDENCIES += lm-sensors
 else
-MESA3D_CONF_OPTS += -Dlmsensors=false
+MESA3D_CONF_OPTS += -Dlmsensors=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_ZSTD),y)
-MESA3D_CONF_OPTS += -Dzstd=true
+MESA3D_CONF_OPTS += -Dzstd=enabled
 MESA3D_DEPENDENCIES += zstd
 else
-MESA3D_CONF_OPTS += -Dzstd=false
+MESA3D_CONF_OPTS += -Dzstd=disabled
 endif
 
 $(eval $(meson-package))
-- 
2.27.0
