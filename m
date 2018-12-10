From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Dec 2018 11:49:50 +0100
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 18.3.0
Message-ID: <20181210104603.454908B470@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed5d7d622983b0a87a53280e0c0dc581a7f4cbf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch 0002 after upstream commit
https://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?h=18.3&id=6b8657aff0adb9952aa3178d3b332de19d354561

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk           |  2 +-
 ...ac-invert-order-for-wayland-scanner-check.patch | 31 +++++++++++++---------
 package/mesa3d/mesa3d.hash                         | 10 +++----
 package/mesa3d/mesa3d.mk                           |  2 +-
 4 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 55101b2201..eba9ee6df9 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 18.2.6
+MESA3D_HEADERS_VERSION = 18.3.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0002-configure.ac-invert-order-for-wayland-scanner-check.patch b/package/mesa3d/0002-configure.ac-invert-order-for-wayland-scanner-check.patch
index 337ad642a5..5135528795 100644
--- a/package/mesa3d/0002-configure.ac-invert-order-for-wayland-scanner-check.patch
+++ b/package/mesa3d/0002-configure.ac-invert-order-for-wayland-scanner-check.patch
@@ -15,6 +15,8 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 [Romain: rebase on 18.1]
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Bernd rebase on 18.3]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  configure.ac | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
@@ -23,22 +25,27 @@ diff --git a/configure.ac b/configure.ac
 index f1fbdcc6c7..dcf87e7dd6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1796,11 +1796,11 @@ for plat in $platforms; do
-         PKG_CHECK_MODULES([WAYLAND_PROTOCOLS], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED])
+@@ -1841,17 +1841,16 @@
+         fi
          WAYLAND_PROTOCOLS_DATADIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
  
 -        PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
--                          WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`,
--                          WAYLAND_SCANNER='')
-+        AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
-         if test "x$WAYLAND_SCANNER" = x; then
--            AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
-+		PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
-+			WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`,
-+			WAYLAND_SCANNER='')
-         fi
++        AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
++        if test "x$WAYLAND_SCANNER" = x; then
++                PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
+                           WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`,
+                           WAYLAND_SCANNER='')
++        fi
+         PKG_CHECK_EXISTS([wayland-scanner >= 1.15],
+                           AC_SUBST(SCANNER_ARG, 'private-code'),
+                           AC_SUBST(SCANNER_ARG, 'code'))
  
+-        if test "x$WAYLAND_SCANNER" = x; then
+-            AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
+-        fi
+-
          if test "x$WAYLAND_SCANNER" = "x:"; then
+                 AC_MSG_ERROR([wayland-scanner is needed to compile the wayland platform])
+         fi
 -- 
 2.14.3
-
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 083284adec..563ac62501 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,7 +1,7 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-November/000479.html
-md5 7c61a801311fb8d2f7b3cceb7b5cf308  mesa-18.2.6.tar.xz
-sha1 435affd7a2c35782b21533ed2c65c487e40abcf8  mesa-18.2.6.tar.xz
-sha256 9ebafa4f8249df0c718e93b9ca155e3593a1239af303aa2a8b0f2056a7efdc12  mesa-18.2.6.tar.xz
-sha512 a7dd02f67384bb800dff70a0672a968ced96bb438605cdb39bde3e468d4dcf6162414a44e5da1abe7a1831fceb6f23e6c850eb5f80cfc5ee3861c14924c10ed4  mesa-18.2.6.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-December/000482.html
+md5 2d69eff8fe0c6e89bb793d4fd69b750d  mesa-18.3.0.tar.xz
+sha1 d4ddc4e7aa8e11a41d35b5d51476f867e81056ca  mesa-18.3.0.tar.xz
+sha256 b63f947e735d6ef3dfaa30c789a9adfbae18aea671191eaacde95a18c17fc38a  mesa-18.3.0.tar.xz
+sha512 6643d8a100c50efee7178fe950e7cccad24c3a98538d3a13c7c6570add30a56776b4e5f279e2b0a20c4038e682e9461ca5a4fd4ac23a7f60d2f4a0c972525c42  mesa-18.3.0.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 6d36499747..f3ee69b85f 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.2.6
+MESA3D_VERSION = 18.3.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
