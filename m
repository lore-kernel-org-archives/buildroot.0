From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri,  4 Jul 2008 01:39:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: target/device
	target/device/Atmel/atngw etc...
Message-ID: <20080704083936.12D6E3C642@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-04 01:39:35 -0700 (Fri, 04 Jul 2008)
New Revision: 22624

Log:
Add prepatched AVR32 gcc-4.2.2 toolchain from www.atmel.no, move patch locations for prepatched toolchain to be under the toolchain directory

Added:
   trunk/buildroot/target/device/Atmel/toolchain/avr32/binutils-2.17-avr32-2.1.4/
   trunk/buildroot/toolchain/binutils/ext_source/
   trunk/buildroot/toolchain/binutils/ext_source/Atmel/
   trunk/buildroot/toolchain/binutils/ext_source/Atmel/avr32/
   trunk/buildroot/toolchain/binutils/ext_source/Atmel/avr32/2.17-avr32-2.0/
   trunk/buildroot/toolchain/binutils/ext_source/Atmel/avr32/2.17-avr32-2.1.3/
   trunk/buildroot/toolchain/binutils/ext_source/Atmel/avr32/2.17-avr32-2.1.5/
   trunk/buildroot/toolchain/gcc/ext_source/
   trunk/buildroot/toolchain/gcc/ext_source/Atmel/
   trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/
   trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.1.2-avr32-2.0/
   trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.1.2-avr32-2.2/
   trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.1-avr32-2.1.3/
   trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/
   trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.3-avr32-2.1.5/
   trunk/buildroot/toolchain/gdb/ext_source/
   trunk/buildroot/toolchain/gdb/ext_source/Atmel/
   trunk/buildroot/toolchain/gdb/ext_source/Atmel/avr32/
   trunk/buildroot/toolchain/gdb/ext_source/Atmel/avr32/6.4-avr32-2.0/
   trunk/buildroot/toolchain/gdb/ext_source/Atmel/avr32/6.4-avr32-2.1.3/
   trunk/buildroot/toolchain/gdb/ext_source/Atmel/avr32/6.7.1-avr32-2.1.5/
   trunk/buildroot/toolchain/uClibc/ext_source/
   trunk/buildroot/toolchain/uClibc/ext_source/Atmel/
   trunk/buildroot/toolchain/uClibc/ext_source/Atmel/avr32/
   trunk/buildroot/toolchain/uClibc/ext_source/Atmel/avr32/0.9.28.3-avr32-2.0/
   trunk/buildroot/toolchain/uClibc/ext_source/Atmel/avr32/0.9.29-avr32-2.1.3/
   trunk/buildroot/toolchain/uClibc/ext_source/Atmel/avr32/0.9.29-avr32-2.1.5/

Removed:
   trunk/buildroot/target/device/Atmel/toolchain/avr32/binutils-2.17-avr32-2.0/
   trunk/buildroot/target/device/Atmel/toolchain/avr32/binutils-2.17-avr32-2.1.3/
   trunk/buildroot/target/device/Atmel/toolchain/avr32/gcc-4.1.2-avr32-2.2/
   trunk/buildroot/target/device/Atmel/toolchain/avr32/gcc-4.2.1-avr32-2.1.3/
   trunk/buildroot/target/device/Atmel/toolchain/avr32/gdb-6.4-avr32-2.0/
   trunk/buildroot/target/device/Atmel/toolchain/avr32/gdb-6.4-avr32-2.1.3/
   trunk/buildroot/target/device/Atmel/toolchain/avr32/uClibc-0.9.28.3-avr32-2.0/
   trunk/buildroot/target/device/Atmel/toolchain/avr32/uClibc-0.9.29-avr32-2.1.3/

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/target/device/Atmel/atngw100/atngw100-linux-2.6.24.config
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
   trunk/buildroot/target/device/Config.in.toolchain
   trunk/buildroot/toolchain/Makefile.in
   trunk/buildroot/toolchain/binutils/binutils.mk
   trunk/buildroot/toolchain/gcc/Config.in
   trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
   trunk/buildroot/toolchain/gdb/Config.in
   trunk/buildroot/toolchain/gdb/gdb.mk
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2008-07-04 03:49:18 UTC (rev 22623)
+++ trunk/buildroot/Makefile	2008-07-04 08:39:35 UTC (rev 22624)
@@ -473,6 +473,8 @@
 
 configured: dirs host-sed kernel-headers uclibc-config busybox-config linux26-config
 
