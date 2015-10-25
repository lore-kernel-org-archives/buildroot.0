From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 25 Oct 2015 20:33:53 +0100
Subject: [Buildroot] [PATCH 1/4] barebox: prepare for x-loader build
In-Reply-To: <1445801636-7554-1-git-send-email-pieter@boesman.nl>
References: <1445801636-7554-1-git-send-email-pieter@boesman.nl>
Message-ID: <1445801636-7554-2-git-send-email-pieter@boesman.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No functional changes, but prepares barebox for building with two
configurations (similar to package/gcc).
---
 boot/barebox/Config.in                      |  9 ++++
 boot/barebox/barebox-boot/barebox-boot.hash |  1 +
 boot/barebox/barebox-boot/barebox-boot.mk   | 80 +++++++++++++++++++++++++++++
 boot/barebox/barebox.mk                     | 60 +---------------------
 4 files changed, 91 insertions(+), 59 deletions(-)
 create mode 120000 boot/barebox/barebox-boot/barebox-boot.hash
 create mode 100644 boot/barebox/barebox-boot/barebox-boot.mk

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 7e81181..437407d 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -64,6 +64,13 @@ config BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION
 
 endif
 
+config BR2_TARGET_BAREBOX_BOOT
+	bool "Build Barebox bootloader"
+	default y
+	help
+	  Build the Barebox bootloader
+
+if BR2_TARGET_BAREBOX_BOOT
 
 choice
 	prompt "Barebox configuration"
@@ -122,3 +129,5 @@ config BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH
 	  the same name as the directory name given here.
 
 endif
+
+endif
diff --git a/boot/barebox/barebox-boot/barebox-boot.hash b/boot/barebox/barebox-boot/barebox-boot.hash
new file mode 120000
index 0000000..b6462b8
--- /dev/null
+++ b/boot/barebox/barebox-boot/barebox-boot.hash
@@ -0,0 +1 @@
+../barebox.hash
\ No newline at end of file
diff --git a/boot/barebox/barebox-boot/barebox-boot.mk b/boot/barebox/barebox-boot/barebox-boot.mk
new file mode 100644
index 0000000..a76a496
--- /dev/null
+++ b/boot/barebox/barebox-boot/barebox-boot.mk
@@ -0,0 +1,80 @@
+################################################################################
+#
+# barebox-boot
+#
+################################################################################
+
+BAREBOX_BOOT_VERSION = $(BAREBOX_VERSION)
+BAREBOX_BOOT_SITE = $(BAREBOX_SITE)
+BAREBOX_BOOT_SITE_METHOD = $(BAREBOX_SITE_METHOD)
+BAREBOX_BOOT_SOURCE = $(BAREBOX_SOURCE)
+BAREBOX_BOOT_DEPENDENCIES = $(BAREBOX_DEPENDENCIES)
+BAREBOX_BOOT_LICENSE = $(BAREBOX_LICENSE)
+BAREBOX_BOOT_LICENSE_FILES = $(BAREBOX_LICENSE_FILES)
+BAREBOX_BOOT_POST_PATCH_HOOKS += $(BAREBOX_POST_PATCH_HOOKS)
+BAREBOX_BOOT_MAKE_FLAGS = $(BAREBOX_MAKE_FLAGS)
+BAREBOX_BOOT_MAKE_ENV = $(BAREBOX_MAKE_ENV)
+BAREBOX_BOOT_INSTALL_IMAGES = $(BAREBOX_INSTALL_IMAGES)
+
+ifeq ($(BR2_TARGET_BAREBOX_USE_DEFCONFIG),y)
+BAREBOX_BOOT_SOURCE_CONFIG = $(BAREBOX_BOOT_DIR)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,\
+	$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))_defconfig
+else ifeq ($(BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG),y)
+BAREBOX_BOOT_SOURCE_CONFIG = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE))
+endif
+
+BAREBOX_BOOT_KCONFIG_FILE = $(BAREBOX_BOOT_SOURCE_CONFIG)
+BAREBOX_BOOT_KCONFIG_FRAGMENT_FILES = $(BAREBOX_KCONFIG_FRAGMENT_FILES)
+BAREBOX_BOOT_KCONFIG_EDITORS = $(BAREBOX_KCONFIG_EDITORS)
+BAREBOX_BOOT_KCONFIG_OPTS = $(BAREBOX_MAKE_FLAGS)
+
+ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
+define BAREBOX_BOOT_BUILD_BAREBOXENV_CMDS
+	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -o $(@D)/bareboxenv \
+		$(@D)/scripts/bareboxenv.c
+endef
+endif
+
+ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_ENV),y)
+BAREBOX_BOOT_ENV_NAME = $(notdir $(call qstrip,\
+	$(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)))
+define BAREBOX_BOOT_BUILD_CUSTOM_ENV
+	$(@D)/scripts/bareboxenv -s \
+		$(call qstrip, $(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)) \
+		$(@D)/$(BAREBOX_BOOT_ENV_NAME)
+endef
+define BAREBOX_BOOT_INSTALL_CUSTOM_ENV
+	cp $(@D)/$(BAREBOX_BOOT_ENV_NAME) $(BINARIES_DIR)
+endef
+endif
+
+define BAREBOX_BOOT_BUILD_CMDS
+	$(BAREBOX_BOOT_BUILD_BAREBOXENV_CMDS)
+	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_BOOT_MAKE_FLAGS) -C $(@D)
+	$(BAREBOX_BOOT_BUILD_CUSTOM_ENV)
+endef
+
+define BAREBOX_BOOT_INSTALL_IMAGES_CMDS
+	if test -h $(@D)/barebox-flash-image ; then \
+		cp -L $(@D)/barebox-flash-image $(BINARIES_DIR)/barebox.bin ; \
+	else \
+		cp $(@D)/barebox.bin $(BINARIES_DIR);\
+	fi
+	$(BAREBOX_BOOT_INSTALL_CUSTOM_ENV)
+endef
+
+ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
+define BAREBOX_BOOT_INSTALL_TARGET_CMDS
+	cp $(@D)/bareboxenv $(TARGET_DIR)/usr/bin
+endef
+endif
+
+# Checks to give errors that the user can understand
+# Must be before we call to kconfig-package
+ifeq ($(BR2_TARGET_BAREBOX)$(BR_BUILDING),yy)
+ifeq ($(BAREBOX_BOOT_SOURCE_CONFIG),)
+$(error No Barebox config file. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG or BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE settings)
+endif
+endif
+
+$(eval $(kconfig-package))
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 00e1537..55bd187 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -55,65 +55,7 @@ endif
 BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(TARGET_CROSS)"
 BAREBOX_MAKE_ENV = $(TARGET_MAKE_ENV)
 
