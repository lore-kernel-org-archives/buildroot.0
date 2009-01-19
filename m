From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 19 Jan 2009 22:42:04 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target: device
	device/Atmel/arch-arm device/Atme etc...
Message-ID: <20090119224204.AC83F77182@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-19 22:42:03 +0000 (Mon, 19 Jan 2009)
New Revision: 24913

Log:
Bump u-boot to -2009.01-rc3, and add possibility to apply the arch-at91 patches if using an at91

Added:
   trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01-rc3/
   trunk/buildroot/target/device/Atmel/arch-arm/u-boot/Config.in
   trunk/buildroot/target/device/Atmel/arch-arm/u-boot/Makefile.in
   trunk/buildroot/target/device/Config.in.u-boot
   trunk/buildroot/target/u-boot/2009.01-rc3/

Removed:
   trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01-rc1/
   trunk/buildroot/target/u-boot/2009.01-rc1/

Modified:
   trunk/buildroot/target/device/Atmel/arch-arm/Makefile.in
   trunk/buildroot/target/u-boot/Config.in
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/arch-arm/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/arch-arm/Makefile.in	2009-01-19 21:27:04 UTC (rev 24912)
+++ trunk/buildroot/target/device/Atmel/arch-arm/Makefile.in	2009-01-19 22:42:03 UTC (rev 24913)
@@ -0,0 +1,2 @@
+include target/device/Atmel/arch-arm/u-boot/Makefile.in
+


Property changes on: trunk/buildroot/target/device/Atmel/arch-arm/u-boot/2009.01-rc3
___________________________________________________________________
Added: svn:mergeinfo
   + 

Added: trunk/buildroot/target/device/Atmel/arch-arm/u-boot/Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/arch-arm/u-boot/Config.in	                        (rev 0)
+++ trunk/buildroot/target/device/Atmel/arch-arm/u-boot/Config.in	2009-01-19 22:42:03 UTC (rev 24913)
@@ -0,0 +1,20 @@
+choice
+	prompt "Add AT91 specific patches to u-Boot"
+	default BR2_TARGET_U_BOOT_2009_01_RC3_ARCH_AT91
+	help
+	  Select a patch to add to U-Boot
+
+config	BR2_TARGET_U_BOOT_2009_01_RC3_ARCH_AT91
+	bool "AT91 patches for u-boot-2009.03-rc3"
+	depends on BR2_TARGET_ATMEL && BR2_arm
+	help
+	  Apply the at91 linux-2.6.28-rc6 patches
+
+endchoice
+
+config	BR2_TARGET_U_BOOT_ARCH_AT91_PATCH_DIR
+	string
+	depends on BR2_TARGET_U_BOOT_ARCH_PATCH
+	default "target/device/Atmel/arch-arm/u-boot/2009.01-rc3" if BR2_TARGET_U_BOOT_2009_01_RC3_ARCH_AT91
+	default ""
+

