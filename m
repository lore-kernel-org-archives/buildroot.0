From: Stephane Viau <stephane.viau@oss.nxp.com>
Date: Fri, 10 Jul 2020 14:00:44 +0200
Subject: [Buildroot] [PATCH v3 3/4] package/freescale-imx/firmware-imx: Add
 option for all i.MX FW needs
In-Reply-To: <1594382445-4464-1-git-send-email-stephane.viau@oss.nxp.com>
References: <1594382445-4464-1-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <1594382445-4464-4-git-send-email-stephane.viau@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some SoC need a HDMI FW for their bootloader, some other require EPDC,
SDMA and/or VPU.
Instead of trying to "guess" what firmware images need to be installed
in firmware-imx.mk, let the Config framework do the job and allow each
SoC to pick what firmware they need.

Note that this patch should also help introducing an eventual DP FW, as
Gary mentioned in a separate thread [1].

[1] http://lists.busybox.net/pipermail/buildroot/2020-May/283181.html

Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
---
v3:
- only copy the VPU (and SDMA) blob associated to the platform selected (Gary)
- Fix attributes order (make check-package)

v2:
- Do not embed VPU FW for i.MX 6S/6UL/7 (Fabio)
- Name VPU FW after IP name (Fabio)
- Rename symbols using the "_NEED_" in their name (Thomas)

Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
---
 package/freescale-imx/firmware-imx/Config.in | 37 +++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 7ff37ed..2c00ee1 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -4,11 +4,46 @@ config BR2_PACKAGE_FIRMWARE_IMX
 	help
 	  Firmware blobs for the Freescale i.MX SoCs.
 
-	  It contains blobs for SDMA and VPU.
+	  It contains blobs for SDMA, VPU, etc...
 
 	  This library is provided by Freescale as-is and doesn't have
 	  an upstream.
 
+config BR2_PACKAGE_FIRMWARE_IMX_SDMA
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX25_3STACK
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX37_3STACK
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX50
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
+	depends on BR2_PACKAGE_FIRMWARE_IMX
+
+config BR2_PACKAGE_FIRMWARE_IMX_VPU
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+	depends on BR2_PACKAGE_FIRMWARE_IMX
+
+config BR2_PACKAGE_FIRMWARE_IMX_HDMI
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
+	depends on BR2_PACKAGE_FIRMWARE_IMX
+
+config BR2_PACKAGE_FIRMWARE_IMX_EPDC
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
+	depends on BR2_PACKAGE_FIRMWARE_IMX
+
 config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW
 	bool
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
-- 
2.7.4
