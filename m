From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Oct 2015 20:07:51 +0100
Subject: [Buildroot] [git commit] imx-vpu: remove kernel dependency
Message-ID: <20151002190830.A76AC8082B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ac0982fb7e936c48c0925b272eb18e0195e1c47
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The imx-vpu package builds just fine without any special kernel header.

Cc: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/imx-vpu/Config.in  |    5 -----
 package/freescale-imx/imx-vpu/imx-vpu.mk |    5 +----
 2 files changed, 1 insertions(+), 9 deletions(-)

diff --git a/package/freescale-imx/imx-vpu/Config.in b/package/freescale-imx/imx-vpu/Config.in
index 8a95416..220385c 100644
--- a/package/freescale-imx/imx-vpu/Config.in
+++ b/package/freescale-imx/imx-vpu/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_IMX_VPU
 	bool "imx-vpu"
-	depends on BR2_LINUX_KERNEL
 	depends on BR2_arm # Only relevant for i.MX
 	select BR2_PACKAGE_FIRMWARE_IMX
 	help
@@ -11,7 +10,3 @@ config BR2_PACKAGE_IMX_VPU
 
 	  This library is provided by Freescale as-is and doesn't have
 	  an upstream.
-
-comment "imx-vpu needs an imx-specific Linux kernel to be built"
-	depends on BR2_arm
-	depends on !BR2_LINUX_KERNEL
diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
index 4c4a031..599dce8 100644
--- a/package/freescale-imx/imx-vpu/imx-vpu.mk
+++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
@@ -10,14 +10,11 @@ IMX_VPU_SOURCE = imx-vpu-$(IMX_VPU_VERSION).bin
 
 IMX_VPU_INSTALL_STAGING = YES
 
-# imx-vpu needs access to imx-specific kernel headers
-IMX_VPU_DEPENDENCIES += linux
 IMX_VPU_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
 	$(TARGET_CONFIGURE_OPTS) \
 	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
-	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM) \
-	INCLUDE="-idirafter $(LINUX_DIR)/include"
+	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM)
 
 IMX_VPU_LICENSE = Freescale Semiconductor Software License Agreement
 IMX_VPU_LICENSE_FILES = EULA vpu/EULA.txt