Added: trunk/buildroot/target/device/Atmel/arch-arm/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/arch-arm/u-boot/Makefile.in	                        (rev 0)
+++ trunk/buildroot/target/device/Atmel/arch-arm/u-boot/Makefile.in	2009-01-19 22:42:03 UTC (rev 24913)
@@ -0,0 +1,5 @@
+ifneq ($(BR2_TARGET_U_BOOT_ARCH_AT91_PATCH_DIR),)
+U_BOOT_ARCH_PATCH_DIR:=$(strip $(subst ",, $(BR2_TARGET_U_BOOT_ARCH_AT91_PATCH_DIR)))
+#"))
+endif
+

Added: trunk/buildroot/target/device/Config.in.u-boot
===================================================================
--- trunk/buildroot/target/device/Config.in.u-boot	                        (rev 0)
+++ trunk/buildroot/target/device/Config.in.u-boot	2009-01-19 22:42:03 UTC (rev 24913)
@@ -0,0 +1,9 @@
+menuconfig BR2_TARGET_U_BOOT_ARCH_PATCH
+	bool "Add architecture specific patch"
+	help
+	  Patch U-Boot for a specific family of chips
+
+if BR2_TARGET_U_BOOT_ARCH_PATCH
+source "target/device/Atmel/arch-arm/u-boot/Config.in"
+endif # BR2_TARGET_U_BOOT_ARCH_PATCH
+


Property changes on: trunk/buildroot/target/u-boot/2009.01-rc3
___________________________________________________________________
Added: svn:mergeinfo
   + 

Modified: trunk/buildroot/target/u-boot/Config.in
===================================================================
--- trunk/buildroot/target/u-boot/Config.in	2009-01-19 21:27:04 UTC (rev 24912)
+++ trunk/buildroot/target/u-boot/Config.in	2009-01-19 22:42:03 UTC (rev 24913)
@@ -17,9 +17,12 @@
 	help
 	  Select the specific U-Boot version you want to use
 
-config BR2_TARGET_UBOOT_2009_01_RC1
-	bool "u-boot-2009.01-rc1"
+#config BR2_TARGET_UBOOT_2009_01
+#	bool "u-boot-2009.01"
 
+config BR2_TARGET_UBOOT_2009_01_RC3
+	bool "u-boot-2009.01-rc3"
+
 config BR2_TARGET_UBOOT_2008_10
 	bool "u-boot-2008.10"
 
@@ -31,24 +34,23 @@
 	bool "u-boot-1.2.0-atmel"
 	depends on BR2_TARGET_AT91
 
-#config BR2_TARGET_UBOOT_2009_01
-#	bool "u-boot-2009.01"
-
 endchoice
 
 config BR2_UBOOT_VERSION
 	string
-	default "2009.01-rc1"	if BR2_TARGET_UBOOT_2009_01_RC1
+	default "2009.01"	if BR2_TARGET_UBOOT_2009_01
+	default "2009.01-rc3"	if BR2_TARGET_UBOOT_2009_01_RC3
 	default "2008.10"	if BR2_TARGET_UBOOT_2008_10
 	default "1.3.4"		if BR2_TARGET_UBOOT_1_3_4
 	default "1.2.0-atmel"	if BR2_TARGET_UBOOT_1_2_0_ATMEL
-	default "2009.01"	if BR2_TARGET_UBOOT_2009_01
 
 config BR2_U_BOOT_SITE
 	string
 	default "$(BR2_ATMEL_MIRROR)"		if BR2_TARGET_UBOOT_1_2_0_ATMEL
 	default "ftp://ftp.denx.de/pub/u-boot"
 
+source "target/device/Config.in.u-boot"
+
 config BR2_TARGET_UBOOT_CUSTOM_PATCH
 	string "custom patch"
 	help

Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2009-01-19 21:27:04 UTC (rev 24912)
+++ trunk/buildroot/target/u-boot/Makefile.in	2009-01-19 22:42:03 UTC (rev 24913)
@@ -88,6 +88,9 @@
 	toolchain/patch-kernel.sh $(U_BOOT_DIR) target/u-boot/$(U_BOOT_VERSION) \
 		u-boot-$(U_BOOT_VERSION)-\*.patch \
 		u-boot-$(U_BOOT_VERSION)-\*.patch.$(ARCH)
+ifneq ($(strip $(U_BOOT_ARCH_PATCH_DIR)),"")
+	toolchain/patch-kernel.sh $(U_BOOT_DIR) $(U_BOOT_ARCH_PATCH_DIR) \*.patch
+endif
 ifneq ($(strip $(BR2_TARGET_UBOOT_CUSTOM_PATCH)),"")
 	@mkdir -p $(U_BOOT_PATCH_DIR)
 	cp -dpr $(BR2_TARGET_UBOOT_CUSTOM_PATCH) $(U_BOOT_PATCH_DIR)
