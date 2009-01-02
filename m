From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  2 Jan 2009 20:31:02 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain: export-toolchain
	uClibc
Message-ID: <20090102203102.1E36C769FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-02 20:31:01 +0000 (Fri, 02 Jan 2009)
New Revision: 24650

Log:
toolchain: revert "Allow creating a script for external use of Buildroot toolchain"

It's been 10 days now without any reply from Ulf, so revert r24480+r24481.

Removed:
   trunk/buildroot/toolchain/export-toolchain/Config.in
   trunk/buildroot/toolchain/export-toolchain/Makefile.in

Modified:
   trunk/buildroot/toolchain/Config.in
   trunk/buildroot/toolchain/Makefile.in
   trunk/buildroot/toolchain/uClibc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/Config.in	2009-01-02 20:30:54 UTC (rev 24649)
+++ trunk/buildroot/toolchain/Config.in	2009-01-02 20:31:01 UTC (rev 24650)
@@ -26,8 +26,6 @@
 	default y if BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_EXTERNAL_SOURCE
 	default n if BR2_TOOLCHAIN_EXTERNAL
 
-source "toolchain/export-toolchain/Config.in"
-
 source "target/device/Config.in.toolchain"
 
 source "toolchain/Config.in.1"

Modified: trunk/buildroot/toolchain/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/Makefile.in	2009-01-02 20:30:54 UTC (rev 24649)
+++ trunk/buildroot/toolchain/Makefile.in	2009-01-02 20:31:01 UTC (rev 24650)
@@ -46,5 +46,3 @@
 
 # gcc has a bunch of needed stuff....
 include toolchain/gcc/Makefile.in
-# breaks the build
-#include toolchain/export-toolchain/Makefile.in

Deleted: trunk/buildroot/toolchain/export-toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/export-toolchain/Config.in	2009-01-02 20:30:54 UTC (rev 24649)
+++ trunk/buildroot/toolchain/export-toolchain/Config.in	2009-01-02 20:31:01 UTC (rev 24650)
@@ -1,8 +0,0 @@
-config BR2_EXPORT_TOOLCHAIN
-	bool "Create script exporting toolchain to home directory"
-	default n
-	help
-	  This will generate a batchfile which, if run
-	  will add the Buildroot toolchain to the user PATH
-	  The file is called "$(ARCH)-uclibc-gcc-$(GCC_VERSION).sh"
-

Deleted: trunk/buildroot/toolchain/export-toolchain/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/export-toolchain/Makefile.in	2009-01-02 20:30:54 UTC (rev 24649)
+++ trunk/buildroot/toolchain/export-toolchain/Makefile.in	2009-01-02 20:31:01 UTC (rev 24650)
@@ -1,29 +0,0 @@
-# This generates a script which exports the toolchain
-# using a shell script
-
-GCC_SCRIPT:=$(ARCH)-uclibc-gcc-$(GCC_VERSION).sh
-GCC_SCRIPT_TEMP:=$(BINARIES_DIR)/$(GCC_SCRIPT)
-
-~/$(GCC_SCRIPT): cross_compiler
-	@echo	"#!/bin/sh"						>	$(GCC_SCRIPT_TEMP)
-	@echo	"# $(ARCH) cross compiler toolchain created $(DATE)"	>>	$(GCC_SCRIPT_TEMP)
-	@echo	"# gcc-$(GCC_VERSION)"					>>	$(GCC_SCRIPT_TEMP)
-	@echo	"# binutils-$(BINUTILS_VERSION)"			>>	$(GCC_SCRIPT_TEMP)
-	@echo	"# uClibc-$(UCLIBC_VERSION)"				>>	$(GCC_SCRIPT_TEMP)
-	@echo	"export	GCCROOT=$(STAGING_DIR)/usr"			>>	$(GCC_SCRIPT_TEMP)
-	@echo	"export	PATH=\$$PATH:\$$GCCROOT/bin"			>>	$(GCC_SCRIPT_TEMP)
-	@echo	"export	CROSS_COMPILE=$(REAL_GNU_TARGET_NAME)-"		>>	$(GCC_SCRIPT_TEMP)
-	@chmod	a+x $(GCC_SCRIPT_TEMP)
-	@cp	$(GCC_SCRIPT_TEMP) ~/$(GCC_SCRIPT)
-	@cat	~/$(GCC_SCRIPT)
-
-export-toolchain: ~/$(GCC_SCRIPT)
-
-export-toolchain-clean:
-	rm	-f ~/$(GCC_SCRIPT)
-	rm	-f $(GCC_SCRIPT_TEMP)
-
-ifeq ($(BR2_EXPORT_TOOLCHAIN),y)
-TARGETS+=export-toolchain
-endif
-

Modified: trunk/buildroot/toolchain/uClibc/Config.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in	2009-01-02 20:30:54 UTC (rev 24649)
+++ trunk/buildroot/toolchain/uClibc/Config.in	2009-01-02 20:31:01 UTC (rev 24650)
@@ -27,12 +27,6 @@
 
 endchoice
 
-config UCLIBC_VERSION
-	string
-	default "0.9.28.3"	if BR2_UCLIBC_VERSION_0_9_28_3
-	default "0.9.29"	if BR2_UCLIBC_VERSION_0_9_29
-	default "0.9.30"	if BR2_UCLIBC_VERSION_0_9_30
-	default "snapshot"	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_USE_UCLIBC_SNAPSHOT
 	string "Date (yyyymmdd) of snapshot or 'snapshot' for latest"
