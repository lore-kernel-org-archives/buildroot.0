From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Apr 2018 14:50:26 +0200
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 18.0.1
Message-ID: <20180421125128.C6902883D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b2c8690d1135745379685096365fd8959a7ede6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch 0002, upstream committed a different fix:
https://cgit.freedesktop.org/mesa/mesa/commit/?h=18.1&id=cbee1bfb34274668a05995b9d4c78ddec9e5ea4c
https://cgit.freedesktop.org/mesa/mesa/commit/?h=18.1&id=5a75019ad0270a974788a9b8648ba98ff4203768

Renumbered patch 0003 -> 0002.

Tested using test-pkg (removed skipped toolchains from log):

                armv5-ctng-linux-gnueabi [ 1/46]: OK
              armv7-ctng-linux-gnueabihf [ 2/46]: OK
                        br-aarch64-glibc [ 3/46]: OK
                           br-arcle-hs38 [ 4/46]: OK
                  br-arm-cortex-a9-glibc [ 6/46]: OK
                   br-arm-cortex-a9-musl [ 7/46]: OK
                             br-arm-full [ 9/46]: OK
                   br-i386-pentium4-full [12/46]: OK
                br-i386-pentium-mmx-musl [13/46]: OK

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk           |  2 +-
 ...ness-detection-with-musl-based-toolchains.patch | 70 ----------------------
 ...c-invert-order-for-wayland-scanner-check.patch} |  0
 package/mesa3d/mesa3d.hash                         | 10 ++--
 package/mesa3d/mesa3d.mk                           |  2 +-
 5 files changed, 7 insertions(+), 77 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 19d1c6fdf1..242cd4f85b 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 18.0.0
