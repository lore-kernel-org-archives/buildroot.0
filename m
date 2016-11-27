From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Sun, 27 Nov 2016 16:32:04 +0200
Subject: [Buildroot] [PATCH v1 3/3] efibootmrg: Allow build with uClibc
In-Reply-To: <20161127143204.116740-1-andriy.shevchenko@linux.intel.com>
References: <20161127143204.116740-1-andriy.shevchenko@linux.intel.com>
Message-ID: <20161127143204.116740-4-andriy.shevchenko@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Details at https://github.com/rhinstaller/efibootmgr/issues/61.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../efibootmgr/0001-Allow-build-with-uClibc.patch  | 38 ++++++++++++++++++++++
 package/efibootmgr/Config.in                       |  3 +-
 package/efibootmgr/efibootmgr.mk                   |  8 +++--
 3 files changed, 44 insertions(+), 5 deletions(-)
 create mode 100644 package/efibootmgr/0001-Allow-build-with-uClibc.patch

diff --git a/package/efibootmgr/0001-Allow-build-with-uClibc.patch b/package/efibootmgr/0001-Allow-build-with-uClibc.patch
new file mode 100644
index 0000000..1e3f9ec
--- /dev/null
+++ b/package/efibootmgr/0001-Allow-build-with-uClibc.patch
@@ -0,0 +1,38 @@
+From bbfcc60497c326576bb23cb01d90115ef3cf6947 Mon Sep 17 00:00:00 2001
+From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+Date: Fri, 25 Nov 2016 20:26:52 +0200
+Subject: [PATCH 1/1] Allow build with uClibc
+
+Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+---
+ src/efibootdump.c | 1 -
+ src/eficonman.c   | 1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/src/efibootdump.c b/src/efibootdump.c
+index 6ff8360..7c5a1c5 100644
+--- a/src/efibootdump.c
++++ b/src/efibootdump.c
+@@ -19,7 +19,6 @@
+ #include <stdint.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+-#include <uchar.h>
+ #include <unistd.h>
+ 
+ #include "error.h"
+diff --git a/src/eficonman.c b/src/eficonman.c
+index 2c2be38..9bfae79 100644
+--- a/src/eficonman.c
++++ b/src/eficonman.c
+@@ -17,7 +17,6 @@
+ #include <stdint.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+-#include <uchar.h>
+ #include <unistd.h>
+ 
+ #define  _(String) gettext (String)
+-- 
+2.10.2
+
diff --git a/package/efibootmgr/Config.in b/package/efibootmgr/Config.in
index 988bf6d..8860e5d 100644
--- a/package/efibootmgr/Config.in
+++ b/package/efibootmgr/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_EFIBOOTMGR
 	bool "efibootmgr"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 # efivar
-	depends on BR2_TOOLCHAIN_USES_GLIBC # efivar
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # efivar
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS && \
 		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII # efivar
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
 	select BR2_PACKAGE_EFIVAR
 	help
 	  A Linux user-space application to modify the Intel Extensible
@@ -16,7 +16,6 @@ config BR2_PACKAGE_EFIBOOTMGR
 
 comment "efibootmgr requires a glibc toolchain w/ headers >= 3.12, gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
-		!BR2_TOOLCHAIN_USES_GLIBC || \\
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS && \
 		!BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
diff --git a/package/efibootmgr/efibootmgr.mk b/package/efibootmgr/efibootmgr.mk
index 731d6e9..487c8ca 100644
--- a/package/efibootmgr/efibootmgr.mk
+++ b/package/efibootmgr/efibootmgr.mk
@@ -8,7 +8,8 @@ EFIBOOTMGR_VERSION = 14
 EFIBOOTMGR_SITE = $(call github,rhinstaller,efibootmgr,$(EFIBOOTMGR_VERSION))
 EFIBOOTMGR_LICENSE = GPLv2+
 EFIBOOTMGR_LICENSE_FILES = COPYING
-EFIBOOTMGR_DEPENDENCIES = efivar
+EFIBOOTMGR_DEPENDENCIES = efivar $(if $(BR2_NEEDS_GETTEXT),gettext)
+EFIBOOTMGR_LDFLAGS = $(TARGET_LDFLAGS) $(if $(BR2_NEEDS_GETTEXT),-lintl)
 
 define EFIBOOTMSR_PATCH_HEADER_PATH
 	$(SED) 's,-I/,-I$(STAGING_DIR)/,' $(@D)/Makefile
@@ -17,11 +18,12 @@ endef
 EFIBOOTMGR_POST_PATCH_HOOKS += EFIBOOTMSR_PATCH_HEADER_PATH
 
 define EFIBOOTMGR_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS)			\
+		LDFLAGS="$(EFIBOOTMGR_LDFLAGS)" $(MAKE1) -C $(@D)
 endef
 
 define EFIBOOTMGR_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)	\
 		DESTDIR=$(TARGET_DIR) install
 endef
 
-- 
2.10.2
