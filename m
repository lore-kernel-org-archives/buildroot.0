From: Adam Duskett <aduskett@gmail.com>
Date: Thu,  2 Feb 2017 08:40:23 -0500
Subject: [Buildroot] [PATCH 1/1] grub2: add option to specify grub.cfg file.
Message-ID: <20170202134023.25002-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently the menu file for grub is copied from boot/grub2/grub.cfg
with no way for a user to change the preset settings.  This is a small
patch but being able to specify a menu file allows for much more flexibility
that is desired.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 boot/grub2/Config.in | 6 ++++++
 boot/grub2/grub2.mk  | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index 7dc5cae..8aa0c2e 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -166,4 +166,10 @@ config BR2_TARGET_GRUB2_BUILTIN_CONFIG
 	  device and other configuration parameters, but however menu
 	  entries cannot be described in this embedded configuration.
 
+config BR2_TARGET_GRUB2_MENU_CONFIG
+	string "Menu config file"
+	default "boot/grub2/grub.cfg"
+	help
+	  Path to a grub.cfg file that will be installed at /boot/grub/grub.cfg
+
 endif # BR2_TARGET_GRUB2
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index dc4e51e..6c2a22c 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -14,6 +14,7 @@ GRUB2_DEPENDENCIES = host-bison host-flex
 GRUB2_BUILTIN_MODULES = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_MODULES))
 GRUB2_BUILTIN_CONFIG = $(call qstrip,$(BR2_TARGET_GRUB2_BUILTIN_CONFIG))
 GRUB2_BOOT_PARTITION = $(call qstrip,$(BR2_TARGET_GRUB2_BOOT_PARTITION))
+GRUB2_MENU_CONFIG = $(call qstrip,$(BR2_TARGET_GRUB2_MENU_CONFIG))
 
 ifeq ($(BR2_TARGET_GRUB2_I386_PC),y)
 GRUB2_IMAGE = $(BINARIES_DIR)/grub.img
@@ -94,7 +95,7 @@ define GRUB2_IMAGE_INSTALLATION
 		$(if $(GRUB2_BUILTIN_CONFIG),-c $(GRUB2_BUILTIN_CONFIG)) \
 		$(GRUB2_BUILTIN_MODULES)
 	mkdir -p $(dir $(GRUB2_CFG))
-	$(INSTALL) -D -m 0644 boot/grub2/grub.cfg $(GRUB2_CFG)
+	$(INSTALL) -D -m 0644 $(GRUB2_MENU_CONFIG) $(GRUB2_CFG)
 	$(GRUB2_IMAGE_INSTALL_ELTORITO)
 endef
 GRUB2_POST_INSTALL_TARGET_HOOKS += GRUB2_IMAGE_INSTALLATION
-- 
2.9.3
