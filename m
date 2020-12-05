From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 21:40:47 +0100
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 20.3.0
Message-ID: <20201205202516.3E21C835F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8526bebc88f031bdbe1e0fb07a851a8ae7d11246
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch 0002 & 0003.
Removed patch 0005 which was applied upstream.

Only Intel and Broadcom drivers depend on expat since upstream commit:
https://cgit.freedesktop.org/mesa/mesa/commit/?id=81a0f1eca24b8605b9f2506122ff90db7129c39e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk           |  2 +-
 ...on-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch | 20 ++++++-------
 ...on-option-to-disable-optional-neon-suppor.patch |  4 +--
 ...cb-fixes-to-loader-when-using-x11-and-dri.patch | 35 ----------------------
 package/mesa3d/Config.in                           |  7 ++++-
 package/mesa3d/mesa3d.hash                         |  6 ++--
 package/mesa3d/mesa3d.mk                           |  7 +++--
 7 files changed, 27 insertions(+), 54 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 8e8170a7a5..40d9979e57 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 20.2.3
+MESA3D_HEADERS_VERSION = 20.3.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0002-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch b/package/mesa3d/0002-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
index b1bb2678b4..e3c70c3f24 100644
--- a/package/mesa3d/0002-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
+++ b/package/mesa3d/0002-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
@@ -18,7 +18,7 @@ Based on the patch for autotools provided by Valentin Korenblit.
 
 Signed-off-by: Romain Naour <romain.naour@smile.fr>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[rebased for 20.02.0]
+[rebased for 20.2.0 & 20.3.0]
 ---
  src/gallium/frontends/clover/meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -27,15 +27,15 @@ diff --git a/src/gallium/frontends/clover/meson.build b/src/gallium/frontends/cl
 index 62ac5f5278d..ecdeb39669c 100644
 --- a/src/gallium/frontends/clover/meson.build
 +++ b/src/gallium/frontends/clover/meson.build
