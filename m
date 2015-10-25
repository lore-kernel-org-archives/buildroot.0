From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 25 Oct 2015 20:33:55 +0100
Subject: [Buildroot] [PATCH 3/4] barebox: user selection of build output
	images
In-Reply-To: <1445801636-7554-1-git-send-email-pieter@boesman.nl>
References: <1445801636-7554-1-git-send-email-pieter@boesman.nl>
Message-ID: <1445801636-7554-4-git-send-email-pieter@boesman.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A non-default image can be selected as the barebox build output in the images/
directory. This typically is needed to select the appropriate image generated
by multi-platform support defconfigs (E.g. am335x).
---
 boot/barebox/Config.in                      | 36 +++++++++++++++++++++++++++++
 boot/barebox/barebox-boot/barebox-boot.mk   | 13 +++++++++--
 boot/barebox/barebox-xload/barebox-xload.mk |  7 ++++++
 3 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 3c0e52e..a138507 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -104,6 +104,24 @@ config BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES
 	  A space-separated list of configuration fragment files,
 	  that will be merged to the main Barebox configuration file.
 
+choice
+	prompt "Barebox image file"
+	default BR2_TARGET_BAREBOX_USE_DEFAULT_IMAGE
+
+config BR2_TARGET_BAREBOX_USE_DEFAULT_IMAGE
+	bool "Using the default image file"
+
+config BR2_TARGET_BAREBOX_USE_SPECIFIC_IMAGE
+	bool "Using a specific image file"
+
+endchoice
+
+config BR2_TARGET_BAREBOX_IMAGE_FILE
+	string "Image file path"
+	depends on BR2_TARGET_BAREBOX_USE_SPECIFIC_IMAGE
+	help
+	  Name of the built barebox image file
+
 config BR2_TARGET_BAREBOX_BAREBOXENV
 	bool "bareboxenv tool in target"
 	help
@@ -169,6 +187,24 @@ config BR2_TARGET_BAREBOX_XLOAD_CONFIG_FRAGMENT_FILES
 	  A space-separated list of configuration fragment files,
 	  that will be merged to the main Barebox configuration file.
 
+choice
+	prompt "Barebox x-loader image file"
+	default BR2_TARGET_BAREBOX_XLOAD_USE_DEFAULT_IMAGE
+
+config BR2_TARGET_BAREBOX_XLOAD_USE_DEFAULT_IMAGE
+	bool "Using the default x-loader image file"
+
+config BR2_TARGET_BAREBOX_XLOAD_USE_SPECIFIC_IMAGE
+	bool "Using a specific x-loader image file"
+
+endchoice
+
+config BR2_TARGET_BAREBOX_XLOAD_IMAGE_FILE
+	string "X-loader image file path"
+	depends on BR2_TARGET_BAREBOX_XLOAD_USE_SPECIFIC_IMAGE
+	help
+	  Name of the built x-loader barebox image file
+
 config BR2_TARGET_BAREBOX_XLOAD_INSTALL_FILENAME
 	string "X-loader image filename when installed"
 	default "MLO"
diff --git a/boot/barebox/barebox-boot/barebox-boot.mk b/boot/barebox/barebox-boot/barebox-boot.mk
index a76a496..e1cde18 100644
--- a/boot/barebox/barebox-boot/barebox-boot.mk
+++ b/boot/barebox/barebox-boot/barebox-boot.mk
@@ -15,6 +15,7 @@ BAREBOX_BOOT_POST_PATCH_HOOKS += $(BAREBOX_POST_PATCH_HOOKS)
 BAREBOX_BOOT_MAKE_FLAGS = $(BAREBOX_MAKE_FLAGS)
 BAREBOX_BOOT_MAKE_ENV = $(BAREBOX_MAKE_ENV)
 BAREBOX_BOOT_INSTALL_IMAGES = $(BAREBOX_INSTALL_IMAGES)
+BAREBOX_BOOT_INSTALL_DEST = $(BINARIES_DIR)/barebox.bin
 
 ifeq ($(BR2_TARGET_BAREBOX_USE_DEFCONFIG),y)
 BAREBOX_BOOT_SOURCE_CONFIG = $(BAREBOX_BOOT_DIR)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,\
@@ -54,14 +55,22 @@ define BAREBOX_BOOT_BUILD_CMDS
 	$(BAREBOX_BOOT_BUILD_CUSTOM_ENV)
 endef
 
+ifdef BR2_TARGET_BAREBOX_USE_SPECIFIC_IMAGE
+define BAREBOX_BOOT_INSTALL_IMAGES_CMDS
+	cp -L $(@D)/images/$(call qstrip,$(BR2_TARGET_BAREBOX_IMAGE_FILE)) \
+		$(BAREBOX_BOOT_INSTALL_DEST)
+	$(BAREBOX_BOOT_INSTALL_CUSTOM_ENV)
+endef
+else
 define BAREBOX_BOOT_INSTALL_IMAGES_CMDS
 	if test -h $(@D)/barebox-flash-image ; then \
-		cp -L $(@D)/barebox-flash-image $(BINARIES_DIR)/barebox.bin ; \
+		cp -L $(@D)/barebox-flash-image $(BAREBOX_BOOT_INSTALL_DEST) ; \
 	else \
-		cp $(@D)/barebox.bin $(BINARIES_DIR);\
+		cp $(@D)/barebox.bin $(BAREBOX_BOOT_INSTALL_DEST);\
 	fi
 	$(BAREBOX_BOOT_INSTALL_CUSTOM_ENV)
 endef
+endif
 
 ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
 define BAREBOX_BOOT_INSTALL_TARGET_CMDS
diff --git a/boot/barebox/barebox-xload/barebox-xload.mk b/boot/barebox/barebox-xload/barebox-xload.mk
index 19bcc1c..9ab552a 100644
--- a/boot/barebox/barebox-xload/barebox-xload.mk
+++ b/boot/barebox/barebox-xload/barebox-xload.mk
@@ -33,6 +33,12 @@ define BAREBOX_XLOAD_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_XLOAD_MAKE_FLAGS) -C $(@D)
 endef
 
+ifdef BR2_TARGET_BAREBOX_XLOAD_USE_SPECIFIC_IMAGE
+define BAREBOX_XLOAD_INSTALL_IMAGES_CMDS
+	cp -L $(@D)/images/$(call qstrip,$(BR2_TARGET_BAREBOX_XLOAD_IMAGE_FILE)) \
+		$(BAREBOX_XLOAD_INSTALL_DEST)
+endef
+else
 define BAREBOX_XLOAD_INSTALL_IMAGES_CMDS
 	if test -h $(@D)/barebox-flash-image ; then \
 		cp -L $(@D)/barebox-flash-image $(BAREBOX_XLOAD_INSTALL_DEST) ; \
@@ -40,5 +46,6 @@ define BAREBOX_XLOAD_INSTALL_IMAGES_CMDS
 		cp $(@D)/barebox.bin $(BAREBOX_XLOAD_INSTALL_DEST);\
 	fi
 endef
+endif
 
 $(eval $(kconfig-package))
-- 
2.1.4