+prepatch:	gcc-patched binutils-patched gdb-patched uclibc-patched
+
 cross: $(BASE_TARGETS)
 
 help:

Modified: trunk/buildroot/target/device/Atmel/atngw100/atngw100-linux-2.6.24.config
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/atngw100-linux-2.6.24.config	2008-07-04 03:49:18 UTC (rev 22623)
+++ trunk/buildroot/target/device/Atmel/atngw100/atngw100-linux-2.6.24.config	2008-07-04 08:39:35 UTC (rev 22624)
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Linux kernel version: 2.6.24-rc7
-# Wed Jan  9 23:20:41 2008
+# Linux kernel version: 2.6.24
+# Thu Jul  3 22:38:28 2008
 #
 CONFIG_AVR32=y
 CONFIG_GENERIC_GPIO=y
@@ -113,6 +113,7 @@
 CONFIG_CPU_AT32AP7000=y
 # CONFIG_BOARD_ATSTK1000 is not set
 CONFIG_BOARD_ATNGW100=y
+# CONFIG_BOARD_ATNGW100_I2C_GPIO is not set
 CONFIG_LOADER_U_BOOT=y
 
 #
@@ -121,6 +122,7 @@
 # CONFIG_AP700X_32_BIT_SMC is not set
 CONFIG_AP700X_16_BIT_SMC=y
 # CONFIG_AP700X_8_BIT_SMC is not set
+# CONFIG_GPIO_DEV is not set
 CONFIG_LOAD_ADDRESS=0x10000000
 CONFIG_ENTRY_ADDRESS=0x90000000
 CONFIG_PHYS_OFFSET=0x10000000
@@ -146,6 +148,8 @@
 CONFIG_ZONE_DMA_FLAG=0
 CONFIG_VIRT_TO_BUS=y
 # CONFIG_OWNERSHIP_TRACE is not set
+# CONFIG_NMI_DEBUGGING is not set
+CONFIG_DW_DMAC=y
 # CONFIG_HZ_100 is not set
 CONFIG_HZ_250=y
 # CONFIG_HZ_300 is not set
@@ -659,6 +663,7 @@
 #
 # I2C Hardware Bus support
 #
+# CONFIG_I2C_ATMELTWI is not set
 CONFIG_I2C_GPIO=m
 # CONFIG_I2C_OCORES is not set
 # CONFIG_I2C_PARPORT_LIGHT is not set
@@ -801,6 +806,7 @@
 #
 # MMC/SD Host Controller Drivers
 #
+# CONFIG_MMC_ATMELMCI is not set
 CONFIG_MMC_SPI=m
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y

Modified: trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2008-07-04 03:49:18 UTC (rev 22623)
+++ trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2008-07-04 08:39:35 UTC (rev 22624)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Wed Jul  2 05:02:43 2008
+# Fri Jul  4 07:58:19 2008
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -86,6 +86,8 @@
 #
 BR2_TARGET_ATMEL_COPYTO=""
 BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"
+BR2_KERNEL_ARCH_PATCH_VERSION="2.6.24"
+BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-avr32/kernel-patches-$(BR2_KERNEL_ARCH_PATCH_VERSION)"
 # BR2_TARGET_VALKA is not set
 
 #
@@ -160,18 +162,20 @@
 BR2_TOOLCHAIN_EXTERNAL_SOURCE=y
 BR2_TOOLCHAIN_SOURCE=y
 # BR2_TOOLCHAIN_ATMEL_AVR32_4_1_2 is not set
-BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1=y
+# BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1 is not set
+BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2=y
+# BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3_ENABLE is not set
+# BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3 is not set
 # BR2_TOOLCHAIN_UNKNOWNVENDOR is not set
 BR2_TOOLCHAIN_ATMEL_AVR32=y
 BR2_VENDOR_SITE="$(BR2_ATMEL_MIRROR)"
 BR2_VENDOR_SUFFIX="-avr32"
-BR2_VENDOR_BINUTILS_RELEASE="-2.1.3"
-BR2_VENDOR_GCC_RELEASE="-2.1.3"
-BR2_VENDOR_UCLIBC_RELEASE="-2.1.3"
-BR2_VENDOR_GDB_RELEASE="-2.1.3"
+BR2_VENDOR_GDB_RELEASE="-2.1.5"
 BR2_VENDOR_PATCH_DIR="target/device/Atmel/toolchain/avr32"
 # BR2_EXT_GCC_VERSION_4_1_2 is not set
