From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 22:55:27 +0200
Subject: [Buildroot] [git commit] package/supertuxkart: bump to version 1.0
Message-ID: <20190424205141.A350B82DD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9152387703707bd1c8c49e7978ef47aec3f8baeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream patch 0001-Fix-3091.patch.

Add enet, libsquish and nettle new dependencies.
Add host-pkgconf since the CMakeLists.txt now use pkg-config
for enet.

Make sure that glew and wiiuse libraries from staging are
used instead of bundled versions.

See:
http://blog.supertuxkart.net/2019/04/supertuxkart-10-release.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/supertuxkart/0001-Fix-3091.patch | 59 --------------------------------
 package/supertuxkart/Config.in           |  4 +++
 package/supertuxkart/supertuxkart.hash   |  8 ++---
 package/supertuxkart/supertuxkart.mk     | 13 +++++--
 4 files changed, 18 insertions(+), 66 deletions(-)

diff --git a/package/supertuxkart/0001-Fix-3091.patch b/package/supertuxkart/0001-Fix-3091.patch
deleted file mode 100644
index dae2a37ce1..0000000000
--- a/package/supertuxkart/0001-Fix-3091.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 813b08bc73e4e93714b972ee56c64b4771735e01 Mon Sep 17 00:00:00 2001
-From: Benau <Benau@users.noreply.github.com>
-Date: Sun, 14 Jan 2018 10:19:37 +0800
-Subject: [PATCH] Fix #3091
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com
-[Retrieved from:
-https://github.com/supertuxkart/stk-code/commit/813b08bc73e4e93714b972ee56c64b4771735e01]
----
- lib/graphics_utils/mipmap/cpusimd.h | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/lib/graphics_utils/mipmap/cpusimd.h b/lib/graphics_utils/mipmap/cpusimd.h
-index 1dc2c730b2..5e2cf30e5f 100644
---- a/lib/graphics_utils/mipmap/cpusimd.h
-+++ b/lib/graphics_utils/mipmap/cpusimd.h
-@@ -38,11 +38,11 @@
-  #include <mmintrin.h>
-  #define CPU_MMX_SUPPORT (1)
- #endif
--#if __SSE__ || _M_X64 || _M_IX86_FP >= 1  || CPU_ENABLE_SSE
-+#if __SSE__ || defined(_M_X64) || ( defined(_M_IX86_FP) && ( _M_IX86_FP >= 1 ) ) || CPU_ENABLE_SSE
-  #include <xmmintrin.h>
-  #define CPU_SSE_SUPPORT (1)
- #endif
--#if __SSE2__ || _M_X64 || _M_IX86_FP >= 2  || CPU_ENABLE_SSE2
-+#if __SSE2__ || defined(_M_X64) || ( defined(_M_IX86_FP) && ( _M_IX86_FP >= 2 ) ) || CPU_ENABLE_SSE2
-  #include <emmintrin.h>
-  #define CPU_SSE2_SUPPORT (1)
- #endif
-@@ -95,23 +95,23 @@
-  #define CPU_POPCNT_SUPPORT (1)
- #endif
- #if __LZCNT__ || CPU_ENABLE_LZCNT
-- #include <lzcntintrin.h>
-+ #include <x86intrin.h>
-  #define CPU_LZCNT_SUPPORT (1)
- #endif
- #if __F16C__ || CPU_ENABLE_F16C
-- #include <f16cintrin.h>
-+ #include <x86intrin.h>
-  #define CPU_F16C_SUPPORT (1)
- #endif
- #if __BMI__ || CPU_ENABLE_BMI
-- #include <bmiintrin.h>
-+ #include <x86intrin.h>
-  #define CPU_BMI_SUPPORT (1)
- #endif
- #if __BMI2__ || CPU_ENABLE_BMI2
-- #include <bmi2intrin.h>
-+ #include <x86intrin.h>
-  #define CPU_BMI2_SUPPORT (1)
- #endif
- #if __TBM__ || CPU_ENABLE_TBM
-- #include <tbmintrin.h>
-+ #include <x86intrin.h>
-  #define CPU_TBM_SUPPORT (1)
- #endif
- 
diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
index 51759160eb..21093cc085 100644
--- a/package/supertuxkart/Config.in
+++ b/package/supertuxkart/Config.in
@@ -10,12 +10,16 @@ config BR2_PACKAGE_SUPERTUXKART
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_ENET
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_LIBGLEW
 	select BR2_PACKAGE_LIBGLU
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_LIBSQUISH
 	select BR2_PACKAGE_LIBVORBIS
+	select BR2_PACKAGE_NETTLE
 	select BR2_PACKAGE_OPENAL
 	select BR2_PACKAGE_XLIB_LIBXRANDR
 	select BR2_PACKAGE_ZLIB
diff --git a/package/supertuxkart/supertuxkart.hash b/package/supertuxkart/supertuxkart.hash
index 4bba3f2c2a..dc65c700b9 100644
--- a/package/supertuxkart/supertuxkart.hash
+++ b/package/supertuxkart/supertuxkart.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256	d8014e7106ba84f98b5ec5f146249dcffc284fc4083f8f237ff420b9e2219cb0  supertuxkart-0.9.3-src.tar.xz
-# From https://sourceforge.net/projects/supertuxkart/files/SuperTuxKart/0.9.3/
-sha1	2650ba20976472f10122a8600cc239507a9b6f24  supertuxkart-0.9.3-src.tar.xz
-md5	8de5455b8fdbb92679e302b76c9041cf  supertuxkart-0.9.3-src.tar.xz
+sha256	6d88f43f0de5202766ba305c87e3d9843103e81d31b7193059286098d2a5d980  supertuxkart-1.0-src.tar.xz
+# From https://sourceforge.net/projects/supertuxkart/files/SuperTuxKart/1.0/
+sha1	cd270c851c5b15fb69c6e78e9824d87187c1f801  supertuxkart-1.0-src.tar.xz
+md5	3059ea9c146b50f40f2b59a606da0fc0  supertuxkart-1.0-src.tar.xz
diff --git a/package/supertuxkart/supertuxkart.mk b/package/supertuxkart/supertuxkart.mk
index 37756213fa..02558df800 100644
--- a/package/supertuxkart/supertuxkart.mk
+++ b/package/supertuxkart/supertuxkart.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUPERTUXKART_VERSION = 0.9.3
+SUPERTUXKART_VERSION = 1.0
 SUPERTUXKART_SOURCE = supertuxkart-$(SUPERTUXKART_VERSION)-src.tar.xz
 SUPERTUXKART_SITE = http://downloads.sourceforge.net/project/supertuxkart/SuperTuxKart/$(SUPERTUXKART_VERSION)
 
@@ -15,14 +15,19 @@ SUPERTUXKART_LICENSE = GPL-3.0+
 SUPERTUXKART_LICENSE_FILES = COPYING
 
 SUPERTUXKART_DEPENDENCIES = \
+	host-pkgconf \
 	freetype \
+	enet \
 	jpeg \
 	libcurl \
 	libgl \
+	libglew \
 	libglu \
 	libogg \
 	libpng \
+	libsquish \
 	libvorbis \
+	nettle \
 	openal \
 	xlib_libXrandr \
 	zlib
@@ -31,7 +36,9 @@ SUPERTUXKART_DEPENDENCIES = \
 # the only user of the bundled libraries, turn off shared libraries entirely.
 # Disable In-game recorder (there is no libopenglrecorder package)
 SUPERTUXKART_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF \
-	-DBUILD_RECORDER=OFF
+	-DBUILD_RECORDER=OFF \
+	-DUSE_SYSTEM_GLEW=ON \
+	-DUSE_SYSTEM_ENET=ON
 
 ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
 SUPERTUXKART_DEPENDENCIES += libfribidi
@@ -42,7 +49,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
 SUPERTUXKART_DEPENDENCIES += bluez5_utils
-SUPERTUXKART_CONF_OPTS += -DUSE_WIIUSE=ON
+SUPERTUXKART_CONF_OPTS += -DUSE_WIIUSE=ON -DUSE_SYSTEM_WIIUSE=ON
 else
 # Wiimote support relies on bluez5.
 SUPERTUXKART_CONF_OPTS += -DUSE_WIIUSE=OFF
