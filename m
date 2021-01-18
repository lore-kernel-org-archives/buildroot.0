From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2021 21:36:11 +0100
Subject: [Buildroot] [git commit branch/2020.11.x]
 package/freescale-imx/firmware-imx: fix the VPU firmware location
Message-ID: <20210118202006.AA7B1883C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=489736cd02b1f372ea390f12087fdf0a1c7f04e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

The mainline kernel searches the coda VPU firmware inside the following
locations [1]:

/lib/firmware/
/lib/firmware/vpu/

Currently Buildroot installs the coda firmware into /lib/firmware/imx/vpu,
which is not a valid location.

Fix it by installing the coda firmwares into /lib/firmware/vpu/ which
is a valid path for both mainline and NXP vendor kernels. Also create a
symlink to /lib/firmware/ so that mainline kernels do not need to wait
more than 60 seconds to search again inside /lib/firmware/vpu/.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=8af7779f3cbc1f6720d15f00abc797493710d1ab

Reported-by: Romain Naour <romain.naour@gmail.com>
Suggested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ec18cac9f9e92d6a03d9d1936553abe1dcd2d327)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freescale-imx/firmware-imx/firmware-imx.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index fb3cfe640b..1ff09baff0 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -116,9 +116,11 @@ endif
 FIRMWARE_IMX_VPU_FW_NAME = $(call qstrip,$(BR2_PACKAGE_FIRMWARE_IMX_VPU_FW_NAME))
 ifneq ($(FIRMWARE_IMX_VPU_FW_NAME),)
 define FIRMWARE_IMX_INSTALL_TARGET_VPU_FW
-	mkdir -p $(TARGET_DIR)/lib/firmware/imx/vpu
-	cp $(@D)/firmware/vpu/vpu_fw_$(FIRMWARE_IMX_VPU_FW_NAME)*.bin \
-		$(TARGET_DIR)/lib/firmware/imx/vpu/
+	mkdir -p $(TARGET_DIR)/lib/firmware/vpu
+	for i in $$(find $(@D)/firmware/vpu/vpu_fw_$(FIRMWARE_IMX_VPU_FW_NAME)*.bin); do \
+		cp $$i $(TARGET_DIR)/lib/firmware/vpu/ ; \
+		ln -sf vpu/$$(basename $$i) $(TARGET_DIR)/lib/firmware/$$(basename $$i) ; \
+	done
 endef
 endif
 
