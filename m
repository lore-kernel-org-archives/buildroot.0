From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jun 2010 16:21:48 +0200
Subject: [Buildroot] [PATCH 14/49] u-boot: support building for mkimage
In-Reply-To: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f2d16ae0e17370131e64438cd50d5a6c7ab0ea8d.1276352308.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To build mkimage for the host (which is needed to build an uImage of
the kernel), it is not necessary to configure U-Boot, and therefore to
have a particular board selected.

Therefore, this commit:

 * Adds a verification at U-Boot configure step that a U-Boot board
   name has been defined

 * Sets a default U-Boot version if none has been specified, so that
   even when U-Boot isn't selected but we want to build mkimage for
   the host, a particular U-Boot version is picked.

 * Make the host mkimage target depend only on U-Boot being
   downloaded/extracted/patched, and the target mkimage/fw_printenv
   targets depend on U-Boot being fully configured.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/u-boot.mk |   28 +++++++++++++++++++++-------
 1 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index ac16c8b..00724ba 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -4,6 +4,15 @@
 #
 #############################################################
 U_BOOT_VERSION:=$(call qstrip,$(BR2_UBOOT_VERSION))
+U_BOOT_BOARD_NAME:=$(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
+
+# U-Boot may not be selected in the configuration, but mkimage might
+# be needed to build/prepare a kernel image. In this case, we just
+# pick some random stable U-Boot version that will be used just to
+# build mkimage.
+ifeq ($(U_BOOT_VERSION),)
+U_BOOT_VERSION=2010.03
+endif
 
 U_BOOT_SOURCE:=u-boot-$(U_BOOT_VERSION).tar.bz2
 
@@ -30,9 +39,6 @@ TARGET_UBOOT_ETHADDR:=$(call qstrip,$(BR2_TARGET_UBOOT_ETHADDR))
 
 # u-boot still uses arch=ppc for powerpc
 U_BOOT_ARCH=$(KERNEL_ARCH:powerpc=ppc)
-ifeq ($(UBOOT_BOARD_NAME),)
-UBOOT_BOARD_NAME:=$(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
-endif
 
 U_BOOT_INC_CONF_FILE:=$(U_BOOT_DIR)/include/config.h
 
@@ -73,6 +79,9 @@ endif
 	touch $@
 
 $(U_BOOT_DIR)/.configured: $(U_BOOT_DIR)/.patched
+ifeq ($(U_BOOT_BOARD_NAME),)
+	$(error NO U-Boot board name set. Check your BR2_TARGET_UBOOT_BOARDNAME setting)
+endif
 	$(TARGET_CONFIGURE_OPTS)		\
 		CFLAGS="$(TARGET_CFLAGS)"	\
 		LDFLAGS="$(TARGET_LDFLAGS)"	\
@@ -154,11 +163,16 @@ $(BINARIES_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/$(U_BOOT_BIN)
 	rm -f $(BINARIES_DIR)/$(U_BOOT_BIN)
 	cp -dpf $(U_BOOT_DIR)/$(U_BOOT_BIN) $(BINARIES_DIR)/
 
-$(U_BOOT_TOOLS): $(U_BOOT_DIR)/$(U_BOOT_BIN)
+# Build just mkimage for the host. It might have already been built by
+# the U-Boot build procedure, but mkimage may also be needed even if
+# U-Boot isn't selected in the configuration, to generate a kernel
+# uImage.
+$(MKIMAGE): $(U_BOOT_DIR)/.patched
 	mkdir -p $(@D)
-	cp -dpf $(U_BOOT_DIR)/tools/mkimage $@
+	$(MAKE) -C $(U_BOOT_DIR) tools
+	cp -dpf $(U_BOOT_DIR)/tools/mkimage $(@D)
 
-$(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/$(U_BOOT_BIN)
+$(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/.configured
 	mkdir -p $(@D)
 	$(TARGET_CC) -I$(U_BOOT_DIR)/include -I$(U_BOOT_DIR)/tools \
 		-DUSE_HOSTCC -o $@ \
@@ -171,7 +185,7 @@ $(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/$(U_BOOT_BIN)
 
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
-$(TARGET_DIR)/usr/sbin/fw_printenv: $(U_BOOT_DIR)/$(U_BOOT_BIN)
+$(TARGET_DIR)/usr/sbin/fw_printenv: $(U_BOOT_DIR)/.configured
 	mkdir -p $(@D)
 	$(TARGET_CC) -I$(U_BOOT_DIR)/include -I$(LINUX_HEADERS_DIR)/include \
 		-DUSE_HOSTCC -o $@ \
-- 
1.7.0.4
