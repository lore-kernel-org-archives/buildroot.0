From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Nov 2017 23:15:11 +0100
Subject: [Buildroot] [PATCH v3 1/2] uboot: Add support for U-Boot TPL
In-Reply-To: <1510664226-32208-1-git-send-email-jagan@amarulasolutions.com>
References: <1510664226-32208-1-git-send-email-jagan@amarulasolutions.com>
Message-ID: <20171115231511.5d9626e5@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jagan,

On Tue, 14 Nov 2017 13:57:05 +0100, Jagan Teki wrote:

> +config BR2_TARGET_UBOOT_TPL
> +	bool "Install U-Boot TPL binary image"
> +	depends on BR2_TARGET_UBOOT_SPL
> +	help
> +	  Install the U-Boot TPL binary image to the images
> +	  directory.
> +	  TPL is first stage bootloader, On rk3288 vyasa board due to size
> +	  limitation on SPL.
> +
> +	  Since the size of SPL can't be exceeded 0x8000 bytes in RK3288,
> +	  it is not possible add new SPL features like Falcon mode or etc.
> +
> +	  So add TPL stage so-that adding new features to SPL is possible.
> +	  - TPL: DRAM init, clocks
> +	  - SPL: MMC, falcon, etc
> +
> +config BR2_TARGET_UBOOT_TPL_NAME
> +	string "U-Boot TPL binary image name"
> +	default "tpl/u-boot-tpl.bin"
> +	depends on BR2_TARGET_UBOOT_TPL
> +	help
> +	  A space-separated list of TPL binaries, generated during
> +	  u-boot build. For most platform it is spl/u-boot-tpl.bin but
> +	  not always.
> +
>  config BR2_TARGET_UBOOT_ZYNQ_IMAGE
>  	bool "Generate image for Xilinx Zynq"
>  	depends on BR2_arm
> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index fdacf16..5702ca6 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -242,6 +242,11 @@ define UBOOT_INSTALL_IMAGES_CMDS
>  			cp -dpf $(@D)/$(f) $(BINARIES_DIR)/
>  		)
>  	)
> +	$(if $(BR2_TARGET_UBOOT_TPL),
> +		$(foreach f,$(call qstrip,$(BR2_TARGET_UBOOT_TPL_NAME)), \
> +			cp -dpf $(@D)/$(f) $(BINARIES_DIR)/
> +		)
> +	)

I don't think we need this additional option. Just list the TPL name
within the BR2_TARGET_UBOOT_SPL_NAME option (this option accepts a
space-separated list of binaries).

Of course, the Config.in help text of BR2_TARGET_UBOOT_SPL_NAME could
be updated to indicate that both SPL and TPL can be specified with this
option.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
