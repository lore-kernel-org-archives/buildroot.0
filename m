From: Pieter Smith <pieter@boesman.nl>
Date: Wed,  4 Nov 2015 22:20:28 +0100
Subject: [Buildroot] [v2, 1/4] barebox: prepare for secondary config build
In-Reply-To: <1446672031-13866-1-git-send-email-pieter@boesman.nl>
References: <1446672031-13866-1-git-send-email-pieter@boesman.nl>
Message-ID: <1446672031-13866-2-git-send-email-pieter@boesman.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No functional changes, but prepares barebox for building with two
configurations (similar to package/gcc).

Signed-off-by: Pieter Smith <pieter@boesman.nl>
---
 boot/barebox/Config.in                | 71 ++++++++++++++++++++-----------
 boot/barebox/barebox-1/barebox-1.hash |  1 +
 boot/barebox/barebox-1/barebox-1.mk   | 80 +++++++++++++++++++++++++++++++++++
 boot/barebox/barebox.mk               | 60 +-------------------------
 4 files changed, 128 insertions(+), 84 deletions(-)
 create mode 120000 boot/barebox/barebox-1/barebox-1.hash
 create mode 100644 boot/barebox/barebox-1/barebox-1.mk

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 7e81181..d278e93 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -64,9 +64,52 @@ config BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION
 
 endif
 
+config BR2_TARGET_BAREBOX_BAREBOXENV
+	bool "bareboxenv tool in target"
+	help
+	  Install bareboxenv tool in target.
+
+config BR2_TARGET_BAREBOX_CUSTOM_ENV
+	bool "Generate an environment image"
+	help
+	  Generate a custom environment image. This environment will
+	  contain the variables and scripts to be used at boot by
+	  barebox.
+
+config BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH
+	string "Environment path"
+	depends on BR2_TARGET_BAREBOX_CUSTOM_ENV
+	help
+	  Path to the directory containing the custom barebox
+	  environment. Depending on your setup, it will probably be
+	  based on either the content of the defaultenv or
+	  defaultenv-2 directories in the barebox source code, plus
+	  the additions needed. The output will be an image in the
+	  barebox devfs format, stored in the images directory, with
+	  the same name as the directory name given here.
 
 choice
-	prompt "Barebox configuration"
+	prompt "Number of Barebox configurations"
+	default BR2_TARGET_BAREBOX_SINGLE_CONFIG
+
+config BR2_TARGET_BAREBOX_ONE_CONFIG
+	select BR2_TARGET_BAREBOX_1
+	bool "Build 1 config"
+	help
+	  Build only one barebox config.
+	  Useful for building the traditional TPL (Tertiary Program
+	  Loader).
+
+endchoice
+
+config BR2_TARGET_BAREBOX_1
+	bool "Barebox configuration 1"
+	default y
+
+if BR2_TARGET_BAREBOX_1
+
+choice
+	prompt "Type of configuration"
 	default BR2_TARGET_BAREBOX_USE_DEFCONFIG
 
 config BR2_TARGET_BAREBOX_USE_DEFCONFIG
@@ -78,7 +121,7 @@ config BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG
 endchoice
 
 config BR2_TARGET_BAREBOX_BOARD_DEFCONFIG
-	string "board defconfig"
+	string "Board defconfig"
 	depends on BR2_TARGET_BAREBOX_USE_DEFCONFIG
 	help
 	  Name of the board for which Barebox should be built, without
@@ -97,28 +140,6 @@ config BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES
 	  A space-separated list of configuration fragment files,
 	  that will be merged to the main Barebox configuration file.
 
-config BR2_TARGET_BAREBOX_BAREBOXENV
-	bool "bareboxenv tool in target"
-	help
-	  Install bareboxenv tool in target.
-
-config BR2_TARGET_BAREBOX_CUSTOM_ENV
-	bool "Generate an environment image"
-	help
-	  Generate a custom environment image. This environment will
-	  contain the variables and scripts to be used at boot by
-	  barebox.
-
-config BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH
-	string "Environment path"
-	depends on BR2_TARGET_BAREBOX_CUSTOM_ENV
-	help
-	  Path to the directory containing the custom barebox
-	  environment. Depending on your setup, it will probably be
-	  based on either the content of the defaultenv or
-	  defaultenv-2 directories in the barebox source code, plus
-	  the additions needed. The output will be an image in the
-	  barebox devfs format, stored in the images directory, with
-	  the same name as the directory name given here.
+endif
 
 endif
