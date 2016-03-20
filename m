From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 20 Mar 2016 23:35:45 +0100
Subject: [Buildroot] [PATCH v4 1/7] barebox: support multi-image-build image
	selection
In-Reply-To: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
Message-ID: <1458513351-6556-2-git-send-email-pieter@boesman.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support selection of the built image filename in a multi-image barebox build.
This makes it possible to specify which image to pick in a in a multi-image
barebox config such as the am335x_defconfig.

The specified image can either be located in the barebox build directory or the
barebox build images directory.

For compatibility with contemporary barbox builds, a sane default has been
chosen. For barebox versions older than 2012.10, the user will have to specify
'barebox.bin'.

Signed-off-by: Pieter Smith <pieter@boesman.nl>
---
 boot/barebox/Config.in  | 9 +++++++++
 boot/barebox/barebox.mk | 9 ++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index bbe6ae2..4f6872c 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -97,6 +97,15 @@ config BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES
 	  A space-separated list of configuration fragment files,
 	  that will be merged to the main Barebox configuration file.
 
+config BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE
+	string "Built image filename"
+	default "barebox-flash-image"
+	help
+	  Name of the built barebox image filename in the barebox build or
+	  build images directory.
+
+	  Set to barebox.bin for barebox versions older than 2012.10.
+
 config BR2_TARGET_BAREBOX_BAREBOXENV
 	bool "bareboxenv tool in target"
 	help
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 7715daf..2a3b724 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -92,10 +92,10 @@ define BAREBOX_BUILD_CMDS
 endef
 
 define BAREBOX_INSTALL_IMAGES_CMDS
-	if test -h $(@D)/barebox-flash-image ; then \
-		cp -L $(@D)/barebox-flash-image $(BINARIES_DIR)/barebox.bin ; \
+	if test -e $(@D)/$(call qstrip,$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)); then \
+		cp -L $(@D)/$(call qstrip,$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)) $(BINARIES_DIR)/barebox.bin ; \
 	else \
-		cp $(@D)/barebox.bin $(BINARIES_DIR);\
+		cp $(@D)/images/$(call qstrip,$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)) $(BINARIES_DIR)/barebox.bin ; \
 	fi
 	$(BAREBOX_INSTALL_CUSTOM_ENV)
 endef
@@ -115,6 +115,9 @@ ifeq ($(BR2_TARGET_BAREBOX)$(BR_BUILDING),yy)
 ifeq ($(or $(BAREBOX_KCONFIG_FILE),$(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))),)
 $(error No Barebox config. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG or BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE settings)
 endif
+ifndef BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE
+$(error No barebox built image filename specified. Check your BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE setting)
+endif
 endif
 
 $(eval $(kconfig-package))
-- 
2.5.0
