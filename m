From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 16 Mar 2016 15:56:51 +0100
Subject: [Buildroot] [PATCH 11/14] imx-uuc: add new package
In-Reply-To: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1458140214-22303-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1458140214-22303-12-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package provides the Universal Adapter user-space utility that is
used to receive commands from the Manufacturing Tool by the Freescale
UTP Protocol.

It only works on Freescale/NXP kernels whose configuration contains
the CONFIG_FSL_UTP option.

In order to use it, the best is to make a ramdisk image whose init
points to /linuxrc. Otherwise you can simply invoke the tool once
booted:
 $ uuc

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/Config.in            |  1 +
 package/freescale-imx/imx-uuc/Config.in    | 11 +++++++++++
 package/freescale-imx/imx-uuc/imx-uuc.hash |  1 +
 package/freescale-imx/imx-uuc/imx-uuc.mk   | 20 ++++++++++++++++++++
 4 files changed, 33 insertions(+)
 create mode 100644 package/freescale-imx/imx-uuc/Config.in
 create mode 100644 package/freescale-imx/imx-uuc/imx-uuc.hash
 create mode 100644 package/freescale-imx/imx-uuc/imx-uuc.mk

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index dfb6cc4..bc3ddd6 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -44,6 +44,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 
 source "package/freescale-imx/imx-kobs/Config.in"
 source "package/freescale-imx/imx-lib/Config.in"
+source "package/freescale-imx/imx-uuc/Config.in"
 source "package/freescale-imx/imx-vpu/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
 if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
diff --git a/package/freescale-imx/imx-uuc/Config.in b/package/freescale-imx/imx-uuc/Config.in
new file mode 100644
index 0000000..2cd8299
--- /dev/null
+++ b/package/freescale-imx/imx-uuc/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_IMX_UUC
+	bool "imx-uuc"
+	depends on BR2_arm # Only relevant for i.MX
+	help
+	  This package provides the Universal Adapter user-space utility
+	  that is used to receive commands from the Manufacturing Tool
+	  by the Freescale UTP Protocol.
+
+	  This package is provided by Freescale/NXP as-is and doesn't have
+	  an upstream.
+
diff --git a/package/freescale-imx/imx-uuc/imx-uuc.hash b/package/freescale-imx/imx-uuc/imx-uuc.hash
new file mode 100644
index 0000000..aab9ea8
--- /dev/null
+++ b/package/freescale-imx/imx-uuc/imx-uuc.hash
@@ -0,0 +1 @@
+sha256 95d7f7b075f58fedc07602fbc0e5bf5212d28deea3d09cdbcbd80992dcd18482  imx-uuc-0.5.1.tar.gz
diff --git a/package/freescale-imx/imx-uuc/imx-uuc.mk b/package/freescale-imx/imx-uuc/imx-uuc.mk
new file mode 100644
index 0000000..1bd419e
--- /dev/null
+++ b/package/freescale-imx/imx-uuc/imx-uuc.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# imx-uuc
+#
+################################################################################
+
+IMX_UUC_VERSION = 0.5.1
+IMX_UUC_SITE = $(FREESCALE_IMX_SITE)
+IMX_UUC_LICENSE = GPLv2+
+IMX_UUC_LICENSE_FILES = COPYING
+
+define IMX_UUC_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC=$(TARGET_CC)
+endef
+
+define IMX_UUC_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.7.0
