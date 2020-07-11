From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 22:38:58 +0200
Subject: [Buildroot] [git commit] package/freescale-imx/firmware-imx: add
 options for all i.MX FW needs
Message-ID: <20200711204122.796F57FAEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00cb4267a1cced9ae650cb9dcb08984cd16a4377
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some SoCs need a HDMI FW for their bootloader, some other require
EPDC, SDMA and/or VPU.

Instead of trying to "guess" what firmware images need to be installed
in firmware-imx.mk, let the Config framework do the job and allow each
SoC to pick what firmware they need.

Note that this patch should also help introducing an eventual DP FW,
as Gary mentioned in a separate thread [1].

[1] http://lists.busybox.net/pipermail/buildroot/2020-May/283181.html

Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/firmware-imx/Config.in | 30 +++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 2cedff5485..aae552177f 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -4,13 +4,41 @@ config BR2_PACKAGE_FIRMWARE_IMX
 	help
 	  Firmware blobs for the Freescale i.MX SoCs.
 
-	  It contains blobs for SDMA and VPU.
+	  It contains blobs for SDMA, VPU, HDMI, EDPC, and DDR
+	  training.
 
 	  This library is provided by Freescale as-is and doesn't have
 	  an upstream.
 
 if BR2_PACKAGE_FIRMWARE_IMX
 
+config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_SDMA_FW
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX25_3STACK
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
+
+config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_VPU_FW
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+
+config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_HDMI_FW
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
+
+config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_EPDC_FW
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
+
 config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
 	bool
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