-BR2_EXT_GCC_VERSION_4_2_1=y
+# BR2_EXT_GCC_VERSION_4_2_1 is not set
+BR2_EXT_GCC_VERSION_4_2_2=y
+# BR2_EXT_GCC_VERSION_4_2_3 is not set
 BR2_EXT_BINUTILS_VERSION_2_17=y
 BR2_EXT_UCLIBC_VERSION_0_9_29=y
 # BR2_EXT_UCLIBC_VERSION_0_9_28_3 is not set
@@ -230,13 +234,14 @@
 # BR2_GCC_VERSION_3_4_6 is not set
 # BR2_GCC_VERSION_4_0_4 is not set
 # BR2_GCC_VERSION_4_1_2 is not set
-BR2_GCC_VERSION_4_2_1=y
+# BR2_GCC_VERSION_4_2_1 is not set
+BR2_GCC_VERSION_4_2_2=y
 # BR2_GCC_VERSION_4_2_3 is not set
 # BR2_GCC_VERSION_4_2_4 is not set
 # BR2_GCC_VERSION_4_3_1 is not set
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
-BR2_GCC_VERSION="4.2.1"
+BR2_GCC_VERSION="4.2.2"
 BR2_TOOLCHAIN_SYSROOT=y
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
@@ -257,13 +262,13 @@
 BR2_PACKAGE_GDB_HOST=y
 # BR2_GDB_VERSION_6_2_1 is not set
 # BR2_GDB_VERSION_6_3 is not set
-BR2_GDB_VERSION_6_4=y
+# BR2_GDB_VERSION_6_4 is not set
 # BR2_GDB_VERSION_6_5 is not set
 # BR2_GDB_VERSION_6_6 is not set
-# BR2_GDB_VERSION_6_7_1 is not set
+BR2_GDB_VERSION_6_7_1=y
 # BR2_GDB_VERSION_6_8 is not set
 # BR2_GDB_VERSION_SNAPSHOT is not set
-BR2_GDB_VERSION="6.4"
+BR2_GDB_VERSION="6.7.1"
 
 #
 # Common Toolchain Options
@@ -659,13 +664,14 @@
 BR2_PACKAGE_LINUX=y
 BR2_PACKAGE_LINUX_KCONFIG="$(BR2_BOARD_PATH)/$(BR2_BOARD_NAME)-linux-2.6.24.config"
 BR2_PACKAGE_LINUX_FORMAT="uImage"
-BR2_KERNEL_CURRENT_VERSION="2.6.24.4"
+BR2_KERNEL_CURRENT_VERSION="2.6.25.9"
 BR2_KERNEL_NEXT_VERSION="2.6.25"
 BR2_KERNEL_THIS_VERSION="2.6.24"
 BR2_KERNEL_SITE="http://ftp.kernel.org/pub/linux/kernel/v2.6/"
 BR2_MM_PATCH_SITE="http://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6"
 BR2_RC_MM_PATCH_DIR="$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)/2.6.$(BR2_KERNEL_NEXT_VERSION)-rc$(BR2_KERNEL_RC_LEVEL)-mm$(BR2_KERNEL_MM_LEVEL)"
 # BR2_LINUX_2_6_STABLE is not set
+# BR2_LINUX_2_6_25 is not set
 BR2_LINUX_2_6_24=y
 # BR2_LINUX_2_6_23 is not set
 # BR2_LINUX_2_6_22_10 is not set
@@ -675,7 +681,8 @@
 # BR2_LINUX_2_6_21_5 is not set
 # BR2_LINUX_2_6_21 is not set
 # BR2_LINUX_2_6_20 is not set
-# BR2_LINUX_2_6_25 is not set
+# BR2_LINUX_2_6_26 is not set
+# BR2_LINUX_2_6_27 is not set
 # BR2_LINUX26_CUSTOM is not set
 
 #
@@ -684,8 +691,6 @@
 # BR2_KERNEL_ADD_KERNEL_ORG_PATCH is not set
 # BR2_KERNEL_ADD_PATCH is not set
 BR2_KERNEL_ARCH_PATCH_ENABLED=y
