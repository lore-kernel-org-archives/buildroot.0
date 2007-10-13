From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 13 Oct 2007 03:15:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: target/device
	target/device/Atmel target etc...
Message-ID: <20071013101502.7A6EDA6151@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-13 03:15:01 -0700 (Sat, 13 Oct 2007)
New Revision: 20239

Log:
Update AVR32 toolchain with new binutils and uClibc, This time it works (cross-fingers)

Added:
   trunk/buildroot/target/device/Atmel/toolchain/avr32/binutils-2.17-avr32-2.1.3/
   trunk/buildroot/target/device/Atmel/toolchain/avr32/gcc-4.2.1-avr32-2.1.3/
   trunk/buildroot/target/device/Atmel/toolchain/avr32/gdb-6.4-avr32-2.1.3/
   trunk/buildroot/target/device/Atmel/toolchain/avr32/uClibc-0.9.29-avr32-2.1.3/

Modified:
   trunk/buildroot/target/device/Atmel/uClibc.config.avr32
   trunk/buildroot/target/device/Config.in.toolchain
   trunk/buildroot/target/linux/Config.in
   trunk/buildroot/toolchain/binutils/Config.in
   trunk/buildroot/toolchain/gcc/Config.in
   trunk/buildroot/toolchain/kernel-headers/Config.in
   trunk/buildroot/toolchain/uClibc/Config.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/uClibc.config.avr32
===================================================================
--- trunk/buildroot/target/device/Atmel/uClibc.config.avr32	2007-10-13 03:36:03 UTC (rev 20238)
+++ trunk/buildroot/target/device/Atmel/uClibc.config.avr32	2007-10-13 10:15:01 UTC (rev 20239)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Fri Oct 12 09:59:26 2007
+# Sat Oct 13 09:10:03 2007
 #
 # TARGET_alpha is not set
 # TARGET_arm is not set
@@ -71,7 +71,7 @@
 UCLIBC_CTOR_DTOR=y
 # HAS_NO_THREADS is not set
 UCLIBC_HAS_THREADS=y
-# PTHREADS_DEBUG_SUPPORT is not set
+PTHREADS_DEBUG_SUPPORT=y
 LINUXTHREADS_OLD=y
 UCLIBC_HAS_LFS=y
 # MALLOC is not set
@@ -83,7 +83,7 @@
 # UCLIBC_SUSV3_LEGACY is not set
 # UCLIBC_SUSV3_LEGACY_MACROS is not set
 UCLIBC_HAS_SHADOW=y
-UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
+# UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
 UCLIBC_HAS___PROGNAME=y
 UNIX98PTY_ONLY=y
 ASSUME_DEVPTS=y
@@ -182,7 +182,7 @@
 #
 # uClibc development/debugging options
 #
-CROSS_COMPILER_PREFIX="/home/ulf/projects/Buildroot/20071011/buildroot/build_avr32/staging_dir/usr/bin/avr32-uclic-linux-"
+CROSS_COMPILER_PREFIX="/home/ulf/projects/Buildroot/20071013/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-"
 UCLIBC_EXTRA_CFLAGS=""
 # DODEBUG is not set
 # DODEBUG_PT is not set

Modified: trunk/buildroot/target/device/Config.in.toolchain
===================================================================
--- trunk/buildroot/target/device/Config.in.toolchain	2007-10-13 03:36:03 UTC (rev 20238)
+++ trunk/buildroot/target/device/Config.in.toolchain	2007-10-13 10:15:01 UTC (rev 20239)
@@ -6,18 +6,41 @@
 	  Select whether to use the toolchain built by the buildroot
 	  system or an external pre-built toolchain.
 
-config BR2_TOOLCHAIN_ATMEL_AVR32
-	bool "Use prepatched source for AVR32 toolchain"
+config BR2_TOOLCHAIN_ATMEL_AVR32_4_1_2
+	bool "Use prepatched source for AVR32 gcc-4.1.2 toolchain"
 	depends on BR2_avr32
