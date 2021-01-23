From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 23:32:59 +0100
Subject: [Buildroot] [PATCH v4 2/8] boot/uboot: Add option to install fw
 files list to uboot build directory
In-Reply-To: <20201125183017.15585-3-xroumegue@gmail.com>
References: <20201109142309.1135596-2-xroumegue@gmail.com>
 <20201125183017.15585-3-xroumegue@gmail.com>
Message-ID: <20210123233259.0b391896@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Nov 2020 19:30:11 +0100
Xavier Roumegue <xroumegue@gmail.com> wrote:

> This copies a list of fw files, which have to be installed by others
> packages to BINARIES_DIR to uboot build directory.
> Some platforms, such as imx8, require firmware files located in the
> build directory to generate a bootable image.
> 
> Signed-off-by: Xavier Roumegue <xroumegue@gmail.com>
> 
> ---
> Changes v3 -> v4:
>     - Fix indentation issue (detected by Stephane Viau)
> ---
>  boot/uboot/Config.in | 15 +++++++++++++++
>  boot/uboot/uboot.mk  |  9 +++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index e4a0f48deb..f2faff826b 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -229,6 +229,21 @@ config BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF
>  
>  endchoice
>  
> +config BR2_TARGET_UBOOT_NEEDS_FW
> +	bool "U-Boot needs FW files"
> +	help
> +	  Some platforms (such as iMX8) requires subsystem firmware
> +	  files encapsulated within the u-boot payload such as this
> +	  configure properly the memory subystem or those later
> +	  require authentication from boot ROM.
> +
> +config BR2_TARGET_UBOOT_FW_FILES
> +	string "Firmware files list"
> +	depends on BR2_TARGET_UBOOT_NEEDS_FW
> +	help
> +	  Specify the list of files to be copied in the u-boot
> +	  build directory from the binary folder.

These options don't work, because the firmware files would typically be
provided by another package... and without adding a dependency from
U-Boot on this other package, it won't work. I know you've added this
dependency on the other BR2_TARGET_UBOOT_FORMAT_IMX_FIT option, but I
think this is wrong, as flash.bin is not necessarily IMX related.

So instead, I would prefer a patch that adds a simple option:

config BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE
	bool "U-Boot needs firmware-imx"
	depends on BR2_PACKAGE_FIRMWARE_IMX
	depends on BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW

and in the .mk file:

ifeq ($(BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE),y)
UBOOT_DEPENDENCIES += firmware-imx
define UBOOT_COPY_IMX_DDR_FIRMWARE
	cp $(BINARIES_DIR)/... $(@D)/
endef
UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_DDR_FIRMWARE
endif

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