-BR2_KERNEL_ARCH_PATCH_VERSION="2.6.24"
-BR2_KERNEL_ARCH_PATCH_DIR="target/device/Atmel/arch-avr32/kernel-patches-$(BR2_KERNEL_ARCH_PATCH_VERSION)"
 BR2_ARCH_AVR32_2_6_24=y
 # BR2_ARCH_AVR32_2_6_23 is not set
 # BR2_ARCH_AVR32_2_6_22_10 is not set

Modified: trunk/buildroot/target/device/Config.in.toolchain
===================================================================
--- trunk/buildroot/target/device/Config.in.toolchain	2008-07-04 03:49:18 UTC (rev 22623)
+++ trunk/buildroot/target/device/Config.in.toolchain	2008-07-04 08:39:35 UTC (rev 22624)
@@ -1,7 +1,7 @@
 if BR2_TOOLCHAIN_EXTERNAL_SOURCE
 choice
 	prompt "Source location:"
-	default BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1 if BR2_avr32
+	default BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2 if BR2_avr32
 	help
 	  Select whether to use the toolchain built by the buildroot
 	  system or an external pre-built toolchain.
@@ -32,6 +32,43 @@
 	  This will not be able to build qtopia
 	  due to internal errors.
 
+config BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2
+	bool "Use prepatched source for AVR32 gcc-4.2.2 toolchain"
+	depends on BR2_avr32
+	select BR2_EXT_GCC_VERSION_4_2_2
+	select BR2_EXT_BINUTILS_VERSION_2_17
+	select BR2_EXT_UCLIBC_VERSION_0_9_29
+	select BR2_TOOLCHAIN_ATMEL_AVR32
+	help
+	  The gcc-4.2.2 toolchain for the AVR32
+	  * gcc-4.2.2
+	  * binutils-2.17
+	  * uClibc-0.9.29
+	  * gdb-6.7.1
+	  It is generated from buildroot-avr32-v2.2.0-rc4
+	  in http://www.atmel.no/buildroot
+
+config BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3_ENABLE
+	bool
+	default n
+
+config BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3
+	bool "Use prepatched source for AVR32 gcc-4.2.3 toolchain"
+	depends on BR2_avr32
+	depends on BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3_ENABLE
+	select BR2_EXT_GCC_VERSION_4_2_3
+	select BR2_EXT_BINUTILS_VERSION_2_17
+	select BR2_EXT_UCLIBC_VERSION_0_9_29
+	select BR2_TOOLCHAIN_ATMEL_AVR32
+	help
+	  The gcc-4.2.3 toolchain for the AVR32
+	  * gcc-4.2.3
+	  * binutils-2.17
+	  * uClibc-0.9.29
+	  * gdb-6.7.1
+	  It is generated from buildroot-avr32-v2.2.0-rc4
+	  in http://www.atmel.no/buildroot
+
 config BR2_TOOLCHAIN_UNKNOWNVENDOR
 	bool "Use prepatched source from unknown vendor"
 
@@ -52,24 +89,34 @@
 
 config BR2_VENDOR_BINUTILS_RELEASE
 	string
-	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32
+	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32_4_1_2
+	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1
+	default "-2.1.5" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2
+	default "-2.1.5" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3
 
 config BR2_VENDOR_GCC_RELEASE
 	string
 	default "-2.0" if BR2_TOOLCHAIN_ATMEL_AVR32_4_1_2
 	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1
+	default "-2.1.5" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2
+	default "-2.1.5" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3
 
 config BR2_VENDOR_UCLIBC_RELEASE
 	string
-	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32
+	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32_4_1_2
+	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1
+	default "-2.1.5" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2
+	default "-2.1.5" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3
 
 config BR2_VENDOR_GDB_RELEASE
 	string
-	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32
+	default "-2.1.3" if BR2_GDB_VERSION_6_4
+	default "-2.1.3" if BR2_GDB_VERSION_6_4
+	default "-2.1.5" if BR2_GDB_VERSION_6_7_1
 
 config BR2_VENDOR_PATCH_DIR
 	string
-	default "target/device/Atmel/toolchain/avr32" if BR2_TOOLCHAIN_ATMEL_AVR32
+	default "Atmel/avr32" if BR2_TOOLCHAIN_ATMEL_AVR32
 endif
 if BR2_TOOLCHAIN_UNKNOWNVENDOR
 config BR2_VENDOR_SITE
@@ -98,7 +145,7 @@
 
 config BR2_VENDOR_PATCH_DIR
 	string "local accumulated patchdir"
-	default "target/device/$(VENDOR)/toolchain/"
+	default "$(VENDOR)/$(ARCH)/"
 endif
 
 
