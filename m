From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Fri, 13 Sep 2019 17:44:57 +0200
Subject: [Buildroot] [PATCH 5/7] package/freescale-imx/firmware-imx:
In-Reply-To: <20190909121525.13935-5-maeva.manuel@nxp.com>
References: <20190909121525.13935-1-maeva.manuel@nxp.com>
 <20190909121525.13935-5-maeva.manuel@nxp.com>
Message-ID: <64e53524-f408-94c8-473b-4692bbbf7c88@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09.09.19 14:15, Maeva Manuel wrote:
>    bump to version 8.0 to support i.MX8QM
> 
> Signed-off-by: Maeva Manuel <maeva.manuel@nxp.com>
> ---
>   .../freescale-imx/firmware-imx/firmware-imx.hash   |  2 +-
>   package/freescale-imx/firmware-imx/firmware-imx.mk | 14 +++++++++++---
>   2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
> index c22ee4c192..615c549e7d 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.hash
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256 a8f099bdf786b2da1e8b43094950c033ccdbf93f1b8a93caffb912e1500cd735  firmware-imx-7.5.bin
> +sha256 63ec62f5d229cbed00918c8449173933f1c9d594c59396b8dd217e94f47138b0  firmware-imx-8.0.bin
>   sha256 fc93f26e4197b9240c327ce26ae6e02123f022423d4704c7b0448a37372cf2a2  EULA
>   sha256 78696664f7afe7f2b081c99af60082d6403fab935b1b10056ed41aec123ff7fa  COPYING
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
> index b70b581523..92c090fae0 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.mk
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -FIRMWARE_IMX_VERSION = 7.5
> +FIRMWARE_IMX_VERSION = 8.0
>   FIRMWARE_IMX_SITE = $(FREESCALE_IMX_SITE)
>   FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
>   
> @@ -45,13 +45,21 @@ define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
>   	cp $(@D)/firmware/hdmi/cadence/signed_hdmi_imx8m.bin \
>   		$(BINARIES_DIR)/signed_hdmi_imx8m.bin
>   endef
> +else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8),y)
> +FIRMWARE_IMX_INSTALL_IMAGES = YES
> +define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
> +	# SECO firmware is needed when generating imx8-boot-sd.bin which
> +	# is done in post-image script.
> +	cp $(@D)/firmware/seco/mx8qm-ahab-container.img \
> +		$(BINARIES_DIR)/mx8qm-ahab-container.img
> +endef
>   else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
>   FIRMWARE_IMX_INSTALL_IMAGES = YES
>   define FIRMWARE_IMX_INSTALL_IMAGES_CMDS
>   	# SECO firmware is needed when generating imx8-boot-sd.bin which
>   	# is done in post-image script.
> -	cp $(@D)/firmware/seco/ahab-container.img \
> -		$(BINARIES_DIR)/ahab-container.img
> +	cp $(@D)/firmware/seco/mx8qx-ahab-container.img \
> +		$(BINARIES_DIR)/mx8qx-ahab-container.img
>   endef
>   else
>   define FIRMWARE_IMX_INSTALL_TARGET_CMDS
> 

Hi Ma?va,

interesting patchset :)
This patch should take care of places using the ahab-container.img, 
because the name changes with the upgrade. Namely imx8-bootloader-prepare.sh
As you should have easy access to an i.MX8QXP MEK board, could you 
please verify that the version upgrades don't break the build and 
especially the runtime on it?

Best regards,
Andr? Hentschel
