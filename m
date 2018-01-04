From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu,  4 Jan 2018 12:39:33 +0100
Subject: [Buildroot] [PATCH v2 01/15] freescale-imx: add config options for
 i.MX6SL/SX and i.MX7D/ULP
In-Reply-To: <20180104113947.21235-1-gary.bisson@boundarydevices.com>
References: <20180104113947.21235-1-gary.bisson@boundarydevices.com>
Message-ID: <20180104113947.21235-2-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to match the latest imx-lib PLATFORM variable requirements [1].

Also creating BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU so that it is easier
to hide/show the Vivante-related packages.

[1] https://github.com/Freescale/meta-freescale/blob/master/recipes-bsp/imx-lib/imx-lib_git.bb

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/Config.in | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index fa3f9a0d38..e02adf51e3 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -29,10 +29,16 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
 	bool "imx53"
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
-	bool "imx6q"
+	bool "imx6q/imx6dl"
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
+	bool "imx6sl/imx6sx"
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
-	bool "imx6ul"
+	bool "imx6ul/imx6ull"
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
+	bool "imx7d/imx7ulp"
 
 endchoice
 
@@ -45,14 +51,23 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 	default "IMX51" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
 	default "IMX53" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
 	default "IMX6Q" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
+	default "IMX6S" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
 	default "IMX6UL" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
+	default "IMX7" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
 
 config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 	bool
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53 || \
-		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
+
+config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
 
 source "package/freescale-imx/imx-codec/Config.in"
 source "package/freescale-imx/imx-kobs/Config.in"
@@ -66,7 +81,7 @@ if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFO
 source "package/freescale-imx/gpu-amd-bin-mx51/Config.in"
 source "package/freescale-imx/libz160/Config.in"
 endif
-if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
+if BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 source "package/freescale-imx/imx-gpu-viv/Config.in"
 source "package/freescale-imx/kernel-module-imx-gpu-viv/Config.in"
 endif
-- 
2.15.1
