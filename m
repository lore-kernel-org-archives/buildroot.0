From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 25 Sep 2007 22:36:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: target/device toolchain
	toolchain/binuti etc...
Message-ID: <20070926053612.C861DA60E7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-25 22:36:11 -0700 (Tue, 25 Sep 2007)
New Revision: 20030

Log:
reinstate AVR32 toolchain

Modified:
   trunk/buildroot/target/device/Toolchain.in
   trunk/buildroot/toolchain/Config.in
   trunk/buildroot/toolchain/binutils/binutils.mk
   trunk/buildroot/toolchain/external-toolchain/Config.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
   trunk/buildroot/toolchain/gdb/gdb.mk
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/target/device/Toolchain.in
===================================================================
--- trunk/buildroot/target/device/Toolchain.in	2007-09-25 22:04:39 UTC (rev 20029)
+++ trunk/buildroot/target/device/Toolchain.in	2007-09-26 05:36:11 UTC (rev 20030)
@@ -1,18 +1,30 @@
-if BR2_TOOLCHAIN_EXTERNAL_SOURCE
 choice
 	prompt "Source location:"
-#	default BR2_TOOLCHAIN_ATMEL_AVR32 if BR2_avr32
+	default BR2_TOOLCHAIN_NORMAL		if!BR2_avr32
+	default BR2_TOOLCHAIN_ATMEL_AVR32	if BR2_avr32
+	depends on BR2_TOOLCHAIN_BUILDROOT
 	help
 	  Select whether to use the toolchain built by the buildroot
 	  system or an external pre-built toolchain.
 
+config BR2_TOOLCHAIN_NORMAL
+	bool
+	prompt "Use default sources for toolchain"
+	depends on !BR2_avr32
+	help
+	  Download vanilla binutils, gcc, uclibc and gdb from their 
+	  main download locations, and apply patches from the
+	  "toolchain/<package>" directores.
+	  I.E: Do not download a prepatched vendor source suite.
+
 config BR2_TOOLCHAIN_ATMEL_AVR32
-	bool "Use prepatched source for AVR32 toolchain"
+	bool
+	prompt "Use prepatched source for AVR32 toolchain"
 	depends on BR2_avr32
-#	depends on BR2_GCC_VERSION_4_1_2
-#	depends on BR2_GDB_VERSION_6_4 || !BR2_PACKAGE_GDB
-#	depends on BR2_BINUTILS_VERSION_2_17
-#	depends on BR2_UCLIBC_VERSION_0_9_28_3
+	depends on BR2_GCC_VERSION_4_1_2
+	depends on BR2_GDB_VERSION_6_4 || !BR2_PACKAGE_GDB
+	depends on BR2_BINUTILS_VERSION_2_17
+	depends on BR2_UCLIBC_VERSION_0_9_28_3
 
 endchoice
 
@@ -43,4 +55,3 @@
 config BR2_VENDOR_PATCH_DIR
 	string
 	default "target/device/Atmel/toolchain/avr32" if BR2_TOOLCHAIN_ATMEL_AVR32
-endif

Modified: trunk/buildroot/toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/Config.in	2007-09-25 22:04:39 UTC (rev 20029)
+++ trunk/buildroot/toolchain/Config.in	2007-09-26 05:36:11 UTC (rev 20030)
@@ -3,28 +3,16 @@
 	prompt "Toolchain type"
 	default BR2_TOOLCHAIN_BUILDROOT
 	help
-	  Select whether to use the toolchain provided by buildroot
-	  or an external toolchain.
+	  Select whether to use the toolchain built by the buildroot
+	  system or an external pre-built toolchain.
 
-	  Some vendors provide toolchains in binary form, some in
-	  source form.
-
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
-	depends on !BR2_avr32
 
 config BR2_TOOLCHAIN_EXTERNAL
-	bool "External binary toolchain"
-
-config BR2_TOOLCHAIN_EXTERNAL_SOURCE
-	bool "External source toolchain"
+	bool "External toolchain"
 endchoice
 
-config BR2_TOOLCHAIN_SOURCE
-	bool
-	default y if BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_EXTERNAL_SOURCE
-	default n if BR2_TOOLCHAIN_EXTERNAL
-
 source "target/device/Toolchain.in"
 
 source "toolchain/Config.in.2"

Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2007-09-25 22:04:39 UTC (rev 20029)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2007-09-26 05:36:11 UTC (rev 20030)
@@ -65,13 +65,13 @@
 BINUTILS_TARGET_CONFIG_OPTIONS+=--with-mpfr="$(MPFR_TARGET_DIR)"
 endif
 
-ifeq ($(BR2_TOOLCHAIN_SOURCE),)
+ifeq ($(BR2_TOOLCHAIN_NORMAL),)
 BINUTILS_SITE:=$(VENDOR_SITE)
 endif
 
 BINUTILS_OFFICIAL_VERSION:=$(BINUTILS_VERSION)$(VENDOR_SUFFIX)$(VENDOR_BINUTILS_RELEASE)
 
-ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
+ifeq ($(BR2_TOOLCHAIN_NORMAL),y)
 BINUTILS_PATCH_DIR:=toolchain/binutils/$(BINUTILS_VERSION)
 else
 BINUTILS_PATCH_DIR:=$(VENDOR_PATCH_DIR)/binutils-$(BINUTILS_OFFICIAL_VERSION)

Modified: trunk/buildroot/toolchain/external-toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/external-toolchain/Config.in	2007-09-25 22:04:39 UTC (rev 20029)
+++ trunk/buildroot/toolchain/external-toolchain/Config.in	2007-09-26 05:36:11 UTC (rev 20030)
@@ -1,9 +1,8 @@
 #
 
-if BR2_TOOLCHAIN_EXTERNAL
-comment "External Toolchain Options"
+menu "External Toolchain Options"
+       depends on BR2_TOOLCHAIN_EXTERNAL
 
-
 config BR2_TOOLCHAIN_EXTERNAL_LIB_C
 	string "The core C library from the external toolchain"
 	default "libc.so.6"
@@ -105,4 +104,4 @@
 	help
 	  Optimizations to use when building for the target host.
 
-endif
+endmenu

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-25 22:04:39 UTC (rev 20029)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-26 05:36:11 UTC (rev 20030)
@@ -33,7 +33,7 @@
 
 
 # redefine if using an external prepatched gcc source
-ifeq ($(BR2_TOOLCHAIN_SOURCE),)
+ifeq ($(BR2_TOOLCHAIN_NORMAL),)
 GCC_SITE:=$(VENDOR_SITE)
 GCC_OFFICIAL_VER:=$(GCC_VERSION)$(VENDOR_SUFFIX)$(VENDOR_GCC_RELEASE)
 endif
@@ -41,7 +41,7 @@
 GCC_SOURCE:=gcc-$(GCC_OFFICIAL_VER).tar.bz2
 GCC_DIR:=$(TOOL_BUILD_DIR)/gcc-$(GCC_OFFICIAL_VER)
 
-ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
+ifeq ($(BR2_TOOLCHAIN_NORMAL),y)
 ifeq ($(GCC_SNAP_DATE),)
 GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
 else

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-09-25 22:04:39 UTC (rev 20029)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-09-26 05:36:11 UTC (rev 20030)
@@ -30,13 +30,13 @@
 endif
 
 # redefine if using an external prepatched gcc source
-ifeq ($(BR2_TOOLCHAIN_SOURCE),)
+ifeq ($(BR2_TOOLCHAIN_NORMAL),)
 GCC_SITE:=$(VENDOR_SITE)
 GCC_OFFICIAL_VER:=$(GCC_VERSION)$(VENDOR_SUFFIX)$(VENDOR_GCC_RELEASE)
 endif
 
 # define patch location
-ifeq ($(BR2_TOOLCHAIN_SOURCE),y) # Normal toolchain
+ifeq ($(BR2_TOOLCHAIN_NORMAL),y) # Normal toolchain
 ifeq ($(GCC_SNAP_DATE),) # Not a snapshot
 GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
 else # Is a snapshot

Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2007-09-25 22:04:39 UTC (rev 20029)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2007-09-26 05:36:11 UTC (rev 20030)
@@ -20,7 +20,7 @@
 GDB_PATCH_DIR:=toolchain/gdb/$(GDB_VERSION)
 else
 
-ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
+ifeq ($(BR2_TOOLCHAIN_NORMAL),y)
 GDB_SITE:=http://ftp.gnu.org/gnu/gdb
 else
 GDB_SITE:=$(VENDOR_SITE)
@@ -31,7 +31,7 @@
 GDB_SOURCE:=gdb-$(GDB_OFFICIAL_VERSION).tar.bz2
 GDB_CAT:=$(BZCAT)
 
-ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
+ifeq ($(BR2_TOOLCHAIN_NORMAL),y)
 GDB_PATCH_DIR:=toolchain/gdb/$(GDB_OFFICIAL_VERSION)
 else
 GDB_PATCH_DIR:=$(VENDOR_PATCH_DIR)/gdb-$(GDB_OFFICIAL_VERSION)

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-25 22:04:39 UTC (rev 20029)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-26 05:36:11 UTC (rev 20030)
@@ -34,14 +34,14 @@
 endif
 UCLIBC_SITE:=http://www.uclibc.org/downloads
 
-ifeq ($(BR2_TOOLCHAIN_SOURCE),)
+ifeq ($(BR2_TOOLCHAIN_NORMAL),)
 UCLIBC_SITE:=$(VENDOR_SITE)
 endif
 
 UCLIBC_OFFICIAL_VERSION:=$(UCLIBC_VER)$(VENDOR_SUFFIX)$(VENDOR_UCLIBC_RELEASE)
 
 
-ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
+ifeq ($(BR2_TOOLCHAIN_NORMAL),y)
 UCLIBC_PATCH_DIR:=toolchain/uClibc/
 else
 UCLIBC_PATCH_DIR:=$(VENDOR_PATCH_DIR)/uClibc-$(UCLIBC_OFFICIAL_VERSION)
