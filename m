From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 21:29:54 +0100
Subject: [Buildroot] [git commit branch/next] boot/arm-trusted-firmware: add
 pattern based image copy for ATF
Message-ID: <20191115204111.204CD8EFE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4d276c357fdf9f19f99f826cab63f373687f902
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This adds support for different platforms where the binaries have
different extensions.

Signed-off-by: Michael Schenk <michael.schenk@noser.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/Config.in               | 7 +++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 +++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-firmware/Config.in
index beb95fbf06..78c03019d5 100644
--- a/boot/arm-trusted-firmware/Config.in
+++ b/boot/arm-trusted-firmware/Config.in
@@ -135,4 +135,11 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG
 	help
 	  Enable this option to build ATF with DEBUG=1.
 
+config BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES
+	string "Binary boot images"
+	default "*.bin"
+	help
+	  Names of generated image files that are installed in the
+	  output images/ directory.
+
 endif
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index a7814e534a..e528686aa1 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -146,7 +146,9 @@ define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
 endef
 
 define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
-	cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/*.bin $(BINARIES_DIR)/
+	$(foreach f,$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES)), \
+		cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/$(f) $(BINARIES_DIR)/
+	)
 	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL)
 	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL_ELF)
 endef