-	select BR2_GCC_VERSION_4_1_2
-	select BR2_BINUTILS_VERSION_2_17
-	select BR2_UCLIBC_VERSION_0_9_28_3
+	select BR2_EXT_GCC_VERSION_4_1_2
+	select BR2_EXT_BINUTILS_VERSION_2_17
+	select BR2_EXT_UCLIBC_VERSION_0_9_29
+	select BR2_TOOLCHAIN_ATMEL_AVR32
+	help
+	  The gcc-4.1.2 toolchain for the AVR32
 
+config BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1
+	bool "Use prepatched source for AVR32 gcc-4.2.1 toolchain"
+	depends on BR2_avr32
+	select BR2_EXT_GCC_VERSION_4_2_1
+	select BR2_EXT_BINUTILS_VERSION_2_17
+	select BR2_EXT_UCLIBC_VERSION_0_9_29
+	select BR2_TOOLCHAIN_ATMEL_AVR32
+	help
+	  The gcc-4.2.1 toolchain for the AVR32
+	  * gcc-4.2.1
+	  * binutils-2.17
+	  * uClibc-0.9.29
+	  * gdb-6.4
+	  This will not be able to build qtopia
+	  due to internal errors.
+
 config BR2_TOOLCHAIN_UNKNOWNVENDOR
 	bool "Use prepatched source from unknown vendor"
 
 endchoice
 
+config BR2_TOOLCHAIN_ATMEL_AVR32
+	bool
+	default n
+
 if BR2_TOOLCHAIN_ATMEL_AVR32
 config BR2_VENDOR_SITE
 	string
@@ -29,19 +52,20 @@
 
 config BR2_VENDOR_BINUTILS_RELEASE
 	string
-	default "-2.0" if BR2_TOOLCHAIN_ATMEL_AVR32
+	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32
 
 config BR2_VENDOR_GCC_RELEASE
 	string
-	default "-2.0" if BR2_TOOLCHAIN_ATMEL_AVR32
+	default "-2.0" if BR2_TOOLCHAIN_ATMEL_AVR32_4_1_2
+	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1
 
 config BR2_VENDOR_UCLIBC_RELEASE
 	string
-	default "-2.0" if BR2_TOOLCHAIN_ATMEL_AVR32
+	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32
 
 config BR2_VENDOR_GDB_RELEASE
 	string
-	default "-2.0" if BR2_TOOLCHAIN_ATMEL_AVR32
+	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32
 
 config BR2_VENDOR_PATCH_DIR
 	string
@@ -79,3 +103,29 @@
 
 
 endif
+
+
+config	BR2_EXT_GCC_VERSION_4_1_2
+	bool
+	default y if !BR2_TOOLCHAIN_EXTERNAL_SOURCE
+	default n if  BR2_TOOLCHAIN_EXTERNAL_SOURCE
+
+config	BR2_EXT_GCC_VERSION_4_2_1
+	bool
+	default y if !BR2_TOOLCHAIN_EXTERNAL_SOURCE
+	default n if  BR2_TOOLCHAIN_EXTERNAL_SOURCE
+
+config	BR2_EXT_BINUTILS_VERSION_2_17
+	bool
+	default y if !BR2_TOOLCHAIN_EXTERNAL_SOURCE
+	default n if  BR2_TOOLCHAIN_EXTERNAL_SOURCE
+
+config	BR2_EXT_UCLIBC_VERSION_0_9_29
+	bool
+	default y if !BR2_TOOLCHAIN_EXTERNAL_SOURCE
+	default n if  BR2_TOOLCHAIN_EXTERNAL_SOURCE
+
+config	BR2_EXT_UCLIBC_VERSION_0_9_28_3
+	bool
+	default y if !BR2_TOOLCHAIN_EXTERNAL_SOURCE
+	default n if  BR2_TOOLCHAIN_EXTERNAL_SOURCE