diff --git a/boot/barebox/barebox-1/barebox-1.hash b/boot/barebox/barebox-1/barebox-1.hash
new file mode 120000
index 0000000..b6462b8
--- /dev/null
+++ b/boot/barebox/barebox-1/barebox-1.hash
@@ -0,0 +1 @@
+../barebox.hash
\ No newline at end of file
diff --git a/boot/barebox/barebox-1/barebox-1.mk b/boot/barebox/barebox-1/barebox-1.mk
new file mode 100644
index 0000000..f71069b
--- /dev/null
+++ b/boot/barebox/barebox-1/barebox-1.mk
@@ -0,0 +1,80 @@
+################################################################################
+#
+# barebox-1
+#
+################################################################################
+
+BAREBOX_1_VERSION = $(BAREBOX_VERSION)
+BAREBOX_1_SITE = $(BAREBOX_SITE)
+BAREBOX_1_SITE_METHOD = $(BAREBOX_SITE_METHOD)
+BAREBOX_1_SOURCE = $(BAREBOX_SOURCE)
+BAREBOX_1_DEPENDENCIES = $(BAREBOX_DEPENDENCIES)
+BAREBOX_1_LICENSE = $(BAREBOX_LICENSE)
+BAREBOX_1_LICENSE_FILES = $(BAREBOX_LICENSE_FILES)
+BAREBOX_1_POST_PATCH_HOOKS += $(BAREBOX_POST_PATCH_HOOKS)
+BAREBOX_1_MAKE_FLAGS = $(BAREBOX_MAKE_FLAGS)
+BAREBOX_1_MAKE_ENV = $(BAREBOX_MAKE_ENV)
+BAREBOX_1_INSTALL_IMAGES = $(BAREBOX_INSTALL_IMAGES)
+
+ifeq ($(BR2_TARGET_BAREBOX_USE_DEFCONFIG),y)
+BAREBOX_1_SOURCE_CONFIG = $(BAREBOX_1_DIR)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,\
+	$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))_defconfig
+else ifeq ($(BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG),y)
+BAREBOX_1_SOURCE_CONFIG = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE))
+endif
+
+BAREBOX_1_KCONFIG_FILE = $(BAREBOX_1_SOURCE_CONFIG)
+BAREBOX_1_KCONFIG_FRAGMENT_FILES = $(BAREBOX_KCONFIG_FRAGMENT_FILES)
+BAREBOX_1_KCONFIG_EDITORS = $(BAREBOX_KCONFIG_EDITORS)
+BAREBOX_1_KCONFIG_OPTS = $(BAREBOX_MAKE_FLAGS)
+
+ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
+define BAREBOX_1_BUILD_BAREBOXENV_CMDS
+	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -o $(@D)/bareboxenv \
+		$(@D)/scripts/bareboxenv.c
+endef
+endif
+
+ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_ENV),y)
+BAREBOX_1_ENV_NAME = $(notdir $(call qstrip,\
+	$(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)))
+define BAREBOX_1_BUILD_CUSTOM_ENV
+	$(@D)/scripts/bareboxenv -s \
+		$(call qstrip, $(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)) \
+		$(@D)/$(BAREBOX_1_ENV_NAME)
+endef
+define BAREBOX_1_INSTALL_CUSTOM_ENV
+	cp $(@D)/$(BAREBOX_1_ENV_NAME) $(BINARIES_DIR)
+endef
+endif
+
+define BAREBOX_1_BUILD_CMDS
+	$(BAREBOX_1_BUILD_BAREBOXENV_CMDS)
+	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_1_MAKE_FLAGS) -C $(@D)
+	$(BAREBOX_1_BUILD_CUSTOM_ENV)
+endef
+
+define BAREBOX_1_INSTALL_IMAGES_CMDS
+	if test -h $(@D)/barebox-flash-image ; then \
+		cp -L $(@D)/barebox-flash-image $(BINARIES_DIR)/barebox.bin ; \
+	else \
+		cp $(@D)/barebox.bin $(BINARIES_DIR);\
+	fi
+	$(BAREBOX_1_INSTALL_CUSTOM_ENV)
+endef
+
+ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
+define BAREBOX_1_INSTALL_TARGET_CMDS
+	cp $(@D)/bareboxenv $(TARGET_DIR)/usr/bin
+endef
+endif
+
+# Checks to give errors that the user can understand
+# Must be before we call to kconfig-package
+ifeq ($(BR2_TARGET_BAREBOX)$(BR_BUILDING),yy)
+ifeq ($(BAREBOX_1_SOURCE_CONFIG),)
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
