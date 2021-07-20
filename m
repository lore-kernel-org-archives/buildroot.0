From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 22:10:56 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: bump version to
 20210511
Message-ID: <20210720193658.765F588597@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=e57e59233cfb8e689855651c23b78dc4aea40484
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- update hash of WHENCE file

- update BRCM_BCM43XX and BRCM_BCM43XXX entries (omitting the new ones with
  spaces in the path name 'brcm/brcmfmac43430a0-sdio.ONDA-V80 PLUS.txt' and
  'brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt') and convert to one
  entry per line format (easier to parse and update)

- fix WHENCE evaluation for new link entries with spaces (otherwise
  reports the following warning '/bin/sh: line 1: test: too many arguments'
  and does not create the link), e.g.:

	Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ 4\ Model\ B.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
	Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ Compute\ Module\ 4.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/linux-firmware.hash |  4 +--
 package/linux-firmware/linux-firmware.mk   | 55 ++++++++++++++++++++----------
 2 files changed, 39 insertions(+), 20 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 12af68f2d3..22d6ddf88f 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f97d6d884026c5e3641909946713dcfea580c307d47830d37d42bfcc9a93870a  linux-firmware-20201022-br1.tar.gz
+sha256  4341b33c64afd8e471de06f1459f63a76445b1ea83055fe3d4103dfb2e1b25ec  linux-firmware-20210511-br1.tar.gz
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
 sha256  8d5847d2971241d4d6a51c16e206379de53a6d4e203fa6f8e1c1e9279c7c4ad0  LICENSE.amdgpu
 sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
@@ -30,6 +30,6 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  18313654864adbb76514e21566528ce57eff42a2a7a66d5823f1f91e895816ea  WHENCE
+sha256  dcc87a24f18d46a73985e68c378ec6d7e7fd4083eb4d4f3130a34fe3f75aff6f  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9f3f4e8635..69b1226cca 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20201022
+LINUX_FIRMWARE_VERSION = 20210511
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
@@ -590,26 +590,45 @@ endif
 # brcm43xx
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX),y)
 LINUX_FIRMWARE_FILES += \
-	brcm/bcm43xx-0.fw brcm/bcm43xx_hdr-0.fw \
-	brcm/bcm4329-fullmac-4.bin brcm/brcmfmac4329-sdio.bin \
-	brcm/brcmfmac4330-sdio.bin brcm/brcmfmac4334-sdio.bin \
-	brcm/brcmfmac4335-sdio.bin brcm/brcmfmac4339-sdio.bin \
-	brcm/brcmfmac4350-pcie.bin brcm/brcmfmac4354-sdio.bin \
-	brcm/brcmfmac4356-pcie.bin brcm/brcmfmac4371-pcie.bin
+	brcm/bcm4329-fullmac-4.bin \
+	brcm/brcmfmac4329-sdio.bin \
+	brcm/brcmfmac4330-sdio.bin \
+	brcm/brcmfmac4334-sdio.bin \
+	brcm/brcmfmac4335-sdio.bin \
+	brcm/brcmfmac4350c2-pcie.bin \
+	brcm/brcmfmac4350-pcie.bin \
+	brcm/brcmfmac4358-pcie.bin \
+	brcm/brcmfmac4371-pcie.bin \
+	brcm/brcmfmac4373.bin \
+	brcm/brcmfmac4330-sdio.Prowise-PT301.txt \
+	brcm/brcmfmac4356-pcie.gpd-win-pocket.txt \
+	brcm/brcmfmac4356-sdio.vamrs,rock960.txt
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
 # brcm43xxx
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX),y)
 LINUX_FIRMWARE_FILES += \
-	brcm/brcmfmac43143.bin brcm/brcmfmac43143-sdio.bin \
-	brcm/brcmfmac43236b.bin brcm/brcmfmac43241b0-sdio.bin \
-	brcm/brcmfmac43241b4-sdio.bin brcm/brcmfmac43241b5-sdio.bin \
-	brcm/brcmfmac43242a.bin brcm/brcmfmac43340-sdio.bin \
-	brcm/brcmfmac43362-sdio.bin brcm/brcmfmac43430-sdio.bin \
-	brcm/brcmfmac43430a0-sdio.bin brcm/brcmfmac43455-sdio.bin \
-	brcm/brcmfmac43569.bin brcm/brcmfmac43570-pcie.bin \
-	brcm/brcmfmac43602-pcie.ap.bin brcm/brcmfmac43602-pcie.bin \
+	brcm/brcmfmac43143.bin \
+	brcm/brcmfmac43143-sdio.bin \
+	brcm/brcmfmac43236b.bin \
+	brcm/brcmfmac43241b0-sdio.bin \
+	brcm/brcmfmac43241b4-sdio.bin \
+	brcm/brcmfmac43241b5-sdio.bin \
+	brcm/brcmfmac43242a.bin \
+	brcm/brcmfmac43430a0-sdio.bin \
+	brcm/brcmfmac43569.bin \
+	brcm/brcmfmac43602-pcie.ap.bin \
+	brcm/brcmfmac43602-pcie.bin \
+	brcm/brcmfmac43340-sdio.meegopad-t08.txt \
+	brcm/brcmfmac43340-sdio.pov-tab-p1006w-data.txt \
+	brcm/brcmfmac43340-sdio.predia-basic.txt \
+	brcm/brcmfmac43362-sdio.cubietech,cubietruck.txt \
+	brcm/brcmfmac43430a0-sdio.ilife-S806.txt \
+	brcm/brcmfmac43430a0-sdio.jumper-ezpad-mini3.txt \
+	brcm/brcmfmac43430-sdio.AP6212.txt \
+	brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt \
+	brcm/brcmfmac43430-sdio.MUR1DX.txt \
 	brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt \
 	brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt \
 	brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
@@ -714,9 +733,9 @@ define LINUX_FIRMWARE_INSTALL_FW
 	cd $(1) ; \
 	sed -r -e '/^Link: (.+) -> (.+)$$/!d; s//\1 \2/' $(@D)/WHENCE | \
 	while read f d; do \
-		if test -f $$(readlink -m $$(dirname $$f)/$$d); then \
-			mkdir -p $$(dirname $$f) || exit 1; \
-			ln -sf $$d $$f || exit 1; \
+		if test -f $$(readlink -m $$(dirname "$$f")/$$d); then \
+			mkdir -p $$(dirname "$$f") || exit 1; \
+			ln -sf $$d "$$f" || exit 1; \
 		fi ; \
 	done
 endef
