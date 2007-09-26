From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 25 Sep 2007 23:13:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/busybox project
	target target/d etc...
Message-ID: <20070926061312.D445CA658A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-25 23:13:09 -0700 (Tue, 25 Sep 2007)
New Revision: 20031

Log:
"Project Name" needed before "root" file system can be copied.
Put first according to principle of configuration order
Merge root skeleton configuration to one place
- currently in package/busybox/Config.in
- Should maybe have it's own Config.in
gcc ABI configuration moved from toplevel to toolchain/gcc/Config.in


Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/package/busybox/Config.in
   trunk/buildroot/project/Config.in
   trunk/buildroot/target/arch.in
   trunk/buildroot/target/device/Config.in
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2007-09-26 05:36:11 UTC (rev 20030)
+++ trunk/buildroot/Config.in	2007-09-26 06:13:09 UTC (rev 20031)
@@ -10,6 +10,8 @@
 	string
 	default "0.10.0-svn"
 
+source "project/Config.in"
+
 source "target/arch.in"
 
 menu "Build options"

Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2007-09-26 05:36:11 UTC (rev 20030)
+++ trunk/buildroot/package/busybox/Config.in	2007-09-26 06:13:09 UTC (rev 20031)
@@ -127,6 +127,8 @@
 	  Do not show packages in menuconfig that are potentially provided
 	  by busybox.
 
+comment "Skeleton configuration"
+
 config BR2_PACKAGE_BUSYBOX_SKELETON
 	bool "use minimal target skeleton"
 	depends on BR2_PACKAGE_BUSYBOX
@@ -135,6 +137,19 @@
 	  Use a minimal target skeleton. Make sure to select mdev
 	  which is used to populate /dev/.
 
+config BR2_HOSTNAME
+	string "hostname"
+	default "uclibc"
+	help
+	  The hostname string is stored in "/etc/hostname"
+
+config BR2_BANNER
+	string "banner"
+	default "Welcome to the Erik's uClibc development environment."
+	help
+	  The banner string is stored in "/etc/issue"
+
+
 #config BR2_PACKAGE_BUSYBOX_INITRAMFS
 #	bool "initramfs perusing busybox"
 #	depends on BR2_PACKAGE_BUSYBOX

Modified: trunk/buildroot/project/Config.in
===================================================================
--- trunk/buildroot/project/Config.in	2007-09-26 05:36:11 UTC (rev 20030)
+++ trunk/buildroot/project/Config.in	2007-09-26 06:13:09 UTC (rev 20031)
@@ -1,4 +1,4 @@
-comment "Project Options"
+menu "Project Options"
 
 config BR2_PROJECT
 	string "Project name"
@@ -11,15 +11,4 @@
 	  Older targets may still build in the build_<arch>
 	  and store binaries in the top directory.
 
-config BR2_HOSTNAME
-	string "hostname"
-	default "uclibc"
-	help
-	  The hostname string is stored in "/etc/hostname"
-
-config BR2_BANNER
-	string "banner"
-	default "Welcome to the Erik's uClibc development environment."
-	help
-	  The banner string is stored in "/etc/issue"
-
+endmenu

Modified: trunk/buildroot/target/arch.in
===================================================================
--- trunk/buildroot/target/arch.in	2007-09-26 05:36:11 UTC (rev 20030)
+++ trunk/buildroot/target/arch.in	2007-09-26 06:13:09 UTC (rev 20031)
@@ -108,19 +108,7 @@
 	default ARM_XSCALE	if BR2_xscale
 	default ARM_IWMMXT	if BR2_iwmmxt
 
-choice
-	prompt "Target ABI"
-	depends BR2_arm || BR2_armeb
-	default BR2_ARM_OABI
-	help
-	  Application Binary Interface to use
 
-config BR2_ARM_OABI
-	bool "OABI"
-config BR2_ARM_EABI
-	bool "EABI"
-endchoice
-
 choice
 	prompt "Target Architecture Variant"
 	depends BR2_avr32
