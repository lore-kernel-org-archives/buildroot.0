From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 22 Dec 2017 12:37:21 +0100
Subject: [Buildroot] [PATCH 1/2] package/{mesa3d,
 mesa3d-headers}: bump version to 17.3.1
Message-ID: <20171222113722.32603-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d-headers/mesa3d-headers.mk           |  2 +-
 ...ness-detection-with-musl-based-toolchains.patch | 26 ++++++++++++----------
 ...ac-invert-order-for-wayland-scanner-check.patch | 14 +++++++-----
 package/mesa3d/mesa3d.hash                         | 10 ++++-----
 package/mesa3d/mesa3d.mk                           |  2 +-
 5 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 4311f98bac..3de1039822 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 17.3.0
+MESA3D_HEADERS_VERSION = 17.3.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_LICENSE = MIT, SGI, Khronos
diff --git a/package/mesa3d/0002-Fix-endianess-detection-with-musl-based-toolchains.patch b/package/mesa3d/0002-Fix-endianess-detection-with-musl-based-toolchains.patch
index 656705b434..4846b34c9d 100644
--- a/package/mesa3d/0002-Fix-endianess-detection-with-musl-based-toolchains.patch
+++ b/package/mesa3d/0002-Fix-endianess-detection-with-musl-based-toolchains.patch
@@ -1,7 +1,7 @@
-From 61b076689b6308b1c9d0d84ee8654a47e65e67ae Mon Sep 17 00:00:00 2001
+From 4135bd2e13880866deb0440855d1a869397e5024 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd.kuhls@t-online.de>
 Date: Fri, 4 Nov 2016 19:44:37 +0100
-Subject: [PATCH 1/1] Fix endianess detection with musl-based toolchains
+Subject: [PATCH] Fix endianess detection with musl-based toolchains
 
 Musl does not define __GLIBC__ and will not provide a __MUSL__ macro:
 http://wiki.musl-libc.org/wiki/FAQ#Q:_why_is_there_no_MUSL_macro_.3F
@@ -17,6 +17,8 @@ http://autobuild.buildroot.net/results/e27/e27a9a95f72dba3076549beb2a2ccfdbea2fc
 Patch sent upstream: https://patchwork.freedesktop.org/patch/119961/
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Romain: rebase on mesa 17.3.1]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
  configure.ac                | 1 +
  src/amd/Makefile.addrlib.am | 1 +
@@ -24,42 +26,42 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  3 files changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 4761c59..7991b52 100644
+index a02173f244..ee03d6f582 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -786,6 +786,7 @@ fi
+@@ -791,6 +791,7 @@ fi
  AC_HEADER_MAJOR
  AC_CHECK_HEADER([xlocale.h], [DEFINES="$DEFINES -DHAVE_XLOCALE_H"])
  AC_CHECK_HEADER([sys/sysctl.h], [DEFINES="$DEFINES -DHAVE_SYS_SYSCTL_H"])
 +AC_CHECK_HEADER([endian.h], [DEFINES="$DEFINES -DHAVE_ENDIAN_H"])
  AC_CHECK_FUNC([strtof], [DEFINES="$DEFINES -DHAVE_STRTOF"])
  AC_CHECK_FUNC([mkostemp], [DEFINES="$DEFINES -DHAVE_MKOSTEMP"])
- 
+ AC_CHECK_FUNC([memfd_create], [DEFINES="$DEFINES -DHAVE_MEMFD_CREATE"])
 diff --git a/src/amd/Makefile.addrlib.am b/src/amd/Makefile.addrlib.am
-index 64823fc..4e2fb1d 100644
+index 46689637f9..508edfd0d5 100644
 --- a/src/amd/Makefile.addrlib.am
 +++ b/src/amd/Makefile.addrlib.am
-@@ -28,6 +28,7 @@ addrlib_libamdgpu_addrlib_la_CPPFLAGS = \
- 	-I$(srcdir)/addrlib/core \
+@@ -30,6 +30,7 @@ addrlib_libamdgpu_addrlib_la_CPPFLAGS = \
  	-I$(srcdir)/addrlib/inc/chip/r800 \
+ 	-I$(srcdir)/addrlib/gfx9/chip \
  	-I$(srcdir)/addrlib/r800/chip \
 +	$(DEFINES) \
  	-DBRAHMA_BUILD=1
  
  addrlib_libamdgpu_addrlib_la_CXXFLAGS = \
 diff --git a/src/util/u_endian.h b/src/util/u_endian.h
