From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 5 Jul 2018 23:57:21 +0200
Subject: [Buildroot] [PATCH 2/3] imx/post-image: Allow flashing
 u-boot-dtb.imx in the SD card
In-Reply-To: <1530818671-20390-2-git-send-email-festevam@gmail.com>
References: <1530818671-20390-1-git-send-email-festevam@gmail.com>
 <1530818671-20390-2-git-send-email-festevam@gmail.com>
Message-ID: <75a18624-33ef-7d5d-3542-2e3b7b75e5f6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-07-18 21:24, Fabio Estevam wrote:
> Add support for flashing the u-boot-dtb.imx binary in the SD card
> when a target selects BR2_TARGET_UBOOT_FORMAT_DTB_IMX.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  .../common/imx/genimage.cfg.template_dtb_imx       | 40 ++++++++++++++++++++++
>  board/freescale/common/imx/post-image.sh           |  2 ++
>  2 files changed, 42 insertions(+)
>  create mode 100644 board/freescale/common/imx/genimage.cfg.template_dtb_imx
> 
> diff --git a/board/freescale/common/imx/genimage.cfg.template_dtb_imx b/board/freescale/common/imx/genimage.cfg.template_dtb_imx

 This file only differs from the normal template in the name of the u-boot
binary, right? So wouldn't it make more sense to make that configurable, just
like the %FILES%, and handle it in an extra sed line?

 Regards,
 Arnout


> new file mode 100644
> index 0000000..b38dfa4
> --- /dev/null
> +++ b/board/freescale/common/imx/genimage.cfg.template_dtb_imx
> @@ -0,0 +1,40 @@
> +# Minimal SD card image for the Freescale boards Template
> +#
> +# We mimic the .sdcard Freescale's image format:
> +# * the SD card must have 1 kB free space at the beginning,
> +# * U-Boot is dumped as is,
> +# * a FAT partition at offset 8 MB is containing zImage/uImage and DTB files
> +# * a single root filesystem partition is required (ext2, ext3 or ext4)
> +#
> +
> +image boot.vfat {
> +  vfat {
> +    files = {
> +      %FILES%
> +    }
> +  }
> +  size = 16M
> +}
> +
> +image sdcard.img {
> +  hdimage {
> +  }
> +
> +  partition u-boot {
> +    in-partition-table = "no"
> +    image = "u-boot-dtb.imx"
> +    offset = 1024
> +  }
> +
> +  partition boot {
> +    partition-type = 0xC
> +    bootable = "true"
> +    image = "boot.vfat"
> +    offset = 8M
> +  }
> +
> +  partition rootfs {
> +    partition-type = 0x83
> +    image = "rootfs.ext2"
> +  }
> +}
> diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
> index 264c8a4..5eb593b 100755
> --- a/board/freescale/common/imx/post-image.sh
> +++ b/board/freescale/common/imx/post-image.sh
> @@ -36,6 +36,8 @@ genimage_type()
>  		echo "genimage.cfg.template_imx8"
>  	elif grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" ${BR2_CONFIG}; then
>  		echo "genimage.cfg.template_spl"
> +	elif grep -Eq "^BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y$" ${BR2_CONFIG}; then
> +		echo "genimage.cfg.template_dtb_imx"
>  	else
>  		echo "genimage.cfg.template"
>  	fi
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
