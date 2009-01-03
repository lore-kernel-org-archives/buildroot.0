From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat,  3 Jan 2009 15:50:40 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target: device/Atmel u-boot
Message-ID: <20090103155041.42D3976BC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-03 15:50:38 +0000 (Sat, 03 Jan 2009)
New Revision: 24674

Log:
Generate an autoscript for configuring u-boot in $(BINARIES_DIR)
mkimage the autoscript to autoscript.$(PROJECT)-
Move build of u-boot-1.2.0-atmel to target/u-boot
	Only visible for AT91 targets.
Fetch prepatched 1.2.0-atmel tarball from $(BR2_ATMEL_MIRROR)
Rest from normal location.
Introduce U_BOOT_CONFIGURE_OPTS
	Set to NOSOFT_FLOAT for u-boot-1.2.0-atmel
Disable target/device/Atmel/u-boot
Keep files in target/device/Atmel/u-boot during a test period.

Files:
M      target/device/Atmel/Makefile.in
M      target/device/Atmel/Config.in
M      target/u-boot/Makefile.in
M      target/u-boot/Config.in
A      target/u-boot/1.2.0-atmel




Added:
   trunk/buildroot/target/u-boot/1.2.0-atmel/

Modified:
   trunk/buildroot/target/device/Atmel/Config.in
   trunk/buildroot/target/device/Atmel/Makefile.in
   trunk/buildroot/target/u-boot/Config.in
   trunk/buildroot/target/u-boot/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/Atmel/Config.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Config.in	2009-01-03 15:05:42 UTC (rev 24673)
+++ trunk/buildroot/target/device/Atmel/Config.in	2009-01-03 15:50:38 UTC (rev 24674)
@@ -65,7 +65,7 @@
 
 endmenu
 
-source "target/device/Atmel/u-boot/Config.in"
+# source "target/device/Atmel/u-boot/Config.in"
 
 source "target/device/Atmel/DataFlashBoot/Config.in"
 

Modified: trunk/buildroot/target/device/Atmel/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Atmel/Makefile.in	2009-01-03 15:05:42 UTC (rev 24673)
+++ trunk/buildroot/target/device/Atmel/Makefile.in	2009-01-03 15:50:38 UTC (rev 24674)
@@ -54,6 +54,8 @@
 
 #BR2_PACKAGE_BUSYBOX_CONFIG:=$(BR2_BOARD_PATH)/busybox-$(BR2_BUSYBOX_VERSION).config
 
