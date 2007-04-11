From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 11 Apr 2007 01:22:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: target/device
	target/device/x86/i386 too etc...
Message-ID: <20070411082200.973434808C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-04-11 01:21:55 -0700 (Wed, 11 Apr 2007)
New Revision: 18399

Log:
- store BR2_PACKAGE_LINUX_KCONFIG and BR2_PACKAGE_LINUX_FORMAT in .config
- adjust a few defaults.


Modified:
   trunk/buildroot/target/device/Config.in
   trunk/buildroot/target/device/x86/i386/Makefile.in
   trunk/buildroot/toolchain/gcc/Config.in
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/target/device/Config.in
===================================================================
--- trunk/buildroot/target/device/Config.in	2007-04-11 07:36:31 UTC (rev 18398)
+++ trunk/buildroot/target/device/Config.in	2007-04-11 08:21:55 UTC (rev 18399)
@@ -11,6 +11,36 @@
 	        kernel headers are just that (headers) and not full
 		kernels. This is a feature.
 
+config BR2_PACKAGE_LINUX_KCONFIG
+	string ".config file"
+	depends on BR2_PACKAGE_LINUX
+	default ""
+	help
+	  kernel's .config to use to build a kernel for the target.
+
+	  If the above setting is empty, you can change the default
+	  board-imposed value by passing LINUX26_KCONFIG=<path> to
+	  make.
+
+config BR2_PACKAGE_LINUX_FORMAT
+	string "kernel binary format"
+	depends on BR2_PACKAGE_LINUX
+	default ""
+	help
+	  kernel binary format.
+	  Popular values include:
+	  - bzImage
+	  - zImage
+	  and other, architecture dependant formats.
+
+	  Note that the default format is supposed to be set by your
+	  board-description, if any.
+	  i386 and compatible default to bzImage if nothing was given
+	  above.
+	  If the above setting is empty, you can change the default
+	  board-imposed value by passing LINUX26_FORMAT=<string> to
+	  make.
+
 source "target/device/AMD/Config.in"
 source "target/device/Arm/Config.in"
 source "target/device/Atmel/Config.in"

Modified: trunk/buildroot/target/device/x86/i386/Makefile.in
===================================================================
--- trunk/buildroot/target/device/x86/i386/Makefile.in	2007-04-11 07:36:31 UTC (rev 18398)
+++ trunk/buildroot/target/device/x86/i386/Makefile.in	2007-04-11 08:21:55 UTC (rev 18399)
@@ -1,7 +1,17 @@
 BR2_BOARD_PATH:=target/device/x86/i386
 
+ifeq ($(strip $(BR2_PACKAGE_LINUX_KCONFIG)),)
 ifndef LINUX26_KCONFIG
 LINUX26_KCONFIG=$(BR2_BOARD_PATH)/linux26.config
 endif
+else
+LINUX26_KCONFIG=$(strip $(BR2_PACKAGE_LINUX_KCONFIG))
+endif
+
+ifeq ($(strip $(BR2_PACKAGE_LINUX_FORMAT)),)
+ifndef LINUX26_FORMAT
 LINUX26_FORMAT=bzImage
-
+endif
+else
+LINUX26_FORMAT=$(strip $(BR2_PACKAGE_LINUX_FORMAT))
+endif

Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-04-11 07:36:31 UTC (rev 18398)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-04-11 08:21:55 UTC (rev 18399)
@@ -4,7 +4,7 @@
 
 choice
 	prompt "GCC compiler Version"
-	default BR2_GCC_VERSION_3_4_6
+	default BR2_GCC_VERSION_4_1_2
 	help
 	  Select the version of gcc you wish to use.
 

Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2007-04-11 07:36:31 UTC (rev 18398)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2007-04-11 08:21:55 UTC (rev 18399)
@@ -6,7 +6,7 @@
 
 choice
 	prompt "Kernel Headers"
-	default BR2_KERNEL_HEADERS_2_4_31
+	default BR2_KERNEL_HEADERS_2_6_20
 	help
 	  Select the version of kernel header files you wish to use.
 	  You must select the correct set of header files to match
@@ -25,7 +25,7 @@
 		bool "Linux 2.4.29 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_4_31
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "Linux 2.4.31 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_9
@@ -37,7 +37,7 @@
 		bool "Linux 2.6.11 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_12
-		depends !BR2_nios2
+		depends !BR2_nios2 && BR2_DEPRECATED
 		bool "Linux 2.6.12 kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_19_2
