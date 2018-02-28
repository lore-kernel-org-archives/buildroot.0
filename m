From: charles.hardin at storagecraft.com <charles.hardin@storagecraft.com>
Date: Wed, 28 Feb 2018 09:36:51 -0800
Subject: [Buildroot] [PATCH 1/1] libaio: add mips64 to the supported
 architecture for libaio
Message-ID: <20180228173651.65873-1-charles.hardin@storagecraft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Charles Hardin <charles.hardin@storagecraft.com>

The required support is available for libaio on mips64
architectures - or at least the Cavium Octeon at least and
the linux kernel running on it.

Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>
---
 package/libaio/0004-fix-mips64-padding.patch | 43 ++++++++++++++++++++++++++++
 package/libaio/Config.in                     |  5 ++--
 2 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 package/libaio/0004-fix-mips64-padding.patch

diff --git a/package/libaio/0004-fix-mips64-padding.patch b/package/libaio/0004-fix-mips64-padding.patch
new file mode 100644
index 0000000000..d88d6e6ab2
--- /dev/null
+++ b/package/libaio/0004-fix-mips64-padding.patch
@@ -0,0 +1,43 @@
+diff -Naur libaio-0.3.110.orig/src/libaio.h libaio-0.3.110/src/libaio.h
+--- libaio-0.3.110.orig/src/libaio.h	2014-01-24 08:01:02.000000000 -0800
++++ libaio-0.3.110/src/libaio.h	2018-02-27 20:06:36.000000000 -0800
+@@ -51,7 +51,8 @@
+ 
+ /* little endian, 32 bits */
+ #if defined(__i386__) || (defined(__arm__) && !defined(__ARMEB__)) || \
+-    defined(__sh__) || defined(__bfin__) || defined(__MIPSEL__) || \
++    defined(__sh__) || defined(__bfin__) || \
++    (defined(__mips__) && defined(__MIPSEL__)) || \
+     defined(__cris__)
+ #define PADDED(x, y)	x; unsigned y
+ #define PADDEDptr(x, y)	x; unsigned y
+@@ -59,7 +60,8 @@
+ 
+ /* little endian, 64 bits */
+ #elif defined(__ia64__) || defined(__x86_64__) || defined(__alpha__) || \
+-      (defined(__aarch64__) && defined(__AARCH64EL__))
++      (defined(__aarch64__) && defined(__AARCH64EL__)) || \
++      (defined(__mips64) && defined(__MIPSEL__))
+ #define PADDED(x, y)	x, y
+ #define PADDEDptr(x, y)	x
+ #define PADDEDul(x, y)	unsigned long x
+@@ -67,7 +69,8 @@
+ /* big endian, 64 bits */
+ #elif defined(__powerpc64__) || defined(__s390x__) || \
+       (defined(__sparc__) && defined(__arch64__)) || \
+-      (defined(__aarch64__) && defined(__AARCH64EB__))
++      (defined(__aarch64__) && defined(__AARCH64EB__)) || \
++      (defined(__mips64) && defined(__MIPSEB__))
+ #define PADDED(x, y)	unsigned y; x
+ #define PADDEDptr(x,y)	x
+ #define PADDEDul(x, y)	unsigned long x
+@@ -75,7 +78,8 @@
+ /* big endian, 32 bits */
+ #elif defined(__PPC__) || defined(__s390__) || \
+       (defined(__arm__) && defined(__ARMEB__)) || \
+-      defined(__sparc__) || defined(__MIPSEB__) || defined(__m68k__) || \
++      defined(__sparc__) || \
++      (defined(__mips__) && defined(__MIPSEB__)) || defined(__m68k__) || \
+       defined(__hppa__) || defined(__frv__) || defined(__avr32__)
+ #define PADDED(x, y)	unsigned y; x
+ #define PADDEDptr(x, y)	unsigned y; x
diff --git a/package/libaio/Config.in b/package/libaio/Config.in
index ea21a36f55..30bebee5bb 100644
--- a/package/libaio/Config.in
+++ b/package/libaio/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 || \
-		BR2_m68k || BR2_mips || BR2_mipsel || BR2_powerpc || \
-		BR2_powerpc64 || BR2_powerpc64le || BR2_sparc || \
+		BR2_m68k || BR2_mips || BR2_mipsel || BR2_mips64 || \
+		BR2_mips64el || BR2_powerpc || BR2_powerpc64 || \
+		BR2_powerpc64le || BR2_sparc || \
 		BR2_x86_64
 
 config BR2_PACKAGE_LIBAIO
-- 
2.14.3 (Apple Git-98)
