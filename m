From: Alexey Lukyanchuk <skif@skif-web.ru>
Date: Mon,  9 Mar 2020 12:55:40 +0300
Subject: [Buildroot] [PATCH 1/1] boot/grub2: add '--memdisk' option to
 grub-makeimage
Message-ID: <20200309095540.15448-1-skif@skif-web.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The memdisk is a virtual disk device viewed by grub.
Memdisk can store some files(pictures, gpg key for verify module,etc), grub modules, into a core.img.
In UEFI platform, grub-mkimage does not pose a limit on the size of memdisk.
It's good solution for secure-boot or embedded systems

Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
---
 boot/grub2/Config.in |  6 ++++++
 boot/grub2/grub2.mk  | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index e45133999e..6ee2f351d9 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -107,6 +107,12 @@ config BR2_TARGET_GRUB2_BUILTIN_CONFIG
 	  device and other configuration parameters, but however menu
 	  entries cannot be described in this embedded configuration.
 
+config BR2_TARGET_GRUB2_MEMDISK_DIR
+	string "memdisk"
+	help
+	  Path to directory that will be a memdisk (-m option in 
+	  grub2-mkimage)
+
 config BR2_TARGET_GRUB2_INSTALL_TOOLS
 	bool "install tools"
 	help
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index a202525d71..0627c6857f 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -22,6 +22,7 @@ endif
 GRUB2_BUILTIN_MODULES = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES))
 GRUB2_BUILTIN_CONFIG = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_CONFIG))
 GRUB2_BOOT_PARTITION = $(call qstrip,$(BR2_TARGET_GRUB2_BOOT_PARTITION))
+GRUB2_MEMDISK_DIR = $(call qstrip,$(BR2_TARGET_GRUB2_MEMDISK_DIR))
 
 ifeq ($(BR2_TARGET_GRUB2_I386_PC),y)
 GRUB2_IMAGE = $(BINARIES_DIR)/grub.img
@@ -87,6 +88,15 @@ GRUB2_CONF_ENV = \
 	TARGET_OBJCOPY="$(TARGET_OBJCOPY)" \
 	TARGET_STRIP="$(TARGET_CROSS)strip"
 
+ifneq ($(GRUB2_MEMDISK_DIR),)
+GRUB2_POST_BUILD_HOOKS += GRUB2_MAKE_MEMDISK
+define GRUB2_MAKE_MEMDISK
+	mkdir -p $(@D)/grub2_memdisk
+	cp -a $(GRUB2_MEMDISK_DIR)/* $(@D)/grub2_memdisk/
+	tar -cvf $(@D)/memdisk.tar -C $(@D)/grub2_memdisk/ .
+endef
+endif
+
 GRUB2_CONF_OPTS = \
 	--target=$(GRUB2_TARGET) \
 	--with-platform=$(GRUB2_PLATFORM) \
@@ -121,6 +131,7 @@ define GRUB2_INSTALL_IMAGES_CMDS
 		-O $(GRUB2_TUPLE) \
 		-o $(GRUB2_IMAGE) \
 		-p "$(GRUB2_PREFIX)" \
+		$(if $(BR2_TARGET_GRUB2_MEMDISK_DIR),-m $(@D)/memdisk.tar) \
 		$(if $(GRUB2_BUILTIN_CONFIG),-c $(GRUB2_BUILTIN_CONFIG)) \
 		$(GRUB2_BUILTIN_MODULES)
 	mkdir -p $(dir $(GRUB2_CFG))
-- 
2.17.1
