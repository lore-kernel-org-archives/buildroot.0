From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 16:43:27 +0100
Subject: [Buildroot] [git commit] efivar: allow build with uClibc
Message-ID: <20161201222140.36EEC7FD88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64551a8f5f7fd8cb8dd92cb3198ceff8f112b343
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Details at https://github.com/rhinstaller/efivar/issues/76.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
[Thomas: tweak the dependency, efivar still doesn't build with musl.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efivar/0002-Allow-build-with-uClibc.patch | 38 +++++++++++++++++++++++
 package/efivar/Config.in                          |  7 ++---
 2 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/package/efivar/0002-Allow-build-with-uClibc.patch b/package/efivar/0002-Allow-build-with-uClibc.patch
new file mode 100644
index 0000000..7c19587
--- /dev/null
+++ b/package/efivar/0002-Allow-build-with-uClibc.patch
@@ -0,0 +1,38 @@
+From 2255601757a8a58baddad2d37d0bcc6b003a3732 Mon Sep 17 00:00:00 2001
+From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+Date: Fri, 25 Nov 2016 19:42:27 +0200
+Subject: [PATCH] Allow build with uClibc
+
+Basically this replaces type definitions in <uchar.h>.
+
+Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+---
+ src/export.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/src/export.c b/src/export.c
+index 7f2d4dd..72c02d1 100644
+--- a/src/export.c
++++ b/src/export.c
+@@ -21,11 +21,17 @@
+ #include <inttypes.h>
+ #include <stdint.h>
+ #include <stdlib.h>
+-#include <uchar.h>
+ 
+ #include <efivar.h>
+ #include "lib.h"
+ 
++#ifdef __UCLIBC__
++typedef int_least16_t char16_t;
++typedef int_least32_t char32_t;
++#else
++#include <uchar.h>
++#endif
++
+ #define EFIVAR_MAGIC 0xf3df1597
+ 
+ #define ATTRS_UNSET 0xa5a5a5a5a5a5a5a5
+-- 
+2.10.2
+
diff --git a/package/efivar/Config.in b/package/efivar/Config.in
index 466a30a..1bdb6ca 100644
--- a/package/efivar/Config.in
+++ b/package/efivar/Config.in
@@ -9,9 +9,8 @@ config BR2_PACKAGE_EFIVAR
 	# toolchains.
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS && \
 		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
-	# doesn't build with uclibc due to lack of uchar.h
 	# doesn't build with musl due to lack of __bswap_constant_16
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	select BR2_PACKAGE_POPT
 	help
@@ -19,9 +18,9 @@ config BR2_PACKAGE_EFIVAR
 
 	  https://github.com/rhinstaller/efivar
 
-comment "efivar requires a glibc toolchain w/ headers >= 3.12, gcc >= 4.9"
+comment "efivar requires a glibc or uClibc toolchain w/ headers >= 3.12, gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
-		!BR2_TOOLCHAIN_USES_GLIBC || \
+		BR2_TOOLCHAIN_USES_MUSL || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS && \
 		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