-index b9d563d..266fb4a 100644
+index 9e09f80181..038a28fac9 100644
 --- a/src/util/u_endian.h
 +++ b/src/util/u_endian.h
 @@ -27,7 +27,7 @@
  #ifndef U_ENDIAN_H
  #define U_ENDIAN_H
  
--#if defined(__GLIBC__) || defined(ANDROID)
-+#if defined(__GLIBC__) || defined(ANDROID) || defined(HAVE_ENDIAN_H)
+-#if defined(__GLIBC__) || defined(ANDROID) || defined(__CYGWIN__)
++#if defined(__GLIBC__) || defined(ANDROID) || defined(__CYGWIN__) || defined(HAVE_ENDIAN_H)
  #include <endian.h>
  
  #if __BYTE_ORDER == __LITTLE_ENDIAN
 -- 
-2.10.1
+2.14.3
 
diff --git a/package/mesa3d/0003-configure.ac-invert-order-for-wayland-scanner-check.patch b/package/mesa3d/0003-configure.ac-invert-order-for-wayland-scanner-check.patch
index d6c9a0d453..bfb6376555 100644
--- a/package/mesa3d/0003-configure.ac-invert-order-for-wayland-scanner-check.patch
+++ b/package/mesa3d/0003-configure.ac-invert-order-for-wayland-scanner-check.patch
@@ -1,4 +1,4 @@
-From 60ee5191a0c074251862a15b12afdc9db0b2df38 Mon Sep 17 00:00:00 2001
+From 11a759c33160db6e887e7640071ba84482e6164f Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Date: Thu, 17 Nov 2016 15:36:54 -0300
 Subject: [PATCH] configure.ac: invert order for wayland-scanner check
@@ -13,16 +13,18 @@ pkg-config.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+[Romain: rebase on 17.3.1]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
  configure.ac | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 2c7e636..0198d52 100644
+index ee03d6f582..786b7214b9 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2174,11 +2174,11 @@ if test "x$with_platforms" != xauto; then
-     with_egl_platforms=$with_platforms
+@@ -1695,11 +1695,11 @@ if test "x$with_platforms" = xauto; then
+     with_platforms=$with_egl_platforms
  fi
  
 -PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
@@ -36,7 +38,7 @@ index 2c7e636..0198d52 100644
 +		WAYLAND_SCANNER='')
  fi
  
- # Do per-EGL platform setups and checks
+ PKG_CHECK_EXISTS([wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED], [have_wayland_protocols=yes], [have_wayland_protocols=no])
 -- 
-2.7.3
+2.14.3
 
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 09310129cf..c342f89394 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2017-December/000380.html
-md5 7f69ae6aa9c54a990c4d65e29b17f07d  mesa-17.3.0.tar.xz
-sha1 98f6a1f50dd0cc18f2d63d170ff4b2569fd72bcd  mesa-17.3.0.tar.xz
-sha256 29a0a3a6c39990d491a1a58ed5c692e596b3bfc6c01d0b45e0b787116c50c6d9  mesa-17.3.0.tar.xz
-sha512 b0a616ce9a534a19c42eb0a626a178c6a7171aae1989351ea7c2a9e775a7478758b805dbfb754056720b1ef0454c3d3beb64aa59543be27f249ce97efae8e47e  mesa-17.3.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2017-December/000385.html
+md5 b4b021279ea21e1eb8a1369afa6f19a0  mesa-17.3.1.tar.xz
+sha1 1bda76199addb01946e5a6cd35e00a05540b7eb0  mesa-17.3.1.tar.xz
+sha256 9ae607e0998a586fb2c866cfc8e45e6f52d1c56cb1b41288253ea83eada824c1  mesa-17.3.1.tar.xz
+sha512 a2bd0123bf2df0db03197001a9e001b25f2609f3c6bf1bae66f3bc50c51d2558b5b77e232e81c1658c3a4dec88eda32a8b5a85c1fedc937a7441476228ef8238  mesa-17.3.1.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
 sha256 a75ee0cec909515ff80a3ec07155b7fb0aafe8051abe1f0e45d5c4c5e2539366  docs/patents.txt
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 5efa9f459e..bd93dbbd8e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 17.3.0
+MESA3D_VERSION = 17.3.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.14.3
