From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 21 Dec 2008 17:11:34 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain: export-toolchain
	uClibc
Message-ID: <20081221171134.7BAB176ABE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-12-21 17:11:33 +0000 (Sun, 21 Dec 2008)
New Revision: 24480

Log:
Allow creating a script for external use of Buildroot toolchain

Added:
   trunk/buildroot/toolchain/export-toolchain/
   trunk/buildroot/toolchain/export-toolchain/Config.in
   trunk/buildroot/toolchain/export-toolchain/Makefile.in

Modified:
   trunk/buildroot/toolchain/Config.in
   trunk/buildroot/toolchain/Makefile.in
   trunk/buildroot/toolchain/uClibc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/Config.in	2008-12-21 15:34:38 UTC (rev 24479)
+++ trunk/buildroot/toolchain/Config.in	2008-12-21 17:11:33 UTC (rev 24480)
@@ -26,6 +26,8 @@
 	default y if BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_EXTERNAL_SOURCE
 	default n if BR2_TOOLCHAIN_EXTERNAL
 
+source "toolchain/export-toolchain/Config.in"
+
 source "target/device/Config.in.toolchain"
 
 source "toolchain/Config.in.1"

Modified: trunk/buildroot/toolchain/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/Makefile.in	2008-12-21 15:34:38 UTC (rev 24479)
+++ trunk/buildroot/toolchain/Makefile.in	2008-12-21 17:11:33 UTC (rev 24480)
@@ -47,3 +47,5 @@
 # gcc has a bunch of needed stuff....
 include toolchain/gcc/Makefile.in
 
+include toolchain/export-toolchain/Makefile.in
+

Added: trunk/buildroot/toolchain/export-toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/export-toolchain/Config.in	                        (rev 0)
+++ trunk/buildroot/toolchain/export-toolchain/Config.in	2008-12-21 17:11:33 UTC (rev 24480)
@@ -0,0 +1,8 @@
+config BR2_EXPORT_TOOLCHAIN
+	bool "Create script exporting toolchain to home directory"
+	default n
+	help
+	  This will generate a batchfile which, if run
+	  will add the Buildroot toolchain to the user PATH
+	  The file is called "$(ARCH)-uclibc-gcc-$(GCC_VERSION).sh"
+

Added: trunk/buildroot/toolchain/export-toolchain/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/export-toolchain/Makefile.in	                        (rev 0)
+++ trunk/buildroot/toolchain/export-toolchain/Makefile.in	2008-12-21 17:11:33 UTC (rev 24480)
@@ -0,0 +1,28 @@
+# This generates a script which exports the toolchain
+# using a shell script
+
+GCC_SCRIPT:=$(ARCH)-uclibc-gcc-$(GCC_VERSION).sh
+GCC_SCRIPT_TEMP:=$(BINARIES_DIR)/$(GCC_SCRIPT)
+
+~/$(GCC_SCRIPT): cross_compiler
+	@echo	"#!/bin/sh"						>	$(GCC_SCRIPT_TEMP)
+	@echo	"# $(ARCH) cross compiler toolchain created $(DATE)"	>>	$(GCC_SCRIPT_TEMP)
+	@echo	"# gcc-$(GCC_VERSION)"					>>	$(GCC_SCRIPT_TEMP)
+	@echo	"# binutils-$(BINUTILS_VERSION)"			>>	$(GCC_SCRIPT_TEMP)
+	@echo	"# uClibc-$(UCLIBC_VERSION)"				>>	$(GCC_SCRIPT_TEMP)
+	@echo	"export	GCCROOT=$(STAGING_DIR)/usr"			>>	$(GCC_SCRIPT_TEMP)
+	@echo	"export	PATH=\$$PATH:\$$GCCROOT/bin"			>>	$(GCC_SCRIPT_TEMP)
+	@echo	"export	CROSS_COMPILE=$(REAL_GNU_TARGET_NAME)-"		>>	$(GCC_SCRIPT_TEMP)
+	@cp	$(GCC_SCRIPT_TEMP) ~/$(GCC_SCRIPT)
+	@cat	~/$(GCC_SCRIPT)
+
+export-toolchain: ~/$(GCC_SCRIPT)
+
+export-toolchain-clean:
+	rm	-f ~/$(GCC_SCRIPT)
+	rm	-f $(GCC_SCRIPT_TEMP)
+
+ifeq ($(BR2_EXPORT_TOOLCHAIN),y)
+TARGETS+=export-toolchain
+endif
+

Modified: trunk/buildroot/toolchain/uClibc/Config.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in	2008-12-21 15:34:38 UTC (rev 24479)
+++ trunk/buildroot/toolchain/uClibc/Config.in	2008-12-21 17:11:33 UTC (rev 24480)
@@ -27,6 +27,12 @@
 
 endchoice
 
+config UCLIBC_VERSION
+	string
+	default "0.9.28.3"	if BR2_UCLIBC_VERSION_0_9_28_3
+	default "0.9.29"	if BR2_UCLIBC_VERSION_0_9_29
+	default "0.9.30"	if BR2_UCLIBC_VERSION_0_9_30
+	default "snapshot"	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_USE_UCLIBC_SNAPSHOT
 	string "Date (yyyymmdd) of snapshot or 'snapshot' for latest"
