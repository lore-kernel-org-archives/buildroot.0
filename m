From: Brendan Heading <brendanheading@gmail.com>
Date: Sun, 26 Jul 2015 18:35:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/exfat-utils: fix compilation error
	with musl
Message-ID: <1437932111-411-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

exfat-utils build would not build on Linux unless __GLIBC__ was defined.
Reworked header file to relax this requirement in favour of other libcs.
patch submitted to the exfat-utils mailing list for comment.

Also added missing dependency - exfat requires libfuse.

See http://autobuild.buildroot.net/results/c60/c60d0f9a93c90d41c3c86c78b0a0

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
 .../0001-fix-compiling-with-non-glibc-libcs.patch  | 53 ++++++++++++++++++++++
 package/exfat-utils/Config.in                      |  2 +
 package/exfat-utils/exfat-utils.mk                 |  2 +-
 3 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 package/exfat-utils/0001-fix-compiling-with-non-glibc-libcs.patch

diff --git a/package/exfat-utils/0001-fix-compiling-with-non-glibc-libcs.patch b/package/exfat-utils/0001-fix-compiling-with-non-glibc-libcs.patch
new file mode 100644
index 0000000..90740fa
--- /dev/null
+++ b/package/exfat-utils/0001-fix-compiling-with-non-glibc-libcs.patch
@@ -0,0 +1,53 @@
+[PATCH] fix compilation when libc does not define __GLIBC__
+
+libexfat would only compile on Linux with __GLIBC__ defined. Changed
+the logic around to use standard defaults on Linux which will work
+for glibc/uclibc/musl.
+
+Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+---
+ platform.h |   23 ++++++++++-------------
+ 1 file changed, 10 insertions(+), 13 deletions(-)
+
+Index: libexfat/libexfat/platform.h
+===================================================================
+--- libexfat/libexfat/platform.h	(revision 422)
++++ libexfat/libexfat/platform.h	(working copy)
+@@ -24,19 +24,8 @@
+ #ifndef PLATFORM_H_INCLUDED
+ #define PLATFORM_H_INCLUDED
+ 
+-#if defined(__GLIBC__)
++#if defined(__APPLE__)
+ 
+-#include <endian.h>
+-#include <byteswap.h>
+-#define exfat_bswap16(x) bswap_16(x)
+-#define exfat_bswap32(x) bswap_32(x)
+-#define exfat_bswap64(x) bswap_64(x)
+-#define EXFAT_BYTE_ORDER __BYTE_ORDER
+-#define EXFAT_LITTLE_ENDIAN __LITTLE_ENDIAN
+-#define EXFAT_BIG_ENDIAN __BIG_ENDIAN
+-
+-#elif defined(__APPLE__)
+-
+ #include <machine/endian.h>
+ #include <libkern/OSByteOrder.h>
+ #define exfat_bswap16(x) OSSwapInt16(x)
+@@ -57,7 +46,15 @@
+ #define EXFAT_BIG_ENDIAN _BIG_ENDIAN
+ 
+ #else 
+-#error Unknown platform
++/* Assume Linux. glibc, uclibc(ng) and musl all provide bswap_X functions. */
++#include <endian.h>
++#include <byteswap.h>
++#define exfat_bswap16(x) bswap_16(x)
++#define exfat_bswap32(x) bswap_32(x)
++#define exfat_bswap64(x) bswap_64(x)
++#define EXFAT_BYTE_ORDER __BYTE_ORDER
++#define EXFAT_LITTLE_ENDIAN __LITTLE_ENDIAN
++#define EXFAT_BIG_ENDIAN __BIG_ENDIAN
+ #endif
+ 
+ #endif /* ifndef PLATFORM_H_INCLUDED */
diff --git a/package/exfat-utils/Config.in b/package/exfat-utils/Config.in
index aedff5f..ead5d47 100644
--- a/package/exfat-utils/Config.in
+++ b/package/exfat-utils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_EXFAT_UTILS
 	bool "exfat-utils"
+	select BR2_PACKAGE_LIBFUSE
 	depends on BR2_USE_WCHAR
 	help
 	  exFAT filesystem utilities.
@@ -8,3 +9,4 @@ config BR2_PACKAGE_EXFAT_UTILS
 
 comment "exfat-utils needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
+
diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
index 4f43233..37c9b30 100644
--- a/package/exfat-utils/exfat-utils.mk
+++ b/package/exfat-utils/exfat-utils.mk
@@ -6,7 +6,7 @@
 
 EXFAT_UTILS_VERSION = 1.1.1
 EXFAT_UTILS_SITE = http://distfiles.gentoo.org/distfiles
-EXFAT_UTILS_DEPENDENCIES = host-scons
+EXFAT_UTILS_DEPENDENCIES = host-scons libfuse
 EXFAT_UTILS_LICENSE = GPLv3+
 EXFAT_UTILS_LICENSE_FILES = COPYING
 
-- 
2.4.3
