From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 25 Oct 2015 20:33:54 +0100
Subject: [Buildroot] [PATCH 2/4] barebox: adds option to build x-loader
In-Reply-To: <1445801636-7554-1-git-send-email-pieter@boesman.nl>
References: <1445801636-7554-1-git-send-email-pieter@boesman.nl>
Message-ID: <1445801636-7554-3-git-send-email-pieter@boesman.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support selection of x-loader config, but version, source URL and patches are
shared with barebox bootloader build.
---
 boot/barebox/Config.in                        | 47 +++++++++++++++++++++++++++
 boot/barebox/barebox-xload/barebox-xload.hash |  1 +
 boot/barebox/barebox-xload/barebox-xload.mk   | 44 +++++++++++++++++++++++++
 3 files changed, 92 insertions(+)
 create mode 120000 boot/barebox/barebox-xload/barebox-xload.hash
 create mode 100644 boot/barebox/barebox-xload/barebox-xload.mk

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 437407d..3c0e52e 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -130,4 +130,51 @@ config BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH
 
 endif
 
+config BR2_TARGET_BAREBOX_XLOAD
+	bool "Build Barebox x-loader"
+	help
+	  Build the Barebox x-loader
+
+if BR2_TARGET_BAREBOX_XLOAD
+
+choice
+	prompt "Barebox x-loader configuration"
+	default BR2_TARGET_BAREBOX_XLOAD_USE_DEFCONFIG
+
+config BR2_TARGET_BAREBOX_XLOAD_USE_DEFCONFIG
+	bool "Using a x-loader defconfig"
+
+config BR2_TARGET_BAREBOX_XLOAD_USE_CUSTOM_CONFIG
+	bool "Using a custom x-loader config file"
+
+endchoice
+
+config BR2_TARGET_BAREBOX_XLOAD_BOARD_DEFCONFIG
+	string "X-loader board defconfig"
+	depends on BR2_TARGET_BAREBOX_XLOAD_USE_DEFCONFIG
+	help
+	  Name of the board for which Barebox should be built, without
+	  the _defconfig suffix.
+
+
+config BR2_TARGET_BAREBOX_XLOAD_CUSTOM_CONFIG_FILE
+	string "X-loader configuration file path"
+	depends on BR2_TARGET_BAREBOX_XLOAD_USE_CUSTOM_CONFIG
+	help
+	  Path to the barebox configuration file
+
+config BR2_TARGET_BAREBOX_XLOAD_CONFIG_FRAGMENT_FILES
+	string "Additional x-loader configuration fragment files"
+	help
+	  A space-separated list of configuration fragment files,
+	  that will be merged to the main Barebox configuration file.
+
+config BR2_TARGET_BAREBOX_XLOAD_INSTALL_FILENAME
+	string "X-loader image filename when installed"
+	default "MLO"
+	help
+	  Name to give the image in the output/images directory.
+
+endif
+
 endif
diff --git a/boot/barebox/barebox-xload/barebox-xload.hash b/boot/barebox/barebox-xload/barebox-xload.hash
new file mode 120000
index 0000000..b6462b8
--- /dev/null
+++ b/boot/barebox/barebox-xload/barebox-xload.hash
@@ -0,0 +1 @@
+../barebox.hash
\ No newline at end of file
diff --git a/boot/barebox/barebox-xload/barebox-xload.mk b/boot/barebox/barebox-xload/barebox-xload.mk
new file mode 100644
index 0000000..19bcc1c
--- /dev/null
+++ b/boot/barebox/barebox-xload/barebox-xload.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# barebox-xload
+#
+################################################################################
+
+BAREBOX_XLOAD_VERSION = $(BAREBOX_VERSION)
+BAREBOX_XLOAD_SITE = $(BAREBOX_SITE)
+BAREBOX_XLOAD_SITE_METHOD = $(BAREBOX_SITE_METHOD)
+BAREBOX_XLOAD_SOURCE = $(BAREBOX_SOURCE)
+BAREBOX_XLOAD_DEPENDENCIES = $(BAREBOX_DEPENDENCIES)
+BAREBOX_XLOAD_LICENSE = $(BAREBOX_LICENSE)
+BAREBOX_XLOAD_LICENSE_FILES = $(BAREBOX_LICENSE_FILES)
+BAREBOX_XLOAD_POST_PATCH_HOOKS += $(BAREBOX_POST_PATCH_HOOKS)
+BAREBOX_XLOAD_MAKE_FLAGS = $(BAREBOX_MAKE_FLAGS)
+BAREBOX_XLOAD_MAKE_ENV = $(BAREBOX_MAKE_ENV)
+BAREBOX_XLOAD_INSTALL_IMAGES = $(BAREBOX_INSTALL_IMAGES)
+BAREBOX_XLOAD_INSTALL_DEST = $(BINARIES_DIR)/$(call qstrip,$(BR2_TARGET_BAREBOX_XLOAD_INSTALL_FILENAME))
+
+ifeq ($(BR2_TARGET_BAREBOX_XLOAD_USE_DEFCONFIG),y)
+BAREBOX_XLOAD_SOURCE_CONFIG = $(BAREBOX_XLOAD_DIR)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,\
+	$(BR2_TARGET_BAREBOX_XLOAD_BOARD_DEFCONFIG))_defconfig
+else ifeq ($(BR2_TARGET_BAREBOX_XLOAD_USE_CUSTOM_CONFIG),y)
+BAREBOX_XLOAD_SOURCE_CONFIG = $(call qstrip,$(BR2_TARGET_BAREBOX_XLOAD_CUSTOM_CONFIG_FILE))
+endif
+
+BAREBOX_XLOAD_KCONFIG_FILE = $(BAREBOX_XLOAD_SOURCE_CONFIG)
+BAREBOX_XLOAD_KCONFIG_FRAGMENT_FILES = $(BAREBOX_KCONFIG_FRAGMENT_FILES)
+BAREBOX_XLOAD_KCONFIG_EDITORS = $(BAREBOX_KCONFIG_EDITORS)
+BAREBOX_XLOAD_KCONFIG_OPTS = $(BAREBOX_MAKE_FLAGS)
+
+define BAREBOX_XLOAD_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_XLOAD_MAKE_FLAGS) -C $(@D)
+endef
+
+define BAREBOX_XLOAD_INSTALL_IMAGES_CMDS
+	if test -h $(@D)/barebox-flash-image ; then \
+		cp -L $(@D)/barebox-flash-image $(BAREBOX_XLOAD_INSTALL_DEST) ; \
+	else \
+		cp $(@D)/barebox.bin $(BAREBOX_XLOAD_INSTALL_DEST);\
+	fi
+endef
+
+$(eval $(kconfig-package))
-- 
2.1.4
