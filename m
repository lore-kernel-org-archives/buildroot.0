From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 25 Sep 2007 01:18:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: target/device toolchain
	toolchain/binuti etc...
Message-ID: <20070925081837.36781300F5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-25 01:18:36 -0700 (Tue, 25 Sep 2007)
New Revision: 20003

Log:
- remove one invariant in toolchain type selection.


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
--- trunk/buildroot/target/device/Toolchain.in	2007-09-25 08:01:15 UTC (rev 20002)
+++ trunk/buildroot/target/device/Toolchain.in	2007-09-25 08:18:36 UTC (rev 20003)
@@ -1,21 +1,11 @@
+if BR2_TOOLCHAIN_EXTERNAL_SOURCE
 choice
 	prompt "Source location:"
-	default BR2_TOOLCHAIN_NORMAL		if!BR2_avr32
 	default BR2_TOOLCHAIN_ATMEL_AVR32	if BR2_avr32
-	depends on BR2_TOOLCHAIN_BUILDROOT
 	help
 	  Select whether to use the toolchain built by the buildroot
 	  system or an external pre-built toolchain.
 
-config BR2_TOOLCHAIN_NORMAL
-	bool "Use default sources for toolchain"
-	depends on !BR2_avr32
-	help
-	  Download vanilla binutils, gcc, uclibc and gdb from their 
-	  main download locations, and apply patches from the
-	  "toolchain/<package>" directores.
-	  I.E: Do not download a prepatched vendor source suite.
-
 config BR2_TOOLCHAIN_ATMEL_AVR32
 	bool "Use prepatched source for AVR32 toolchain"
 	depends on BR2_avr32
@@ -53,3 +43,4 @@
 config BR2_VENDOR_PATCH_DIR
 	string
 	default "target/device/Atmel/toolchain/avr32" if BR2_TOOLCHAIN_ATMEL_AVR32
+endif

Modified: trunk/buildroot/toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/Config.in	2007-09-25 08:01:15 UTC (rev 20002)
+++ trunk/buildroot/toolchain/Config.in	2007-09-25 08:18:36 UTC (rev 20003)
@@ -3,16 +3,25 @@
 	prompt "Toolchain type"
 	default BR2_TOOLCHAIN_BUILDROOT
 	help
-	  Select whether to use the toolchain built by the buildroot
-	  system or an external pre-built toolchain.
+	  Select whether to use the toolchain provided by buildroot
+	  or an external toolchain.
 
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
+	depends on !BR2_avr32
 
 config BR2_TOOLCHAIN_EXTERNAL
-	bool "External toolchain"
+	bool "External binary toolchain"
+
+config BR2_TOOLCHAIN_EXTERNAL_SOURCE
+	bool "External source toolchain"
 endchoice
 
+config BR2_TOOLCHAIN_SOURCE
+	bool
+	default y if !BR2_TOOLCHAIN_EXTERNAL
+	default n if BR2_TOOLCHAIN_EXTERNAL
+
 source "target/device/Toolchain.in"
 
 source "toolchain/Config.in.2"

Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2007-09-25 08:01:15 UTC (rev 20002)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2007-09-25 08:18:36 UTC (rev 20003)
@@ -65,13 +65,13 @@
 BINUTILS_TARGET_CONFIG_OPTIONS+=--with-mpfr="$(MPFR_TARGET_DIR)"
 endif
 
-ifeq ($(BR2_TOOLCHAIN_NORMAL),)
+ifeq ($(BR2_TOOLCHAIN_SOURCE),)
 BINUTILS_SITE:=$(VENDOR_SITE)
 endif
 
 BINUTILS_OFFICIAL_VERSION:=$(BINUTILS_VERSION)$(VENDOR_SUFFIX)$(VENDOR_BINUTILS_RELEASE)
 
-ifeq ($(BR2_TOOLCHAIN_NORMAL),y)
+ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 BINUTILS_PATCH_DIR:=toolchain/binutils/$(BINUTILS_VERSION)
 else
 BINUTILS_PATCH_DIR:=$(VENDOR_PATCH_DIR)/binutils-$(BINUTILS_OFFICIAL_VERSION)

Modified: trunk/buildroot/toolchain/external-toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/external-toolchain/Config.in	2007-09-25 08:01:15 UTC (rev 20002)
+++ trunk/buildroot/toolchain/external-toolchain/Config.in	2007-09-25 08:18:36 UTC (rev 20003)
@@ -1,8 +1,9 @@
 #
 
