From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  6 Jan 2009 14:16:28 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
Message-ID: <20090106141628.5859776BFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-06 14:16:27 +0000 (Tue, 06 Jan 2009)
New Revision: 24697

Log:
Use PROJECT-u-boot-VERSION-DATE.bin as u-boot target
Provide link using "u-boot.bin"

Add BR2_TARGET_UBOOT_DEFAULT_ENV config
If this is set, Buildroot will generate
a default environment to allow easy downloading
of the kernel and root file system
Both as compile time data and an autoscript.

Make u-boot depend on $(U_BOOT_TARGETS)
Add "u-boot-autoscript" to U_BOOT_TARGETS if 
BR2_TARGET_UBOOT_DEFAULT_ENV is set.

Take kernel name from Linux build.

Use correct ARCH when mkimaging the autoscript.
Do not use TARGET_ATMEL_COPYTO for generic u-boot.

Hide dataflash memory configurations when 
different boot memory is used.



Modified:
   trunk/buildroot/target/u-boot/Config.in
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/u-boot/Config.in
===================================================================
--- trunk/buildroot/target/u-boot/Config.in	2009-01-06 11:59:55 UTC (rev 24696)
+++ trunk/buildroot/target/u-boot/Config.in	2009-01-06 14:16:27 UTC (rev 24697)
@@ -121,7 +121,15 @@
 	help
 	  Install fw_printenv / fw_setenv tools in target.
 
+menuconfig BR2_TARGET_UBOOT_DEFAULT_ENV
+	bool "Generate a default environment"
+	default n
+	depends on BR2_TARGET_UBOOT
+	help
+	  Will generate variables for factory default command
+	  and autoscript.
 
+if BR2_TARGET_UBOOT_DEFAULT_ENV
 choice
 	prompt "SDRAM Memory size"
 	default BR2_TARGET_UBOOT_SDRAM_SIZE_64M
@@ -183,6 +191,7 @@
 
 choice
 	prompt "Dataflash Size"
+	depends on BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD || BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH
 	default BR2_TARGET_UBOOT_DATAFLASH_SIZE_2_00MB
 
 config BR2_TARGET_UBOOT_DATAFLASH_SIZE_8MB
@@ -207,6 +216,7 @@
 
 config BR2_TARGET_UBOOT_DATAFLASH_SIZE
 	string
+	depends on BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD || BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH
 	default "8M"	if BR2_TARGET_DATAFLASH_SIZE_8MB
 	default "4M"	if BR2_TARGET_DATAFLASH_SIZE_4MB
 	default "2M"	if BR2_TARGET_DATAFLASH_SIZE_2MB
@@ -216,6 +226,7 @@
 
 config BR2_TARGET_UBOOT_END_OF_FLASH
 	string
+	depends on BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD || BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH
 	default "C083FFFF" if  BR2_TARGET_UBOOT_DATAFLASH_SIZE_8MB
 	default "C041FFFF" if  BR2_TARGET_UBOOT_DATAFLASH_SIZE_4MB
 	default "C020FFFF" if  BR2_TARGET_UBOOT_DATAFLASH_SIZE_2MB
@@ -233,7 +244,10 @@
 
 config BR2_TARGET_UBOOT_KERNEL_LOCATION
 	string "Kernel flash address"
-	default "C0042000"
+	depends on BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD || \
+			BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH 
+	default "C0042000" if BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD || BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH
+	default ""
 	help
 	  Kernel location in dataflash
 
@@ -252,6 +266,8 @@
 
 config BR2_TARGET_UBOOT_FILESYSTEM_LOCATION
 	string
+	depends on BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASHCARD || \
+			BR2_TARGET_UBOOT_BOOTSOURCE_DATAFLASH 
 	default "C018C000" if BR2_TARGET_UBOOT_KERNEL_SIZE_1_25MB
   	default "C01CE000" if BR2_TARGET_UBOOT_KERNEL_SIZE_1_50MB
   	default "C0210000" if BR2_TARGET_UBOOT_KERNEL_SIZE_1_75MB
@@ -323,6 +339,8 @@
 
 endif
 
+endif
+
 config BR2_BOOTSOURCE_DATAFLASHCARD
 	bool
 	help

Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2009-01-06 11:59:55 UTC (rev 24696)
+++ trunk/buildroot/target/u-boot/Makefile.in	2009-01-06 14:16:27 UTC (rev 24697)
@@ -14,11 +14,20 @@
 U_BOOT_PATCH_DIR:=$(PROJECT_BUILD_DIR)/u-boot-$(U_BOOT_VERSION)-patches
 U_BOOT_CAT:=$(BZCAT)
 U_BOOT_BIN:=u-boot.bin
+U_BOOT_TARGET_BIN:=$(PROJECT)-u-boot-$(U_BOOT_VERSION)-$(DATE).bin
+
 U_BOOT_TOOLS_BIN:=mkimage
 U_BOOT_TOOLS:=$(STAGING_DIR)/usr/bin/$(U_BOOT_TOOLS_BIN)
 MKIMAGE:=$(U_BOOT_TOOLS)
