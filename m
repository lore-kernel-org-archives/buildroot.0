From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Sun, 27 Nov 2016 16:32:03 +0200
Subject: [Buildroot] [PATCH v1 2/3] efivar: allow build with uClibc
In-Reply-To: <20161127143204.116740-1-andriy.shevchenko@linux.intel.com>
References: <20161127143204.116740-1-andriy.shevchenko@linux.intel.com>
Message-ID: <20161127143204.116740-3-andriy.shevchenko@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Details at https://github.com/rhinstaller/efivar/issues/76.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 package/efivar/0002-Allow-build-with-uClibc.patch | 38 +++++++++++++++++++++++
 package/efivar/Config.in                          |  2 --
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 package/efivar/0002-Allow-build-with-uClibc.patch

diff --git a/package/efivar/0002-Allow-build-with-uClibc.patch b/package/efivar/0002-Allow-build-with-uClibc.patch
new file mode 100644
index 0000000..7b62714
--- /dev/null
+++ b/package/efivar/0002-Allow-build-with-uClibc.patch
@@ -0,0 +1,38 @@
+From 2255601757a8a58baddad2d37d0bcc6b003a3732 Mon Sep 17 00:00:00 2001
+From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+Date: Fri, 25 Nov 2016 19:42:27 +0200
+Subject: [PATCH 2/2] Allow build with uClibc
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
index 466a30a..5fd3360 100644
--- a/package/efivar/Config.in
+++ b/package/efivar/Config.in
@@ -11,7 +11,6 @@ config BR2_PACKAGE_EFIVAR
 		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	# doesn't build with uclibc due to lack of uchar.h
 	# doesn't build with musl due to lack of __bswap_constant_16
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	select BR2_PACKAGE_POPT
 	help
@@ -21,7 +20,6 @@ config BR2_PACKAGE_EFIVAR
 
 comment "efivar requires a glibc toolchain w/ headers >= 3.12, gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
-		!BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS && \
 		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
-- 
2.10.2
