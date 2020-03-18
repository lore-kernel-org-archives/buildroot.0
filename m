From: sunil at amarulasolutions.com <sunil@amarulasolutions.com>
Date: Wed, 18 Mar 2020 19:15:49 +0530
Subject: [Buildroot] [PATCH v3 1/5] boot/arm-trusted-firmware: Disable bin
 copy for rk3399
In-Reply-To: <1584539153-12934-1-git-send-email-sunil@amarulasolutions.com>
References: <1581590685-31680-2-git-send-email-sunil@amarulasolutions.com>
 <1584539153-12934-1-git-send-email-sunil@amarulasolutions.com>
Message-ID: <1584539153-12934-2-git-send-email-sunil@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

Unlike other SoC platforms, rockchip platforms doesn't require a binary
generation on TF-A project.

This is due to rockchip platforms have non-continuous memory areas in
the linker script with a huge gap between them, so generating the binary
would require addition padding which indeed increases the size of the binary.

Interestingly this binary generation is disabled in v2.2 of TF-A on below
commit:
 commit <33218d2a8143> "rockchip: Disable binary generation for all SoCs."

Buildroot generally looks for a *.bin in the TF-A build directory but v2.2 is
not creating any bin since rk3399 (or rockchip) doesn't need bins, because of
which build fails.

This changeset checks for a *.bin in the respective TF-A build directory, if
available it copies to the output directory, otherwise skips copy.

This fixes the atf build on rk3399 with v2.2 and above.

Note: the same can be applied to rest of rockchip platforms if
they use v2.2 TF-A and above.

Cc: linux-amarula at amarulasolutions.com
Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- Based on suggestions from sergey and thomas, instead of encoding
  platform-specific stuff in config files, made changes in .mk files
  based on the build flow.
- Tested on roc-rk3399-pc, a rk3399 based target. Compile tested for orangepi 

Changes for v2:
- added Cc tag.

 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 3473701..7722954 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -150,9 +150,11 @@ define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
 endef
 
 define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
+if [ -e $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/*.bin ]; then \
 	$(foreach f,$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES)), \
-		cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/$(f) $(BINARIES_DIR)/
-	)
+		cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/$(f) $(BINARIES_DIR)/ \
+	) ; \
+fi
 	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL)
 	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL_ELF)
 endef
-- 
2.7.4
