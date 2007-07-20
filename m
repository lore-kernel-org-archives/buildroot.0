From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Fri, 20 Jul 2007 07:39:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel/u-boot
Message-ID: <20070720143902.0D57C3006F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-20 07:39:01 -0700 (Fri, 20 Jul 2007)
New Revision: 19183

Log:
Convert DOS to UNIX style.


Modified:
   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk


Changeset:
Modified: trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2007-07-20 14:37:48 UTC (rev 19182)
+++ trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2007-07-20 14:39:01 UTC (rev 19183)
@@ -1,22 +1,22 @@
-#############################################################
-#
-# u-boot mkimage to build to target u-boot filesystems and
-# 
-# u-boot.bin - the boot loader for the target - which needs soft float, so 
-#              we won't make it.
-#
-#
-#############################################################
-UBOOT_VERSION:=1.2.0-atmel
+#############################################################
+#
+# u-boot mkimage to build to target u-boot filesystems and
+# 
+# u-boot.bin - the boot loader for the target - which needs soft float, so 
+#              we won't make it.
+#
+#
+#############################################################
+UBOOT_VERSION:=1.2.0-atmel
 UBOOT_DIR:=$(BUILD_DIR)/u-boot-$(UBOOT_VERSION)
-UBOOT_BUILD_DIR:=$(PROJECT_BUILD_DIR)/u-boot-$(UBOOT_VERSION)
-UBOOT_SOURCE:=u-boot-$(UBOOT_VERSION).tar.bz2
+UBOOT_BUILD_DIR:=$(PROJECT_BUILD_DIR)/u-boot-$(UBOOT_VERSION)
+UBOOT_SOURCE:=u-boot-$(UBOOT_VERSION).tar.bz2
 #UBOOT_SOURCE:=u-boot-1.1.5-atmel.tar.bz2
