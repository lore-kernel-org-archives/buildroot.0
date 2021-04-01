From: Andreas Ziegler <br015@umbiko.net>
Date: Thu,  1 Apr 2021 14:04:12 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/rpi-wifi-firmware: provide board
 specific links to firmware configuration files for BCM43430 and BCM43455
 based Raspberry Pi models
In-Reply-To: <20210329184503.10514-1-ps.report@gmx.net>
References: <20210329184503.10514-1-ps.report@gmx.net>
Message-ID: <20210401120412.232714-1-br015@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Broadcom FMAC firmware loader in the current Linux kernel branch (5.x.y), when loading NVRAM files, tries to load a board specific file first. If that fails, the standard file name is used. The package rpi-wifi-firmware does not provide these board specific files; this results in unneccesary warning messages in the kernel log: 

(RPi3B+):

  brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt failed with error -2

(RPi4B):

  brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt failed with error -2

(RPi0W):

  brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt failed with error -2

(RPi3B):

  This was found to be present in linux-firmware [1] and Ubuntu 20.04.2 [2]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
[2] https://ubuntu.com/download/raspberry-pi

This patch provides links for BCM43430 and BCM43455 based Raspberry Pi models, to avoid the observed firmware load failure messages in the kernel log. 

Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Changes v1 -> v2:
  - added links for brcmfmac43430 based RPi0W and RPi3B

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
 package/rpi-wifi-firmware/rpi-wifi-firmware.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
index 24ba5941b0..f98fc4cd68 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
@@ -12,6 +12,11 @@ RPI_WIFI_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
 define RPI_WIFI_FIRMWARE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
 	$(INSTALL) -m 0644 $(@D)/firmware/brcm/brcmfmac* $(TARGET_DIR)/lib/firmware/brcm
-endef
+	ln -sf brcmfmac43430-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt
+	ln -sf brcmfmac43430-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt
+	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt
+	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
+	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
+	endef
 
 $(eval $(generic-package))
-- 
2.25.1