-@@ -63,7 +63,7 @@
-     clover_cpp_args,
-     clover_opencl_cpp_args,
-     clover_spirv_cpp_args,
--    '-DLIBCLC_INCLUDEDIR="@0@/"'.format(dep_clc.get_pkgconfig_variable('includedir')),
-+    '-DLIBCLC_INCLUDEDIR="/usr/share"',
-     '-DLIBCLC_LIBEXECDIR="@0@/"'.format(dep_clc.get_pkgconfig_variable('libexecdir')),
-     '-DCLANG_RESOURCE_DIR="@0@"'.format(join_paths(
-       dep_llvm.get_configtool_variable('libdir'), 'clang',
+@@ -27,7 +27,7 @@
+   '-DCL_USE_DEPRECATED_OPENCL_2_0_APIS',
+   '-DCL_USE_DEPRECATED_OPENCL_2_1_APIS',
+   '-DCL_USE_DEPRECATED_OPENCL_2_2_APIS',
+-  '-DLIBCLC_INCLUDEDIR="@0@/"'.format(dep_clc.get_variable(pkgconfig : 'includedir')),
++  '-DLIBCLC_INCLUDEDIR="/usr/share"',
+   '-DLIBCLC_LIBEXECDIR="@0@/"'.format(dep_clc.get_variable(pkgconfig : 'libexecdir'))
+ ]
+ clover_spirv_cpp_args = []
 -- 
 2.20.1
 
diff --git a/package/mesa3d/0003-vc4-add-meson-option-to-disable-optional-neon-suppor.patch b/package/mesa3d/0003-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
index 4b9878fb90..39e402361f 100644
--- a/package/mesa3d/0003-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
+++ b/package/mesa3d/0003-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
@@ -10,7 +10,7 @@ to force disabling it at compile time.
 [Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4114]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[rebased for 20.2.0]
+[rebased for 20.2.0 & 20.3.0]
 ---
  meson_options.txt                    | 7 +++++++
  src/gallium/drivers/vc4/meson.build  | 4 ++--
@@ -21,7 +21,7 @@ diff --git a/meson_options.txt b/meson_options.txt
 index a39596a6f19..0f6b6c62b55 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -124,6 +124,13 @@ option(
+@@ -123,6 +123,13 @@ option(
    choices : ['auto', 'true', 'false', 'enabled', 'disabled'],
    description : 'enable gallium va frontend.',
  )
diff --git a/package/mesa3d/0005-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch b/package/mesa3d/0005-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch
deleted file mode 100644
index 5746bc221e..0000000000
--- a/package/mesa3d/0005-meson-Add-xcb-fixes-to-loader-when-using-x11-and-dri.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From da691ec75cc8a7b2d0ac0c5894521afda4bc601d Mon Sep 17 00:00:00 2001
-From: Duncan Hopkins <duncan@duncanhopkins.me.uk>
-Date: Thu, 15 Oct 2020 12:14:57 +0100
-Subject: [PATCH] meson: Add xcb-fixes to loader when using x11 and dri3. Fixes
- undefined symbol for xcb_xfixes_create_region in loader_dri3_helper.c
-
-loader_dr3_helper.c uses xcb_xfixes_create_region() that requires dep_xcb_xfixes to link. This is dependent on with_platform_x11 and with_dri3.
-But the source meson file does not set this up dependent on with_dri3.
-The build was initialsed using platforms=x11 and gallium-drivers=zink,swrast.
-
-Reviewed-by: Eric Anholt <eric@anholt.net>
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/7164>
-(cherry picked from commit cf17d6251653f4a98e7c4f904ea2f0bc0ecedd5c)
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- meson.build | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index fbd3c4b8e8d..670cb521a2b 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1742,7 +1742,8 @@ if with_platform_x11
-       dep_xxf86vm = dependency('xxf86vm')
-     endif
-   endif
--  if (with_egl or (
-+  if (with_egl or 
-+      with_dri3 or (
-       with_gallium_vdpau or with_gallium_xvmc or with_gallium_xa or
-       with_gallium_omx != 'disabled'))
-     dep_xcb_xfixes = dependency('xcb-xfixes')
--- 
-2.25.4
-
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index ebfc422bf2..45eb62b701 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -5,7 +5,6 @@ menuconfig BR2_PACKAGE_MESA3D
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_ZLIB
 	help
@@ -139,6 +138,7 @@ comment "Gallium i915: Only one i915 provider can be built"
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	bool "Gallium iris driver"
 	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	help
 	  Mesa driver for iris-based Intel GPUs.
@@ -263,6 +263,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
 	bool "Gallium v3d driver"
 	depends on (BR2_arm && BR2_ARM_CPU_HAS_NEON) || BR2_aarch64
+	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	select BR2_PACKAGE_LIBDRM_VC4
@@ -278,6 +279,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	bool "Gallium vc4 driver"
 	depends on BR2_arm || BR2_aarch64
+	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	select BR2_PACKAGE_LIBDRM_VC4
@@ -344,6 +346,7 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_I915
 	bool "DRI i915 driver"
 	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM_INTEL
 	help
@@ -353,6 +356,7 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
 	bool "DRI i965 driver"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
+	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM_INTEL
 	help
@@ -391,6 +395,7 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
 	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
 	depends on BR2_PACKAGE_XORG7 # xorgproto
+	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	select BR2_PACKAGE_XORGPROTO
 	select BR2_PACKAGE_XLIB_LIBXSHMFENCE
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index b59d1f866e..76436bdc70 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2020-November/000607.html
-sha256  ae1b240e11531df528d14dc214d2dc4d2b4f2e835c6230ba0b492b171eceb82b  mesa-20.2.3.tar.xz
-sha512  e55b57523f6fdb1199586538c119c3e7c81d1a7af86be14c90d140c514f65e54ac0c56bd341686d04b770b80d3ddd92188ee17b3bc23f243aed10c25de7e19a6  mesa-20.2.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2020-December/000609.html
+sha256  2999738e888731531cd62b27519fa37566cc0ea2cd7d4d97f46abaa3e949c630  mesa-20.3.0.tar.xz
+sha512  69ee0bc1e7a69a519597dd55f4d601f35fe51ed6687d6f6beff6aef3da8d82de932220305fc187e06a52aaf0073d434a6e3458619c767b9b7932464a2cbb2cf2  mesa-20.3.0.tar.xz
 
 # License
 sha256  1361129baa4519b6ed27a1bf4aeee33a58b060bf7bb9b6ea415ecede04e35e46  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 5af3cbb3f4..77b5899061 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 20.2.3
+MESA3D_VERSION = 20.3.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -19,10 +19,13 @@ MESA3D_DEPENDENCIES = \
 	host-bison \
 	host-flex \
 	host-python3-mako \
-	expat \
 	libdrm \
 	zlib
 
+ifeq ($(BR2_PACKAGE_EXPAT),y)
+MESA3D_DEPENDENCIES += expat
+endif
+
 MESA3D_CONF_OPTS = \
 	-Dgallium-omx=disabled \
 	-Dpower8=disabled
