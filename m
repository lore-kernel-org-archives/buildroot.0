From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  6 Dec 2017 23:25:58 +0100
Subject: [Buildroot] [PATCH] package/uboot: detect missing user-supplied
 environment source files
Message-ID: <20171206222558.30529-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since 0542bb79e8 (uboot: Support multiple environment source files),
a missing user-supplied environment source files is no longer detected.

This is because we cat them all, and feed the concatenation to the stdin
of mkenvimage. So, if one source file is missing, the cat exits in error,
but the compound command exits with the exit code of the last command,
which is that of mkenvimage, which happens to be happy with whatever it
is fed on its stdin, even is empty.

We fix that by creating a temporary file, that we even leave afterward
for the user to inspect.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Cam Hutchison <camh@xdna.net>
---
 boot/uboot/uboot.mk | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a1fac7dcae..518433796f 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -250,11 +250,13 @@ define UBOOT_INSTALL_IMAGES_CMDS
 		)
 	)
 	$(if $(BR2_TARGET_UBOOT_ENVIMAGE),
-		cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) | \
-			$(HOST_DIR)/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
-			$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
-			$(if $(filter BIG,$(BR2_ENDIAN)),-b) \
-			-o $(BINARIES_DIR)/uboot-env.bin -)
+		cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) \
+			>$(BINARIES_DIR)/uboot-env.txt && \
+		$(HOST_DIR)/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
+		$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
+		$(if $(filter BIG,$(BR2_ENDIAN)),-b) \
+		-o $(BINARIES_DIR)/uboot-env.bin \
+		$(BINARIES_DIR)/uboot-env.txt)
 	$(if $(BR2_TARGET_UBOOT_BOOT_SCRIPT),
 		$(HOST_DIR)/bin/mkimage -C none -A $(MKIMAGE_ARCH) -T script \
 			-d $(call qstrip,$(BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE)) \
-- 
2.11.0