@@ -115,6 +162,16 @@
 	default y if !BR2_TOOLCHAIN_EXTERNAL_SOURCE
 	default n if  BR2_TOOLCHAIN_EXTERNAL_SOURCE
 
+config	BR2_EXT_GCC_VERSION_4_2_2
+	bool
+	default y if !BR2_TOOLCHAIN_EXTERNAL_SOURCE
+	default n if  BR2_TOOLCHAIN_EXTERNAL_SOURCE
+
+config	BR2_EXT_GCC_VERSION_4_2_3
+	bool
+	default y if !BR2_TOOLCHAIN_EXTERNAL_SOURCE
+	default n if  BR2_TOOLCHAIN_EXTERNAL_SOURCE
+
 config	BR2_EXT_BINUTILS_VERSION_2_17
 	bool
 	default y if !BR2_TOOLCHAIN_EXTERNAL_SOURCE

Modified: trunk/buildroot/toolchain/Makefile.in
===================================================================
--- trunk/buildroot/toolchain/Makefile.in	2008-07-04 03:49:18 UTC (rev 22623)
+++ trunk/buildroot/toolchain/Makefile.in	2008-07-04 08:39:35 UTC (rev 22624)
@@ -46,3 +46,4 @@
 
 # gcc has a bunch of needed stuff....
 include toolchain/gcc/Makefile.in
+

Modified: trunk/buildroot/toolchain/binutils/binutils.mk
===================================================================
--- trunk/buildroot/toolchain/binutils/binutils.mk	2008-07-04 03:49:18 UTC (rev 22623)
+++ trunk/buildroot/toolchain/binutils/binutils.mk	2008-07-04 08:39:35 UTC (rev 22624)
@@ -70,7 +70,7 @@
 BINUTILS_PATCH_DIR:=toolchain/binutils/$(BINUTILS_VERSION)
 else # ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SOURCE),)
 BINUTILS_SITE:=$(VENDOR_SITE)
-BINUTILS_PATCH_DIR:=$(VENDOR_PATCH_DIR)/binutils-$(BINUTILS_OFFICIAL_VERSION)
+BINUTILS_PATCH_DIR:=toolchain/binutils/ext_source/$(VENDOR_PATCH_DIR)/$(BINUTILS_OFFICIAL_VERSION)
 endif
 
 BINUTILS_SOURCE:=binutils-$(BINUTILS_OFFICIAL_VERSION).tar.bz2
@@ -91,6 +91,7 @@
 	$(CONFIG_UPDATE) $(BINUTILS_DIR)
 	touch $@
 
+binutils-patched: $(BINUTILS_DIR)/.patched
 $(BINUTILS_DIR)/.patched: $(BINUTILS_DIR)/.unpacked
 	# Apply appropriate binutils patches.
 	toolchain/patch-kernel.sh $(BINUTILS_DIR) $(BINUTILS_PATCH_DIR) \*.patch

Copied: trunk/buildroot/toolchain/binutils/ext_source/Atmel/avr32/2.17-avr32-2.0 (from rev 22623, trunk/buildroot/target/device/Atmel/toolchain/avr32/binutils-2.17-avr32-2.0)

Copied: trunk/buildroot/toolchain/binutils/ext_source/Atmel/avr32/2.17-avr32-2.1.3 (from rev 22623, trunk/buildroot/target/device/Atmel/toolchain/avr32/binutils-2.17-avr32-2.1.3)

Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2008-07-04 03:49:18 UTC (rev 22623)
+++ trunk/buildroot/toolchain/gcc/Config.in	2008-07-04 08:39:35 UTC (rev 22624)
@@ -5,7 +5,7 @@
 choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_4_2_4 if !BR2_avr32
-	default BR2_GCC_VERSION_4_1_2 if BR2_avr32
+	default BR2_GCC_VERSION_4_2_3 if BR2_avr32
 	help
 	  Select the version of gcc you wish to use.
 
@@ -29,9 +29,14 @@
 		depends on BR2_EXT_GCC_VERSION_4_2_1
 		bool "gcc 4.2.1"
 
+	config BR2_GCC_VERSION_4_2_2
+		depends on BR2_avr32
+		depends on BR2_EXT_GCC_VERSION_4_2_2
+		bool "gcc 4.2.2"
+
 	config BR2_GCC_VERSION_4_2_3
