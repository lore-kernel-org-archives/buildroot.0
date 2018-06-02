From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Jun 2018 22:26:14 +0200
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 18.1.1
Message-ID: <20180602202555.7E65980DB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5379504d700c18693c7ff981431c6b76ba2a5bf8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebase the two patches on 18.1.1.
Convert 0001-musl.patch to git patch.

See:
https://lists.freedesktop.org/archives/mesa-dev/2018-June/196523.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk           |  2 +-
 package/mesa3d/0001-musl.patch                     | 26 +++++++++++++++--
 ...ac-invert-order-for-wayland-scanner-check.patch | 34 +++++++++++-----------
 package/mesa3d/mesa3d.hash                         | 10 +++----
 package/mesa3d/mesa3d.mk                           |  2 +-
 5 files changed, 47 insertions(+), 27 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 18c98a7f9e..1ce30f7dcf 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 18.0.4
+MESA3D_HEADERS_VERSION = 18.1.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0001-musl.patch b/package/mesa3d/0001-musl.patch
index 8f7ba773aa..44c7f5b96d 100644
--- a/package/mesa3d/0001-musl.patch
+++ b/package/mesa3d/0001-musl.patch
@@ -1,12 +1,29 @@
-Fix musl build
+From 25e20c2e288e1d482f479eca863bc4aaa374b782 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 22 Apr 2018 15:58:38 +0200
+Subject: [PATCH] Fix musl build
+
+Fix musl build when svga gallium driver is enabled.
+
+In file included from vmw_fence.c:34:0:
+vmw_screen.h:100:4: error: unknown type name ???dev_t???
+    dev_t device;
+    ^~~~~
 
 Downloaded from
 http://git.alpinelinux.org/cgit/aports/plain/main/mesa/musl-fixes.patch
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Romain: rebase on 18.1]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/gallium/winsys/svga/drm/vmw_screen.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
---- ./src/gallium/winsys/svga/drm/vmw_screen.h.orig
-+++ ./src/gallium/winsys/svga/drm/vmw_screen.h
+diff --git a/src/gallium/winsys/svga/drm/vmw_screen.h b/src/gallium/winsys/svga/drm/vmw_screen.h
+index f21cabb51f..20d03f8b53 100644
+--- a/src/gallium/winsys/svga/drm/vmw_screen.h
++++ b/src/gallium/winsys/svga/drm/vmw_screen.h
 @@ -34,7 +34,7 @@
  #ifndef VMW_SCREEN_H_
  #define VMW_SCREEN_H_
@@ -16,3 +33,6 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  #include "pipe/p_compiler.h"
  #include "pipe/p_state.h"
  
+-- 
+2.14.3
+
diff --git a/package/mesa3d/0002-configure.ac-invert-order-for-wayland-scanner-check.patch b/package/mesa3d/0002-configure.ac-invert-order-for-wayland-scanner-check.patch
index bfb6376555..337ad642a5 100644
--- a/package/mesa3d/0002-configure.ac-invert-order-for-wayland-scanner-check.patch
+++ b/package/mesa3d/0002-configure.ac-invert-order-for-wayland-scanner-check.patch
@@ -1,4 +1,4 @@
-From 11a759c33160db6e887e7640071ba84482e6164f Mon Sep 17 00:00:00 2001
+From ef96bac7cbbb11b98606864ead0f731dd5b71d5a Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Date: Thu, 17 Nov 2016 15:36:54 -0300
 Subject: [PATCH] configure.ac: invert order for wayland-scanner check
@@ -13,32 +13,32 @@ pkg-config.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-[Romain: rebase on 17.3.1]
+[Romain: rebase on 18.1]
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
  configure.ac | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index ee03d6f582..786b7214b9 100644
+index f1fbdcc6c7..dcf87e7dd6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1695,11 +1695,11 @@ if test "x$with_platforms" = xauto; then
-     with_platforms=$with_egl_platforms
- fi
+@@ -1796,11 +1796,11 @@ for plat in $platforms; do
+         PKG_CHECK_MODULES([WAYLAND_PROTOCOLS], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED])
+         WAYLAND_PROTOCOLS_DATADIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
  
--PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
--        WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`,
--        WAYLAND_SCANNER='')
-+AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
- if test "x$WAYLAND_SCANNER" = x; then
--    AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
-+	PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
-+		WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`,
-+		WAYLAND_SCANNER='')
- fi
+-        PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
+-                          WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`,
+-                          WAYLAND_SCANNER='')
++        AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
+         if test "x$WAYLAND_SCANNER" = x; then
+-            AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
++		PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
++			WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`,
++			WAYLAND_SCANNER='')
+         fi
  
- PKG_CHECK_EXISTS([wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED], [have_wayland_protocols=yes], [have_wayland_protocols=no])
+         if test "x$WAYLAND_SCANNER" = "x:"; then
 -- 
 2.14.3
 
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index b6ce272c1c..fb72f4f683 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-May/000429.html
-md5 ef525adaff7f31bedd4c5134bc313da9  mesa-18.0.4.tar.xz
-sha1 4bbee07d8eb42625f215f49d39a657fabdc2f29d  mesa-18.0.4.tar.xz
-sha256 1f3bcfe7cef0a5c20dae2b41df5d7e0a985e06be0183fa4d43b6068fcba2920f  mesa-18.0.4.tar.xz
-sha512 f9a14be46c209661ceb318add1611481445d13b47e95c7a5d2a5e5ecfdd5d2c3fa9c2b16b30035bbb8d61ccc7cb65bfa6698ac8b040273e5ab045a951a67752c  mesa-18.0.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-dev/2018-June/196523.html
+md5 063468c930ff61d211ece0191874fa95  mesa-18.1.1.tar.xz
+sha1 60d6b58f8f119b3731de587bdad30c1ecbb52678  mesa-18.1.1.tar.xz
+sha256 d3312a2ede5aac14a47476b208b8e3a401367838330197c4588ab8ad420d7781  mesa-18.1.1.tar.xz
+sha512 7783adc1ec7a1c3d092acfcca6b4ba19450c15a7f0d7f41fbf25e482236615d79ce24afe60959066ea7aa851df4f74fa3c569fa6d847ea79e6bfe046b8c65e90  mesa-18.1.1.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
 sha256 a75ee0cec909515ff80a3ec07155b7fb0aafe8051abe1f0e45d5c4c5e2539366  docs/patents.txt
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1b2fca1f90..a323747e61 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.0.4
+MESA3D_VERSION = 18.1.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
