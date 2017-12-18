From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Mon, 18 Dec 2017 17:55:57 +0300
Subject: [Buildroot] [PATCH] uboot: add option customizing the name of
 environment image
Message-ID: <20171218145557.19360-1-didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Historically, in buildroot the name of binary environment image
file is "uboot-env.bin". But in upstream u-boot default name
for this file is "uboot.env":

http://git.denx.de/?p=u-boot.git;a=blob;f=env/Kconfig#l394

For some boards U-Boot environment is stored in FAT partition, not as
a raw blob on SD-card, so the name of environment file must be correct.
For customizing name of envimage file option BR2_TARGET_UBOOT_ENVIMAGE_FILENAME
has been added. For backward compatibility by default value of this
option is set to "uboot-env.bin".

Signed-off-by: Evgeniy Didin <didin@synopsys.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/Config.in | 8 ++++++++
 boot/uboot/uboot.mk  | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 2829d2ca5e..e05ae15238 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -430,6 +430,14 @@ config BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT
 	  Buildroot is compatible with the "redundant environment"
 	  mechanism of U-Boot.
 
+config BR2_TARGET_UBOOT_ENVIMAGE_FILENAME
+	string "Custom filename for environment image"
+	default "uboot-env.bin"
+	help
+	  Some platforms require setting custom name for U-Boot
+	  environment image. For backward compatibility
+	  default filename is "uboot-env.bin".
+
 endif # BR2_TARGET_UBOOT_ENVIMAGE
 
 config BR2_TARGET_UBOOT_BOOT_SCRIPT
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index d2f241cd8b..5ebd1df89d 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -250,7 +250,7 @@ define UBOOT_GENERATE_ENV_IMAGE
 	$(HOST_DIR)/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
 		$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
 		$(if $(filter BIG,$(BR2_ENDIAN)),-b) \
-		-o $(BINARIES_DIR)/uboot-env.bin \
+		-o $(BINARIES_DIR)/$(BR2_TARGET_UBOOT_ENVIMAGE_FILENAME) \
 		$(@D)/buildroot-env.txt
 endef
 endif
-- 
2.11.0
