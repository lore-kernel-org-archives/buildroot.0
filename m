From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 23 Dec 2020 15:42:08 +0100
Subject: [Buildroot] [PATCH v4 4/8] boot/uboot/imx8: Add new target
 needed for mainline u-boot
In-Reply-To: <20201125183017.15585-5-xroumegue@gmail.com>
References: <20201109142309.1135596-2-xroumegue@gmail.com>
 <20201125183017.15585-5-xroumegue@gmail.com>
Message-ID: <X+NXQCzENQozNpBW@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Xavier,

On Wed, Nov 25, 2020 at 07:30:13PM +0100, Xavier Roumegue wrote:
> Mainline u-boot support for the iMX8M based boards is no longer
> using the external imx-mkimage command and instead building
> the fit image directly inside U-Boot.
> 
> This fit image usually embeds ddr/hdmi firmware for iMX8M target.
> 
> Inspired from
> https://github.com/SolidRun/buildroot/commit/0f2b2971e836b508bf9c2dac34426a59a9d83572
> 
> Signed-off-by: Xavier Roumegue <xroumegue@gmail.com>
> Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  boot/uboot/Config.in | 5 +++++
>  boot/uboot/uboot.mk  | 6 ++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> index f2faff826b..2e1d836cf8 100644
> --- a/boot/uboot/Config.in
> +++ b/boot/uboot/Config.in
> @@ -281,6 +281,11 @@ config BR2_TARGET_UBOOT_FORMAT_DTB_IMX
>  config BR2_TARGET_UBOOT_FORMAT_ITB
>  	bool "u-boot.itb"
>  
> +config BR2_TARGET_UBOOT_FORMAT_IMX_FIT

I know this was copied from SolidRun but I'm not a fan of the IMX_FIT
name. True flash.bin includes a FIT image but SPL/FW etc are outside of
it, it's not just a FIT image.
Maybe NXP will do another boot image format in the future that will also
include a FIT image but the rest would be different.
Since the U-Boot target is simply "flash.bin" I would name it
UBOOT_FORMAT_FLASH_BIN.

> +	bool "flash.bin"
> +	select BR2_PACKAGE_FIRMWARE_IMX

You can't do that unfortunately, you need to either have a test around
that option or add a depends on BR2_PACKAGE_FREESCALE_IMX.

Otherwise it will give this:
WARNING: unmet direct dependencies detected for BR2_PACKAGE_FIRMWARE_IMX
  Depends on [n]: BR2_PACKAGE_FREESCALE_IMX [=n] && (BR2_arm [=y] || BR2_aarch64 [=n])
  Selected by [y]:
  - BR2_TARGET_UBOOT_FORMAT_IMX_FIT [=y] && BR2_TARGET_UBOOT [=y]

Regards,
Gary