@@ -635,24 +623,3 @@
 	default z990		if BR2_s390_z990
 	default z9-109		if BR2_s390_z9_109
 
-config BR2_GCC_TARGET_ABI
-	string
-	default apcs-gnu	if BR2_arm_dunno
-	default atpcs		if BR2_arm_dunno
-	default aapcs		if BR2_arm_dunno
-	default aapcs-linux	if BR2_arm_dunno
-	default iwmmxt		if BR2_iwmmxt
-	default 32		if BR2_mipsel && BR2_OABI
-	default n32		if BR2_mipsel && BR2_EABI
-	default o64		if BR2_mips && BR2_OABI
-	default 64		if BR2_mips && BR2_ABI64
-	default eabi		if BR2_mips && BR2_EABI
-	default mmixware	if BR2_mmix && BR2_ABI_native
-	default gnu		if BR2_mmix && !BR2_ABI_native
-	default altivec		if BR2_powerpc && BR2_ABI_altivec
-	default no-altivec	if BR2_powerpc && BR2_ABI_no-altivec
-	default spe		if BR2_powerpc && BR2_ABI_spe
-	default no-spe		if BR2_powerpc && BR2_ABI_no-spe
-	default ibmlongdouble	if BR2_powerpc && BR2_ABI_ibmlongdouble
-	default ieeelongdouble	if BR2_powerpc && BR2_ABI_ieeelongdouble
-

Modified: trunk/buildroot/target/device/Config.in
===================================================================
--- trunk/buildroot/target/device/Config.in	2007-09-26 05:36:11 UTC (rev 20030)
+++ trunk/buildroot/target/device/Config.in	2007-09-26 06:13:09 UTC (rev 20031)
@@ -1,7 +1,5 @@
 menu "Board Support Options"
 
-source "project/Config.in"
-
 comment "Preset Devices"
 
 source "target/device/AMD/Config.in"

Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-09-26 05:36:11 UTC (rev 20030)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-09-26 06:13:09 UTC (rev 20031)
@@ -69,6 +69,40 @@
 	default "4.2.1"     if BR2_GCC_VERSION_4_2_1
 	default "4.3"       if BR2_GCC_VERSION_4_3
 
+choice
+	prompt "Target ABI"
+	depends BR2_arm || BR2_armeb
+	default BR2_ARM_OABI
+	help
+	  Application Binary Interface to use
+
+config BR2_ARM_OABI
+	bool "OABI"
+config BR2_ARM_EABI
+	bool "EABI"
+endchoice
+
+config BR2_GCC_TARGET_ABI
+	string
+	default apcs-gnu	if BR2_arm_dunno
+	default atpcs		if BR2_arm_dunno
+	default aapcs		if BR2_arm_dunno
+	default aapcs-linux	if BR2_arm_dunno
+	default iwmmxt		if BR2_iwmmxt
+	default 32		if BR2_mipsel && BR2_OABI
+	default n32		if BR2_mipsel && BR2_EABI
+	default o64		if BR2_mips && BR2_OABI
+	default 64		if BR2_mips && BR2_ABI64
+	default eabi		if BR2_mips && BR2_EABI
+	default mmixware	if BR2_mmix && BR2_ABI_native
+	default gnu		if BR2_mmix && !BR2_ABI_native
+	default altivec		if BR2_powerpc && BR2_ABI_altivec
+	default no-altivec	if BR2_powerpc && BR2_ABI_no-altivec
+	default spe		if BR2_powerpc && BR2_ABI_spe
+	default no-spe		if BR2_powerpc && BR2_ABI_no-spe
+	default ibmlongdouble	if BR2_powerpc && BR2_ABI_ibmlongdouble
+	default ieeelongdouble	if BR2_powerpc && BR2_ABI_ieeelongdouble
+
 config BR2_TOOLCHAIN_SYSROOT
 	bool "Enable toolchain with --sysroot support"
 	depends on BR2_GCC_SUPPORTS_SYSROOT
