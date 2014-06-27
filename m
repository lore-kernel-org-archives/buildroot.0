From: Gary Bisson <bisson.gary@gmail.com>
Date: Thu, 26 Jun 2014 22:24:47 -0700
Subject: [Buildroot] [PATCH v2 04/11] freescale-imx: change platform choice
	to be common
In-Reply-To: <1403846694-21974-1-git-send-email-bisson.gary@gmail.com>
References: <1403150639-29382-1-git-send-email-bisson.gary@gmail.com>
 <1403846694-21974-1-git-send-email-bisson.gary@gmail.com>
Message-ID: <1403846694-21974-5-git-send-email-bisson.gary@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

that way all the packages can inherit from that information plus the
Vivante package will only be available for iMX6Q platforms.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 package/freescale-imx/Config.in          | 47 ++++++++++++++++++++++++++++++--
 package/freescale-imx/imx-lib/Config.in  | 37 -------------------------
 package/freescale-imx/imx-lib/imx-lib.mk |  2 +-
 3 files changed, 46 insertions(+), 40 deletions(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 7c22f79..0626a74 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -1,8 +1,51 @@
-menu "Freescale i.MX libraries"
+menuconfig BR2_PACKAGE_FREESCALE_IMX
+	bool "Freescale i.MX libraries"
 	depends on BR2_arm
+	help
+	  Those packages provide hardware acceleration for GPU or VPU, hardware
+	  optimization or some hardware tools for Freescale i.MX platforms.
+
+if BR2_PACKAGE_FREESCALE_IMX
+choice
+	prompt "i.MX platform"
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX25_3STACK
+	bool "imx25-3stack"
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS
+	bool "imx27ads"
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX37_3STACK
+	bool "imx37-3stack"
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX50
+	bool "imx50"
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
+	bool "imx51"
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
+	bool "imx53"
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
+	bool "imx6q"
+
+endchoice
+
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
+	string
+	default "IMX25_3STACK" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX25_3STACK
+	default "IMX27ADS" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS
+	default "IMX37_3STACK" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX37_3STACK
+	default "IMX50" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX50
+	default "IMX51" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
+	default "IMX53" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
+	default "IMX6Q" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
 
 source "package/freescale-imx/imx-lib/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
+if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
 source "package/freescale-imx/gpu-viv-bin-mx6q/Config.in"
+endif
 
-endmenu
+endif
diff --git a/package/freescale-imx/imx-lib/Config.in b/package/freescale-imx/imx-lib/Config.in
index 444060b..3b0f7a9 100644
--- a/package/freescale-imx/imx-lib/Config.in
+++ b/package/freescale-imx/imx-lib/Config.in
@@ -14,40 +14,3 @@ config BR2_PACKAGE_IMX_LIB
 	  This library is provided by Freescale as-is and doesn't have
 	  an upstream.
 
-if BR2_PACKAGE_IMX_LIB
-choice
-	prompt "i.MX platform"
-
-config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX25_3STACK
-	bool "imx25-3stack"
-
-config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX27ADS
-	bool "imx27ads"
-
-config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX37_3STACK
-	bool "imx37-3stack"
-
-config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX50
-	bool "imx50"
-
-config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX51
-	bool "imx51"
-
-config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX53
-	bool "imx53"
-
-config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX6Q
-	bool "imx6q"
-
-endchoice
-
-config BR2_PACKAGE_IMX_LIB_PLATFORM
-	string
-	default "IMX25_3STACK" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX25_3STACK
-	default "IMX27ADS" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX27ADS
-	default "IMX37_3STACK" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX37_3STACK
-	default "IMX50" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX50
-	default "IMX51" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX51
-	default "IMX53" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX53
-	default "IMX6Q" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX6Q
-endif
diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
index 2a94430..0d66759 100644
--- a/package/freescale-imx/imx-lib/imx-lib.mk
+++ b/package/freescale-imx/imx-lib/imx-lib.mk
@@ -23,7 +23,7 @@ IMX_LIB_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
 	$(TARGET_CONFIGURE_OPTS) \
 	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
-	PLATFORM=$(BR2_PACKAGE_IMX_LIB_PLATFORM) \
+	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM) \
 	INCLUDE="$(IMX_LIB_INCLUDE)"
 
 define IMX_LIB_BUILD_CMDS
-- 
2.0.0
