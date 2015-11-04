From: Pieter Smith <pieter@boesman.nl>
Date: Wed,  4 Nov 2015 22:20:29 +0100
Subject: [Buildroot] [v2, 2/4] barebox: adds option to build secondary config
In-Reply-To: <1446672031-13866-1-git-send-email-pieter@boesman.nl>
References: <1446672031-13866-1-git-send-email-pieter@boesman.nl>
Message-ID: <1446672031-13866-3-git-send-email-pieter@boesman.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support selection of secondary config, but version, source URL and patches are
shared with barebox bootloader build.

Signed-off-by: Pieter Smith <pieter@boesman.nl>
---
 boot/barebox/Config.in                | 60 ++++++++++++++++++++++++++++++++++-
 boot/barebox/barebox-2/barebox-2.hash |  1 +
 boot/barebox/barebox-2/barebox-2.mk   | 44 +++++++++++++++++++++++++
 3 files changed, 104 insertions(+), 1 deletion(-)
 create mode 120000 boot/barebox/barebox-2/barebox-2.hash
 create mode 100644 boot/barebox/barebox-2/barebox-2.mk

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index d278e93..81c07fb 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -100,11 +100,20 @@ config BR2_TARGET_BAREBOX_ONE_CONFIG
 	  Useful for building the traditional TPL (Tertiary Program
 	  Loader).
 
+config BR2_TARGET_BAREBOX_TWO_CONFIGS
+	select BR2_TARGET_BAREBOX_1
+	select BR2_TARGET_BAREBOX_2
+	bool "Build 2 configs"
+	help
+	  Build two barebox configurations.
+	  Useful for building an SPL (Secondary Program Loader) in addition to
+	  the traditional TPL (Tertiary Program Loader), such as the X-Loader
+	  or MLO for Texas Instruments processors.
+
 endchoice
 
 config BR2_TARGET_BAREBOX_1
 	bool "Barebox configuration 1"
-	default y
 
 if BR2_TARGET_BAREBOX_1
 
@@ -142,4 +151,53 @@ config BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES
 
 endif
 
+if BR2_TARGET_BAREBOX_TWO_CONFIGS
+
+config BR2_TARGET_BAREBOX_2
+	bool "Barebox configuration 2"
+
+if BR2_TARGET_BAREBOX_2
+
+choice
+	prompt "Type of configuration"
+	default BR2_TARGET_BAREBOX_2_USE_DEFCONFIG
+
+config BR2_TARGET_BAREBOX_2_USE_DEFCONFIG
+	bool "Using a defconfig"
+
+config BR2_TARGET_BAREBOX_2_USE_CUSTOM_CONFIG
+	bool "Using a custom config file"
+
+endchoice
+
+config BR2_TARGET_BAREBOX_2_BOARD_DEFCONFIG
+	string "Board defconfig"
+	depends on BR2_TARGET_BAREBOX_2_USE_DEFCONFIG
+	help
+	  Name of the board for which Barebox should be built, without
+	  the _defconfig suffix.
+
+
+config BR2_TARGET_BAREBOX_2_CUSTOM_CONFIG_FILE
+	string "Configuration file path"
+	depends on BR2_TARGET_BAREBOX_2_USE_CUSTOM_CONFIG
+	help
+	  Path to the barebox configuration file
+
+config BR2_TARGET_BAREBOX_2_CONFIG_FRAGMENT_FILES
+	string "Additional configuration fragment files"
+	help
+	  A space-separated list of configuration fragment files,
+	  that will be merged to the main Barebox configuration file.
+
+config BR2_TARGET_BAREBOX_2_INSTALL_FILENAME
+	string "Destination image filename in output/images"
+	default "MLO"
+	help
+	  Name to give the image in the output/images directory.
+
+endif
+
+endif
+
 endif
diff --git a/boot/barebox/barebox-2/barebox-2.hash b/boot/barebox/barebox-2/barebox-2.hash
new file mode 120000
index 0000000..b6462b8
--- /dev/null
+++ b/boot/barebox/barebox-2/barebox-2.hash
@@ -0,0 +1 @@
+../barebox.hash
\ No newline at end of file
diff --git a/boot/barebox/barebox-2/barebox-2.mk b/boot/barebox/barebox-2/barebox-2.mk
new file mode 100644
index 0000000..dd70cc7
--- /dev/null
+++ b/boot/barebox/barebox-2/barebox-2.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# barebox-2
+#
+################################################################################
+
+BAREBOX_2_VERSION = $(BAREBOX_VERSION)
+BAREBOX_2_SITE = $(BAREBOX_SITE)
+BAREBOX_2_SITE_METHOD = $(BAREBOX_SITE_METHOD)
+BAREBOX_2_SOURCE = $(BAREBOX_SOURCE)
+BAREBOX_2_DEPENDENCIES = $(BAREBOX_DEPENDENCIES)
+BAREBOX_2_LICENSE = $(BAREBOX_LICENSE)
+BAREBOX_2_LICENSE_FILES = $(BAREBOX_LICENSE_FILES)
+BAREBOX_2_POST_PATCH_HOOKS += $(BAREBOX_POST_PATCH_HOOKS)
+BAREBOX_2_MAKE_FLAGS = $(BAREBOX_MAKE_FLAGS)
+BAREBOX_2_MAKE_ENV = $(BAREBOX_MAKE_ENV)
+BAREBOX_2_INSTALL_IMAGES = $(BAREBOX_INSTALL_IMAGES)
+BAREBOX_2_INSTALL_DEST = $(BINARIES_DIR)/$(call qstrip,$(BR2_TARGET_BAREBOX_2_INSTALL_FILENAME))
+
+ifeq ($(BR2_TARGET_BAREBOX_2_USE_DEFCONFIG),y)
+BAREBOX_2_SOURCE_CONFIG = $(BAREBOX_2_DIR)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,\
+	$(BR2_TARGET_BAREBOX_2_BOARD_DEFCONFIG))_defconfig
+else ifeq ($(BR2_TARGET_BAREBOX_2_USE_CUSTOM_CONFIG),y)
+BAREBOX_2_SOURCE_CONFIG = $(call qstrip,$(BR2_TARGET_BAREBOX_2_CUSTOM_CONFIG_FILE))
+endif
+
+BAREBOX_2_KCONFIG_FILE = $(BAREBOX_2_SOURCE_CONFIG)
+BAREBOX_2_KCONFIG_FRAGMENT_FILES = $(BAREBOX_KCONFIG_FRAGMENT_FILES)
+BAREBOX_2_KCONFIG_EDITORS = $(BAREBOX_KCONFIG_EDITORS)
+BAREBOX_2_KCONFIG_OPTS = $(BAREBOX_MAKE_FLAGS)
+
+define BAREBOX_2_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_2_MAKE_FLAGS) -C $(@D)
+endef
+
+define BAREBOX_2_INSTALL_IMAGES_CMDS
+	if test -h $(@D)/barebox-flash-image ; then \
+		cp -L $(@D)/barebox-flash-image $(BAREBOX_2_INSTALL_DEST) ; \
+	else \
+		cp $(@D)/barebox.bin $(BAREBOX_2_INSTALL_DEST);\
+	fi
+endef
+
+$(eval $(kconfig-package))
-- 
2.1.4
