From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 22 Sep 2007 07:16:26 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: project target/device
	toolchain toolcha etc...
Message-ID: <20070922141626.A8CC3A612B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-22 07:16:25 -0700 (Sat, 22 Sep 2007)
New Revision: 19937

Log:
- Subsume and collaps toolchain options in one menu
  This is ment to ease configuration by providing toolchain related options in one place
  No functional changes, just shuffling the menus around..


Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/project/Config.in
   trunk/buildroot/target/device/Toolchain.in
   trunk/buildroot/toolchain/Config.in
   trunk/buildroot/toolchain/Config.in.2
   trunk/buildroot/toolchain/external-toolchain/Config.in
   trunk/buildroot/toolchain/gcc/Config.in
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-09-22 10:25:09 UTC (rev 19936)
+++ trunk/buildroot/Config.in	2007-09-22 14:16:25 UTC (rev 19937)
@@ -6,8 +6,6 @@
 	bool
 	default y
 
-source "project/Config.in"
-
 choice
 	prompt "Target Architecture"
 	default BR2_i386

Modified: trunk/buildroot/project/Config.in
===================================================================
--- trunk/buildroot/project/Config.in	2007-09-22 10:25:09 UTC (rev 19936)
+++ trunk/buildroot/project/Config.in	2007-09-22 14:16:25 UTC (rev 19937)
@@ -1,4 +1,4 @@
-menu "Project Options"
+comment "Project Options"
 
 config BR2_PROJECT
 	string "Project name"
@@ -23,4 +23,3 @@
 	help
 	  The banner string is stored in "/etc/issue"
 
-endmenu

Modified: trunk/buildroot/target/device/Toolchain.in
===================================================================
--- trunk/buildroot/target/device/Toolchain.in	2007-09-22 10:25:09 UTC (rev 19936)
+++ trunk/buildroot/target/device/Toolchain.in	2007-09-22 14:16:25 UTC (rev 19937)
@@ -8,8 +8,7 @@
 	  system or an external pre-built toolchain.
 
 config BR2_TOOLCHAIN_NORMAL
-	bool
-	prompt "Use default sources for toolchain"
+	bool "Use default sources for toolchain"
 	depends on !BR2_avr32
 	help
 	  Download vanilla binutils, gcc, uclibc and gdb from their 
@@ -18,8 +17,7 @@
 	  I.E: Do not download a prepatched vendor source suite.
 
 config BR2_TOOLCHAIN_ATMEL_AVR32
-	bool
-	prompt "Use prepatched source for AVR32 toolchain"
+	bool "Use prepatched source for AVR32 toolchain"
 	depends on BR2_avr32
 	depends on BR2_GCC_VERSION_4_1_2
 	depends on BR2_GDB_VERSION_6_4 || !BR2_PACKAGE_GDB

Modified: trunk/buildroot/toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/Config.in	2007-09-22 10:25:09 UTC (rev 19936)
+++ trunk/buildroot/toolchain/Config.in	2007-09-22 14:16:25 UTC (rev 19937)
@@ -1,4 +1,4 @@
-menu "Toolchain type"
+menu "Toolchain"
 choice
 	prompt "Toolchain type"
 	default BR2_TOOLCHAIN_BUILDROOT
@@ -7,17 +7,17 @@
 	  system or an external pre-built toolchain.
 
 config BR2_TOOLCHAIN_BUILDROOT
-	bool
-	prompt "Buildroot toolchain"
+	bool "Buildroot toolchain"
 
 config BR2_TOOLCHAIN_EXTERNAL
-	bool
-	prompt "External toolchain"
+	bool "External toolchain"
 endchoice
 
 source "target/device/Toolchain.in"
 
-endmenu
-
 source "toolchain/Config.in.2"
 source "toolchain/external-toolchain/Config.in"
+
+source "project/Config.in"
+
+endmenu

Modified: trunk/buildroot/toolchain/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/Config.in.2	2007-09-22 10:25:09 UTC (rev 19936)
+++ trunk/buildroot/toolchain/Config.in.2	2007-09-22 14:16:25 UTC (rev 19937)
@@ -1,8 +1,6 @@
 #
 
-menu "Toolchain Options"
-	depends on BR2_TOOLCHAIN_BUILDROOT
-
+if BR2_TOOLCHAIN_BUILDROOT
 source "toolchain/kernel-headers/Config.in"
 source "toolchain/uClibc/Config.in"
 source "toolchain/binutils/Config.in"
@@ -81,4 +79,4 @@
 	  Answer Y if you want these apps (if built) copied into the
 	  cross toolchain dir under <arch>-linux-uclibc/target_utils/.
 
-endmenu
+endif

Modified: trunk/buildroot/toolchain/external-toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/external-toolchain/Config.in	2007-09-22 10:25:09 UTC (rev 19936)
+++ trunk/buildroot/toolchain/external-toolchain/Config.in	2007-09-22 14:16:25 UTC (rev 19937)
@@ -1,6 +1,6 @@
 #
 
-menu "Toolchain Options"
+menu "External Toolchain Options"
 	depends on BR2_TOOLCHAIN_EXTERNAL
 
 config BR2_TOOLCHAIN_EXTERNAL_LIB_C

Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-09-22 10:25:09 UTC (rev 19936)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-09-22 14:16:25 UTC (rev 19937)
@@ -1,6 +1,6 @@
 # Choose gcc version.
 
-comment "Gcc Options"
+comment "GCC Options"
 
 choice
 	prompt "GCC compiler Version"

Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2007-09-22 10:25:09 UTC (rev 19936)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2007-09-22 14:16:25 UTC (rev 19937)
@@ -2,7 +2,7 @@
 # ignored if you are building your own kernel or using the system kernel.
 #
 
-menu "Kernel Header Options"
+comment "Kernel Header Options"
 
 choice
 	prompt "Kernel Headers"
@@ -113,4 +113,3 @@
 	default "2.6.22.1"  if BR2_KERNEL_HEADERS_2_6_22_1
 	default "2.6.22.6"  if BR2_KERNEL_HEADERS_2_6_22
 
-endmenu
