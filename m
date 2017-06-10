From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 Jun 2017 13:53:46 +0200
Subject: [Buildroot] [PATCH 1/2] package/{mesa3d,
	mesa3d-headers}: bump version to 17.1.2
Message-ID: <20170610115347.27948-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Patch 0005 tweaked to apply on this release.

Patch 0006 already included in this release:
  https://cgit.freedesktop.org/mesa/mesa/commit/?id=e75001811e3b66986b4ede165a0fdde703d4f05b

zlib is now a mandatory dependency.
https://cgit.freedesktop.org/mesa/mesa/commit/?h=17.1&id=85a9b1b562b6a73b9494b3fad25172da3dc90fc2

[Bernd: added in v2]
- bump to mesa3d version 17.1.2
- squashed mesa3d-headers bump for bisectability
- renumbered patch 0007
- added zlib link in patch message
- Vulkan Intel driver does not depend on the i965 dri driver anymore
  https://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?h=17.1&id=9aebdb5d082ec640fe8a14704201952bddb50a88
- Gallium vc4 driver depends on NEON support
  https://cgit.freedesktop.org/mesa/mesa/commit/?h=17.1&id=4d30024238efa829cabc72c1601beeee18c3dbf2

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk           |  2 +-
 ...ac-invert-order-for-wayland-scanner-check.patch | 17 ++++++-----
 ...ct-PATCH-etnaviv-add-RGBX-RGBA-pixel-for.patch} |  0
 ...naviv-Cannot-render-to-rb-swapped-formats.patch | 35 ----------------------
 package/mesa3d/Config.in                           |  4 +--
 package/mesa3d/mesa3d.hash                         | 10 +++----
 package/mesa3d/mesa3d.mk                           |  5 ++--
 7 files changed, 21 insertions(+), 52 deletions(-)
 rename package/mesa3d/{0007-Revert-Subject-PATCH-etnaviv-add-RGBX-RGBA-pixel-for.patch => 0006-Revert-Subject-PATCH-etnaviv-add-RGBX-RGBA-pixel-for.patch} (100%)
 delete mode 100644 package/mesa3d/0006-Revert-etnaviv-Cannot-render-to-rb-swapped-formats.patch

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index ccf90db58..4254088ff 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.0.7
+MESA3D_HEADERS_VERSION = 17.1.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/0005-configure.ac-invert-order-for-wayland-scanner-check.patch b/package/mesa3d/0005-configure.ac-invert-order-for-wayland-scanner-check.patch
index e32031eca..d6c9a0d45 100644
--- a/package/mesa3d/0005-configure.ac-invert-order-for-wayland-scanner-check.patch
+++ b/package/mesa3d/0005-configure.ac-invert-order-for-wayland-scanner-check.patch
@@ -9,17 +9,20 @@ non-executable and wrong scanner.
 Try searching the PATH first, and if that fails fall back into
 pkg-config.
 
+[Vincent: tweak patch for 17.1.1 version]
+
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 ---
  configure.ac | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 5f30ae8..461792e 100644
+index 2c7e636..0198d52 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2025,11 +2025,11 @@ if test "x$with_egl_platforms" != "x" -a "x$enable_egl" != xyes; then
-     AC_MSG_ERROR([cannot build egl state tracker without EGL library])
+@@ -2174,11 +2174,11 @@ if test "x$with_platforms" != xauto; then
+     with_egl_platforms=$with_platforms
  fi
  
 -PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
@@ -27,10 +30,10 @@ index 5f30ae8..461792e 100644
 -        WAYLAND_SCANNER='')
 +AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
  if test "x$WAYLAND_SCANNER" = x; then
--    AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
-+    PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
-+            WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`,
-+            WAYLAND_SCANNER='')
+-    AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
++	PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
++		WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`,
++		WAYLAND_SCANNER='')
  fi
  
  # Do per-EGL platform setups and checks
