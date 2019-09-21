From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Sep 2019 18:31:26 +0200
Subject: [Buildroot] [git commit] binaries-marvell: bump version and switch
 to common firmware
Message-ID: <20190921164321.CC41F8EF26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a220de466ad8ee03d16527f8de5f50fea170e4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since release 18.12 binaries-marvell repository provides
common firmware supporting both A7K and A8K SoC families.

This commit bumps package version to 18.12 and removes
platform specific binary selections from Config.in.
Single firmware image suitable for both A7K and A8K
platforms is now specified in mk file explicitely.

Legacy handling is not needed, as configs which did have
the option set will continue to work without change.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
[Arnout:
 - Remove BINARIES_MARVELL_IMAGE entirely;
 - Add remark about legacy handling;
 - Remove the deprecated option from the defconfigs and test that use
   it.]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/binaries-marvell/Config.in                  | 22 +---------------------
 boot/binaries-marvell/binaries-marvell.hash      |  4 ++--
 boot/binaries-marvell/binaries-marvell.mk        |  7 +++----
 configs/solidrun_clearfog_gt_8k_defconfig        |  1 -
 configs/solidrun_macchiatobin_mainline_defconfig |  1 -
 configs/solidrun_macchiatobin_marvell_defconfig  |  1 -
 support/testing/tests/boot/test_atf.py           |  1 -
 7 files changed, 6 insertions(+), 31 deletions(-)

diff --git a/boot/binaries-marvell/Config.in b/boot/binaries-marvell/Config.in
index 63052070bd..80fbecb270 100644
--- a/boot/binaries-marvell/Config.in
+++ b/boot/binaries-marvell/Config.in
@@ -7,26 +7,6 @@ config BR2_TARGET_BINARIES_MARVELL
 	  reset and system control. ATF Boot Loader stage 2 (BL2) loads
 	  optional SCP_BL2 image into a platform-specific region
 	  of secure memory. This package downloads and installs such
-	  firmwares, which are needed to build ATF.
+	  firmware, which is needed to build ATF.
 
 	  https://github.com/MarvellEmbeddedProcessors/binaries-marvell/
-
-if BR2_TARGET_BINARIES_MARVELL
-
-choice
-	prompt "Marvell Armada platform"
-
-config BR2_TARGET_BINARIES_MARVELL_7040
-	bool "7040"
-
-config BR2_TARGET_BINARIES_MARVELL_8040
-	bool "8040"
-
-endchoice
-
-config BR2_TARGET_BINARIES_MARVELL_IMAGE
-	string
-	default "mrvl_scp_bl2_mss_ap_cp1_a8040.img" if BR2_TARGET_BINARIES_MARVELL_8040
-	default "mrvl_scp_bl2_mss_ap_cp1_a7040.img" if BR2_TARGET_BINARIES_MARVELL_7040
-
-endif
diff --git a/boot/binaries-marvell/binaries-marvell.hash b/boot/binaries-marvell/binaries-marvell.hash
index 0d214502a7..a7d5928a5d 100644
--- a/boot/binaries-marvell/binaries-marvell.hash
+++ b/boot/binaries-marvell/binaries-marvell.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 45c348d7a62fd147e7c6a59211a77876ce5dd26de690bd45ab79c8ff891acedf binaries-marvell-14481806e699dcc6f7025dbe3e46cf26bb787791.tar.gz
-sha256 509a36bb6faa106bbc9730c23038a361ee0c860e53a4cdf9e8605c0174fe45f7	README.md
+sha256 d818c95bcd4d5c026238d6e554151184ed7fea15bce1f861f9068b97b4cd320a binaries-marvell-c5d3ef2b63ba66d8717ecbe679fd2e639cde88ee.tar.gz
+sha256 e6d08ef60068ee72c68835001a24eb832dcba27cac0dde0f179dfb428be050ca README.md
diff --git a/boot/binaries-marvell/binaries-marvell.mk b/boot/binaries-marvell/binaries-marvell.mk
index 6c70148540..1a27fa9873 100644
--- a/boot/binaries-marvell/binaries-marvell.mk
+++ b/boot/binaries-marvell/binaries-marvell.mk
@@ -4,18 +4,17 @@
 #
 ################################################################################
 
