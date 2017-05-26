From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 26 May 2017 14:16:06 +0100
Subject: [Buildroot] [PATCH next 1/2] mesa3d: bump version to 17.1.1
Message-ID: <20170526131607.34436-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch 0005 tweaked to apply on this release.

Patch 0006 already included in this release:
  https://cgit.freedesktop.org/mesa/mesa/commit/?id=e75001811e3b66986b4ede165a0fdde703d4f05b

zlib is now a mandatory dependency.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...ac-invert-order-for-wayland-scanner-check.patch | 17 ++++++-----
 ...naviv-Cannot-render-to-rb-swapped-formats.patch | 35 ----------------------
 package/mesa3d/Config.in                           |  1 +
 package/mesa3d/mesa3d.hash                         | 10 +++----
 package/mesa3d/mesa3d.mk                           |  5 ++--
 5 files changed, 19 insertions(+), 49 deletions(-)
 delete mode 100644 package/mesa3d/0006-Revert-etnaviv-Cannot-render-to-rb-swapped-formats.patch

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
index e5ff7d73d..38b87715a 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -15,6 +15,7 @@ menuconfig BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_ZLIB
 	help
 	  Mesa 3D, an open-source implementation of the OpenGL specification.
 
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index ccd1afe7c..3362cc93b 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2017-May/000327.html
-md5 77ea38dc0ab899864b06ea2941ac31a4  mesa-17.0.6.tar.xz
-sha1 f348781d5e4342ef5b78572f68ef9749e308dbd7  mesa-17.0.6.tar.xz
-sha256 89ecf3bcd0f18dcca5aaa42bf36bb52a2df33be89889f94aaaad91f7a504a69d  mesa-17.0.6.tar.xz
-sha512 537d28aa694c2d48811d2467e33b3adc841067d5f1cdb7e0809ba100f71869090285bbb246e57e5f0177401a539b44cc32b1ccfcb32a1855c14b011b92d32eaf  mesa-17.0.6.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2017-May/000330.html
+md5 a4844bc6052578574f9629458bcbb749  mesa-17.1.1.tar.xz
+sha1 e25d16be7924e3aec75eac78f3820e36a20c7c4e  mesa-17.1.1.tar.xz
+sha256 aed503f94c0c1630a162a3e276f4ee12a86764cee4cb92338ea2dea99a04e7ef  mesa-17.1.1.tar.xz
+sha512 4679b8c1a957e515e9f7a6658f2264d4c458379a37fa8f64c9ef03e817857a683fc527a8172d3ae68ca5ebc84a1a78264e18807704c5130c95efdf0431502bc7  mesa-17.1.1.tar.xz
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1404f8407..a625700d6 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.0.6
+MESA3D_VERSION = 17.1.1
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
2.13.0