-menu "External Toolchain Options"
-	depends on BR2_TOOLCHAIN_EXTERNAL
+if BR2_TOOLCHAIN_EXTERNAL
+comment "External Toolchain Options"
 
+
 config BR2_TOOLCHAIN_EXTERNAL_LIB_C
 	string "The core C library from the external toolchain"
 	default "libc.so.6"
@@ -104,4 +105,4 @@
 	help
 	  Optimizations to use when building for the target host.
 
-endmenu
+endif

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-25 08:01:15 UTC (rev 20002)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-09-25 08:18:36 UTC (rev 20003)
@@ -33,7 +33,7 @@
 
 
 # redefine if using an external prepatched gcc source
-ifeq ($(BR2_TOOLCHAIN_NORMAL),)
+ifeq ($(BR2_TOOLCHAIN_SOURCE),)
 GCC_SITE:=$(VENDOR_SITE)
 GCC_OFFICIAL_VER:=$(GCC_VERSION)$(VENDOR_SUFFIX)$(VENDOR_GCC_RELEASE)
 endif
@@ -41,7 +41,7 @@
 GCC_SOURCE:=gcc-$(GCC_OFFICIAL_VER).tar.bz2
 GCC_DIR:=$(TOOL_BUILD_DIR)/gcc-$(GCC_OFFICIAL_VER)
 
-ifeq ($(BR2_TOOLCHAIN_NORMAL),y)
+ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 ifeq ($(GCC_SNAP_DATE),)
 GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
 else

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-09-25 08:01:15 UTC (rev 20002)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2007-09-25 08:18:36 UTC (rev 20003)
@@ -30,13 +30,13 @@
 endif
 
 # redefine if using an external prepatched gcc source
-ifeq ($(BR2_TOOLCHAIN_NORMAL),)
+ifeq ($(BR2_TOOLCHAIN_SOURCE),)
 GCC_SITE:=$(VENDOR_SITE)
 GCC_OFFICIAL_VER:=$(GCC_VERSION)$(VENDOR_SUFFIX)$(VENDOR_GCC_RELEASE)
 endif
 
 # define patch location
-ifeq ($(BR2_TOOLCHAIN_NORMAL),y) # Normal toolchain
+ifeq ($(BR2_TOOLCHAIN_SOURCE),y) # Normal toolchain
 ifeq ($(GCC_SNAP_DATE),) # Not a snapshot
 GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
 else # Is a snapshot

Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2007-09-25 08:01:15 UTC (rev 20002)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2007-09-25 08:18:36 UTC (rev 20003)
@@ -20,7 +20,7 @@
 GDB_PATCH_DIR:=toolchain/gdb/$(GDB_VERSION)
 else
 
-ifeq ($(BR2_TOOLCHAIN_NORMAL),y)
+ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 GDB_SITE:=http://ftp.gnu.org/gnu/gdb
 else
 GDB_SITE:=$(VENDOR_SITE)
@@ -31,7 +31,7 @@
 GDB_SOURCE:=gdb-$(GDB_OFFICIAL_VERSION).tar.bz2
 GDB_CAT:=$(BZCAT)
 
-ifeq ($(BR2_TOOLCHAIN_NORMAL),y)
+ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 GDB_PATCH_DIR:=toolchain/gdb/$(GDB_OFFICIAL_VERSION)
 else
 GDB_PATCH_DIR:=$(VENDOR_PATCH_DIR)/gdb-$(GDB_OFFICIAL_VERSION)

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-25 08:01:15 UTC (rev 20002)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-25 08:18:36 UTC (rev 20003)
@@ -34,14 +34,14 @@
 endif
 UCLIBC_SITE:=http://www.uclibc.org/downloads
 
-ifeq ($(BR2_TOOLCHAIN_NORMAL),)
+ifeq ($(BR2_TOOLCHAIN_SOURCE),)
 UCLIBC_SITE:=$(VENDOR_SITE)
 endif
 
 UCLIBC_OFFICIAL_VERSION:=$(UCLIBC_VER)$(VENDOR_SUFFIX)$(VENDOR_UCLIBC_RELEASE)
 
 
-ifeq ($(BR2_TOOLCHAIN_NORMAL),y)
+ifeq ($(BR2_TOOLCHAIN_SOURCE),y)
 UCLIBC_PATCH_DIR:=toolchain/uClibc/
 else
 UCLIBC_PATCH_DIR:=$(VENDOR_PATCH_DIR)/uClibc-$(UCLIBC_OFFICIAL_VERSION)
