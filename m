From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 21:46:08 +0100
Subject: [Buildroot] [git commit] firmware-imx: bump to version 5.2
Message-ID: <20160201224700.E22687FAE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=923155df19718cff1683022aca445ac37399795a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use a different versioning schema based on package versioning
instead of BSP version. This way, if a new BSP version does
not bump this package, we can keep this package unchanged as well.

VPU firmware upgraded to v3.1.1_r46067
- Low Latency fixes for H.264 encoder
- Wrong frame number fix for H.264 decoder
- Decode failure fix for H.264 decoder with multi-SPS/PPS headers

The package adds the EPDC waveforms and the needed changes to properly
install those were done in the firmware-imx.mk file.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/d869826
https://github.com/Freescale/meta-fsl-arm/commit/075a5b1

This package has been implicitely tested through gstreamer as the
plugins rely on them for vpu decoding for instance:
 # gst-launch-1.0 filesrc location=/root/tears_of_steel_1080p.webm ! \
   matroskademux ! imxvpudec ! imxipuvideosink

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
[Thomas:
 - fix typo in commit logs
 - remove ; \ and ; at the end of commands, since they were not
   needed.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.hash | 2 +-
 package/freescale-imx/firmware-imx/firmware-imx.mk   | 9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
index 0b89c4b..06d5a54 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.hash
+++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256 1f09acd4d605efc78a0672068a658cb16274811d2f444cf3ae7aaa075266746f  firmware-imx-3.14.28-1.0.0.bin
+sha256 8cc2df128c0e2d2f5224d73389fbe6e4d6fa9ede76f8c0a9adaf7ec0986d0f1f  firmware-imx-5.2.bin
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 9cab5c2..7e6f0e9 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIRMWARE_IMX_VERSION = $(FREESCALE_IMX_VERSION)
+FIRMWARE_IMX_VERSION = 5.2
 FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
 
@@ -13,17 +13,20 @@ FIRMWARE_IMX_LICENSE = Freescale Semiconductor Software License Agreement, \
 FIRMWARE_IMX_LICENSE_FILES = EULA COPYING
 FIRMWARE_IMX_REDISTRIBUTE = NO
 
-FIRMWARE_IMX_BLOBS = ath6k sdma vpu
+FIRMWARE_IMX_BLOBS = sdma vpu
 
 define FIRMWARE_IMX_EXTRACT_CMDS
 	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(FIRMWARE_IMX_SOURCE))
 endef
 
 define FIRMWARE_IMX_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/lib/firmware
+	mkdir -p $(TARGET_DIR)/lib/firmware/imx
 	for blobdir in $(FIRMWARE_IMX_BLOBS); do \
 		cp -r $(@D)/firmware/$${blobdir} $(TARGET_DIR)/lib/firmware; \
 	done
+	cp -r $(@D)/firmware/epdc $(TARGET_DIR)/lib/firmware/imx
+	mv $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw.nonrestricted \
+	   $(TARGET_DIR)/lib/firmware/imx/epdc/epdc_ED060XH2C1.fw
 endef
 
 $(eval $(generic-package))
