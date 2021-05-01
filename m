From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 May 2021 14:55:59 +0200
Subject: [Buildroot] [git commit] package/imx-seco: use the c0 revision for
 the imx8qxp ahab image
Message-ID: <20210501122911.6EF9581674@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea8c74000883e102c5642f35013dbc8bd14a235d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the selection of the ahab container image to use based upon
a choice in the Config.in - there are multiple ASIC revisions that
use AHAB and the firmware images need to match. This extends the
support beyond a default image for just the imx8 amd imx8x based
upon the current contents of the imx-seco firmware extraction.

Files from 3.7.4:
    mx8dxla0-ahab-container.img
    mx8dxla1-ahab-container.img
    mx8qmb0-ahab-container.img
    mx8qxb0-ahab-container.img
    mx8qxc0-ahab-container.img

The original defaults prior to this patch were mx8qmb0 for IMX8
and mx8qxb0 for the IMX8X selections. However, this patch will
change the default selection of the IMX8X from the B0 option to
C0 because the IMX8X C0 HW variant is widespread and the current
release of hardware silicon. Because there are still B0's in
circulation an option is being kept for that as well.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
[yann.morin.1998 at free.fr: 1 minor code style]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/freescale-imx/imx-seco/Config.in   | 44 ++++++++++++++++++++++++++++++
 package/freescale-imx/imx-seco/imx-seco.mk | 11 ++------
 2 files changed, 47 insertions(+), 8 deletions(-)

diff --git a/package/freescale-imx/imx-seco/Config.in b/package/freescale-imx/imx-seco/Config.in
index 1877664a0c..867ffe1bb0 100644
--- a/package/freescale-imx/imx-seco/Config.in
+++ b/package/freescale-imx/imx-seco/Config.in
@@ -7,3 +7,47 @@ config BR2_PACKAGE_IMX_SECO
 
 	  This library is provided by Freescale as-is and doesn't have
 	  an upstream.
+
+if BR2_PACKAGE_IMX_SECO
+
+choice
+	prompt "i.MX Seco Firmware Release"
+	default BR2_PACKAGE_IMX_SECO_MX8QMB0 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
+	default BR2_PACKAGE_IMX_SECO_MX8QXC0 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+	help
+	  Select the appropriate ahab container image to install
+	  to match the iMX asics revision.
+
+	  Note - mismatches result in a failure to boot
+
+config BR2_PACKAGE_IMX_SECO_MX8DXLA0
+	bool "imx-seco-mx8dxla0"
+	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
+
+config BR2_PACKAGE_IMX_SECO_MX8DXLA1
+	bool "imx-seco-mx8dxla1"
+	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
+
+config BR2_PACKAGE_IMX_SECO_MX8QMB0
+	bool "imx-seco-mx8qmb0"
+	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
+
+config BR2_PACKAGE_IMX_SECO_MX8QXB0
+	bool "imx-seco-mx8qxb0"
+	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+
+config BR2_PACKAGE_IMX_SECO_MX8QXC0
+	bool "imx-seco-mx8qxc0"
+	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+
+endchoice
+
+config BR2_PACKAGE_IMX_SECO_AHAB_CONTAINER_IMAGE
+	string
+	default "mx8dxla0-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8DXLA0
+	default "mx8dxla1-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8DXLA1
+	default "mx8qmb0-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8QMB0
+	default "mx8qxb0-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8QXB0
+	default "mx8qxc0-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8QXC0
+
+endif
diff --git a/package/freescale-imx/imx-seco/imx-seco.mk b/package/freescale-imx/imx-seco/imx-seco.mk
index 245c3e3311..79c9722c43 100644
--- a/package/freescale-imx/imx-seco/imx-seco.mk
+++ b/package/freescale-imx/imx-seco/imx-seco.mk
@@ -20,16 +20,11 @@ IMX_SECO_INSTALL_IMAGES = YES
 
 # SECO firmware is needed when generating imx8-boot-sd.bin which
 # is done in post-image script.
-ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
-define IMX_SECO_INSTALL_IMAGES_CMDS
-	cp $(@D)/firmware/seco/mx8qxb0-ahab-container.img \
-		$(BINARIES_DIR)/ahab-container.img
-endef
-else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8),y)
+IMX_SECO_AHAB_CONTAINER_IMAGE = $(call qstrip,$(BR2_PACKAGE_IMX_SECO_AHAB_CONTAINER_IMAGE))
+
 define IMX_SECO_INSTALL_IMAGES_CMDS
-	cp $(@D)/firmware/seco/mx8qmb0-ahab-container.img \
+	cp $(@D)/firmware/seco/$(IMX_SECO_AHAB_CONTAINER_IMAGE) \
 		$(BINARIES_DIR)/ahab-container.img
 endef
-endif
 
 $(eval $(generic-package))