-		depends on !BR2_avr32 && !BR2_nios2
-		depends on BR2_DEPRECATED
+		depends on !BR2_nios2
+		depends on BR2_EXT_GCC_VERSION_4_2_3 || BR2_DEPRECATED
 		bool "gcc 4.2.3"
 
 	config BR2_GCC_VERSION_4_2_4
@@ -60,8 +65,8 @@
 
 config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 	bool
-	default n if BR2_GCC_VERSION_3_4_6 || BR2_GCC_VERSION_4_0_4 || BR2_GCC_VERSION_4_1_2 || BR2_GCC_VERSION_4_2_1 || BR2_GCC_VERSION_4_2_3 || BR2_GCC_VERSION_4_2_4
-	default y if !BR2_GCC_VERSION_3_4_6 && !BR2_GCC_VERSION_4_0_4 && !BR2_GCC_VERSION_4_1_2 && !BR2_GCC_VERSION_4_2_1 && !BR2_GCC_VERSION_4_2_3 && !BR2_GCC_VERSION_4_2_4
+	default n if BR2_GCC_VERSION_3_4_6 || BR2_GCC_VERSION_4_0_4 || BR2_GCC_VERSION_4_1_2 || BR2_GCC_VERSION_4_2_1 || BR2_GCC_VERSION_4_2_2 || BR2_GCC_VERSION_4_2_3 || BR2_GCC_VERSION_4_2_4
+	default y if !BR2_GCC_VERSION_3_4_6 && !BR2_GCC_VERSION_4_0_4 && !BR2_GCC_VERSION_4_1_2 && !BR2_GCC_VERSION_4_2_1 && !BR2_GCC_VERSION_4_2_2 && !BR2_GCC_VERSION_4_2_3 && !BR2_GCC_VERSION_4_2_4
 
 config BR2_GCC_SNAP_DATE
 	string "GCC snapshot date"
@@ -77,6 +82,7 @@
 	default "4.0.4"     if BR2_GCC_VERSION_4_0_4
 	default "4.1.2"     if BR2_GCC_VERSION_4_1_2
 	default "4.2.1"     if BR2_GCC_VERSION_4_2_1
+	default "4.2.2"     if BR2_GCC_VERSION_4_2_2
 	default "4.2.3"     if BR2_GCC_VERSION_4_2_3
 	default "4.2.4"     if BR2_GCC_VERSION_4_2_4
 	default "4.3.1"     if BR2_GCC_VERSION_4_3_1

Copied: trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.1.2-avr32-2.0 (from rev 22623, trunk/buildroot/target/device/Atmel/toolchain/avr32/gcc-4.1.2-avr32-2.0)

Copied: trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.1.2-avr32-2.2 (from rev 22623, trunk/buildroot/target/device/Atmel/toolchain/avr32/gcc-4.1.2-avr32-2.2)

Copied: trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.1-avr32-2.1.3 (from rev 22623, trunk/buildroot/target/device/Atmel/toolchain/avr32/gcc-4.2.1-avr32-2.1.3)

Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2008-07-04 03:49:18 UTC (rev 22623)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-4.x.mk	2008-07-04 08:39:35 UTC (rev 22624)
@@ -21,19 +21,19 @@
 ifeq ($(BR2_TOOLCHAIN_SYSROOT),y)
 
 ifeq ($(GCC_SNAP_DATE),)
-GCC_OFFICIAL_VER:=$(GCC_VERSION)
+GCC_OFFICIAL_VERSION:=$(GCC_VERSION)
 GCC_SITE:=$(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_VERSION)
-#GCC_SITE:=ftp://ftp.ibiblio.org/pub/mirrors/gnu/ftp/gnu/gcc/gcc-$(GCC_OFFICIAL_VER)
+#GCC_SITE:=ftp://ftp.ibiblio.org/pub/mirrors/gnu/ftp/gnu/gcc/gcc-$(GCC_OFFICIAL_VERSION)
 else
-GCC_OFFICIAL_VER:=$(GCC_VERSION)-$(GCC_SNAP_DATE)
-GCC_SITE:=ftp://sources.redhat.com/pub/gcc/snapshots/$(GCC_OFFICIAL_VER)
+GCC_OFFICIAL_VERSION:=$(GCC_VERSION)-$(GCC_SNAP_DATE)
+GCC_SITE:=ftp://sources.redhat.com/pub/gcc/snapshots/$(GCC_OFFICIAL_VERSION)
 endif
 
 # redefine if using an external prepatched gcc source
 ifneq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 GCC_SITE:=$(VENDOR_SITE)