+U_BOOT_AUTOSCRIPT=$(BINARIES_DIR)/autoscript
 
-U_BOOT_AUTOSCRIPT=$(BINARIES_DIR)/autoscript
+U_BOOT_TARGETS:=$(BINARIES_DIR)/$(U_BOOT_BIN) $(U_BOOT_TOOLS) $(U_BOOT_TARGET_TOOLS)
+
+ifeq ($(strip $(subst ",,$(BR2_TARGET_UBOOT_DEFAULT_ENV))),y)
+#"))
+U_BOOT_TARGETS += u-boot-autoscript
+endif
+
 TARGET_UBOOT_IPADDR:=$(strip $(subst ",, $(BR2_TARGET_UBOOT_IPADDR)))
 #"))
 TARGET_UBOOT_SERVERIP:=$(strip $(subst ",, $(BR2_TARGET_UBOOT_SERVERIP)))
@@ -179,7 +188,9 @@
 
 $(BINARIES_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/$(U_BOOT_BIN)
 	rm -f $(BINARIES_DIR)/$(U_BOOT_BIN)
-	cp -dpf $(U_BOOT_DIR)/$(U_BOOT_BIN) $(BINARIES_DIR)
+	rm -f $(BINARIES_DIR)/$(U_BOOT_TARGET_BIN)
+	cp -dpf $(U_BOOT_DIR)/$(U_BOOT_BIN) $(BINARIES_DIR)/$(U_BOOT_TARGET_BIN)
+	(cd $(BINARIES_DIR); ln -s $(U_BOOT_TARGET_BIN) $(U_BOOT_BIN))
 
 $(U_BOOT_TOOLS):	$(U_BOOT_DIR)/tools/$(U_BOOT_TOOLS_BIN)
 	cp -dpf $(U_BOOT_DIR)/tools/$(U_BOOT_TOOLS_BIN) $(STAGING_DIR)/usr/bin/
@@ -199,7 +210,7 @@
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 	ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
 
-u-boot: $(BINARIES_DIR)/$(U_BOOT_BIN) $(U_BOOT_TOOLS) $(U_BOOT_TARGET_TOOLS)
+u-boot: $(U_BOOT_TARGETS)
 
 u-boot-autoscript: $(U_BOOT_AUTOSCRIPT).$(PROJECT)
 
@@ -238,13 +249,13 @@
 ifneq ($(TARGET_UBOOT_NETMASK),)
 	echo setenv netmask $(TARGET_UBOOT_NETMASK) >> $(U_BOOT_AUTOSCRIPT)
 endif
-	echo setenv linux $(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE).gz >> $(U_BOOT_AUTOSCRIPT)
+	echo setenv linux $(LINUX26_KERNEL_NAME).gz >> $(U_BOOT_AUTOSCRIPT)
 	echo setenv kernel-version $(LINUX26_VERSION) >> $(U_BOOT_AUTOSCRIPT)
 	echo setenv kernel-date $(DATE) >> $(U_BOOT_AUTOSCRIPT)
 	echo setenv hostname $(TARGET_HOSTNAME) >> $(U_BOOT_AUTOSCRIPT)
 	echo setenv fs-date $(DATE) >> $(U_BOOT_AUTOSCRIPT)
-	echo setenv rd-1 rootfs.$(BR2_ARCH)-$(DATE).ext2 >> $(U_BOOT_AUTOSCRIPT)
-	echo setenv rd-2 rootfs.$(BR2_ARCH)-$(DATE).jffs2 >> $(U_BOOT_AUTOSCRIPT)
+	echo setenv rd-1 rootfs.$(ARCH)-$(DATE).ext2 >> $(U_BOOT_AUTOSCRIPT)
+	echo setenv rd-2 rootfs.$(ARCH)-$(DATE).jffs2 >> $(U_BOOT_AUTOSCRIPT)
 	echo setenv rd rootfs.$(BR2_ARCH)-$(DATE).ext2 >> $(U_BOOT_AUTOSCRIPT)
 	echo setenv ver 1 >> $(U_BOOT_AUTOSCRIPT)
 ifneq ($(TARGET_UBOOT_ETHADDR),)
@@ -257,7 +268,7 @@
 	echo saveenv >> $(U_BOOT_AUTOSCRIPT)
 
 $(U_BOOT_AUTOSCRIPT).$(PROJECT): $(U_BOOT_AUTOSCRIPT) $(MKIMAGE)
-	$(MKIMAGE) -A arm \
+	$(MKIMAGE) -A $(ARCH) \
 				-O linux \
 				-T script \
 				-C none \
@@ -266,7 +277,6 @@
 				-n "autoscr config" \
 				-d $(U_BOOT_AUTOSCRIPT) \
 				$(U_BOOT_AUTOSCRIPT).$(PROJECT)
-	cp $(U_BOOT_AUTOSCRIPT).$(PROJECT) $(TARGET_ATMEL_COPYTO)
 
 
 