diff --git a/package/mesa3d/0007-Revert-Subject-PATCH-etnaviv-add-RGBX-RGBA-pixel-for.patch b/package/mesa3d/0006-Revert-Subject-PATCH-etnaviv-add-RGBX-RGBA-pixel-for.patch
similarity index 100%
rename from package/mesa3d/0007-Revert-Subject-PATCH-etnaviv-add-RGBX-RGBA-pixel-for.patch
rename to package/mesa3d/0006-Revert-Subject-PATCH-etnaviv-add-RGBX-RGBA-pixel-for.patch
diff --git a/package/mesa3d/0006-Revert-etnaviv-Cannot-render-to-rb-swapped-formats.patch b/package/mesa3d/0006-Revert-etnaviv-Cannot-render-to-rb-swapped-formats.patch
deleted file mode 100644
index c919fc469..000000000
--- a/package/mesa3d/0006-Revert-etnaviv-Cannot-render-to-rb-swapped-formats.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 309d4f0f11bac24a0b487404c51564735ac2c9ed Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Tue, 14 Mar 2017 09:51:23 -0300
-Subject: [PATCH 1/2] Revert "etnaviv: Cannot render to rb-swapped formats"
-Organization: O.S. Systems Software LTDA.
-
-This reverts commit 6c89a728d9e5d072cb504453e73077564c6523d3.
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-Signed-off-by: Fabio Estevam <festevam@gmail.com>
----
- src/gallium/drivers/etnaviv/etnaviv_screen.c | 7 ++-----
- 1 file changed, 2 insertions(+), 5 deletions(-)
-
-diff --git a/src/gallium/drivers/etnaviv/etnaviv_screen.c b/src/gallium/drivers/etnaviv/etnaviv_screen.c
-index 28db9b95bf..2298936f51 100644
---- a/src/gallium/drivers/etnaviv/etnaviv_screen.c
-+++ b/src/gallium/drivers/etnaviv/etnaviv_screen.c
-@@ -469,11 +469,8 @@ etna_screen_is_format_supported(struct pipe_screen *pscreen,
-       return FALSE;
- 
-    if (usage & PIPE_BIND_RENDER_TARGET) {
--      /* If render target, must be RS-supported format that is not rb swapped.
--       * Exposing rb swapped (or other swizzled) formats for rendering would
--       * involve swizzing in the pixel shader.
--       */
--      if (translate_rs_format(format) != ETNA_NO_MATCH && !translate_rs_format_rb_swap(format)) {
-+      /* if render target, must be RS-supported format */
-+      if (translate_rs_format(format) != ETNA_NO_MATCH) {
-          /* Validate MSAA; number of samples must be allowed, and render target
-           * must have MSAA'able format. */
-          if (sample_count > 1) {
--- 
-2.12.0
-
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index e5ff7d73d..36a0304e2 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -15,6 +15,7 @@ menuconfig BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_ZLIB
 	help
 	  Mesa 3D, an open-source implementation of the OpenGL specification.
 
@@ -90,7 +91,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	bool "Gallium vc4 driver"
-	depends on BR2_arm
+	depends on BR2_ARM_CPU_HAS_NEON
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_VC4
 	select BR2_PACKAGE_MESA3D_NEEDS_XA
@@ -153,7 +154,6 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # memfd.h
 	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
 	depends on BR2_PACKAGE_XORG7 # xproto_dri3proto
-	select BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	select BR2_PACKAGE_XPROTO_DRI3PROTO
 	help
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index e540074f6..807c60c00 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2017-June/000332.html
-md5 8d088c8f7a099084ac745646ed1ad62b  mesa-17.0.7.tar.xz
-sha1 33eecf0d137ad31bc91d2863447766aa42d2df43  mesa-17.0.7.tar.xz
-sha256 f6d75304a229c8d10443e219d6b6c0c342567dbab5a879ebe7cfa3c9139c4492  mesa-17.0.7.tar.xz
-sha512 378d643cf63ec3ed5fd093c00079fb03375f6a87875d3583a5d4707d3d6b21934194b0f624f4ed261c9a05a2fe3e9f292dcd8466e82cfb95d919459e3eb635ea  mesa-17.0.7.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2017-May/000335.html
+md5 4d2eaf5955740b044afd95ed167c906c  mesa-17.1.2.tar.xz
+sha1 9433bd12ac1509d22100c9cd68e15c406daccf2e  mesa-17.1.2.tar.xz
+sha256 0937804f43746339b1f9540d8f9c8b4a1bb3d3eec0e4020eac283b8799798239  mesa-17.1.2.tar.xz
+sha512 9df5e1a0336948a6ba338a9a8499b286543bc079f61f1cf85f6ecf98e05fab9a237777cde0d1e3f2153df9b07515cb8c1a08531d43f053783991ecdd32380d3b  mesa-17.1.2.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index b01072243..f20d4398b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.0.7
+MESA3D_VERSION = 17.1.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -20,7 +20,8 @@ MESA3D_DEPENDENCIES = \
 	host-bison \
 	host-flex \
 	expat \
-	libdrm
+	libdrm \
+	zlib
 
 # Disable assembly usage.
 MESA3D_CONF_OPTS = --disable-asm
-- 
2.11.0
