From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2021 18:17:57 +0100
Subject: [Buildroot] [git commit] package/mesa3d: unconditionally needs expat
Message-ID: <20210116170231.7014587826@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86150bd7a2ae1ed69a73ddb7ffc00f3af0b74bf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mesa3d should only need expat for a limited set of drivers. However,
the condition in their meson.build is borked:

    required: not with_platform_android or with_any_broadcom or with_any_intel

So, as soon as the platform is not android, expat is required. If it
is not already present in the configuraiotn, then meson will try to be
helpful and will try to download its own copy under the table:

    Run-time dependency expat found: NO (tried pkgconfig and cmake)
    Looking for a fallback subproject for the dependency expat
    Downloading expat source from https://github.com/libexpat/libexpat/releases/download/R_2_2_5/expat-2.2.5.tar.bz2
    <urlopen error unknown url type: https>
    A fallback URL could be specified using source_fallback_url key in the wrap file

    ../O/build/mesa3d-20.3.3/meson.build:1366:2: ERROR: could not get https://github.com/libexpat/libexpat/releases/download/R_2_2_5/expat-2.2.5.tar.bz2 is the internet available?

Ideally, we would like to fix the condition in the meson.build, to drop
the spurious and dubious condition on the android platform. However it
is not totally obvious what the prupose was, and expat compiles quikly,
so we just add expat as an unconditional mandatory dependency.

Fixes:
    http://autobuild.buildroot.org/results/f71865771482b1d71d12e77767d236ca693785d5/
    http://autobuild.buildroot.org/results/98290b9681a38b3be820017823a4a4196d474476/
    ....

Reported-by: Titouan Christophe <titouanchristophe@gmail.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
[yann.morin.1998 at free.fr:
  - make it a generic fix, not tied to freedreno, reported by Fabio
  - rewrite commit log to explain the root cause
  - also reported about virgl, by Titouan
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mesa3d/Config.in | 7 +------
 package/mesa3d/mesa3d.mk | 5 +----
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 45eb62b701..a96fd46bbe 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -4,6 +4,7 @@ menuconfig BR2_PACKAGE_MESA3D
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
 	select BR2_PACKAGE_ZLIB
@@ -138,7 +139,6 @@ comment "Gallium i915: Only one i915 provider can be built"
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	bool "Gallium iris driver"
 	depends on BR2_i386 || BR2_x86_64
-	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	help
 	  Mesa driver for iris-based Intel GPUs.
@@ -263,7 +263,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
 	bool "Gallium v3d driver"
 	depends on (BR2_arm && BR2_ARM_CPU_HAS_NEON) || BR2_aarch64
-	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	select BR2_PACKAGE_LIBDRM_VC4
@@ -279,7 +278,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	bool "Gallium vc4 driver"
 	depends on BR2_arm || BR2_aarch64
-	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	select BR2_PACKAGE_LIBDRM_VC4
@@ -346,7 +344,6 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST
 config BR2_PACKAGE_MESA3D_DRI_DRIVER_I915
 	bool "DRI i915 driver"
 	depends on BR2_i386 || BR2_x86_64
-	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM_INTEL
 	help
@@ -356,7 +353,6 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
 	bool "DRI i965 driver"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
-	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_LIBDRM_INTEL
 	help
@@ -395,7 +391,6 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
 	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
 	depends on BR2_PACKAGE_XORG7 # xorgproto
-	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	select BR2_PACKAGE_XORGPROTO
 	select BR2_PACKAGE_XLIB_LIBXSHMFENCE
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index ce1197cc99..bc277bec5a 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -19,13 +19,10 @@ MESA3D_DEPENDENCIES = \
 	host-bison \
 	host-flex \
 	host-python3-mako \
+	expat \
 	libdrm \
 	zlib
 
-ifeq ($(BR2_PACKAGE_EXPAT),y)
-MESA3D_DEPENDENCIES += expat
-endif
-
 MESA3D_CONF_OPTS = \
 	-Dgallium-omx=disabled \
 	-Dpower8=disabled
