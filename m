From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 17:08:55 +0100
Subject: [Buildroot] [git commit branch/2017.11.x] package/uboot: detect
 missing user-supplied environment source files
Message-ID: <20171227161504.3523A836BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5cb141abe5b6c3b283e68303b851a0e8cc44676e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit c9b6604fa7871087120cd8a469452807d14a4c1c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a1fac7d..a0d13ca 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -238,6 +238,18 @@ define UBOOT_BUILD_OMAP_IFT
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
@@ -249,12 +261,7 @@ define UBOOT_INSTALL_IMAGES_CMDS
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
