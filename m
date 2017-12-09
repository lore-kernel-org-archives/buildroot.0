From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Dec 2017 12:35:49 +0100
Subject: [Buildroot] [PATCHv3] package/uboot: detect missing user-supplied
 environment source files
Message-ID: <20171209113549.1510-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since 0542bb79e8 (uboot: Support multiple environment source files),
missing user-supplied environment source files is no longer detected.

This is because we cat them all, and feed the concatenation to the stdin
of mkenvimage. So, if one source file is missing, the cat exits in error,
but the compound command exits with the exit code of the last command,
which is that of mkenvimage, which happens to be happy with whatever it
is fed on its stdin, even is empty.

We fix that by creating a temporary file, that we even leave afterward
for the user to inspect.

We also move it out of the _CMDS block and into a macro of its own, so
that it is easier to write and maintain.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Cam Hutchison <camh@xdna.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v2 -> v3:
  - generate inter;ediate file in $(@D) to avoid conflicts with
    user-generated files in $(O)/images/  (Cam)
  - typo

Changes v1 -> v2:
  - move into its own macro  (Thomas)
---
 boot/uboot/uboot.mk | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 39175999ec..d2f241cd8b 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -243,6 +243,18 @@ define UBOOT_BUILD_OMAP_IFT
 		-c $(call qstrip,$(BR2_TARGET_UBOOT_OMAP_IFT_CONFIG))
 endef
 
+ifneq ($(BR2_TARGET_UBOOT_ENVIMAGE),)
+define UBOOT_GENERATE_ENV_IMAGE
+	cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) \
+		>$(@D)/buildroot-env.txt
+	$(HOST_DIR)/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
+		$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
+		$(if $(filter BIG,$(BR2_ENDIAN)),-b) \
+		-o $(BINARIES_DIR)/uboot-env.bin \
+		$(@D)/buildroot-env.txt
+endef
+endif
+
 define UBOOT_INSTALL_IMAGES_CMDS
 	$(foreach f,$(UBOOT_BINS), \
 			cp -dpf $(@D)/$(f) $(BINARIES_DIR)/
@@ -254,12 +266,7 @@ define UBOOT_INSTALL_IMAGES_CMDS
 			cp -dpf $(@D)/$(f) $(BINARIES_DIR)/
 		)
 	)
-	$(if $(BR2_TARGET_UBOOT_ENVIMAGE),
-		cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) | \
-			$(HOST_DIR)/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
-			$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
-			$(if $(filter BIG,$(BR2_ENDIAN)),-b) \
-			-o $(BINARIES_DIR)/uboot-env.bin -)
+	$(UBOOT_GENERATE_ENV_IMAGE)
 	$(if $(BR2_TARGET_UBOOT_BOOT_SCRIPT),
 		$(HOST_DIR)/bin/mkimage -C none -A $(MKIMAGE_ARCH) -T script \
 			-d $(call qstrip,$(BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE)) \
-- 
2.11.0
