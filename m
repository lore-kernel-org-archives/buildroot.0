From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 20:49:15 +0100
Subject: [Buildroot] [git commit] uboot: integrate mkenvimage
Message-ID: <20130324194908.E5F849B290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b252919409e7bb63f6035fbe3b7167f4abbfed1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit provides configuration options to automatically generate a
binary environment image for U-Boot.
Two options are available (and mandatory):
 * the location of a text file describing U-Boot environment.
 * the size of the environment.

[Peter: fix Config.in indentation + typo]
Signed-off-by: Arnaud R??billout <rebillout@syscom.ch>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/uboot/Config.in |   23 +++++++++++++++++++++++
 boot/uboot/uboot.mk  |   16 ++++++++++++++++
 2 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index d22e23b..bc5ce19 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -212,4 +212,27 @@ config BR2_TARGET_UBOOT_SPL_NAME
 	  u-boot build. For most platform it is u-boot-spl.bin
 	  but not always. It is MLO on OMAP for example.
 
+menuconfig BR2_TARGET_UBOOT_ENVIMAGE
+	bool "Environment image"
+	help
+	  Generate a valid binary environment image from a text file
+	  describing the key=value pairs of the environment.
+
+	  The environment image will be called uboot-env.bin.
+
+if BR2_TARGET_UBOOT_ENVIMAGE
+
+config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
+	string "Source file for environment"
+	help
+	  Text file describing the environment.
+
+config BR2_TARGET_UBOOT_ENVIMAGE_SIZE
+	string "Size of environment"
+	help
+	  Size of envronment, can be prefixed with 0x for hexadecimal
+	  values.
+
+endif # BR2_TARGET_UBOOT_ENVIMAGE
+
 endif # BR2_TARGET_UBOOT
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index ea77259..c337e75 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -104,6 +104,9 @@ define UBOOT_INSTALL_IMAGES_CMDS
 	cp -dpf $(@D)/$(UBOOT_BIN) $(BINARIES_DIR)/
 	$(if $(BR2_TARGET_UBOOT_SPL),
 		cp -dpf $(@D)/$(BR2_TARGET_UBOOT_SPL_NAME) $(BINARIES_DIR)/)
+	$(if $(BR2_TARGET_UBOOT_ENVIMAGE),
+		$(HOST_DIR)/usr/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
+		-o $(BINARIES_DIR)/uboot-env.bin $(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE))
 endef
 
 define UBOOT_INSTALL_OMAP_IFT_IMAGE
@@ -125,6 +128,19 @@ UBOOT_POST_BUILD_HOOKS += UBOOT_BUILD_OMAP_IFT
 UBOOT_POST_INSTALL_IMAGES_HOOKS += UBOOT_INSTALL_OMAP_IFT_IMAGE
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE),y)
+# we NEED a environment settings unless we're at make source
+ifeq ($(filter source,$(MAKECMDGOALS)),)
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)),)
+$(error Please define a source file for Uboot environment (BR2_TARGET_UBOOT_ENVIMAGE_SOURCE setting))
+endif
+ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SIZE)),)
+$(error Please provide Uboot environment size (BR2_TARGET_UBOOT_ENVIMAGE_SIZE setting))
+endif
+endif
+UBOOT_DEPENDENCIES += host-uboot-tools
+endif
+
 $(eval $(generic-package))
 
 ifeq ($(BR2_TARGET_UBOOT),y)
