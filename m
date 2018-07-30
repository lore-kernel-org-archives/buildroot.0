From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 30 Jul 2018 15:01:42 +0200
Subject: [Buildroot] [PATCH v3 3/5] imx-vpuwrap: bump version to 4.3.5
In-Reply-To: <20180730130144.31110-1-gary.bisson@boundarydevices.com>
References: <20180730130144.31110-1-gary.bisson@boundarydevices.com>
Message-ID: <20180730130144.31110-4-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No changelog provided for 4.3.5 but it can now builds against the
following VPU backends:
- Chips&Media
- Hantro
- Amphion (not supported in BR yet)

Changes in 4.3.2:
- Add vpu_wrapper_test
- Add gst_dump tools
- Add gl sink
- Enable RMVB/VC1/DIVX3
- Add webp support

Changes in 4.3.4:
- set hasColorDesc and fullRange in VPU_DecGetInitialInfo.
- Fix H264 failure due to too many MBI buffers.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-vpuwrap/Config.in        | 11 +++++------
 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash |  3 ++-
 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk   | 11 +++++++++--
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/package/freescale-imx/imx-vpuwrap/Config.in b/package/freescale-imx/imx-vpuwrap/Config.in
index bdfa147867..8a9bf0e32d 100644
--- a/package/freescale-imx/imx-vpuwrap/Config.in
+++ b/package/freescale-imx/imx-vpuwrap/Config.in
@@ -1,17 +1,16 @@
 comment "imx-vpuwrap needs an imx-specific Linux kernel to be built"
-	depends on BR2_arm
 	depends on !BR2_LINUX_KERNEL
 
 comment "imx-vpuwrap needs an i.MX platform with VPU support"
-	depends on BR2_arm
-	depends on BR2_LINUX_KERNEL && !BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
+	depends on BR2_LINUX_KERNEL
+	depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_VPU && !BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
 
 config BR2_PACKAGE_IMX_VPUWRAP
 	bool "imx-vpuwrap"
 	depends on BR2_LINUX_KERNEL
-	depends on BR2_arm # Only relevant for i.MX
-	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
-	select BR2_PACKAGE_IMX_VPU
+	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU || BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
+	select BR2_PACKAGE_IMX_VPU if BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
+	select BR2_PACKAGE_IMX_VPU_HANTRO if BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
 	help
 	  Wrapper library for the vpu library, giving it a different
 	  API.
diff --git a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash
index 2999984d2c..28c73c002c 100644
--- a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash
+++ b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.hash
@@ -1,2 +1,3 @@
 # locally computed
-sha256	282e7f8766ce385d8752bd29f04ddeff709ece0846be97547cf982183bbe241e  imx-vpuwrap-1.0.68.bin
+sha256  5c08b4b7c771404c998779f0e27a75564b57958d463e2df152c910d76cca9e44  imx-vpuwrap-4.3.5.bin
+sha256  78696664f7afe7f2b081c99af60082d6403fab935b1b10056ed41aec123ff7fa  COPYING
diff --git a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
index edba87279f..fdad3a5f2b 100644
--- a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
+++ b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
@@ -4,12 +4,19 @@
 #
 ################################################################################
 
-IMX_VPUWRAP_VERSION = 1.0.68
+IMX_VPUWRAP_VERSION = 4.3.5
 IMX_VPUWRAP_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPUWRAP_SOURCE = imx-vpuwrap-$(IMX_VPUWRAP_VERSION).bin
-IMX_VPUWRAP_DEPENDENCIES = imx-vpu
 IMX_VPUWRAP_INSTALL_STAGING = YES
 
+ifeq ($(BR2_PACKAGE_IMX_VPU),y)
+IMX_VPUWRAP_DEPENDENCIES = imx-vpu
+endif
+
+ifeq ($(BR2_PACKAGE_IMX_VPU_HANTRO),y)
+IMX_VPUWRAP_DEPENDENCIES = imx-vpu-hantro
+endif
+
 IMX_VPUWRAP_LICENSE = NXP Semiconductor Software License Agreement
 IMX_VPUWRAP_LICENSE_FILES = EULA COPYING
 IMX_VPUWRAP_REDISTRIBUTE = NO
-- 
2.18.0
