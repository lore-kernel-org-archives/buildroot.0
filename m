From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 20 Jul 2007 00:54:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel/u-boot
Message-ID: <20070720075422.525D4A6875@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-20 00:54:21 -0700 (Fri, 20 Jul 2007)
New Revision: 19169

Log:
U-Boot cleanup

Modified:
   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk


Changeset:
Modified: trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2007-07-20 07:47:31 UTC (rev 19168)
+++ trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2007-07-20 07:54:21 UTC (rev 19169)
@@ -45,13 +45,12 @@
 $(UBOOT_DIR)/.unpacked: $(DL_DIR)/$(UBOOT_SOURCE)
 	mkdir -p   $(BUILD_DIR)
 	$(UBOOT_CAT) $(DL_DIR)/$(UBOOT_SOURCE) | tar -C $(BUILD_DIR) -xvf -
-	touch $(UBOOT_DIR)/.unpacked
-	ls	$(UBOOT_DIR)/.unpacked
+	touch	$@
 
 $(UBOOT_PATCHES)/.unpacked: $(DL_DIR)/$(UBOOT_PATCH_SOURCE)
 	mkdir -p $(UBOOT_PATCHES)
 	bzcat 	$(DL_DIR)/$(UBOOT_PATCH_SOURCE) | tar -C $(UBOOT_PATCHES) -xvf -
-	touch $(UBOOT_PATCHES)/.unpacked
+	touch	$@
 
 $(UBOOT_DIR)/.patched.$(UBOOT_PATCH_SOURCE): $(UBOOT_DIR)/.unpacked $(UBOOT_PATCHES)/.unpacked
 	toolchain/patch-kernel.sh $(UBOOT_DIR) $(UBOOT_PATCHES) *.patch
@@ -105,10 +104,10 @@
 
 $(UBOOT_BUILD_DIR)/.customized:	.config	$(UBOOT_BUILD_DIR)/.configured
 	echo	"/* Automatically generated file, do not edit */"		>  $(UBOOT_CUSTOM)
-ifneq	($(HOSTNAME),)
+ifneq	($(TARGET_HOSTNAME),)
 	echo	"#if defined(CONFIG_HOSTNAME)"					>> $(UBOOT_CUSTOM)
 	echo	"#undef	 CONFIG_HOSTNAME"					>> $(UBOOT_CUSTOM)
-	echo	"#define CONFIG_HOSTNAME		$(HOSTNAME)"		>> $(UBOOT_CUSTOM)
+	echo	"#define CONFIG_HOSTNAME		$(TARGET_HOSTNAME)"	>> $(UBOOT_CUSTOM)
 	echo	"#endif"							>> $(UBOOT_CUSTOM)
 endif
 ifneq	($(TARGET_UBOOT_IPADDR),)
@@ -144,7 +143,7 @@
 	echo setenv linux		$(LINUX26_KERNEL)			>> $(UBOOT_SCR)
 	echo setenv kernel-version	$(LINUX26_VERSION)			>> $(UBOOT_SCR)
 	echo setenv kernel-date		$(DATE)					>> $(UBOOT_SCR)
-	echo setenv hostname		$(HOSTNAME)				>> $(UBOOT_SCR)
+	echo setenv hostname		$(TARGET_HOSTNAME)			>> $(UBOOT_SCR)
 	echo setenv fs-date		$(DATE)					>> $(UBOOT_SCR)
 	echo setenv rd-1		rootfs.$(BR2_ARCH)-$(DATE).ext2		>> $(UBOOT_SCR)
 	echo setenv rd-2		rootfs.$(BR2_ARCH)-$(DATE).jffs2	>> $(UBOOT_SCR)
@@ -159,7 +158,7 @@
 	echo setargs								>> $(UBOOT_SCR)
 	echo saveenv								>> $(UBOOT_SCR)
 
-$(UBOOT_SCR).$(HOSTNAME):	$(UBOOT_SCR)	 $(MKIMAGE)
+$(UBOOT_SCR).$(PROJECT):	$(UBOOT_SCR)	 $(MKIMAGE)
 	$(MKIMAGE)  -A arm \
 				-O linux	\
 				-T script	\