+U_BOOT_VERSION:=$(strip $(subst ",,$(BR2_UBOOT_VERSION)))
+#"))
 
 # Update things in board specific makefiles
 include target/device/Atmel/*/Makefile.in
@@ -63,9 +65,9 @@
 UBOOT_CONFIG:=$(UBOOT_BOARD_NAME)_config
 UBOOT_CONFIG_FILE:=$(BOARD_PATH)/u-boot/$(UBOOT_BOARD_NAME).h
 
-ifeq ($(BR2_TARGET_UBOOT_AT91),y)
-include $(ATMEL_PATH)/u-boot/u-boot.mk
-endif
+#ifeq ($(BR2_TARGET_UBOOT_AT91),y)
+#include $(ATMEL_PATH)/u-boot/u-boot.mk
+#endif
 
 ifeq ($(BR2_TARGET_DATAFLASHBOOT),y)
 include $(ATMEL_PATH)/DataFlashBoot/DataflashBoot.mk

Modified: trunk/buildroot/target/u-boot/Config.in
===================================================================
--- trunk/buildroot/target/u-boot/Config.in	2009-01-03 15:05:42 UTC (rev 24673)
+++ trunk/buildroot/target/u-boot/Config.in	2009-01-03 15:50:38 UTC (rev 24674)
@@ -1,12 +1,5 @@
-config BR2_TARGET_CUSTOM_UBOOT
-	bool
-	help
-	  A target can "select" this to disable
-	  the build of vanilla u-boot.
-
 menuconfig BR2_TARGET_UBOOT
 	bool "Das U-Boot Boot Monitor"
-	depends on !BR2_TARGET_CUSTOM_UBOOT
 	help
 	  Build "Das U-Boot" Boot Monitor
 
@@ -37,6 +30,11 @@
 	bool "u-boot-1.3.4"
 	depends on BR2_TARGET_UBOOT
 	
+config BR2_TARGET_UBOOT_1_2_0_ATMEL
+	bool "u-boot-1.2.0-atmel"
+	depends on BR2_TARGET_AT91
+	depends on BR2_TARGET_UBOOT
+	
 config BR2_TARGET_UBOOT_2009_01
 	bool "u-boot-2009.01"
 	depends on BR2_TARGET_UBOOT
@@ -48,8 +46,14 @@
 	default "2009.01-rc1"	if BR2_TARGET_UBOOT_2009_01_RC1
 	default "2008.10"	if BR2_TARGET_UBOOT_2008_10
 	default "1.3.4"		if BR2_TARGET_UBOOT_1_3_4
+	default "1.2.0-atmel"	if BR2_TARGET_UBOOT_1_2_0_ATMEL
 	default "2009.01"	if BR2_TARGET_UBOOT_2009_01
 
+config BR2_U_BOOT_SITE
+	string
+	default "$(BR2_ATMEL_MIRROR)"		if BR2_TARGET_UBOOT_1_2_0_ATMEL
+	default "ftp://ftp.denx.de/pub/u-boot"
+
 config BR2_TARGET_UBOOT_CUSTOM_PATCH
 	string "custom patch"
 	depends on BR2_TARGET_UBOOT

Modified: trunk/buildroot/target/u-boot/Makefile.in
===================================================================
--- trunk/buildroot/target/u-boot/Makefile.in	2009-01-03 15:05:42 UTC (rev 24673)
+++ trunk/buildroot/target/u-boot/Makefile.in	2009-01-03 15:50:38 UTC (rev 24674)
@@ -7,14 +7,30 @@
 #"))
 
 U_BOOT_SOURCE:=u-boot-$(U_BOOT_VERSION).tar.bz2
-U_BOOT_SITE:=ftp://ftp.denx.de/pub/u-boot
+
+U_BOOT_SITE:=$(strip $(subst ",,$(BR2_U_BOOT_SITE)))
+#"))
 U_BOOT_DIR:=$(PROJECT_BUILD_DIR)/u-boot-$(U_BOOT_VERSION)
-U_BOOT_PATCH_DIR:=$(PROJECT_BUILD_DIR)/u-boot-patches
+U_BOOT_PATCH_DIR:=$(PROJECT_BUILD_DIR)/u-boot-$(U_BOOT_VERSION)-patches
 U_BOOT_CAT:=$(BZCAT)
 U_BOOT_BIN:=u-boot.bin
 U_BOOT_TARGET:=$(BOARD_NAME)-u-boot-$(U_BOOT_VERSION)-$(DATE).bin
 U_BOOT_TOOLS_BIN:=mkimage
 U_BOOT_TOOLS:=$(STAGING_DIR)/usr/bin/$(U_BOOT_TOOLS_BIN)
+MKIMAGE:=$(U_BOOT_TOOLS)
+
+U_BOOT_AUTOSCRIPT=$(BINARIES_DIR)/autoscript
+TARGET_UBOOT_IPADDR:=$(strip $(subst ",, $(BR2_TARGET_UBOOT_IPADDR)))
+#"))
+TARGET_UBOOT_SERVERIP:=$(strip $(subst ",, $(BR2_TARGET_UBOOT_SERVERIP)))
+#"))
+TARGET_UBOOT_GATEWAY:=$(strip $(subst ",, $(BR2_TARGET_UBOOT_GATEWAY)))
+#"))
+TARGET_UBOOT_NETMASK:=$(strip $(subst ",, $(BR2_TARGET_UBOOT_NETMASK)))
+#"))
+TARGET_UBOOT_ETHADDR:=$(strip $(subst ",, $(BR2_TARGET_UBOOT_ETHADDR)))
+#"))
+
 # u-boot still uses arch=ppc for powerpc
 U_BOOT_ARCH=$(KERNEL_ARCH:powerpc=ppc)
 ifeq ($(UBOOT_BOARD_NAME),"")
@@ -36,7 +52,12 @@
 U_BOOT_TARGET_TOOLS+=$(TARGET_DIR)/usr/sbin/fw_printenv
 endif
 
+U_BOOT_CONFIGURE_OPTS :=
 
+ifneq ($(BR2_TARGET_UBOOT_1_2_0_ATMEL),)
+U_BOOT_CONFIGURE_OPTS += CONFIG_NOSOFTFLOAT=1
+endif
+
 # Define a helper function
 define insert_define
 @echo "#ifdef $(strip $(1))" >> $(U_BOOT_INC_CONF_FILE)
@@ -52,6 +73,7 @@
 $(U_BOOT_DIR)/.unpacked: $(DL_DIR)/$(U_BOOT_SOURCE)
 	$(U_BOOT_CAT) $(DL_DIR)/$(U_BOOT_SOURCE) \
 		| tar -C $(PROJECT_BUILD_DIR) $(TAR_OPTIONS) -
+	mkdir -p $(U_BOOT_DIR)
 	touch $@
 
 $(U_BOOT_DIR)/.patched: $(U_BOOT_DIR)/.unpacked
@@ -75,6 +97,7 @@
 	$(TARGET_CONFIGURE_OPTS)		\
 		CFLAGS="$(TARGET_CFLAGS)"	\
 		LDFLAGS="$(TARGET_LDFLAGS)"	\
+		$(U_BOOT_CONFIGURE_OPTS) \
 		$(MAKE) -C $(U_BOOT_DIR)	\
 		$(UBOOT_BOARD_NAME)_config
 	touch $@
@@ -151,6 +174,7 @@
 	$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
+		$(U_BOOT_CONFIGURE_OPTS) \
 		$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" ARCH=$(U_BOOT_ARCH) \
 		 -C $(U_BOOT_DIR)
 
@@ -178,8 +202,10 @@
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 	ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
 
-u-boot: $(BINARIES_DIR)/$(U_BOOT_BIN) $(U_BOOT_TOOLS) $(U_BOOT_TARGET_TOOLS)
+u-boot: $(BINARIES_DIR)/$(U_BOOT_BIN) $(U_BOOT_TOOLS) $(U_BOOT_TARGET_TOOLS) u-boot-autoscript
 
+u-boot-autoscript: $(U_BOOT_AUTOSCRIPT).$(PROJECT)
+
 u-boot-clean:
 	-$(MAKE) -C $(U_BOOT_DIR) clean
 	rm -f $(U_BOOT_TOOLS) $(U_BOOT_TARGET_TOOLS)
@@ -195,6 +221,60 @@
 
 #############################################################
 #
+# Generate an autoscript with the configration items
+#
+#############################################################
+
+$(U_BOOT_AUTOSCRIPT): .config
+	rm -f $(U_BOOT_AUTOSCRIPT)
+ifneq ($(TARGET_UBOOT_IPADDR),)
+	echo setenv ipaddr $(TARGET_UBOOT_IPADDR) > $(U_BOOT_AUTOSCRIPT)
+else
+	echo TARGET_UBOOT_IPADDR="$(TARGET_UBOOT_IPADDR)"
+endif
+ifneq ($(TARGET_UBOOT_SERVERIP),)
+	echo setenv serverip $(TARGET_UBOOT_SERVERIP) >> $(U_BOOT_AUTOSCRIPT)
+endif
+ifneq ($(TARGET_UBOOT_GATEWAY),)
+	echo setenv gatewayip $(TARGET_UBOOT_GATEWAY) >> $(U_BOOT_AUTOSCRIPT)
+endif
+ifneq ($(TARGET_UBOOT_NETMASK),)
+	echo setenv netmask $(TARGET_UBOOT_NETMASK) >> $(U_BOOT_AUTOSCRIPT)
+endif
+	echo setenv linux $(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE).gz >> $(U_BOOT_AUTOSCRIPT)
+	echo setenv kernel-version $(LINUX26_VERSION) >> $(U_BOOT_AUTOSCRIPT)
+	echo setenv kernel-date $(DATE) >> $(U_BOOT_AUTOSCRIPT)
+	echo setenv hostname $(TARGET_HOSTNAME) >> $(U_BOOT_AUTOSCRIPT)
+	echo setenv fs-date $(DATE) >> $(U_BOOT_AUTOSCRIPT)
+	echo setenv rd-1 rootfs.$(BR2_ARCH)-$(DATE).ext2 >> $(U_BOOT_AUTOSCRIPT)
+	echo setenv rd-2 rootfs.$(BR2_ARCH)-$(DATE).jffs2 >> $(U_BOOT_AUTOSCRIPT)
+	echo setenv rd rootfs.$(BR2_ARCH)-$(DATE).ext2 >> $(U_BOOT_AUTOSCRIPT)
+	echo setenv ver 1 >> $(U_BOOT_AUTOSCRIPT)
+ifneq ($(TARGET_UBOOT_ETHADDR),)
+	echo setenv ethaddr $(TARGET_UBOOT_ETHADDR) >> $(U_BOOT_AUTOSCRIPT)
+endif
+	echo setenv fstype ram >> $(U_BOOT_AUTOSCRIPT)
+	echo fs >> $(U_BOOT_AUTOSCRIPT)
+	echo os >> $(U_BOOT_AUTOSCRIPT)
+	echo setargs >> $(U_BOOT_AUTOSCRIPT)
+	echo saveenv >> $(U_BOOT_AUTOSCRIPT)
+
+$(U_BOOT_AUTOSCRIPT).$(PROJECT): $(U_BOOT_AUTOSCRIPT) $(MKIMAGE)
+	$(MKIMAGE) -A arm \
+				-O linux \
+				-T script \
+				-C none \
+				-a 0 \
+				-e 0 \
+				-n "autoscr config" \
+				-d $(U_BOOT_AUTOSCRIPT) \
+				$(U_BOOT_AUTOSCRIPT).$(PROJECT)
+	cp $(U_BOOT_AUTOSCRIPT).$(PROJECT) $(TARGET_ATMEL_COPYTO)
+
+
+
+#############################################################
+#
 # Toplevel Makefile options
 #
 #############################################################
