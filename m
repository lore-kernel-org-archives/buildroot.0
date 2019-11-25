From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 22:23:45 +0100
Subject: [Buildroot] [PATCH v2 04/10]
 package/freescale-qoriq/fsl-qoriq-rcw: add target rcw binary support
In-Reply-To: <20191121102324.35225-5-jerry.huang@nxp.com>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
 <20191121102324.35225-5-jerry.huang@nxp.com>
Message-ID: <20191125222345.3b7897ae@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm sorry, but I don't really grasp what this patch is trying to do.

On Thu, 21 Nov 2019 18:23:18 +0800
Changming Huang <jerry.huang@nxp.com> wrote:

> From: Jerry Huang <jerry.huang@nxp.com>
> 
> For NXP QorIQ (PowerPC and Layerscape) platform,
> we need to specify the RCW file and build it to binary.
> 
> Introduce BR2_PACKAGE_HOST_RCW_ATF to use ATF for RCW.

What does this mean ?

> Introduce BR2_PACKAGE_HOST_RCW_BIN to specify the RCW binary file.

Hm, ok, but then it seems to be used to calculate from which directory
"make" is going to be invoked.

> Introduce BR2_PACKAGE_HOST_RCW_BOOT_MODE to define the boot mode.
> Because the RCW binary can be stored in different media, for example:
> SD card - RCW locate in SD card, boot the board from SD card
> eMMC    - RCW locate in eMMC chip, boot the board from eMMC chip
> flexSPI - RCW locate in flexSPI, boot the board from flexSPI Nor/Nand flash
> QSPI    - RCW locate in QSPI flash, boot the board from QSPI flash
> 
> Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
> ---
> changes since v1:
> 1. add option BR2_PACKAGE_HOST_RCW_ATF for ATF
> ---
>  .../freescale-qoriq/fsl-qoriq-rcw/Config.in.host  | 15 +++++++++++++++
>  .../fsl-qoriq-rcw/fsl-qoriq-rcw.mk                | 11 +++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/package/freescale-qoriq/fsl-qoriq-rcw/Config.in.host b/package/freescale-qoriq/fsl-qoriq-rcw/Config.in.host
> index a9253958d9..f55f2a6f3a 100644
> --- a/package/freescale-qoriq/fsl-qoriq-rcw/Config.in.host
> +++ b/package/freescale-qoriq/fsl-qoriq-rcw/Config.in.host
> @@ -25,4 +25,19 @@ config BR2_PACKAGE_HOST_RCW_CUSTOM_PATH
>  	  included for use in the SDK or with post scripts but no
>  	  RCW binary will not be generated.
>  
> +config BR2_PACKAGE_HOST_RCW_ATF
> +	bool "atf for rcw"
> +	help
> +	  When ATF is used for RCW, enable this option.

This option is not used in the code below.

> +
> +config BR2_PACKAGE_HOST_RCW_BIN

Should be named with a BR2_PACKAGE_HOST_FSL_QORIQ_RCW_ prefix.

> +	string "Custom RCW"
> +	help
> +	  This option is used to specify the RCW binary file for board.

More details are needed. What happens when this option is empty? Which
values are typically needed? Your code assumes there's one slash in the
value, this should be explained.

> +config BR2_PACKAGE_HOST_RCW_BOOT_MODE

This option is not used in the .mk file

> +	string "Boot mode"
> +	help
> +	  Specify the boot mode, for example, sd, emmc, flexspi_nor.
> +
>  endif
> diff --git a/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.mk b/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.mk
> index a2c3f4f8a6..15c4024eb8 100644
> --- a/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.mk
> +++ b/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.mk
> @@ -37,6 +37,17 @@ endef
>  define HOST_FSL_QORIQ_RCW_INSTALL_DELIVERY_FILE
>  	$(INSTALL) -D -m 0644 $(@D)/PBL.bin $(BINARIES_DIR)/PBL.bin
>  endef
> +else

Why is this part mutually exclusive with the
BR2_PACKAGE_HOST_RCW_CUSTOM_PATH option ? I'd like to understand what
they each try to do. If they are mutually exclusive, they should also
be mutually exclusive at the Config.in level. Could you please explain
the different use cases for rcw so that we can figure out the right way
to handle this ?

> +RCW_BIN = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_BIN))
> +RCW_PLATFORM = $(firstword $(subst /, ,$(RCW_BIN)))

Variables must be prefixed by the package name, not just RCW_.

> +
> +define HOST_FSL_QORIQ_RCW_BUILD_CMDS
> +	cd $(@D)/$(RCW_PLATFORM) && $(MAKE)

Should be:

	$(MAKE) -C ...

> +endef
> +
> +define HOST_FSL_QORIQ_RCW_INSTALL_DELIVERY_FILE
> +	$(INSTALL) -D -m 0644 $(@D)/$(RCW_BIN) $(BINARIES_DIR)/

Complete destination path is needed, including the destination file
name.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
