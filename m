From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 17:05:26 +0200
Subject: [Buildroot] [PATCH 14/35] u-boot: support building for mkimage
In-Reply-To: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b5da8b5d7c45528088686c22a0cfbbc9a127a34a.1271170913.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When mkimage needs to be built (when building an uImage for the Linux
kernel is needed), but U-Boot hasn't been selected for compilation,
U_BOOT_VERSION and U_BOOT_BOARD_NAME aren't defined. Define them to
default values in this case.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/u-boot.mk |   26 ++++++++++++++++++--------
 1 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index ac16c8b..4425f52 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -4,6 +4,15 @@
 #
 #############################################################
 U_BOOT_VERSION:=$(call qstrip,$(BR2_UBOOT_VERSION))
+U_BOOT_BOARD_NAME:=$(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
+
+# An U-Boot version and board might not be specified if U-Boot isn't
+# explicitly selected, but mkimage needs to be compiled. In this case,
+# we just take a random U-Boot version and configuration.
+ifeq ($(U_BOOT_VERSION),)
+U_BOOT_VERSION=2010.03
+U_BOOT_BOARD_NAME=smdk2410
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
@@ -154,14 +163,15 @@ $(BINARIES_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/$(U_BOOT_BIN)
 	rm -f $(BINARIES_DIR)/$(U_BOOT_BIN)
 	cp -dpf $(U_BOOT_DIR)/$(U_BOOT_BIN) $(BINARIES_DIR)/
 
-$(U_BOOT_TOOLS): $(U_BOOT_DIR)/$(U_BOOT_BIN)
+$(MKIMAGE): $(U_BOOT_DIR)/.configured
 	mkdir -p $(@D)
-	cp -dpf $(U_BOOT_DIR)/tools/mkimage $@
+	$(MAKE) -C $(U_BOOT_DIR) tools
+	cp -dpf $(U_BOOT_DIR)/tools/mkimage $(@D)
 
-$(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/$(U_BOOT_BIN)
+$(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/.configured
 	mkdir -p $(@D)
 	$(TARGET_CC) -I$(U_BOOT_DIR)/include -I$(U_BOOT_DIR)/tools \
-		-DUSE_HOSTCC -o $@ \
+		-DUSE_HOSTCC -o $@
 		$(U_BOOT_DIR)/common/image.c \
 		$(wildcard $(addprefix $(U_BOOT_DIR)/tools/,default_image.c \
 			fit_image.c imximage.c kwbimage.c mkimage.c)) \
@@ -171,7 +181,7 @@ $(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/$(U_BOOT_BIN)
 
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
-$(TARGET_DIR)/usr/sbin/fw_printenv: $(U_BOOT_DIR)/$(U_BOOT_BIN)
+$(TARGET_DIR)/usr/sbin/fw_printenv: $(U_BOOT_DIR)/.configured
 	mkdir -p $(@D)
 	$(TARGET_CC) -I$(U_BOOT_DIR)/include -I$(LINUX_HEADERS_DIR)/include \
 		-DUSE_HOSTCC -o $@ \
-- 
1.6.3.3
