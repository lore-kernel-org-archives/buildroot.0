From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Sep 2014 12:06:28 +0200
Subject: [Buildroot] [PATCH 1/2] xserver_xorg-server: Fix compile error for
	microblaze & xtensa
Message-ID: <1410084389-5971-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/05f/05f2f1317f366b724c2d6b1bb572bb6778c69896/
http://autobuild.buildroot.net/results/655/655c00859ea61378739309539d71b38fab62e229/
http://autobuild.buildroot.net/results/4d3/4d37c5594c0916c27c897b0d2545d1c5cc492598/
http://autobuild.buildroot.net/results/d1a/d1af06d73ee0fd57ee0ad8b371927b2f9478d44e/
http://autobuild.buildroot.net/results/5cc/5cceb96ac29a410316fd7d8f7de0615ba33e3f2c/
http://autobuild.buildroot.net/results/143/14308a9d1806574f06ab2a7d222f53119fab1c90/
http://autobuild.buildroot.net/results/c6a/c6a5bbee21b5c4ce84c6a95bd764f294d3791720/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../xserver_xorg-server-0002-glyphpadbytes.patch   |  232 ++++++++++++++++++++
 1 file changed, 232 insertions(+)
 create mode 100644 package/x11r7/xserver_xorg-server/xserver_xorg-server-0002-glyphpadbytes.patch

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-0002-glyphpadbytes.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-0002-glyphpadbytes.patch
new file mode 100644
index 0000000..3eb75f0
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server-0002-glyphpadbytes.patch
@@ -0,0 +1,232 @@
+xserver_xorg-server: Fix compile error in microblaze
+
+Ported from upstream commit
+http://cgit.freedesktop.org/xorg/xserver/commit/include/servermd.h?id=17c3347f14822b9f7da4253c71f6ed51be2b38d1
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+From 17c3347f14822b9f7da4253c71f6ed51be2b38d1 Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Mon, 21 Jul 2014 10:06:50 -0400
+Subject: dix: Default GLYPHPADBYTES to 4
+
+This effectively no longer varied across architectures anyway.
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+Reviewed-by: Daniel Stone <daniels@collabora.com>
+Signed-off-by: Keith Packard <keithp@keithp.com>
+
+diff -uNr xorg-server-1.16.0.org/include/servermd.h xorg-server-1.16.0/include/servermd.h
+--- xorg-server-1.16.0.org/include/servermd.h	2014-06-23 22:57:42.000000000 +0200
++++ xorg-server-1.16.0/include/servermd.h	2014-09-07 11:21:44.165508641 +0200
+@@ -52,26 +52,10 @@
+  * really be simplified even further.
+  */
+ 
+-/*
+- * Machine dependent values:
+- * GLYPHPADBYTES should be chosen with consideration for the space-time
+- * trade-off.  Padding to 0 bytes means that there is no wasted space
+- * in the font bitmaps (both on disk and in memory), but that access of
+- * the bitmaps will cause odd-address memory references.  Padding to
+- * 2 bytes would ensure even address memory references and would
+- * be suitable for a 68010-class machine, but at the expense of wasted
+- * space in the font bitmaps.  Padding to 4 bytes would be good
+- * for real 32 bit machines, etc.  Be sure that you tell the font
+- * compiler what kind of padding you want because its defines are
+- * kept separate from this.  See server/include/font.h for how
+- * GLYPHPADBYTES is used.
+- */
+-
+ #ifdef __avr32__
+ 
+ #define IMAGE_BYTE_ORDER        MSBFirst
+ #define BITMAP_BIT_ORDER        MSBFirst
+-#define GLYPHPADBYTES           4
+ 
+ #endif                          /* __avr32__ */
+ 
+@@ -79,7 +63,6 @@
+ 
+ #define IMAGE_BYTE_ORDER        LSBFirst
+ #define BITMAP_BIT_ORDER        LSBFirst
+-#define GLYPHPADBYTES           4
+ 
+ #endif                          /* __arm32__ */
+ 
+@@ -97,7 +80,6 @@
+ #define BITMAP_SCANLINE_UNIT	8
+ #endif
+ 
+-#define GLYPHPADBYTES		4
+ #define GETLEFTBITS_ALIGNMENT	1
+ #define LARGE_INSTRUCTION_CACHE
+ #define AVOID_MEMORY_READ
+@@ -108,8 +90,6 @@
+ 
+ #define IMAGE_BYTE_ORDER	MSBFirst
+ #define BITMAP_BIT_ORDER	MSBFirst
+-#define GLYPHPADBYTES		4       /* to make fb work */
+-                                        /* byte boundries */
+ #endif                          /* hpux || __hppa__ */
+ 
+ #if defined(__powerpc__) || defined(__ppc__) || defined(__ppc64__)
+@@ -121,7 +101,6 @@
+ #define IMAGE_BYTE_ORDER      MSBFirst
+ #define BITMAP_BIT_ORDER      MSBFirst
+ #endif
+-#define GLYPHPADBYTES           4
+ 
+ #endif                          /* PowerPC */
+ 
+@@ -130,11 +109,9 @@
+ #if defined(__BIG_ENDIAN__)
+ #define IMAGE_BYTE_ORDER	MSBFirst
+ #define BITMAP_BIT_ORDER	MSBFirst
+-#define GLYPHPADBYTES		4
+ #else
+ #define IMAGE_BYTE_ORDER	LSBFirst
+ #define BITMAP_BIT_ORDER	LSBFirst
+-#define GLYPHPADBYTES		4
+ #endif
+ 
+ #endif                          /* SuperH */
+@@ -144,11 +121,9 @@
+ #if defined(__BIG_ENDIAN__)
+ #define IMAGE_BYTE_ORDER      MSBFirst
+ #define BITMAP_BIT_ORDER      MSBFirst
+-#define GLYPHPADBYTES         4
+ #else
+ #define IMAGE_BYTE_ORDER      LSBFirst
+ #define BITMAP_BIT_ORDER      LSBFirst
+-#define GLYPHPADBYTES         4
+ #endif
+ 
+ #endif                          /* __m32r__ */
+@@ -170,9 +145,6 @@
+ #define IMAGE_BYTE_ORDER	MSBFirst        /* Values for the SUN only */
+ #define BITMAP_BIT_ORDER	MSBFirst
+ #endif
+-
+-#define	GLYPHPADBYTES		4
+-
+ #endif                          /* sun && !(i386 && SVR4) */
+ 
+ #if defined(ibm032) || defined (ibm)
+@@ -197,11 +169,9 @@
+ #if defined(MIPSEL) || defined(__MIPSEL__)
+ #define IMAGE_BYTE_ORDER	LSBFirst        /* Values for the PMAX only */
+ #define BITMAP_BIT_ORDER	LSBFirst
+-#define GLYPHPADBYTES		4
+ #else
+ #define IMAGE_BYTE_ORDER	MSBFirst        /* Values for the MIPS only */
+ #define BITMAP_BIT_ORDER	MSBFirst
+-#define GLYPHPADBYTES		4
+ #endif
+ 
+ #endif                          /* mips */
+@@ -209,15 +179,12 @@
+ #if defined(__alpha) || defined(__alpha__)
+ #define IMAGE_BYTE_ORDER	LSBFirst        /* Values for the Alpha only */
+ #define BITMAP_BIT_ORDER       LSBFirst
+-#define GLYPHPADBYTES		4
+-
+ #endif                          /* alpha */
+ 
+ #if defined (linux) && defined (__s390__)
+ 
+ #define IMAGE_BYTE_ORDER      	MSBFirst
+ #define BITMAP_BIT_ORDER      	MSBFirst
+-#define GLYPHPADBYTES         	4
+ 
+ #define BITMAP_SCANLINE_UNIT	8
+ #define FAST_UNALIGNED_READ
+@@ -228,7 +195,6 @@
+ 
+ #define IMAGE_BYTE_ORDER       MSBFirst
+ #define BITMAP_BIT_ORDER       MSBFirst
+-#define GLYPHPADBYTES          4
+ 
+ #define BITMAP_SCANLINE_UNIT	8
+ #define FAST_UNALIGNED_READ
+@@ -239,15 +205,12 @@
+ 
+ #define IMAGE_BYTE_ORDER	LSBFirst
+ #define BITMAP_BIT_ORDER       LSBFirst
+-#define GLYPHPADBYTES		4
+ 
+ #endif                          /* ia64 */
+ 
+ #if defined(__amd64__) || defined(amd64) || defined(__amd64)
+ #define IMAGE_BYTE_ORDER	LSBFirst
+ #define BITMAP_BIT_ORDER       LSBFirst
+-#define GLYPHPADBYTES		4
+-/* ???? */
+ #endif                          /* AMD64 */
+ 
+ #if	defined(SVR4) && (defined(__i386__) || defined(__i386) ) ||	\
+@@ -263,17 +226,12 @@
+ #define BITMAP_BIT_ORDER      LSBFirst
+ #endif
+ 
+-#ifndef GLYPHPADBYTES
+-#define GLYPHPADBYTES           4
+-#endif
+-
+ #endif                          /* SVR4 / BSD / i386 */
+ 
+ #if defined (linux) && defined (__mc68000__)
+ 
+ #define IMAGE_BYTE_ORDER       MSBFirst
+ #define BITMAP_BIT_ORDER       MSBFirst
+-#define GLYPHPADBYTES          4
+ 
+ #endif                          /* linux/m68k */
+ 
+@@ -281,14 +239,12 @@
+ #if defined(linux) && defined(__arm__)
+ #define IMAGE_BYTE_ORDER	LSBFirst
+ #define BITMAP_BIT_ORDER	LSBFirst
+-#define GLYPHPADBYTES		4
+ #endif
+ 
+ /* linux on IBM S/390 */
+ #if defined (linux) && defined (__s390__)
+ #define IMAGE_BYTE_ORDER	MSBFirst
+ #define BITMAP_BIT_ORDER	MSBFirst
+-#define GLYPHPADBYTES		4
+ #endif                          /* linux/s390 */
+ 
+ #ifdef __aarch64__
+@@ -301,7 +257,6 @@
+ #define IMAGE_BYTE_ORDER        MSBFirst
+ #define BITMAP_BIT_ORDER        MSBFirst
+ #endif
+-#define GLYPHPADBYTES           4
+ 
+ #endif                          /* __aarch64__ */
+ 
+@@ -314,7 +269,6 @@
+ #define IMAGE_BYTE_ORDER	LSBFirst
+ #define BITMAP_BIT_ORDER	LSBFirst
+ #endif
+-#define GLYPHPADBYTES		4
+ 
+ #endif                          /* ARC */
+ 
+@@ -328,10 +282,13 @@
+ #define IMAGE_BYTE_ORDER        MSBFirst
+ #define BITMAP_BIT_ORDER        MSBFirst
+ #endif
+-#define GLYPHPADBYTES           4
+ 
+ #endif                          /* __xtensa__ */
+ 
++#ifndef GLYPHPADBYTES
++#define GLYPHPADBYTES           4
++#endif
++
+ /* size of buffer to use with GetImage, measured in bytes. There's obviously
+  * a trade-off between the amount of heap used and the number of times the
+  * ddx routine has to be called.
-- 
1.7.10.4
