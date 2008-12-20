From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 20 Dec 2008 22:27:56 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot: target/device
	toolchain/gcc/ext_source/A etc...
Message-ID: <20081220222756.9A82176CEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-12-20 22:27:56 +0000 (Sat, 20 Dec 2008)
New Revision: 24473

Log:
Add updated gcc-4.2.2 prepatched toolchain for AVR32

Added:
   trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-1.1.3/

Modified:
   trunk/buildroot/target/device/Config.in.toolchain
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:
Modified: trunk/buildroot/target/device/Config.in.toolchain
===================================================================
--- trunk/buildroot/target/device/Config.in.toolchain	2008-12-20 22:26:24 UTC (rev 24472)
+++ trunk/buildroot/target/device/Config.in.toolchain	2008-12-20 22:27:56 UTC (rev 24473)
@@ -51,6 +51,23 @@
 	  It is generated from buildroot-avr32-v2.2.0-rc4
 	  in http://www.atmel.no/buildroot
 
+config BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2_REV_2
+	bool "Use prepatched source for AVR32 gcc-4.2.2 toolchain"
+	depends on BR2_avr32
+	select BR2_EXT_GCC_VERSION_4_2_2
+	select BR2_EXT_BINUTILS_VERSION_2_18
+	select BR2_EXT_UCLIBC_VERSION_0_9_29
+	select BR2_TOOLCHAIN_ATMEL_AVR32
+	select BR2_GCC_SUPPORTS_SYSROOT
+	help
+	  The gcc-4.2.2 toolchain for the AVR32
+	  * gcc-4.2.2
+	  * binutils-2.18
+	  * uClibc-0.9.29
+	  * gdb-6.7.1
+	  It is generated from buildroot-avr32-v2.3.0-rc1
+	  in http://www.atmel.no/buildroot
+
 config BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3
 	bool "Use prepatched source for AVR32 gcc-4.2.3 toolchain"
 	depends on BR2_avr32
@@ -94,6 +111,7 @@
 	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32_4_1_2
 	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1
 	default "-2.1.5" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2
+	default "-1.0.1" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2_REV_2
 	default "-2.1.5" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3
 
 config BR2_VENDOR_GCC_RELEASE
@@ -101,6 +119,7 @@
 	default "-2.0" if BR2_TOOLCHAIN_ATMEL_AVR32_4_1_2
 	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1
 	default "-2.1.5" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2
+	default "-1.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2_REV_2
 	default "-2.1.5" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3
 
 config BR2_VENDOR_UCLIBC_RELEASE
@@ -108,6 +127,7 @@
 	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32_4_1_2
 	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1
 	default "-2.1.5" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2
+	default "-2.1.5" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2_REV_2
 	default "-2.1.5" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3
 
 config BR2_VENDOR_GDB_RELEASE
@@ -174,6 +194,10 @@
 	bool
 	default !BR2_TOOLCHAIN_EXTERNAL_SOURCE
 
+config	BR2_EXT_BINUTILS_VERSION_2_18
+	bool
+	default !BR2_TOOLCHAIN_EXTERNAL_SOURCE
+
 config	BR2_EXT_UCLIBC_VERSION_0_9_28_3
 	bool
 	default !BR2_TOOLCHAIN_EXTERNAL_SOURCE

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2008-12-20 22:26:24 UTC (rev 24472)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile	2008-12-20 22:27:56 UTC (rev 24473)
@@ -77,6 +77,8 @@
 	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) package/openswan \
 		linux-$(LINUX_HEADERS_VERSION)-\*.patch{,.gz,.bz2}
 endif
+	toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) toolchain/kernel-headers/arch/$(ARCH)/linux-$(LINUX_HEADERS_VERSION) \
+		linux-\*.patch{,.gz,.bz2}
 	touch $@
 
 $(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_UNPACK_DIR)/.patched
