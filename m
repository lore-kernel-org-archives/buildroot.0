From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 1 May 2021 14:57:13 +0200
Subject: [Buildroot] [PATCH v3] package/imx-seco: use the c0 revision
 for the imx8qxp ahab image
In-Reply-To: <20210430180933.555-1-charles.hardin@chargepoint.com>
References: <20210430180933.555-1-charles.hardin@chargepoint.com>
Message-ID: <20210501125713.GE2137340@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Charles, All,

On 2021-04-30 11:09 -0700, Charles Hardin spake thusly:
> From: Charles Hardin <ckhardin@gmail.com>
> 
> Update the selection of the ahab container image to use based upon
> a choice in the Config.in - there are multiple ASIC revisions that
> use AHAB and the firmware images need to match. This extends the
> support beyond a default image for just the imx8 amd imx8x based
> upon the current contents of the imx-seco firmware extraction.
> 
> Files from 3.7.4:
>     mx8dxla0-ahab-container.img
>     mx8dxla1-ahab-container.img
>     mx8qmb0-ahab-container.img
>     mx8qxb0-ahab-container.img
>     mx8qxc0-ahab-container.img
> 
> The original defaults prior to this patch were mx8qmb0 for IMX8
> and mx8qxb0 for the IMX8X selections. However, this patch will
> change the default selection of the IMX8X from the B0 option to
> C0 because the IMX8X C0 HW variant is widespread and the current
> release of hardware silicon. Because there are still B0's in
> circulation an option is being kept for that as well.
> 
> Signed-off-by: Charles Hardin <ckhardin@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3
>   - add a newline for the endchoice (suggested by Yann)
>   - in this patch there is no way for contain image to be empty
>     so remove the protection and assume extensions of choice
>     will be done correctly in the future (suggested by Yann)
> 
> Changes v1 -> v2:
>   - convert the image selection to a choice in Config.in
>     (suggested by Stephane)
> 
> 
> ---
>  package/freescale-imx/imx-seco/Config.in   | 43 ++++++++++++++++++++++
>  package/freescale-imx/imx-seco/imx-seco.mk | 11 ++----
>  2 files changed, 46 insertions(+), 8 deletions(-)
> 
> diff --git a/package/freescale-imx/imx-seco/Config.in b/package/freescale-imx/imx-seco/Config.in
> index 1877664a0c..596683eb13 100644
> --- a/package/freescale-imx/imx-seco/Config.in
> +++ b/package/freescale-imx/imx-seco/Config.in
> @@ -7,3 +7,46 @@ config BR2_PACKAGE_IMX_SECO
>  
>  	  This library is provided by Freescale as-is and doesn't have
>  	  an upstream.
> +
> +if BR2_PACKAGE_IMX_SECO
> +choice
> +	prompt "i.MX Seco Firmware Release"
> +	default BR2_PACKAGE_IMX_SECO_MX8QMB0 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
> +	default BR2_PACKAGE_IMX_SECO_MX8QXC0 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
> +	help
> +	  Select the appropriate ahab container image to install
> +	  to match the iMX asics revision.
> +
> +	  Note - mismatches result in a failure to boot
> +
> +config BR2_PACKAGE_IMX_SECO_MX8DXLA0
> +	bool "imx-seco-mx8dxla0"
> +	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
> +
> +config BR2_PACKAGE_IMX_SECO_MX8DXLA1
> +	bool "imx-seco-mx8dxla1"
> +	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
> +
> +config BR2_PACKAGE_IMX_SECO_MX8QMB0
> +	bool "imx-seco-mx8qmb0"
> +	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8
> +
> +config BR2_PACKAGE_IMX_SECO_MX8QXB0
> +	bool "imx-seco-mx8qxb0"
> +	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
> +
> +config BR2_PACKAGE_IMX_SECO_MX8QXC0
> +	bool "imx-seco-mx8qxc0"
> +	depends on BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
> +
> +endchoice
> +
> +config BR2_PACKAGE_IMX_SECO_AHAB_CONTAINER_IMAGE
> +	string
> +	default "mx8dxla0-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8DXLA0
> +	default "mx8dxla1-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8DXLA1
> +	default "mx8qmb0-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8QMB0
> +	default "mx8qxb0-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8QXB0
> +	default "mx8qxc0-ahab-container.img" if BR2_PACKAGE_IMX_SECO_MX8QXC0
> +
> +endif
> diff --git a/package/freescale-imx/imx-seco/imx-seco.mk b/package/freescale-imx/imx-seco/imx-seco.mk
> index 245c3e3311..79c9722c43 100644
> --- a/package/freescale-imx/imx-seco/imx-seco.mk
> +++ b/package/freescale-imx/imx-seco/imx-seco.mk
> @@ -20,16 +20,11 @@ IMX_SECO_INSTALL_IMAGES = YES
>  
>  # SECO firmware is needed when generating imx8-boot-sd.bin which
>  # is done in post-image script.
> -ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X),y)
> -define IMX_SECO_INSTALL_IMAGES_CMDS
> -	cp $(@D)/firmware/seco/mx8qxb0-ahab-container.img \
> -		$(BINARIES_DIR)/ahab-container.img
> -endef
> -else ifeq ($(BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8),y)
> +IMX_SECO_AHAB_CONTAINER_IMAGE = $(call qstrip,$(BR2_PACKAGE_IMX_SECO_AHAB_CONTAINER_IMAGE))
> +
>  define IMX_SECO_INSTALL_IMAGES_CMDS
> -	cp $(@D)/firmware/seco/mx8qmb0-ahab-container.img \
> +	cp $(@D)/firmware/seco/$(IMX_SECO_AHAB_CONTAINER_IMAGE) \
>  		$(BINARIES_DIR)/ahab-container.img
>  endef
> -endif
>  
>  $(eval $(generic-package))
> -- 
> 2.21.1 (Apple Git-122.3)
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