-ATMEL_MIRROR:=$(strip  $(subst ",, $(BR2_ATMEL_MIRROR)))
+ATMEL_MIRROR:=$(strip  $(subst ",, $(BR2_ATMEL_MIRROR)))
 #UBOOT_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/u-boot
 UBOOT_SITE:=$(ATMEL_MIRROR)/Source
-UBOOT_PATCH_SITE:=$(ATMEL_MIRROR)/Source
-UBOOT_CAT:=bzcat
+UBOOT_PATCH_SITE:=$(ATMEL_MIRROR)/Source
+UBOOT_CAT:=bzcat
 UBOOT_PATCH_SOURCE:=u-boot-1.2.0-atmel-patch.tar.bz2
 
 MKIMAGE_BINLOC:=$(UBOOT_BUILD_DIR)/tools/mkimage
@@ -26,7 +26,7 @@
 
 UBOOT_PATCHES:=$(PROJECT_BUILD_DIR)/u-boot-patches
 
-UBOOT_ATMEL_BMP:=$(UBOOT_PATCHES)/atmel.bmp
+UBOOT_ATMEL_BMP:=$(UBOOT_PATCHES)/atmel.bmp
 
 UBOOT_SCR=$(BINARIES_DIR)/autoscript
 TARGET_UBOOT_IPADDR:=$(strip  $(subst ",, $(BR2_TARGET_UBOOT_IPADDR)))
@@ -35,31 +35,31 @@
 TARGET_UBOOT_NETMASK:=$(strip  $(subst ",, $(BR2_TARGET_UBOOT_NETMASK)))
 TARGET_UBOOT_ETHADDR:=$(strip  $(subst ",, $(BR2_TARGET_UBOOT_ETHADDR)))
 UBOOT_CUSTOM:=$(UBOOT_DIR)/include/custom.h
-
-$(DL_DIR)/$(UBOOT_SOURCE):
+
+$(DL_DIR)/$(UBOOT_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(UBOOT_SITE)/$(UBOOT_SOURCE)
 
-$(DL_DIR)/$(UBOOT_PATCH_SOURCE):
+$(DL_DIR)/$(UBOOT_PATCH_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(UBOOT_PATCH_SITE)/$(UBOOT_PATCH_SOURCE)
-
+
 $(UBOOT_DIR)/.unpacked: $(DL_DIR)/$(UBOOT_SOURCE)
-	mkdir -p   $(BUILD_DIR)
-	$(UBOOT_CAT) $(DL_DIR)/$(UBOOT_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	touch	$@
+	mkdir -p   $(BUILD_DIR)
+	$(UBOOT_CAT) $(DL_DIR)/$(UBOOT_SOURCE) | tar -C $(BUILD_DIR) -xvf -
+	touch	$@
 
 $(UBOOT_PATCHES)/.unpacked: $(DL_DIR)/$(UBOOT_PATCH_SOURCE)
 	mkdir -p $(UBOOT_PATCHES)
 	bzcat 	$(DL_DIR)/$(UBOOT_PATCH_SOURCE) | tar -C $(UBOOT_PATCHES) -xvf -
-	touch	$@
-
-$(UBOOT_DIR)/.patched.$(UBOOT_PATCH_SOURCE): $(UBOOT_DIR)/.unpacked $(UBOOT_PATCHES)/.unpacked
+	touch	$@
+
+$(UBOOT_DIR)/.patched.$(UBOOT_PATCH_SOURCE): $(UBOOT_DIR)/.unpacked $(UBOOT_PATCHES)/.unpacked
 	toolchain/patch-kernel.sh $(UBOOT_DIR) $(UBOOT_PATCHES) *.patch
-	touch $(UBOOT_DIR)/.patched.$(UBOOT_PATCH_SOURCE)
-#	cp $(UBOOT_CONFIG_FILE) $(UBOOT_DIR)/include/configs/.
+	touch $(UBOOT_DIR)/.patched.$(UBOOT_PATCH_SOURCE)
+#	cp $(UBOOT_CONFIG_FILE) $(UBOOT_DIR)/include/configs/.
 #	cp $(UBOOT_PATCHES)/cmd_defenv.c $(UBOOT_DIR)/common/.
-#	cp $(UBOOT_ATMEL_BMP) $(UBOOT_DIR)/tools/logos/.
-
-$(UBOOT_BUILD_DIR)/.configured: $(UBOOT_DIR)/.patched.$(UBOOT_PATCH_SOURCE)
+#	cp $(UBOOT_ATMEL_BMP) $(UBOOT_DIR)/tools/logos/.
+
+$(UBOOT_BUILD_DIR)/.configured: $(UBOOT_DIR)/.patched.$(UBOOT_PATCH_SOURCE)
 ifneq	($(strip $(UBOOT_CONFIG_FILE)),)
 	cp $(UBOOT_CONFIG_FILE) $(UBOOT_DIR)/include/configs/.
 endif
@@ -67,11 +67,11 @@
 		O=$(UBOOT_BUILD_DIR)	\
 		CONFIG_NOSOFTFLOAT=1		\
 		-C $(UBOOT_DIR) 	\
-		$(UBOOT_CONFIG)
-	$(SED) 's/ $$(SREC) $$(BIN)//' $(UBOOT_DIR)/examples/Makefile
-	touch $(UBOOT_BUILD_DIR)/.configured
-#	$(MAKE) O=$(UBOOT_BUILD_DIR) -C $(UBOOT_DIR) 
-
+		$(UBOOT_CONFIG)
+	$(SED) 's/ $$(SREC) $$(BIN)//' $(UBOOT_DIR)/examples/Makefile
+	touch $(UBOOT_BUILD_DIR)/.configured
+#	$(MAKE) O=$(UBOOT_BUILD_DIR) -C $(UBOOT_DIR) 
+
 $(MKIMAGE_BINLOC): $(UBOOT_BUILD_DIR)/.configured
 	$(MAKE) \
 		O=$(UBOOT_BUILD_DIR)		\
@@ -79,11 +79,11 @@
 		CONFIG_NOSOFTFLOAT=1		\
 		TOPDIR=$(UBOOT_DIR)		\
 		SRCTREE=$(UBOOT_DIR)		\
-		-C $(UBOOT_DIR)	tools
+		-C $(UBOOT_DIR)	tools
 	touch $(MKIMAGE_BINLOC)
-
+
 $(UBOOT_BUILD_DIR)/u-boot.bin:	$(UBOOT_BUILD_DIR)/.configured $(UBOOT_CUSTOM)
-	echo TARGET_CROSS=$(TARGET_CROSS)
+	echo TARGET_CROSS=$(TARGET_CROSS)
 	$(MAKE) O=$(UBOOT_BUILD_DIR)		\
 		CROSS_COMPILE=$(TARGET_CROSS)	\
 		CONFIG_NOSOFTFLOAT=1		\
@@ -93,11 +93,11 @@
 		-C $(UBOOT_DIR)
 
 $(BINARIES_DIR)/$(UBOOT_BIN):	$(UBOOT_BUILD_DIR)/u-boot.bin
-	mkdir -p $(BINARIES_DIR)
+	mkdir -p $(BINARIES_DIR)
 	cp $(UBOOT_BUILD_DIR)/u-boot.bin $(BINARIES_DIR)/$(UBOOT_BIN)
 
 /tftpboot/$(UBOOT_BIN):	$(UBOOT_BUILD_DIR)/u-boot.bin
-	mkdir -p /tftpboot
+	mkdir -p /tftpboot
 	cp $(UBOOT_BUILD_DIR)/u-boot.bin /tftpboot/$(UBOOT_BIN)
 
 uboot-bin:	$(BINARIES_DIR)/$(UBOOT_BIN)	/tftpboot/$(UBOOT_BIN)
@@ -170,25 +170,25 @@
 				$(UBOOT_SCR).$(PROJECT)
 	cp	$(UBOOT_SCR).$(PROJECT) /tftpboot
 
-$(MKIMAGE):	$(MKIMAGE_BINLOC) 
-	cp -f $(MKIMAGE_BINLOC)	 $(MKIMAGE)
-
-uboot: $(MKIMAGE)	uboot-bin $(UBOOT_SCR).$(PROJECT)
+$(MKIMAGE):	$(MKIMAGE_BINLOC) 
+	cp -f $(MKIMAGE_BINLOC)	 $(MKIMAGE)
 
-uboot-source: $(DL_DIR)/$(UBOOT_SOURCE)
-
-uboot-clean:
+uboot: $(MKIMAGE)	uboot-bin $(UBOOT_SCR).$(PROJECT)
+
+uboot-source: $(DL_DIR)/$(UBOOT_SOURCE)
+
+uboot-clean:
 	rm -fr	$(UBOOT_BUILD_DIR)
 	rm -fr	$(UBOOT_PATCHES)
 	rm -f	$(BINARIES_DIR)/$(UBOOT_BIN)
 	rm -fr	$(UBOOT_DIR)
 	rm -f	$(UBOOT_SCR)
 	rm -f	$(UBOOT_SCR).$(PROJECT)
-#	-$(MAKE) -C $(UBOOT_DIR)/uboot-tools clean
-
-uboot-dirclean:	uboot-clean
-	rm -rf $(UBOOT_DIR)
+#	-$(MAKE) -C $(UBOOT_DIR)/uboot-tools clean
 
+uboot-dirclean:	uboot-clean
+	rm -rf $(UBOOT_DIR)
+
 uboot-new:
 	rm -fr	$(UBOOT_BUILD_DIR)/u-boot
 	rm -fr	$(UBOOT_BUILD_DIR)/u-boot.gz
@@ -196,52 +196,52 @@
 	rm -fr	/tftpboot/$(UBOOT_BIN)
 	rm -fr	$(BINARIES_DIR)/$(UBOOT_BIN)
 
-.PHONY:	uboot-bin
-#############################################################
-#
-# Build the uboot root filesystem image
-#
-#############################################################
-
-UBOOT_TARGET:=$(IMAGE).uboot
-
-ubootroot: host-fakeroot makedevs uboot
-	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
-	@rm -rf $(TARGET_DIR)/usr/man
-	@rm -rf $(TARGET_DIR)/usr/info
-	-/sbin/ldconfig -r $(TARGET_DIR) 2>/dev/null
-	# Use fakeroot to pretend all target binaries are owned by root
-	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
-	touch $(STAGING_DIR)/.fakeroot.00000
-	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
-	echo "chown -R root:root $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
-	# Use fakeroot to pretend to create all needed device nodes
-	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
-		>> $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
-	# Use fakeroot so mkuboot believes the previous fakery
-	echo "$(UBOOT_DIR)/uboot-tools/mkuboot " \
-		    "$(TARGET_DIR) $(UBOOT_TARGET) " \
-		    "-noappend $(UBOOT_ENDIANNESS)" \
-		>> $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
-	chmod a+x $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
-	$(STAGING_DIR)/usr/bin/fakeroot -- $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
-	- at rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
-
-ubootroot-source: uboot-source
-
-ubootroot-clean:
-	-$(MAKE) -C $(UBOOT_DIR) clean
-
-ubootroot-dirclean:
-	rm -rf $(UBOOT_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(strip $(BR2_TARGET_UBOOT)),y)
-TARGETS+=uboot
+.PHONY:	uboot-bin
+#############################################################
+#
+# Build the uboot root filesystem image
+#
+#############################################################
+
+UBOOT_TARGET:=$(IMAGE).uboot
+
+ubootroot: host-fakeroot makedevs uboot
+	- at find $(TARGET_DIR) -type f -perm +111 | xargs $(STRIP) 2>/dev/null || true;
+	@rm -rf $(TARGET_DIR)/usr/man
+	@rm -rf $(TARGET_DIR)/usr/info
+	-/sbin/ldconfig -r $(TARGET_DIR) 2>/dev/null
+	# Use fakeroot to pretend all target binaries are owned by root
+	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
+	touch $(STAGING_DIR)/.fakeroot.00000
+	cat $(STAGING_DIR)/.fakeroot* > $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
+	echo "chown -R root:root $(TARGET_DIR)" >> $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
+	# Use fakeroot to pretend to create all needed device nodes
+	echo "$(STAGING_DIR)/bin/makedevs -d $(TARGET_DEVICE_TABLE) $(TARGET_DIR)" \
+		>> $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
+	# Use fakeroot so mkuboot believes the previous fakery
+	echo "$(UBOOT_DIR)/uboot-tools/mkuboot " \
+		    "$(TARGET_DIR) $(UBOOT_TARGET) " \
+		    "-noappend $(UBOOT_ENDIANNESS)" \
+		>> $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
+	chmod a+x $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
+	$(STAGING_DIR)/usr/bin/fakeroot -- $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
+	- at rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(UBOOT_TARGET))
+
+ubootroot-source: uboot-source
+
+ubootroot-clean:
+	-$(MAKE) -C $(UBOOT_DIR) clean
+
+ubootroot-dirclean:
+	rm -rf $(UBOOT_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_TARGET_UBOOT)),y)
+TARGETS+=uboot
 endif
 
 uboot-test:
@@ -267,7 +267,7 @@
 	- at ls	/tftpboot/$(UBOOT_BIN)
 	- at echo	"mkimage = $(MKIMAGE)"
 	- at ls	$(MKIMAGE)
-	- at echo	"u-boot script=$(UBOOT_SCR).$(PROJECT)"
+	- at echo	"u-boot script=$(UBOOT_SCR).$(PROJECT)"
 	- at ls	$(UBOOT_SCR).$(PROJECT)
 	- at echo	"u-boot script (ASCII)=$(UBOOT_SCR)"
 	- at ls	$(UBOOT_SCR)
