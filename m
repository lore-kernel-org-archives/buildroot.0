From: Pieter Smith <pieter@boesman.nl>
Date: Wed,  4 Nov 2015 22:20:30 +0100
Subject: [Buildroot] [v2, 3/4] barebox: user selection of build output images
In-Reply-To: <1446672031-13866-1-git-send-email-pieter@boesman.nl>
References: <1446672031-13866-1-git-send-email-pieter@boesman.nl>
Message-ID: <1446672031-13866-4-git-send-email-pieter@boesman.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A non-default image can be selected as the barebox build output in the images/
directory. This typically is needed to select the appropriate image generated
by multi-platform support defconfigs (E.g. am335x).

Signed-off-by: Pieter Smith <pieter@boesman.nl>
---
 boot/barebox/Config.in              | 36 ++++++++++++++++++++++++++++++++++++
 boot/barebox/barebox-1/barebox-1.mk | 13 +++++++++++--
 boot/barebox/barebox-2/barebox-2.mk |  7 +++++++
 3 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 81c07fb..19b4e0f 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -149,6 +149,24 @@ config BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES
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
+	  Name of the built barebox image file in the barebox images directory
+
 endif
 
 if BR2_TARGET_BAREBOX_TWO_CONFIGS
@@ -190,6 +208,24 @@ config BR2_TARGET_BAREBOX_2_CONFIG_FRAGMENT_FILES
 	  A space-separated list of configuration fragment files,
 	  that will be merged to the main Barebox configuration file.
 
+choice
+	prompt "Barebox image file"
+	default BR2_TARGET_BAREBOX_2_USE_DEFAULT_IMAGE
+
+config BR2_TARGET_BAREBOX_2_USE_DEFAULT_IMAGE
+	bool "Using the default image file"
+
+config BR2_TARGET_BAREBOX_2_USE_SPECIFIC_IMAGE
+	bool "Using a specific image file"
+
+endchoice
+
+config BR2_TARGET_BAREBOX_2_IMAGE_FILE
+	string "Image file path"
+	depends on BR2_TARGET_BAREBOX_2_USE_SPECIFIC_IMAGE
+	help
+	  Name of the built barebox image file in the barebox images directory
+
 config BR2_TARGET_BAREBOX_2_INSTALL_FILENAME
 	string "Destination image filename in output/images"
 	default "MLO"
diff --git a/boot/barebox/barebox-1/barebox-1.mk b/boot/barebox/barebox-1/barebox-1.mk
index f71069b..b28248d 100644
--- a/boot/barebox/barebox-1/barebox-1.mk
+++ b/boot/barebox/barebox-1/barebox-1.mk
@@ -15,6 +15,7 @@ BAREBOX_1_POST_PATCH_HOOKS += $(BAREBOX_POST_PATCH_HOOKS)
 BAREBOX_1_MAKE_FLAGS = $(BAREBOX_MAKE_FLAGS)
 BAREBOX_1_MAKE_ENV = $(BAREBOX_MAKE_ENV)
 BAREBOX_1_INSTALL_IMAGES = $(BAREBOX_INSTALL_IMAGES)
+BAREBOX_1_INSTALL_DEST = $(BINARIES_DIR)/barebox.bin
 
 ifeq ($(BR2_TARGET_BAREBOX_USE_DEFCONFIG),y)
 BAREBOX_1_SOURCE_CONFIG = $(BAREBOX_1_DIR)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,\
@@ -54,14 +55,22 @@ define BAREBOX_1_BUILD_CMDS
 	$(BAREBOX_1_BUILD_CUSTOM_ENV)
 endef
 
+ifdef BR2_TARGET_BAREBOX_USE_SPECIFIC_IMAGE
+define BAREBOX_1_INSTALL_IMAGES_CMDS
+	cp -L $(@D)/images/$(call qstrip,$(BR2_TARGET_BAREBOX_IMAGE_FILE)) \
+		$(BAREBOX_1_INSTALL_DEST)
+	$(BAREBOX_1_INSTALL_CUSTOM_ENV)
+endef
+else
 define BAREBOX_1_INSTALL_IMAGES_CMDS
 	if test -h $(@D)/barebox-flash-image ; then \
-		cp -L $(@D)/barebox-flash-image $(BINARIES_DIR)/barebox.bin ; \
+		cp -L $(@D)/barebox-flash-image $(BAREBOX_1_INSTALL_DEST) ; \
 	else \
-		cp $(@D)/barebox.bin $(BINARIES_DIR);\
+		cp $(@D)/barebox.bin $(BAREBOX_1_INSTALL_DEST);\
 	fi
 	$(BAREBOX_1_INSTALL_CUSTOM_ENV)
 endef
+endif
 
 ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
 define BAREBOX_1_INSTALL_TARGET_CMDS
diff --git a/boot/barebox/barebox-2/barebox-2.mk b/boot/barebox/barebox-2/barebox-2.mk
index dd70cc7..b50fc7b 100644
--- a/boot/barebox/barebox-2/barebox-2.mk
+++ b/boot/barebox/barebox-2/barebox-2.mk
@@ -33,6 +33,12 @@ define BAREBOX_2_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_2_MAKE_FLAGS) -C $(@D)
 endef
 
+ifdef BR2_TARGET_BAREBOX_2_USE_SPECIFIC_IMAGE
+define BAREBOX_2_INSTALL_IMAGES_CMDS
+	cp -L $(@D)/images/$(call qstrip,$(BR2_TARGET_BAREBOX_2_IMAGE_FILE)) \
+		$(BAREBOX_2_INSTALL_DEST)
+endef
+else
 define BAREBOX_2_INSTALL_IMAGES_CMDS
 	if test -h $(@D)/barebox-flash-image ; then \
 		cp -L $(@D)/barebox-flash-image $(BAREBOX_2_INSTALL_DEST) ; \
@@ -40,5 +46,6 @@ define BAREBOX_2_INSTALL_IMAGES_CMDS
 		cp $(@D)/barebox.bin $(BAREBOX_2_INSTALL_DEST);\
 	fi
 endef
+endif
 
 $(eval $(kconfig-package))
-- 
2.1.4
