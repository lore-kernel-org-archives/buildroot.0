From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 15:38:01 +0100
Subject: [Buildroot] [git commit branch/next]
	package/x11r7/xserver_xorg-server: bump version to 1.17.0
Message-ID: <20150214143824.3AA5C80172@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b264b95cbcce4accfd3536d15e9902b948e5ccea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- remove patches, all were applied upstream
- add support for libglamor, needed by package/x11r7/xdriver_xf86-video-ati

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-adjust-gcc-version-conditions-for-pragma.patch |   62 ------
 .../xserver_xorg-server/0002-glyphpadbytes.patch   |  232 --------------------
 .../0003-image-byte-order.patch                    |   33 ---
 .../xserver_xorg-server/xserver_xorg-server.hash   |    6 +-
 .../xserver_xorg-server/xserver_xorg-server.mk     |    6 +-
 5 files changed, 8 insertions(+), 331 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/0001-os-log-adjust-gcc-version-conditions-for-pragma.patch b/package/x11r7/xserver_xorg-server/0001-os-log-adjust-gcc-version-conditions-for-pragma.patch
deleted file mode 100644
index 052bf4b..0000000
--- a/package/x11r7/xserver_xorg-server/0001-os-log-adjust-gcc-version-conditions-for-pragma.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 67c2a89004f867151d0ad6acc5e10dee76be454f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 2 Sep 2014 21:57:30 +0200
-Subject: [PATCH] os/log: adjust gcc version conditions for #pragma
-
-In commit e67f2d7e0f9189beb2907fa06cff5ecc7f35f922 ("gcc 4.2.1 doesn't
-support #pragma GCC diagnostic ignored"), some compile time
-conditionals were added around the #pragma usage. Those conditionals
-ensure that the #pragma are not used on gcc <= 4.2.
-
-However, the usage of #pragma diagnostic inside functions was only
-added in gcc 4.6, and a build failure is therefore experienced with
-gcc 4.5:
-
-log.c: In function 'LogInit':
-log.c:199:9: error: #pragma GCC diagnostic not allowed inside functions
-log.c:201:9: warning: format not a string literal, argument types not checked
-log.c:212:9: error: #pragma GCC diagnostic not allowed inside functions
-log.c:214:17: warning: format not a string literal, argument types not checked
-
-$ ./host/usr/bin/powerpc-linux-gnu-gcc -v
-[...]
-gcc version 4.5.2 (Sourcery G++ Lite 2011.03-38)
-
-This patch therefore adjusts the compile time conditionals to make
-sure the #pragma is not used on gcc <= 4.5, and only used on gcc >=
-4.6.
-
-Submitted upstream:
-
-  http://lists.x.org/archives/xorg-devel/2014-September/043716.html
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- os/log.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/os/log.c b/os/log.c
-index 2a721b9..629021e 100644
---- a/os/log.c
-+++ b/os/log.c
-@@ -195,7 +195,7 @@ LogInit(const char *fname, const char *backup)
-     char *logFileName = NULL;
- 
-     if (fname && *fname) {
--#if __GNUC__ > 4 || __GNUC__ == 4 && __GNUC_MINOR__ > 2
-+#if __GNUC__ > 4 || __GNUC__ == 4 && __GNUC_MINOR__ > 5
- #pragma GCC diagnostic ignored "-Wformat-nonliteral"
- #endif
-         if (asprintf(&logFileName, fname, display) == -1)
-@@ -208,7 +208,7 @@ LogInit(const char *fname, const char *backup)
-                 char *suffix;
-                 char *oldLog;
- 
--#if __GNUC__ > 4 || __GNUC__ == 4 && __GNUC_MINOR__ > 2
-+#if __GNUC__ > 4 || __GNUC__ == 4 && __GNUC_MINOR__ > 5
- #pragma GCC diagnostic ignored "-Wformat-nonliteral"
- #endif
-                 if ((asprintf(&suffix, backup, display) == -1) ||
--- 
-2.0.0
-
diff --git a/package/x11r7/xserver_xorg-server/0002-glyphpadbytes.patch b/package/x11r7/xserver_xorg-server/0002-glyphpadbytes.patch
deleted file mode 100644
index 3eb75f0..0000000
--- a/package/x11r7/xserver_xorg-server/0002-glyphpadbytes.patch
+++ /dev/null
@@ -1,232 +0,0 @@
-xserver_xorg-server: Fix compile error in microblaze
-
-Ported from upstream commit
-http://cgit.freedesktop.org/xorg/xserver/commit/include/servermd.h?id=17c3347f14822b9f7da4253c71f6ed51be2b38d1
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-
-From 17c3347f14822b9f7da4253c71f6ed51be2b38d1 Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Mon, 21 Jul 2014 10:06:50 -0400
-Subject: dix: Default GLYPHPADBYTES to 4
-
-This effectively no longer varied across architectures anyway.
-
-Signed-off-by: Adam Jackson <ajax@redhat.com>
-Reviewed-by: Daniel Stone <daniels@collabora.com>
-Signed-off-by: Keith Packard <keithp@keithp.com>
-
-diff -uNr xorg-server-1.16.0.org/include/servermd.h xorg-server-1.16.0/include/servermd.h
---- xorg-server-1.16.0.org/include/servermd.h	2014-06-23 22:57:42.000000000 +0200
-+++ xorg-server-1.16.0/include/servermd.h	2014-09-07 11:21:44.165508641 +0200
-@@ -52,26 +52,10 @@
-  * really be simplified even further.
-  */
- 
--/*
-- * Machine dependent values:
-- * GLYPHPADBYTES should be chosen with consideration for the space-time
-- * trade-off.  Padding to 0 bytes means that there is no wasted space
-- * in the font bitmaps (both on disk and in memory), but that access of
-- * the bitmaps will cause odd-address memory references.  Padding to
-- * 2 bytes would ensure even address memory references and would
-- * be suitable for a 68010-class machine, but at the expense of wasted
-- * space in the font bitmaps.  Padding to 4 bytes would be good
-- * for real 32 bit machines, etc.  Be sure that you tell the font
-- * compiler what kind of padding you want because its defines are
-- * kept separate from this.  See server/include/font.h for how
-- * GLYPHPADBYTES is used.
-- */
--
- #ifdef __avr32__
- 
- #define IMAGE_BYTE_ORDER        MSBFirst
- #define BITMAP_BIT_ORDER        MSBFirst
--#define GLYPHPADBYTES           4
- 
- #endif                          /* __avr32__ */
- 
-@@ -79,7 +63,6 @@
- 
- #define IMAGE_BYTE_ORDER        LSBFirst
- #define BITMAP_BIT_ORDER        LSBFirst
--#define GLYPHPADBYTES           4
- 
- #endif                          /* __arm32__ */
- 
-@@ -97,7 +80,6 @@
- #define BITMAP_SCANLINE_UNIT	8
- #endif
- 
--#define GLYPHPADBYTES		4
- #define GETLEFTBITS_ALIGNMENT	1
- #define LARGE_INSTRUCTION_CACHE
- #define AVOID_MEMORY_READ
-@@ -108,8 +90,6 @@
- 
- #define IMAGE_BYTE_ORDER	MSBFirst
- #define BITMAP_BIT_ORDER	MSBFirst
--#define GLYPHPADBYTES		4       /* to make fb work */
--                                        /* byte boundries */
- #endif                          /* hpux || __hppa__ */
- 
- #if defined(__powerpc__) || defined(__ppc__) || defined(__ppc64__)
-@@ -121,7 +101,6 @@
- #define IMAGE_BYTE_ORDER      MSBFirst
- #define BITMAP_BIT_ORDER      MSBFirst
- #endif
--#define GLYPHPADBYTES           4
- 
- #endif                          /* PowerPC */
- 
-@@ -130,11 +109,9 @@
- #if defined(__BIG_ENDIAN__)
- #define IMAGE_BYTE_ORDER	MSBFirst
- #define BITMAP_BIT_ORDER	MSBFirst
--#define GLYPHPADBYTES		4
- #else
- #define IMAGE_BYTE_ORDER	LSBFirst
- #define BITMAP_BIT_ORDER	LSBFirst
--#define GLYPHPADBYTES		4
- #endif
- 
- #endif                          /* SuperH */
-@@ -144,11 +121,9 @@
- #if defined(__BIG_ENDIAN__)
- #define IMAGE_BYTE_ORDER      MSBFirst
- #define BITMAP_BIT_ORDER      MSBFirst
--#define GLYPHPADBYTES         4
- #else
- #define IMAGE_BYTE_ORDER      LSBFirst
- #define BITMAP_BIT_ORDER      LSBFirst
--#define GLYPHPADBYTES         4
- #endif
- 
- #endif                          /* __m32r__ */
-@@ -170,9 +145,6 @@
- #define IMAGE_BYTE_ORDER	MSBFirst        /* Values for the SUN only */
- #define BITMAP_BIT_ORDER	MSBFirst
- #endif
--
--#define	GLYPHPADBYTES		4
--
- #endif                          /* sun && !(i386 && SVR4) */
- 
- #if defined(ibm032) || defined (ibm)
-@@ -197,11 +169,9 @@
- #if defined(MIPSEL) || defined(__MIPSEL__)
- #define IMAGE_BYTE_ORDER	LSBFirst        /* Values for the PMAX only */
- #define BITMAP_BIT_ORDER	LSBFirst
--#define GLYPHPADBYTES		4
- #else
- #define IMAGE_BYTE_ORDER	MSBFirst        /* Values for the MIPS only */
- #define BITMAP_BIT_ORDER	MSBFirst
--#define GLYPHPADBYTES		4
- #endif
- 
- #endif                          /* mips */
-@@ -209,15 +179,12 @@
- #if defined(__alpha) || defined(__alpha__)
- #define IMAGE_BYTE_ORDER	LSBFirst        /* Values for the Alpha only */
- #define BITMAP_BIT_ORDER       LSBFirst
--#define GLYPHPADBYTES		4
--
- #endif                          /* alpha */
- 
- #if defined (linux) && defined (__s390__)
- 
- #define IMAGE_BYTE_ORDER      	MSBFirst
- #define BITMAP_BIT_ORDER      	MSBFirst
--#define GLYPHPADBYTES         	4
- 
- #define BITMAP_SCANLINE_UNIT	8
- #define FAST_UNALIGNED_READ
-@@ -228,7 +195,6 @@
- 
- #define IMAGE_BYTE_ORDER       MSBFirst
- #define BITMAP_BIT_ORDER       MSBFirst
--#define GLYPHPADBYTES          4
- 
- #define BITMAP_SCANLINE_UNIT	8
- #define FAST_UNALIGNED_READ
-@@ -239,15 +205,12 @@
- 
- #define IMAGE_BYTE_ORDER	LSBFirst
- #define BITMAP_BIT_ORDER       LSBFirst
--#define GLYPHPADBYTES		4
- 
- #endif                          /* ia64 */
- 
- #if defined(__amd64__) || defined(amd64) || defined(__amd64)
- #define IMAGE_BYTE_ORDER	LSBFirst
- #define BITMAP_BIT_ORDER       LSBFirst
--#define GLYPHPADBYTES		4
--/* ???? */
- #endif                          /* AMD64 */
- 
- #if	defined(SVR4) && (defined(__i386__) || defined(__i386) ) ||	\
-@@ -263,17 +226,12 @@
- #define BITMAP_BIT_ORDER      LSBFirst
- #endif
- 
--#ifndef GLYPHPADBYTES
--#define GLYPHPADBYTES           4
--#endif
--
- #endif                          /* SVR4 / BSD / i386 */
- 
- #if defined (linux) && defined (__mc68000__)
- 
- #define IMAGE_BYTE_ORDER       MSBFirst
- #define BITMAP_BIT_ORDER       MSBFirst
--#define GLYPHPADBYTES          4
- 
- #endif                          /* linux/m68k */
- 
-@@ -281,14 +239,12 @@
- #if defined(linux) && defined(__arm__)
- #define IMAGE_BYTE_ORDER	LSBFirst
- #define BITMAP_BIT_ORDER	LSBFirst
--#define GLYPHPADBYTES		4
- #endif
- 
- /* linux on IBM S/390 */
- #if defined (linux) && defined (__s390__)
- #define IMAGE_BYTE_ORDER	MSBFirst
- #define BITMAP_BIT_ORDER	MSBFirst
--#define GLYPHPADBYTES		4
- #endif                          /* linux/s390 */
- 
- #ifdef __aarch64__
-@@ -301,7 +257,6 @@
- #define IMAGE_BYTE_ORDER        MSBFirst
- #define BITMAP_BIT_ORDER        MSBFirst
- #endif
--#define GLYPHPADBYTES           4
- 
- #endif                          /* __aarch64__ */
- 
-@@ -314,7 +269,6 @@
- #define IMAGE_BYTE_ORDER	LSBFirst
- #define BITMAP_BIT_ORDER	LSBFirst
- #endif
--#define GLYPHPADBYTES		4
- 
- #endif                          /* ARC */
- 
-@@ -328,10 +282,13 @@
- #define IMAGE_BYTE_ORDER        MSBFirst
- #define BITMAP_BIT_ORDER        MSBFirst
- #endif
--#define GLYPHPADBYTES           4
- 
- #endif                          /* __xtensa__ */
- 
-+#ifndef GLYPHPADBYTES
-+#define GLYPHPADBYTES           4
-+#endif
-+
- /* size of buffer to use with GetImage, measured in bytes. There's obviously
-  * a trade-off between the amount of heap used and the number of times the
-  * ddx routine has to be called.
diff --git a/package/x11r7/xserver_xorg-server/0003-image-byte-order.patch b/package/x11r7/xserver_xorg-server/0003-image-byte-order.patch
deleted file mode 100644
index b99b669..0000000
--- a/package/x11r7/xserver_xorg-server/0003-image-byte-order.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-xserver_xorg-server: Fix compile error for microblaze
-
-Fixes
-mipushpxl.c: In function 'miPushPixels':
-mipushpxl.c:110:38: error: 'IMAGE_BYTE_ORDER' undeclared (first use in this function)
-     if (screenInfo.bitmapBitOrder == IMAGE_BYTE_ORDER)
-
-Patch submitted upstream: https://bugs.freedesktop.org/show_bug.cgi?id=83582
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr xorg-server-1.16.0.glyph/include/servermd.h xorg-server-1.16.0/include/servermd.h
---- xorg-server-1.16.0.glyph/include/servermd.h	2014-09-07 11:32:34.297332811 +0200
-+++ xorg-server-1.16.0/include/servermd.h	2014-09-07 11:31:33.470099995 +0200
-@@ -176,6 +176,18 @@
- 
- #endif                          /* mips */
- 
-+#if defined(__microblaze__) || defined(microblaze)
-+
-+#ifdef __BIG_ENDIAN__
-+#define IMAGE_BYTE_ORDER	MSBFirst
-+#define BITMAP_BIT_ORDER	MSBFirst
-+#else
-+#define IMAGE_BYTE_ORDER	LSBFirst
-+#define BITMAP_BIT_ORDER	LSBFirst
-+#endif
-+
-+#endif
-+
- #if defined(__alpha) || defined(__alpha__)
- #define IMAGE_BYTE_ORDER	LSBFirst        /* Values for the Alpha only */
- #define BITMAP_BIT_ORDER       LSBFirst
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 974e59e..26c3558 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,3 +1,3 @@
-# From http://lists.x.org/archives/xorg-announce/2014-December/002506.html
-sha1	cf903e3b02cd4f4b075d139ee7d6b0a3741cd9cf				xorg-server-1.16.3.tar.bz2
-sha256	5e0f443238af1078b48f6eea98a382861b59187da221c2cf714d31c1d560b0fb	xorg-server-1.16.3.tar.bz2
+# From http://lists.x.org/archives/xorg-announce/2015-February/002529.html
+sha1	35d9fbc4665fd847f17f97666dd7ce28aa46c785				xorg-server-1.17.0.tar.bz2
+sha256	4e8548bae163129d2fc8f8e1f3b6071fe9d62821e3d5617507ccd2f589526166	xorg-server-1.17.0.tar.bz2
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index a9b9921..bd36eb3 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 1.16.3
+XSERVER_XORG_SERVER_VERSION = 1.17.0
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
@@ -180,6 +180,10 @@ ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri3
 endif
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += libepoxy
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-glamor
+endif
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri2 --disable-dri3
 endif