@@ -168,13 +167,13 @@
 				-e 0		\
 				-n "autoscr config" \
 				-d $(UBOOT_SCR)	\
-				$(UBOOT_SCR).$(HOSTNAME)
-	cp	$(UBOOT_SCR).$(HOSTNAME) /tftpboot
+				$(UBOOT_SCR).$(PROJECT)
+	cp	$(UBOOT_SCR).$(PROJECT) /tftpboot
 
 $(MKIMAGE):	$(MKIMAGE_BINLOC) 
 	cp -f $(MKIMAGE_BINLOC)	 $(MKIMAGE)
 
-uboot: $(MKIMAGE)	uboot-bin $(UBOOT_SCR).$(HOSTNAME)
+uboot: $(MKIMAGE)	uboot-bin $(UBOOT_SCR).$(PROJECT)
 
 uboot-source: $(DL_DIR)/$(UBOOT_SOURCE)
 
@@ -184,7 +183,7 @@
 	rm -f	$(BINARIES_DIR)/$(UBOOT_BIN)
 	rm -fr	$(UBOOT_DIR)
 	rm -f	$(UBOOT_SCR)
-	rm -f	$(UBOOT_SCR).$(HOSTNAME)
+	rm -f	$(UBOOT_SCR).$(PROJECT)
 #	-$(MAKE) -C $(UBOOT_DIR)/uboot-tools clean
 
 uboot-dirclean:	uboot-clean
@@ -246,10 +245,30 @@
 endif
 
 uboot-test:
+	- at echo	source=$(DL_DIR)/$(UBOOT_SOURCE)
+	- at ls	$(DL_DIR)/$(UBOOT_SOURCE)
+	- at echo	patch=$(DL_DIR)/$(UBOOT_PATCH_SOURCE)
+	- at ls	$(DL_DIR)/$(UBOOT_PATCH_SOURCE)
+	- at echo	unpacked=$(UBOOT_PATCHES)/.unpacked
+	- at ls	$(UBOOT_PATCHES)/.unpacked
+	- at echo	patch-unpacked=$(UBOOT_PATCHES)/.unpacked
+	- at ls	$(UBOOT_PATCHES)/.unpacked
+	- at echo	patched-source=$(UBOOT_DIR)/.patched.$(UBOOT_PATCH_SOURCE)
+	- at ls	$(UBOOT_DIR)/.patched.$(UBOOT_PATCH_SOURCE)
+	- at echo	configured=$(UBOOT_BUILD_DIR)/.configured
+	- at ls	$(UBOOT_BUILD_DIR)/.configured
+	- at echo	mkimage=$(MKIMAGE_BINLOC)
+	- at ls	$(MKIMAGE_BINLOC)
+	- at echo	u-boot.bin=$(UBOOT_BUILD_DIR)/u-boot.bin
+	- at ls	$(UBOOT_BUILD_DIR)/u-boot.bin
+	- at echo	binaries-u-boot.bin=$(BINARIES_DIR)/$(UBOOT_BIN)
+	- at ls	$(BINARIES_DIR)/$(UBOOT_BIN)
+	- at echo	tftpboot=/tftpboot/$(UBOOT_BIN)
+	- at ls	/tftpboot/$(UBOOT_BIN)
 	- at echo	"mkimage = $(MKIMAGE)"
 	- at ls	$(MKIMAGE)
-	- at echo	"u-boot script=$(UBOOT_SCR).$(HOSTNAME)"
-	- at ls	$(UBOOT_SCR).$(HOSTNAME)
+	- at echo	"u-boot script=$(UBOOT_SCR).$(PROJECT)"
+	- at ls	$(UBOOT_SCR).$(PROJECT)
 	- at echo	"u-boot script (ASCII)=$(UBOOT_SCR)"
 	- at ls	$(UBOOT_SCR)
 	- at echo "mkimage binary=$(MKIMAGE_BINLOC)"