-GCC_OFFICIAL_VER:=$(GCC_VERSION)$(VENDOR_SUFFIX)$(VENDOR_GCC_RELEASE)
-GCC_PATCH_DIR:=$(VENDOR_PATCH_DIR)/gcc-$(GCC_OFFICIAL_VER)
+GCC_OFFICIAL_VERSION:=$(GCC_VERSION)$(VENDOR_SUFFIX)$(VENDOR_GCC_RELEASE)
+GCC_PATCH_DIR:=toolchain/gcc/ext_source/$(VENDOR_PATCH_DIR)/$(GCC_OFFICIAL_VERSION)
 endif #!BR2_TOOLCHAIN_BUILDROOT
 
 # define patch location
@@ -41,8 +41,8 @@
 ifeq ($(GCC_SNAP_DATE),) # Not a snapshot
 GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
 else # Is a snapshot
-ifneq ($(wildcard toolchain/gcc/$(GCC_OFFICIAL_VER)),) # Snapshot patch?
-GCC_PATCH_DIR:=toolchain/gcc/$(GCC_OFFICIAL_VER)
+ifneq ($(wildcard toolchain/gcc/$(GCC_OFFICIAL_VERSION)),) # Snapshot patch?
+GCC_PATCH_DIR:=toolchain/gcc/$(GCC_OFFICIAL_VERSION)
 else # Normal patch to snapshot
 # Use the normal location, if the dedicated location does not exist
 GCC_PATCH_DIR:=toolchain/gcc/$(GCC_VERSION)
@@ -50,8 +50,8 @@
 endif # Not a snapshot
 endif # BR2_TOOLCHAIN_BUILDROOT
 
-GCC_SOURCE:=gcc-$(GCC_OFFICIAL_VER).tar.bz2
-GCC_DIR:=$(TOOL_BUILD_DIR)/gcc-$(GCC_OFFICIAL_VER)
+GCC_SOURCE:=gcc-$(GCC_OFFICIAL_VERSION).tar.bz2
+GCC_DIR:=$(TOOL_BUILD_DIR)/gcc-$(GCC_OFFICIAL_VERSION)
 GCC_CAT:=$(BZCAT)
 GCC_STRIP_HOST_BINARIES:=nope
 GCC_SRC_DIR:=$(GCC_DIR)

Modified: trunk/buildroot/toolchain/gdb/Config.in
===================================================================
--- trunk/buildroot/toolchain/gdb/Config.in	2008-07-04 03:49:18 UTC (rev 22623)
+++ trunk/buildroot/toolchain/gdb/Config.in	2008-07-04 08:39:35 UTC (rev 22624)
@@ -23,7 +23,7 @@
 choice
 	prompt "GDB debugger Version"
 	default BR2_GDB_VERSION_6_6 if !BR2_avr32
-	default BR2_GDB_VERSION_6_4 if BR2_avr32
+	default BR2_GDB_VERSION_6_7_1 if BR2_avr32
 	depends on BR2_PACKAGE_GDB || BR2_PACKAGE_GDB_SERVER || BR2_PACKAGE_GDB_HOST
 	help
 	  Select the version of gdb you wish to use.
@@ -50,7 +50,6 @@
 
 	config BR2_GDB_VERSION_6_7_1
 		bool "gdb 6.7.1"
-		depends on !BR2_avr32
 
 	config BR2_GDB_VERSION_6_8
 		bool "gdb 6.8"

Copied: trunk/buildroot/toolchain/gdb/ext_source/Atmel/avr32/6.4-avr32-2.0 (from rev 22623, trunk/buildroot/target/device/Atmel/toolchain/avr32/gdb-6.4-avr32-2.0)

Copied: trunk/buildroot/toolchain/gdb/ext_source/Atmel/avr32/6.4-avr32-2.1.3 (from rev 22623, trunk/buildroot/target/device/Atmel/toolchain/avr32/gdb-6.4-avr32-2.1.3)

Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2008-07-04 03:49:18 UTC (rev 22623)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2008-07-04 08:39:35 UTC (rev 22624)
@@ -27,7 +27,7 @@
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SOURCE),y)
 GDB_SITE:=$(VENDOR_SITE)
