From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Feb 2019 15:29:34 +0100
Subject: [Buildroot] [git commit branch/next]
 package/freescale-imx/imx-sc-firmware: new package
Message-ID: <20190223152837.60FDA8D700@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0366a0ec71ff187d38d726dd99e9e121994a88ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Andr?? Hentschel <andre.hentschel@zf.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/freescale-imx/Config.in                    |  1 +
 package/freescale-imx/imx-sc-firmware/Config.in    |  8 +++++++
 .../imx-sc-firmware/imx-sc-firmware.mk             | 27 ++++++++++++++++++++++
 4 files changed, 37 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 44de17aba1..65051db72c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -129,6 +129,7 @@ F:	package/ktap/
 
 N:	Andr?? Hentschel <nerv@dawncrow.de>
 F:	package/azure-iot-sdk-c/
+F:	package/freescale-imx/imx-sc-firmware/
 F:	package/libkrb5/
 F:	package/openal/
 F:	package/p7zip/
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 9001764437..fcceacdc9e 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -90,6 +90,7 @@ source "package/freescale-imx/imx-vpu/Config.in"
 source "package/freescale-imx/imx-vpu-hantro/Config.in"
 source "package/freescale-imx/imx-vpuwrap/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
+source "package/freescale-imx/imx-sc-firmware/Config.in"
 if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
 source "package/freescale-imx/gpu-amd-bin-mx51/Config.in"
 source "package/freescale-imx/libz160/Config.in"
diff --git a/package/freescale-imx/imx-sc-firmware/Config.in b/package/freescale-imx/imx-sc-firmware/Config.in
new file mode 100644
index 0000000000..5c71618ce0
--- /dev/null
+++ b/package/freescale-imx/imx-sc-firmware/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_IMX_SC_FIRMWARE
+	bool "imx-sc-firmware"
+	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+	help
+	  System Control Unit Firmware blobs for the Freescale i.MX8 SoCs.
+
+	  This library is provided by Freescale as-is and doesn't have
+	  an upstream.
diff --git a/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
new file mode 100644
index 0000000000..fac20d0c6f
--- /dev/null
+++ b/package/freescale-imx/imx-sc-firmware/imx-sc-firmware.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# imx-sc-firmware
+#
+################################################################################
+
+IMX_SC_FIRMWARE_VERSION = 1.0
+IMX_SC_FIRMWARE_SITE = $(FREESCALE_IMX_SITE)
+IMX_SC_FIRMWARE_SOURCE = imx-sc-firmware-$(IMX_SC_FIRMWARE_VERSION).bin
+
+IMX_SC_FIRMWARE_LICENSE = NXP Semiconductor Software License Agreement
+IMX_SC_FIRMWARE_LICENSE_FILES = EULA COPYING
+IMX_SC_FIRMWARE_REDISTRIBUTE = NO
+
+define IMX_SC_FIRMWARE_EXTRACT_CMDS
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_SC_FIRMWARE_DL_DIR)/$(IMX_SC_FIRMWARE_SOURCE))
+endef
+
+IMX_SC_FIRMWARE_INSTALL_IMAGES = YES
+define IMX_SC_FIRMWARE_INSTALL_IMAGES_CMDS
+	# SCFW firmware is needed when generating imx8-boot-sd.bin which
+	# is done in post-image script.
+	cp $(@D)/mx8qx-mek-scfw-tcm.bin $(BINARIES_DIR)/mx8qx-mek-scfw-tcm.bin
+	cp $(@D)/mx8qx-val-scfw-tcm.bin $(BINARIES_DIR)/mx8qx-val-scfw-tcm.bin
+endef
+
+$(eval $(generic-package))
