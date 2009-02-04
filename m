From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  4 Feb 2009 13:42:40 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain:
	external-toolchain gcc
Message-ID: <20090204134241.21E0F76274@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-04 13:42:40 +0000 (Wed, 04 Feb 2009)
New Revision: 25237

Log:
toolchain: revert r25193 (Change binary toolchain configuration)

As discussed on the list.

Modified:
   trunk/buildroot/toolchain/Config.in
   trunk/buildroot/toolchain/external-toolchain/Config.in.2
   trunk/buildroot/toolchain/external-toolchain/ext-tool.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/Config.in	2009-02-04 12:57:21 UTC (rev 25236)
+++ trunk/buildroot/toolchain/Config.in	2009-02-04 13:42:40 UTC (rev 25237)
@@ -26,8 +26,6 @@
 	default y if BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_EXTERNAL_SOURCE
 	default n if BR2_TOOLCHAIN_EXTERNAL
 
-source "toolchain/external-toolchain/Config.in.2"
-
 source "target/device/Config.in.toolchain"
 
 source "toolchain/Config.in.1"
@@ -40,6 +38,6 @@
 comment "Common Toolchain Options"
 
 source "toolchain/Config.in.2"
+source "toolchain/external-toolchain/Config.in.2"
 
 endmenu
-

Modified: trunk/buildroot/toolchain/external-toolchain/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/external-toolchain/Config.in.2	2009-02-04 12:57:21 UTC (rev 25236)
+++ trunk/buildroot/toolchain/external-toolchain/Config.in.2	2009-02-04 13:42:40 UTC (rev 25237)
@@ -3,12 +3,9 @@
 if BR2_TOOLCHAIN_EXTERNAL
 config BR2_TOOLCHAIN_EXTERNAL_PATH
 	string "External toolchain path"
-	default "$(GCCROOT)"
+	default "/path/to/staging_dir/usr"
 	help
 	  Path to where the external toolchain is installed.
-	  Either define GCCROOT in your environment
-	  or an absolute path like:
-	  "/path/to/staging_dir/usr"
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	string "External toolchain prefix"

Modified: trunk/buildroot/toolchain/external-toolchain/ext-tool.mk
===================================================================
--- trunk/buildroot/toolchain/external-toolchain/ext-tool.mk	2009-02-04 12:57:21 UTC (rev 25236)
+++ trunk/buildroot/toolchain/external-toolchain/ext-tool.mk	2009-02-04 13:42:40 UTC (rev 25237)
@@ -60,4 +60,3 @@
 		$(call copy_toolchain_lib_root, $$libs, /lib, $(BR2_TOOLCHAIN_EXTERNAL_STRIP)); \
 	done
 	$(call copy_toolchain_sysroot)
-

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-02-04 12:57:21 UTC (rev 25236)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2009-02-04 13:42:40 UTC (rev 25237)
@@ -498,23 +498,5 @@
 	@echo GCC_PATCH_DIR=$(GCC_PATCH_DIR)
 	@echo GCC_SITE=$(GCC_SITE)
 
-GCCSCRIPT=$(ARCH)-uclibc-gcc-$(BR2_GCC_VERSION).sh
-
-gccscript:
-	@rm -f $(GCCSCRIPT)
-	@rm -f gcc.sh
-	@echo	"#!/bin/sh"						> $(GCCSCRIPT)
-	@echo	"# $(ARCH) cross compiler toolchain created $(DATE)"	>> $(GCCSCRIPT)
-	@echo	"# gcc-$(BR2_GCC_VERSION)"				>> $(GCCSCRIPT)
-	@echo	"# binutils-$(BR2_BINUTILS_VERSION)"			>> $(GCCSCRIPT)
-	@echo	"# uClibc-$(UCLIBC_VER)"				>> $(GCCSCRIPT)
-	@echo	"export	GCCROOT=$(BR2_STAGING_DIR)/usr"			>> $(GCCSCRIPT)
-	@echo	"export	PATH=\$$GCCROOT/bin:\$$PATH"			>> $(GCCSCRIPT)
-	@echo	"export	GCCPREFIX=$(ARCH)-linux"			>> $(GCCSCRIPT)
-	@echo	"export	CROSS_COMPILE=\$$GCCPREFIX-"			>> $(GCCSCRIPT)
-	@chmod	a+x $(GCCSCRIPT)
-	@ln	-s $(GCCSCRIPT) gcc.sh
-	@echo	"$(GCCSCRIPT) created"
-	@more	$(GCCSCRIPT)
 endif
 # gcc-4.x only
