From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 13 Jan 2021 09:08:22 -0300
Subject: [Buildroot] [PATCH] package/freescale-imx/firmware-imx: install the
 VPU firmware into a valid location
Message-ID: <20210113120822.327-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mainline kernel searches the coda VPU firmware inside the following
locations [1]:

/lib/firmware/
/lib/firmware/vpu/

Currently Buildroot installs the coda firmware into /lib/firmware/imx/vpu,
which is not a valid location.

Fix it to install the coda firmwares into /lib/firmware/vpu/ which
is a valid path for both mainline and NXP vendor kernels. 

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=8af7779f3cbc1f6720d15f00abc797493710d1ab

Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index 7d1f42f1d87b..f65614c9a79c 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -116,9 +116,9 @@ endif
 FIRMWARE_IMX_VPU_FW_NAME = $(call qstrip,$(BR2_PACKAGE_FIRMWARE_IMX_VPU_FW_NAME))
 ifneq ($(FIRMWARE_IMX_VPU_FW_NAME),)
 define FIRMWARE_IMX_INSTALL_TARGET_VPU_FW
-	mkdir -p $(TARGET_DIR)/lib/firmware/imx/vpu
+	mkdir -p $(TARGET_DIR)/lib/firmware/vpu
 	cp $(@D)/firmware/vpu/vpu_fw_$(FIRMWARE_IMX_VPU_FW_NAME)*.bin \
-		$(TARGET_DIR)/lib/firmware/imx/vpu/
+		$(TARGET_DIR)/lib/firmware/vpu/
 endef
 endif
 
-- 
2.17.1