+MESA3D_HEADERS_VERSION = 18.0.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://mesa.freedesktop.org/archive
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0002-Fix-endianess-detection-with-musl-based-toolchains.patch b/package/mesa3d/0002-Fix-endianess-detection-with-musl-based-toolchains.patch
deleted file mode 100644
index 9ab0bca93a..0000000000
--- a/package/mesa3d/0002-Fix-endianess-detection-with-musl-based-toolchains.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 4135bd2e13880866deb0440855d1a869397e5024 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Fri, 4 Nov 2016 19:44:37 +0100
-Subject: [PATCH] Fix endianess detection with musl-based toolchains
-
-Musl does not define __GLIBC__ and will not provide a __MUSL__ macro:
-http://wiki.musl-libc.org/wiki/FAQ#Q:_why_is_there_no_MUSL_macro_.3F
-
-This patch checks for the presence of endian.h and promotes the result
-to src/amd/Makefile.addrlib.am which executes the broken build command.
-Fixes compile errors detected by the autobuilder infrastructure of the
-buildroot project:
-
-http://autobuild.buildroot.net/results/e27/e27a9a95f72dba3076549beb2a2ccfdbea2fcfee/
-http://autobuild.buildroot.net/results/e27/e27a9a95f72dba3076549beb2a2ccfdbea2fcfee/
-
-Patch sent upstream: https://patchwork.freedesktop.org/patch/119961/
-
-[Bernd: rebase on mesa 18.0.0]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Romain: rebase on mesa 17.3.1]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- configure.ac                | 1 +
- src/amd/Makefile.addrlib.am | 1 +
- src/util/u_endian.h         | 2 +-
- 3 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index a02173f244..ee03d6f582 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -791,6 +791,7 @@ fi
- AC_HEADER_MAJOR
- AC_CHECK_HEADER([xlocale.h], [DEFINES="$DEFINES -DHAVE_XLOCALE_H"])
- AC_CHECK_HEADER([sys/sysctl.h], [DEFINES="$DEFINES -DHAVE_SYS_SYSCTL_H"])
-+AC_CHECK_HEADER([endian.h], [DEFINES="$DEFINES -DHAVE_ENDIAN_H"])
- AC_CHECK_FUNC([strtof], [DEFINES="$DEFINES -DHAVE_STRTOF"])
- AC_CHECK_FUNC([mkostemp], [DEFINES="$DEFINES -DHAVE_MKOSTEMP"])
- AC_CHECK_FUNC([memfd_create], [DEFINES="$DEFINES -DHAVE_MEMFD_CREATE"])
-diff --git a/src/amd/Makefile.addrlib.am b/src/amd/Makefile.addrlib.am
-index 46689637f9..508edfd0d5 100644
---- a/src/amd/Makefile.addrlib.am
-+++ b/src/amd/Makefile.addrlib.am
-@@ -29,7 +29,8 @@
- 	-I$(srcdir)/addrlib/inc/chip/gfx9 \
- 	-I$(srcdir)/addrlib/inc/chip/r800 \
- 	-I$(srcdir)/addrlib/gfx9/chip \
--	-I$(srcdir)/addrlib/r800/chip
-+	-I$(srcdir)/addrlib/r800/chip \
-+	$(DEFINES)
- 
- addrlib_libamdgpu_addrlib_la_CXXFLAGS = \
- 	$(VISIBILITY_CXXFLAGS) $(CXX11_CXXFLAGS)
-diff --git a/src/util/u_endian.h b/src/util/u_endian.h
-index 9e09f80181..038a28fac9 100644
---- a/src/util/u_endian.h
-+++ b/src/util/u_endian.h
-@@ -27,7 +27,7 @@
- #ifndef U_ENDIAN_H
- #define U_ENDIAN_H
- 
--#if defined(__GLIBC__) || defined(ANDROID) || defined(__CYGWIN__)
-+#if defined(__GLIBC__) || defined(ANDROID) || defined(__CYGWIN__) || defined(HAVE_ENDIAN_H)
- #include <endian.h>
- 
- #if __BYTE_ORDER == __LITTLE_ENDIAN
--- 
-2.14.3
-
diff --git a/package/mesa3d/0003-configure.ac-invert-order-for-wayland-scanner-check.patch b/package/mesa3d/0002-configure.ac-invert-order-for-wayland-scanner-check.patch
similarity index 100%
rename from package/mesa3d/0003-configure.ac-invert-order-for-wayland-scanner-check.patch
rename to package/mesa3d/0002-configure.ac-invert-order-for-wayland-scanner-check.patch
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index ed88910bab..b6809fdf0d 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2018-March/000412.html
-md5 c2a59fc5b56de3e197fa3a6023409e23  mesa-18.0.0.tar.xz
-sha1 361ed565bb7d243c251bfccd4fe2776f54c6d968  mesa-18.0.0.tar.xz
-sha256 694e5c3d37717d23258c1f88bc134223c5d1aac70518d2f9134d6df3ee791eea  mesa-18.0.0.tar.xz
-sha512 1494bb09357896a2505b3dcfec772268e28c765804f21e144948a314f1d79d99ff9f21062ef5860eb5a5a568b305a9c954585924a7ac8890fe1ebd8df3bcc396  mesa-18.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2018-April/000419.html
+md5 a240b17769ad5ff918507848590f9397  mesa-18.0.1.tar.xz
+sha1 90ce55e5d7b522d8bdc401e9864416cc54d02ccd  mesa-18.0.1.tar.xz
+sha256 b2d2f5b5dbaab13e15cb0dcb5ec81887467f55ebc9625945b303a3647cd87954  mesa-18.0.1.tar.xz
+sha512 b0d610904b6f179a27b42aee5f479339e341926915cdc6adb08ac999a4a12539abc3776577e86af83e10381d9703ef1bca70bab81b43daf2c000622c9c3612d2  mesa-18.0.1.tar.xz
 # License
 sha256 630e75b4fdeb75ee2bf9e55db54dd1e3ff7353d52d9314ca8512bfd460f8e24c  docs/license.html
 sha256 a75ee0cec909515ff80a3ec07155b7fb0aafe8051abe1f0e45d5c4c5e2539366  docs/patents.txt
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 506f84274f..e93490c042 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 18.0.0
+MESA3D_VERSION = 18.0.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