-ifeq ($(BR2_TARGET_BAREBOX_USE_DEFCONFIG),y)
-BAREBOX_SOURCE_CONFIG = $(BAREBOX_DIR)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,\
-	$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))_defconfig
-else ifeq ($(BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG),y)
-BAREBOX_SOURCE_CONFIG = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE))
-endif
-
-BAREBOX_KCONFIG_FILE = $(BAREBOX_SOURCE_CONFIG)
 BAREBOX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES))
 BAREBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
-BAREBOX_KCONFIG_OPTS = $(BAREBOX_MAKE_FLAGS)
-
-ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
-define BAREBOX_BUILD_BAREBOXENV_CMDS
-	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -o $(@D)/bareboxenv \
-		$(@D)/scripts/bareboxenv.c
-endef
-endif
-
-ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_ENV),y)
-BAREBOX_ENV_NAME = $(notdir $(call qstrip,\
-	$(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)))
-define BAREBOX_BUILD_CUSTOM_ENV
-	$(@D)/scripts/bareboxenv -s \
-		$(call qstrip, $(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)) \
-		$(@D)/$(BAREBOX_ENV_NAME)
-endef
-define BAREBOX_INSTALL_CUSTOM_ENV
-	cp $(@D)/$(BAREBOX_ENV_NAME) $(BINARIES_DIR)
-endef
-endif
-
-define BAREBOX_BUILD_CMDS
-	$(BAREBOX_BUILD_BAREBOXENV_CMDS)
-	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D)
-	$(BAREBOX_BUILD_CUSTOM_ENV)
-endef
-
-define BAREBOX_INSTALL_IMAGES_CMDS
-	if test -h $(@D)/barebox-flash-image ; then \
-		cp -L $(@D)/barebox-flash-image $(BINARIES_DIR)/barebox.bin ; \
-	else \
-		cp $(@D)/barebox.bin $(BINARIES_DIR);\
-	fi
-	$(BAREBOX_INSTALL_CUSTOM_ENV)
-endef
-
-ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
-define BAREBOX_INSTALL_TARGET_CMDS
-	cp $(@D)/bareboxenv $(TARGET_DIR)/usr/bin
-endef
-endif
-
-# Checks to give errors that the user can understand
-# Must be before we call to kconfig-package
-ifeq ($(BR2_TARGET_BAREBOX)$(BR_BUILDING),yy)
-ifeq ($(BAREBOX_SOURCE_CONFIG),)
-$(error No Barebox config file. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG or BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE settings)
-endif
-endif
 
-$(eval $(kconfig-package))
+include $(sort $(wildcard boot/barebox/*/*.mk))
-- 
2.1.4