-# This is version binaries-marvell-armada-18.06
-BINARIES_MARVELL_VERSION = 14481806e699dcc6f7025dbe3e46cf26bb787791
+# This is version binaries-marvell-armada-18.12
+BINARIES_MARVELL_VERSION = c5d3ef2b63ba66d8717ecbe679fd2e639cde88ee
 BINARIES_MARVELL_SITE = $(call github,MarvellEmbeddedProcessors,binaries-marvell,$(BINARIES_MARVELL_VERSION))
 
 BINARIES_MARVELL_LICENSE = GPL-2.0 with freertos-exception-2.0
 BINARIES_MARVELL_LICENSE_FILES = README.md
 
-BINARIES_MARVELL_IMAGE = $(call qstrip,$(BR2_TARGET_BINARIES_MARVELL_IMAGE))
 BINARIES_MARVELL_INSTALL_IMAGES  = YES
 
 define BINARIES_MARVELL_INSTALL_IMAGES_CMDS
-	$(INSTALL) -D -m 0644 $(@D)/$(BINARIES_MARVELL_IMAGE) $(BINARIES_DIR)/scp-fw.bin
+	$(INSTALL) -D -m 0644 $(@D)/mrvl_scp_bl2.img $(BINARIES_DIR)/scp-fw.bin
 endef
 
 $(eval $(generic-package))
diff --git a/configs/solidrun_clearfog_gt_8k_defconfig b/configs/solidrun_clearfog_gt_8k_defconfig
index a44038e663..626302d9cd 100644
--- a/configs/solidrun_clearfog_gt_8k_defconfig
+++ b/configs/solidrun_clearfog_gt_8k_defconfig
@@ -14,7 +14,6 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
 BR2_TARGET_BINARIES_MARVELL=y
-BR2_TARGET_BINARIES_MARVELL_8040=y
 BR2_TARGET_MV_DDR_MARVELL=y
 
 # U-Boot
diff --git a/configs/solidrun_macchiatobin_mainline_defconfig b/configs/solidrun_macchiatobin_mainline_defconfig
index 8e5fbfa4e8..79eb1e05ae 100644
--- a/configs/solidrun_macchiatobin_mainline_defconfig
+++ b/configs/solidrun_macchiatobin_mainline_defconfig
@@ -14,7 +14,6 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
 BR2_TARGET_BINARIES_MARVELL=y
-BR2_TARGET_BINARIES_MARVELL_8040=y
 BR2_TARGET_MV_DDR_MARVELL=y
 
 # U-Boot
diff --git a/configs/solidrun_macchiatobin_marvell_defconfig b/configs/solidrun_macchiatobin_marvell_defconfig
index 4b52e47945..4d269b9f75 100644
--- a/configs/solidrun_macchiatobin_marvell_defconfig
+++ b/configs/solidrun_macchiatobin_marvell_defconfig
@@ -14,7 +14,6 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
 BR2_TARGET_BINARIES_MARVELL=y
-BR2_TARGET_BINARIES_MARVELL_8040=y
 BR2_TARGET_MV_DDR_MARVELL=y
 
 # U-Boot
diff --git a/support/testing/tests/boot/test_atf.py b/support/testing/tests/boot/test_atf.py
index bb3701baed..21c3ec314e 100644
--- a/support/testing/tests/boot/test_atf.py
+++ b/support/testing/tests/boot/test_atf.py
@@ -69,7 +69,6 @@ class TestATFMarvell(infra.basetest.BRTest):
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="USE_COHERENT_MEM=0"
         BR2_TARGET_BINARIES_MARVELL=y
-        BR2_TARGET_BINARIES_MARVELL_8040=y
         BR2_TARGET_MV_DDR_MARVELL=y
         BR2_TARGET_UBOOT=y
         BR2_TARGET_UBOOT_BOARDNAME="mvebu_mcbin-88f8040"
