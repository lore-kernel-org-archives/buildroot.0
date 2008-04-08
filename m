From: Michel (BusError) <buildroot.atmel.com@pollet.net>
Date: Tue,  8 Apr 2008 20:41:43 +0100
Subject: [Buildroot] [PATCH] U-BOOT: Added support for linux userland
	environmnet access
In-Reply-To: <1207683703-14842-4-git-send-email-buildroot.atmel.com@pollet.net>
References: <1207683703-14842-1-git-send-email-buildroot.atmel.com@pollet.net>
	<1207683703-14842-2-git-send-email-buildroot.atmel.com@pollet.net>
	<1207683703-14842-3-git-send-email-buildroot.atmel.com@pollet.net>
	<1207683703-14842-4-git-send-email-buildroot.atmel.com@pollet.net>
Message-ID: <1207683703-14842-5-git-send-email-buildroot.atmel.com@pollet.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michel <michel.git@pollet.net>

The config allows to add fw_printenv to the target filesystem, and also
to selectively add a link to fw_setenv and allow changing the environment.
The new configuration options also let you specify a (simple) set of
parameters that will be used to create a working comfiguration file in
the target's .../etc/fw_env.config.
Note that the fw_setenv will only work if the MTD partition is R/W. Some
kernels (avr32...) map it read-only by default.
---
 target/u-boot/Config.in   |   56 +++++++++++++++++++++++++++++++++++++++++++++
 target/u-boot/Makefile.in |   29 +++++++++++++++++++++++
 2 files changed, 85 insertions(+), 0 deletions(-)

diff --git a/target/u-boot/Config.in b/target/u-boot/Config.in
index 66ebaf5..c31bccf 100644
--- a/target/u-boot/Config.in
+++ b/target/u-boot/Config.in
@@ -20,6 +20,62 @@ config BR2_TARGET_UBOOT_CUSTOM_PATCH
 	  If your board requires a custom patch, add the path to the file here.
 	  Most users may leave this empty
 
+config BR2_TARGET_UBOOT_LINUX_ENV
+	bool "fw_printenv: linux userspace environment access"
+	depends on BR2_TARGET_UBOOT
+	help
+	  Compile fw_printenv and add it to the target linux filesystem
+	  It is also possible to symlink fw_setenv from it.
+	  Note that the command needs a /etc/fw_env.config to work. Check
+	  u-boot/tools/env/fw_env.config for an example to be adapted for
+	  your board.
+
+config BR2_TARGET_UBOOT_LINUX_SETENV
+	bool "Also create fw_setenv link"
+	depends on BR2_TARGET_UBOOT_LINUX_ENV
+	help
+	  Creates the link to fw_printenv to allow userspace to change
+	  u-boot environment variables from shell scripts.
+	  *Note* that your board setup code might mark the environment
+	  flash partition as read only, in which case you will have to change
+	  that for this command to work.
+
+config BR2_TARGET_UBOOT_LINUX_HASENV
+	bool "Specify a default environment access"
+	depends on BR2_TARGET_UBOOT_LINUX_ENV
+	help
+	  Specifies the environment location and size for a default
+	  Non-redundant u-boot environment. This will create a
+	  /etc/fw_env.config into the target filesystem
+
+config BR2_TARGET_UBOOT_ENV_MTDDEV
+	string "MTD device pathname"
+	depends on BR2_TARGET_UBOOT_LINUX_HASENV
+	default "/dev/mtd2"
+	help
+	  MTD device to use for environment
+
+config BR2_TARGET_UBOOT_ENV_MTDOFF
+	string "MTD device offset"
+	depends on BR2_TARGET_UBOOT_LINUX_HASENV
+	default "0x0000"
+	help
+	  MTD device offset
+
+config BR2_TARGET_UBOOT_ENV_MTDSIZE
+	string "MTD environment sise"
+	depends on BR2_TARGET_UBOOT_LINUX_HASENV
+	default "0x10000"
+	help
+	  MTD environment total size
+
+config BR2_TARGET_UBOOT_ENV_MTDESIZE
+	string "MTD environment erase sector sise"
+	depends on BR2_TARGET_UBOOT_LINUX_HASENV
+	default "0x10000"
+	help
+	  MTD environment erase sector size
+
 config BR2_TARGET_UBOOT_SERVERIP
 	string "server ip"
 	depends on BR2_TARGET_UBOOT
