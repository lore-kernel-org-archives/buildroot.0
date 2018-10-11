From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 09:28:54 +0200
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: don't pass
 TARGET_CONFIGURE_OPTS when building
Message-ID: <20181011072918.B82AB7FA8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=baa450e0365e9a1c45d7b9197987853e1affcff9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Passing CFLAGS/CPPFLAGS in the environment confuses the ATF version
provided by Marvell, and we in fact only need to pass CROSS_COMPILE,
which is already in ARM_TRUSTED_FIRMWARE_MAKE_OPTS.

We however keep TARGET_MAKE_ENV so that the PATH with $(HOST_DIR) is
kept.

This change has been tested with all current defconfigs that build
ATF:

 - arm_juno
 - bananapi_m64
 - freescale_imx8mqevk
 - friendlyarm_nanopi_a64
 - friendlyarm_nanopi_neo2
 - nitrogen8m
 - olimex_a64_olinuxino
 - orangepi_pc2
 - orangepi_prime
 - orangepi_win
 - orangepi_zero_plus2
 - pine64
 - pine64_sopine
 - solidrun_macchiatobin_mainline
 - solidrun_macchiatobin_marvell
 - zynqmp_zcu106

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 054a000a1d..19f7c4c80a 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -96,9 +96,8 @@ endif
 
 define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
 	$(ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL)
-	$(TARGET_CONFIGURE_OPTS) \
-		$(MAKE) -C $(@D) $(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
-			$(ARM_TRUSTED_FIRMWARE_MAKE_TARGETS)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
+		$(ARM_TRUSTED_FIRMWARE_MAKE_TARGETS)
 	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_BUILD)
 endef
 
