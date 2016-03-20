From: Pieter Smith <pieter@boesman.nl>
Date: Sun, 20 Mar 2016 23:35:47 +0100
Subject: [Buildroot] [PATCH v4 3/7] barebox: support custom barebox output
	image name
In-Reply-To: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
Message-ID: <1458513351-6556-4-git-send-email-pieter@boesman.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation for building a 2nd barebox config, a configuration option is
added to allow customization of the image filename when the built image is
copied to the output/images directory.

Signed-off-by: Pieter Smith <pieter@boesman.nl>
---
 boot/barebox/Config.in  | 7 +++++++
 boot/barebox/barebox.mk | 9 +++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 4f6872c..7769866 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -106,6 +106,13 @@ config BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE
 
 	  Set to barebox.bin for barebox versions older than 2012.10.
 
+config BR2_TARGET_BAREBOX_OUTPUT_IMAGE_FILE
+	string "Output image filename"
+	default "barebox.bin"
+	help
+	  Name to use when copying the barebox image to the output/images
+	  directory.
+
 config BR2_TARGET_BAREBOX_BAREBOXENV
 	bool "bareboxenv tool in target"
 	help
diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index d0f28cf..4eea470 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -93,9 +93,11 @@ endef
 
 define BAREBOX_INSTALL_IMAGES_CMDS
 	if test -e $(@D)/$(call qstrip,$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)); then \
-		cp -L $(@D)/$(call qstrip,$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)) $(BINARIES_DIR)/barebox.bin ; \
+		cp -L $(@D)/$(call qstrip,$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)) \
+		      $(BINARIES_DIR)/$(call qstrip,$(BR2_TARGET_BAREBOX_OUTPUT_IMAGE_FILE)) ; \
 	elif test -e $(@D)/images/$(call qstrip,$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)); then \
-		cp $(@D)/images/$(call qstrip,$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)) $(BINARIES_DIR)/barebox.bin ; \
+		cp $(@D)/images/$(call qstrip,$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE)) \
+		   $(BINARIES_DIR)/$(call qstrip,$(BR2_TARGET_BAREBOX_OUTPUT_IMAGE_FILE)) ; \
 	else \
 		echo "error: Specified built image file not found: $(call qstrip,$(BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE))" >&2 ; \
 		echo "       in: $(@D)/" >&2 ; \
@@ -124,6 +126,9 @@ endif
 ifndef BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE
 $(error No barebox built image filename specified. Check your BR2_TARGET_BAREBOX_BUILT_IMAGE_FILE setting)
 endif
+ifndef BR2_TARGET_BAREBOX_OUTPUT_IMAGE_FILE
+$(error No barebox output image filename specified. Check your BR2_TARGET_BAREBOX_OUTPUT_IMAGE_FILE setting)
+endif
 endif
 
 $(eval $(kconfig-package))
-- 
2.5.0