Modified: trunk/buildroot/target/linux/Config.in
===================================================================
--- trunk/buildroot/target/linux/Config.in	2007-10-13 03:36:03 UTC (rev 20238)
+++ trunk/buildroot/target/linux/Config.in	2007-10-13 10:15:01 UTC (rev 20239)
@@ -59,7 +59,8 @@
 choice
 	prompt "Linux Kernel Version"
 	depends on BR2_PACKAGE_LINUX
-	default BR2_LINUX_2_6_22_1
+	default BR2_LINUX_2_6_22_1 if !BR2_avr32
+	default BR2_LINUX_2_6_22_10 if BR2_avr32
 	help
 	  Select the specific Linux version you want to use
 

Modified: trunk/buildroot/toolchain/binutils/Config.in
===================================================================
--- trunk/buildroot/toolchain/binutils/Config.in	2007-10-13 03:36:03 UTC (rev 20238)
+++ trunk/buildroot/toolchain/binutils/Config.in	2007-10-13 10:15:01 UTC (rev 20239)
@@ -10,6 +10,7 @@
 
 	config BR2_BINUTILS_VERSION_2_17
 		depends BR2_avr32 || !BR2_nios2 && BR2_DEPRECATED
+		depends BR2_EXT_BINUTILS_VERSION_2_17
 		bool "binutils 2.17"
 
 	config BR2_BINUTILS_VERSION_2_17_50_0_17

Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-10-13 03:36:03 UTC (rev 20238)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-10-13 10:15:01 UTC (rev 20239)
@@ -4,7 +4,8 @@
 
 choice
 	prompt "GCC compiler Version"
-	default BR2_GCC_VERSION_4_2_1
+	default BR2_GCC_VERSION_4_2_1 if !BR2_avr32
+	default BR2_GCC_VERSION_4_1_2 if BR2_avr32
 	help
 	  Select the version of gcc you wish to use.
 
@@ -19,6 +20,7 @@
 
 	config BR2_GCC_VERSION_4_1_2
 		depends !BR2_nios2
+		depends BR2_EXT_GCC_VERSION_4_1_2
 		bool "gcc 4.1.2"
 
 	config BR2_GCC_VERSION_4_2_0
@@ -27,7 +29,8 @@
 		bool "gcc 4.2.0"
 
 	config BR2_GCC_VERSION_4_2_1
-		depends !BR2_avr32 && !BR2_nios2
+		depends !BR2_nios2
+		depends BR2_EXT_GCC_VERSION_4_2_1
 		bool "gcc 4.2.1"
 
 #	config BR2_GCC_VERSION_4_3

Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2007-10-13 03:36:03 UTC (rev 20238)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2007-10-13 10:15:01 UTC (rev 20239)
@@ -62,7 +62,7 @@
 		bool "Latest Linux 2.6.21.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_22_1
-		depends !BR2_nios2
+		depends !BR2_avr32 && !BR2_nios2
 		bool "Linux 2.6.22.1 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_22_10
@@ -79,6 +79,7 @@
 
 	config BR2_KERNEL_HEADERS_SNAP
 		bool "Linux 2.6 snapshot"
+		depends !BR2_avr32
 
 endchoice
 

Modified: trunk/buildroot/toolchain/uClibc/Config.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in	2007-10-13 03:36:03 UTC (rev 20238)
+++ trunk/buildroot/toolchain/uClibc/Config.in	2007-10-13 10:15:01 UTC (rev 20239)
@@ -10,11 +10,13 @@
 	  Select the version of uClibc you wish to use.
 
 	config BR2_UCLIBC_VERSION_0_9_28_3
-		depends BR2_avr32 || BR2_DEPRECATED
+		depends !BR2_avr32 && BR2_DEPRECATED
 		bool "uClibc 0.9.28.3"
+		depends BR2_EXT_UCLIBC_VERSION_0_9_28_3
 
 	config BR2_UCLIBC_VERSION_0_9_29
 		bool "uClibc 0.9.29"
+		depends BR2_EXT_UCLIBC_VERSION_0_9_29
 
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		depends !BR2_avr32