-GDB_PATCH_DIR:=$(VENDOR_PATCH_DIR)/gdb-$(GDB_OFFICIAL_VERSION)
+GDB_PATCH_DIR:=toolchain/gdb/ext_source/$(VENDOR_PATCH_DIR)/$(GDB_OFFICIAL_VERSION)
 else
 GDB_SITE:=$(BR2_GNU_MIRROR)/gdb
 GDB_PATCH_DIR:=toolchain/gdb/$(GDB_OFFICIAL_VERSION)
@@ -61,6 +61,12 @@
 	$(CONFIG_UPDATE) $(GDB_DIR)
 	touch $@
 
+gdb-patched: $(GDB_DIR)/.unpacked
+$(GDB_DIR)/.patched: $(GDB_DIR)/.unpacked
+	toolchain/patch-kernel.sh $(GDB_DIR) $(GDB_PATCH_DIR) \*.patch
+	$(CONFIG_UPDATE) $(GDB_DIR)
+	touch $@
+
 gdb-dirclean:
 	rm -rf $(GDB_DIR)
 
@@ -82,7 +88,7 @@
 	bash_cv_func_sigsetjmp=present \
 	bash_cv_have_mbstate_t=yes
 
-$(GDB_TARGET_DIR)/.configured: $(GDB_DIR)/.unpacked
+$(GDB_TARGET_DIR)/.configured: $(GDB_DIR)/.patched
 	mkdir -p $(GDB_TARGET_DIR)
 	(cd $(GDB_TARGET_DIR); \
 		gdb_cv_func_sigsetjmp=yes \

Copied: trunk/buildroot/toolchain/uClibc/ext_source/Atmel/avr32/0.9.28.3-avr32-2.0 (from rev 22623, trunk/buildroot/target/device/Atmel/toolchain/avr32/uClibc-0.9.28.3-avr32-2.0)

Copied: trunk/buildroot/toolchain/uClibc/ext_source/Atmel/avr32/0.9.29-avr32-2.1.3 (from rev 22623, trunk/buildroot/target/device/Atmel/toolchain/avr32/uClibc-0.9.29-avr32-2.1.3)

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-07-04 03:49:18 UTC (rev 22623)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-07-04 08:39:35 UTC (rev 22624)
@@ -40,7 +40,7 @@
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 UCLIBC_PATCH_DIR:=toolchain/uClibc/
 else
-UCLIBC_PATCH_DIR:=$(VENDOR_PATCH_DIR)/uClibc-$(UCLIBC_OFFICIAL_VERSION)
+UCLIBC_PATCH_DIR:=toolchain/uClibc/ext_source/$(VENDOR_PATCH_DIR)/$(UCLIBC_OFFICIAL_VERSION)
 endif
 
 UCLIBC_DIR:=$(TOOL_BUILD_DIR)/uClibc-$(UCLIBC_OFFICIAL_VERSION)
@@ -105,10 +105,15 @@
 UCLIBC_LOCALE_DATA=
 endif
 
+uclibc-unpacked: $(UCLIBC_DIR)/.unpacked
 $(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE) $(UCLIBC_LOCALE_DATA)
 	mkdir -p $(TOOL_BUILD_DIR)
 	rm -rf $(UCLIBC_DIR)
 	$(UCLIBC_CAT) $(DL_DIR)/$(UCLIBC_SOURCE) | tar -C $(TOOL_BUILD_DIR) $(TAR_OPTIONS) -
+	touch $@
+
+uclibc-patched: $(UCLIBC_DIR)/.patched
+$(UCLIBC_DIR)/.patched: $(UCLIBC_DIR)/.unpacked
 ifneq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 	toolchain/patch-kernel.sh $(UCLIBC_DIR) $(UCLIBC_PATCH_DIR) \
 		uClibc-$(UCLIBC_OFFICIAL_VERSION)-\*.patch \
@@ -122,8 +127,9 @@
 endif
 	touch $@
 
+
 # Some targets may wish to provide their own UCLIBC_CONFIG_FILE...
-$(UCLIBC_DIR)/.oldconfig: $(UCLIBC_DIR)/.unpacked $(UCLIBC_CONFIG_FILE)
+$(UCLIBC_DIR)/.oldconfig: $(UCLIBC_DIR)/.patched $(UCLIBC_CONFIG_FILE)
 	cp -f $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.oldconfig
 	$(SED) 's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="$(TARGET_CROSS)",g' \
 		-e 's,# TARGET_$(UCLIBC_TARGET_ARCH) is not set,TARGET_$(UCLIBC_TARGET_ARCH)=y,g' \
