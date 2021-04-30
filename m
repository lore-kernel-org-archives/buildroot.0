From: Stephane Viau (OSS) <stephane.viau@oss.nxp.com>
Date: Fri, 30 Apr 2021 17:09:10 +0000
Subject: [Buildroot] [PATCH v2] package/imx-seco: use the c0 revision
 for the imx8qxp ahab image
In-Reply-To: <20210430164147.99742-1-charles.hardin@chargepoint.com>
References: <20210428034036.15461-1-charles.hardin@chargepoint.com>,
 <20210430164147.99742-1-charles.hardin@chargepoint.com>
Message-ID: <AM0PR04MB694683382B0E12089ED8F18EA75E9@AM0PR04MB6946.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Charles, 

>
>
>From: Charles Hardin <ckhardin@gmail.com>
>
>Update the selection of the ahab container image to use based upon
>a choice in the Config.in - there are multiple ASIC revisions that
>use AHAB and the firmware images need to match. This extends the
>support beyond a default image for just the imx8 amd imx8x based
>upon the current contents of the imx-seco firmware extraction.
>
>Files from 3.7.4:
>    mx8dxla0-ahab-container.img
>    mx8dxla1-ahab-container.img
>    mx8qmb0-ahab-container.img
>    mx8qxb0-ahab-container.img
>    mx8qxc0-ahab-container.img
>
>Signed-off-by: Charles Hardin <ckhardin@gmail.com>
>
>---
>Changes v1 -> v2:
>  - convert the image selection to a choice in Config.in
>    (suggested by Stephane)

Thank you for the quick feedback on this ; I appreciate it... and will try and test it ASAP!

>
>---
> package/freescale-imx/imx-seco/Config.in   | 38 ++++++++++++++++++++++
> package/freescale-imx/imx-seco/imx-seco.mk | 14 ++++----
> 2 files changed, 44 insertions(+), 8 deletions(-)
>
>diff --git a/package/freescale-imx/imx-seco/Config.in b/package/freescale-imx/imx-seco/Config.in
>index 1877664a0c..e5d835f8b1 100644
>--- a/package/freescale-imx/imx-seco/Config.in
>+++ b/package/freescale-imx/imx-seco/Config.in
>@@ -7,3 +7,41 @@ config BR2_PACKAGE_IMX_SECO
>
>          This library is provided by Freescale as-is and doesn't have
>          an upstream.
>+
>+if BR2_PACKAGE_IMX_SECO
>+choice
>+       prompt "i.MX Seco Firmware Release"
>+       help
>+         Select the appropriate ahab container image to install
>+         to match the asics revision.

Should we default it to C0 when 8X is selected?:

	default BR2_PACKAGE_IMX_SECO_MX8QXC0 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X

BR,
Stephane.

>+
>+config BR2_PACKAGE_IMX_SECO_MX8DXLA0
>+       bool "imx-seco-mx8dxla0"
>+       depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
>+
>+config BR2_PACKAGE_IMX_SECO_MX8DXLA1
>+       bool "imx-seco-mx8dxla1"
>+       depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
>+
>+config BR2_PACKAGE_IMX_SECO_MX8QMB0
>+       bool "imx-seco-mx8qmb0"
>+       depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
>+
>+config BR2_PACKAGE_IMX_SECO_MX8QXB0
>+       bool "imx-seco-mx8qxb0"
>+       depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
>+
>+config BR2_PACKAGE_IMX_SECO_MX8QXC0
>+       bool "imx-seco-mx8qxc0"
>+       depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
>+endchoice
>+
>+config BR2_PACKAGE_IMX_SECO_AHAB_CONTAINER_IMAGE
>+       string
>+       default "mx8dxla0-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8DXLA0
>+       default "mx8dxla1-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8DXLA1
>+       default "mx8qmb0-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8QMB0
>+       default "mx8qxb0-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8QXB0
>+       default "mx8qxc0-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8QXC0
>+
>+endif
>diff --git a/package/freescale-imx/imx-seco/imx-seco.mk b/package/freescale-imx/imx-seco/imx-seco.mk
>index 245c3e3311..b1a38b5943 100644
>--- a/package/freescale-imx/imx-seco/imx-seco.mk
>+++ b/package/freescale-imx/imx-seco/imx-seco.mk
>@@ -18,18 +18,16 @@ endef
>
> IMX_SECO_INSTALL_IMAGES = YES
>
>+IMX_SECO_AHAB_CONTAINER_IMAGE = $(call qstrip,$(BR2_PACKAGE_IMX_SECO_AHAB_CONTAINER_IMAGE))
>+ifeq ($(IMX_SECO_AHAB_CONTAINER_IMAGE),)
>+$(error No iMX Seco AHAB Container Image file specified)
>+endif
>+
> # SECO firmware is needed when generating imx8-boot-sd.bin which
> # is done in post-image script.
>-ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
>-define IMX_SECO_INSTALL_IMAGES_CMDS
>-       cp $(@D)/firmware/seco/mx8qxb0-ahab-container.img \
>-               $(BINARIES_DIR)/ahab-container.img
>-endef
>-else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8),y)
> define IMX_SECO_INSTALL_IMAGES_CMDS
>-       cp $(@D)/firmware/seco/mx8qmb0-ahab-container.img \
>+       cp $(@D)/firmware/seco/$(IMX_SECO_AHAB_CONTAINER_IMAGE) \
>                $(BINARIES_DIR)/ahab-container.img
> endef
>-endif
>
> $(eval $(generic-package))
>--
>2.21.1 (Apple Git-122.3)
>
>
