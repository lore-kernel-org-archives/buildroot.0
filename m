From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 11 May 2021 20:04:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: bump version to 21.1.0
Message-ID: <20210511180442.1572077-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed kmsro-related options, these are now handled by the build
system:
https://cgit.freedesktop.org/mesa/mesa/commit/?id=70813c1c13b99cb029c8fa3537163650bdd17b6d

Updated license hash due to upstream commit:
https://cgit.freedesktop.org/mesa/mesa/commit/?id=2f42c21221cf89f738225e3ac2aa2e85953c1dc1

Rebased patch 0003 due to upstream commit:
https://cgit.freedesktop.org/mesa/mesa/commit/?id=a9618e7c4214e29c97009870ad8904623746ffe9

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
 ...tion-to-disable-optional-neon-suppor.patch |  6 ++---
 package/mesa3d/Config.in                      | 23 +------------------
 package/mesa3d/mesa3d.hash                    |  8 +++----
 package/mesa3d/mesa3d.mk                      |  3 +--
 5 files changed, 10 insertions(+), 32 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 9c0079c3f9..308c6701ab 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 21.0.3
+MESA3D_HEADERS_VERSION = 21.1.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0003-vc4-add-meson-option-to-disable-optional-neon-suppor.patch b/package/mesa3d/0003-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
index 39e402361f..bb5ef00a9f 100644
--- a/package/mesa3d/0003-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
+++ b/package/mesa3d/0003-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
@@ -10,7 +10,7 @@ to force disabling it at compile time.
 [Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4114]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[rebased for 20.2.0 & 20.3.0]
+[rebased for 20.2.0, 20.3.0 & 21.1.0]
 ---
  meson_options.txt                    | 7 +++++++
  src/gallium/drivers/vc4/meson.build  | 4 ++--
@@ -67,7 +67,7 @@ index 66767e7f1f8..7446f1c3d0c 100644
  {
 -#ifdef USE_ARM_ASM
 +#ifdef VC4_TILING_LT_NEON
-         if (util_cpu_caps.has_neon) {
+         if (util_get_cpu_caps()->has_neon) {
                  vc4_load_lt_image_neon(dst, dst_stride, src, src_stride,
                                         cpp, box);
 @@ -105,7 +105,7 @@ vc4_store_lt_image(void *dst, uint32_t dst_stride,
@@ -76,7 +76,7 @@ index 66767e7f1f8..7446f1c3d0c 100644
  {
 -#ifdef USE_ARM_ASM
 +#ifdef VC4_TILING_LT_NEON
-         if (util_cpu_caps.has_neon) {
+         if (util_get_cpu_caps()->has_neon) {
                  vc4_store_lt_image_neon(dst, dst_stride, src, src_stride,
                                          cpp, box);
 -- 
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 0a9e95a799..d1b3af2054 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -81,11 +81,6 @@ config BR2_PACKAGE_MESA3D_DRIVER
 config BR2_PACKAGE_MESA3D_NEEDS_XA
 	bool
 
-# Quote from mesa3d meson.build: "kmsro driver requires one or more
-# renderonly drivers (vc4, etnaviv, freedreno)".
-config BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
-	bool
-
 # OpenGL GLX and Gallium VDPAU both needs X11
 config BR2_PACKAGE_MESA3D_NEEDS_X11
 	bool
@@ -105,7 +100,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 	bool "Gallium Etnaviv driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_ETNAVIV
-	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	help
 	  Mesa driver for Vivante GPUs.
 
@@ -119,7 +113,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO
 	# for arm/aarch64.
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_FREEDRENO
-	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	help
 	  Mesa driver for Freedreno GPUs.
 
@@ -143,20 +136,9 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
 	help
 	  Mesa driver for iris-based Intel GPUs.
 
-config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
-	bool "Gallium KMSRO driver"
-	depends on BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
-	help
-	  Support various sorts of KMS displays with the
-	  renderonly layer used to attach a GPU.
-
-comment "Gallium KMSRO needs one or more renderonly drivers"
-	depends on !BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
-
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA
 	bool "Gallium lima driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
-	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	help
 	  Mesa driver for ARM Mali Utgard GPUs.
 
@@ -172,7 +154,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST
 	bool "Gallium panfrost driver"
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
-	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	help
 	  Mesa driver for ARM Mali Midgard and Bifrost GPUs.
 
@@ -260,11 +241,10 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D
 	bool "Gallium v3d driver"
 	depends on (BR2_arm && BR2_ARM_CPU_HAS_NEON) || BR2_aarch64
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
-	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	select BR2_PACKAGE_LIBDRM_VC4
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
 	help
-	  Driver for Broadcom VC6 (rpi4) GPUs (needs kmsro and vc4).
+	  Driver for Broadcom VC6 (rpi4) GPUs (needs vc4).
 
 	  It requires a kernel 4.18+ with DRM V3D support enabled:
 
@@ -275,7 +255,6 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	bool "Gallium vc4 driver"
 	depends on BR2_arm || BR2_aarch64
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
-	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	select BR2_PACKAGE_LIBDRM_VC4
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
 	help
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 6a70e8a1b2..b9eace0b42 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2021-April/000627.html
-sha256  565c6f4bd2d5747b919454fc1d439963024fc78ca56fd05158c3b2cde2f6912b  mesa-21.0.3.tar.xz
-sha512  4a8aee48a8ea7f32e8aa3bbbd91db26c6053b9a43e62ff88256929e6bc147884f0fef988726b5a3d59d7008663f017c746a0352fd3fcc1c476b8190af4a2531f  mesa-21.0.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2021-May/000630.html
+sha256  0128f10e22970d3aed3d1034003731f94623015cd9797c07151417649c1b1ff8  mesa-21.1.0.tar.xz
+sha512  9d7617a6d5dd8ec1d93fdda8fe8b2f745695c02bc381d685f1257f7e7f08d5c06f3c57ae71c5f2dfaabb1742b8a88f47294a369bd3ac553f29835f24ce5dd350  mesa-21.1.0.tar.xz
 
 # License
-sha256  1361129baa4519b6ed27a1bf4aeee33a58b060bf7bb9b6ea415ecede04e35e46  docs/license.rst
+sha256  998437f3f75f0c542046f83c1cb349408122268168fb13eb4ae6967aa18b7d98  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index a278d3dbdb..3aec1df834 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 21.0.3
+MESA3D_VERSION = 21.1.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -88,7 +88,6 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)  += etnaviv
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO) += freedreno
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915)     += i915
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS)     += iris
-MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO)    += kmsro
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA)     += lima
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST) += panfrost
-- 
2.29.2