diff --git a/target/u-boot/Makefile.in b/target/u-boot/Makefile.in
index deb10ea..a27ae83 100644
--- a/target/u-boot/Makefile.in
+++ b/target/u-boot/Makefile.in
@@ -11,6 +11,8 @@ U_BOOT_PATCH_DIR:=$(PROJECT_BUILD_DIR)/u-boot-patches
 U_BOOT_CAT:=$(BZCAT)
 U_BOOT_BIN:=u-boot.bin
 U_BOOT_TOOLS_BIN:=mkimage
+U_BOOT_PRINTENV_BIN:=fw_printenv
+U_BOOT_ENV_TARGET_DIR:=$(TARGET_DIR)/usr/bin
 
 ifneq ($(BR2_TARGET_U_BOOT_CONFIG_BOARD),)
 U_BOOT_INC_CONF_FILE:=$(U_BOOT_DIR)/include/configs/$(subst _config,,$(BR2_TARGET_U_BOOT_CONFIG_BOARD)).h
@@ -42,6 +44,10 @@ ifneq ($(strip $(BR2_TARGET_UBOOT_CUSTOM_PATCH)),"")
 	cp -dpr $(BR2_TARGET_UBOOT_CUSTOM_PATCH) $(U_BOOT_PATCH_DIR)
 	toolchain/patch-kernel.sh $(U_BOOT_DIR) $(U_BOOT_PATCH_DIR) *.patch
 endif
+ifeq ($(strip $(BR2_TARGET_UBOOT_LINUX_ENV)),y)
+	toolchain/patch-kernel.sh $(U_BOOT_DIR) target/u-boot/ \
+		u-boot-$(U_BOOT_VERSION)-env-*.patch
+endif
 	touch $@
 
 $(U_BOOT_DIR)/.header_copied: $(U_BOOT_DIR)/.patched
@@ -105,11 +111,34 @@ $(U_BOOT_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/.header_modified
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		$(MAKE) -C $(U_BOOT_DIR)
 
+$(U_BOOT_DIR)/tools/env/$(U_BOOT_PRINTENV_BIN): 
+	$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		$(MAKE) -C $(U_BOOT_DIR) env
+
+$(U_BOOT_DIR)/$(U_BOOT_PRINTENV_BIN): $(U_BOOT_DIR)/tools/env/$(U_BOOT_PRINTENV_BIN)
+	cp -dpf $(U_BOOT_DIR)/tools/env/$(U_BOOT_PRINTENV_BIN) $(U_BOOT_DIR)
+
+$(U_BOOT_ENV_TARGET_DIR)/$(U_BOOT_PRINTENV_BIN): $(U_BOOT_DIR)/$(U_BOOT_PRINTENV_BIN)
+	cp -dpf $(U_BOOT_DIR)/$(U_BOOT_PRINTENV_BIN) $(U_BOOT_ENV_TARGET_DIR)
+ifeq ($(strip $(BR2_TARGET_UBOOT_LINUX_SETENV)),y)
+	(cd $(U_BOOT_ENV_TARGET_DIR); ln -s fw_printenv fw_setenv)
+endif
+ifeq ($(strip $(BR2_TARGET_UBOOT_LINUX_HASENV)),y)
+	( echo "# Automaticaly Generated from buildroot config";echo "$(BR2_TARGET_UBOOT_ENV_MTDDEV) $(BR2_TARGET_UBOOT_ENV_MTDOFF) $(BR2_TARGET_UBOOT_ENV_MTDSIZE) $(BR2_TARGET_UBOOT_ENV_MTDESIZE)") >$(TARGET_DIR)/etc/fw_env.config
+endif
+
+
 $(BINARIES_DIR)/$(U_BOOT_BIN): $(U_BOOT_DIR)/$(U_BOOT_BIN)
 	cp -dpf $(U_BOOT_DIR)/$(U_BOOT_BIN) $(BINARIES_DIR)
 	cp -dpf $(U_BOOT_DIR)/tools/$(U_BOOT_TOOLS_BIN) $(STAGING_DIR)/usr/bin/
 
+ifeq ($(strip $(BR2_TARGET_UBOOT_LINUX_ENV)),y)
+u-boot: gcc $(BINARIES_DIR)/$(U_BOOT_BIN) $(U_BOOT_ENV_TARGET_DIR)/$(U_BOOT_PRINTENV_BIN)
+else
 u-boot: gcc $(BINARIES_DIR)/$(U_BOOT_BIN)
+endif
 
 u-boot-clean:
 	-$(MAKE) -C $(U_BOOT_DIR) clean
-- 
1.5.4.3
