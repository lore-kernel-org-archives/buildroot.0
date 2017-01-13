From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Fri, 13 Jan 2017 11:34:34 -0500
Subject: [Buildroot] [PATCH 3/4] board/altera: Updated script to support
 sockit automatic build
In-Reply-To: <1484322930-27625-3-git-send-email-lucas.bajolet@savoirfairelinux.com>
References: <1484322930-27625-1-git-send-email-lucas.bajolet@savoirfairelinux.com>
 <1484322930-27625-3-git-send-email-lucas.bajolet@savoirfairelinux.com>
Message-ID: <74cf416e-27b4-3479-3bb2-0b75853a6b1a@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Lucas,

You should have a commit message, explaining what this commit does.
Also to respect the buildroot commit standard, you should not use a
capital letter to begin your commit title.

On 01/13/2017 10:55 AM, Lucas Bajolet wrote:
> Signed-off-by: Lucas Bajolet <lucas.bajolet@savoirfairelinux.com>
> ---
>  board/altera/genimage.cfg       | 31 +++++++++++++++++++++++++++++++
>  board/altera/post-image.sh      | 31 ++++++++++++++++++++++++++++++-
>  configs/altera_sockit_defconfig |  1 +
>  3 files changed, 62 insertions(+), 1 deletion(-)
>  create mode 100644 board/altera/genimage.cfg
> 
> diff --git a/board/altera/genimage.cfg b/board/altera/genimage.cfg
> new file mode 100644
> index 0000000..3107939
> --- /dev/null
> +++ b/board/altera/genimage.cfg
> @@ -0,0 +1,31 @@
> +image rootfs-img.vfat {
> +	vfat {
> +		file "socfpga.dtb" {image = "socfpga_cyclone5_sockit.dtb"}
> +		file "zImage" {image = "zImage"}

> +	}
> +
> +	size = 10M
> +}
> +
> +image sockit_image.img {
> +	hdimage {
> +	}
> +
> +	partition uboot {
> +		partition-type = 0xa2
> +		image = "uboot-part.img"
> +		offset = 0
> +	}
> +
> +	partition rootfs {
> +		partition-type = 0xb
> +		image = "rootfs-img.vfat"
> +		offset = 1M
> +	}
> +
> +	partition linux {
> +		partition-type = 0x83
> +		image = "rootfs.ext2"
> +		offset = 12M
> +	}
> +}
> diff --git a/board/altera/post-image.sh b/board/altera/post-image.sh
> index 03e7819..d65af3b 100755
> --- a/board/altera/post-image.sh
> +++ b/board/altera/post-image.sh
> @@ -5,4 +5,33 @@
>  
>  # create a DTB file copy with the name expected by the u-boot config
>  # Name of the DTB is passed as the second argument to the script.
> -cp -af $BINARIES_DIR/${2}.dtb  $BINARIES_DIR/socfpga.dtb
> +set -e
> +
> +BOARD_DIR=$(dirname $0)
> +
> +echo "* Generating boot script image..."
> +mkpimage $BINARIES_DIR/u-boot-spl.bin -o $BINARIES_DIR/u-boot-spl-signed.bin
> +
> +# Create SPL + bootloader image
> +fallocate -l 1M $BINARIES_DIR/uboot-part.img
> +dd if=$BINARIES_DIR/u-boot-spl-signed.bin of=$BINARIES_DIR/uboot-part.img bs=64k seek=0
> +dd if=$BINARIES_DIR/u-boot.img of=$BINARIES_DIR/uboot-part.img bs=64k seek=4
> +
> +#########################################
> +# Final image generation (using genimage)
> +#########################################
> +# Prepare data for image
> +T=`mktemp -d`
> +echo $T
> +mkdir -p $T/root
> +mkdir -p $T/tmp
> +
> +echo "* Generating sd-card image..."
> +genimage \
> +        --config $BOARD_DIR/genimage.cfg \
> +        --rootpath $T/root \
> +        --tmppath $T/tmp \
> +        --inputpath $BINARIES_DIR \
> +        --outputpath $BINARIES_DIR \
> +
> +rm -rf $T
> diff --git a/configs/altera_sockit_defconfig b/configs/altera_sockit_defconfig
> index bbd3bfa..1d18fb2 100644
> --- a/configs/altera_sockit_defconfig
> +++ b/configs/altera_sockit_defconfig
> @@ -11,6 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
>  
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/altera/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_LINUX_KERNEL_INTREE_DTS_NAME)"
> +BR2_PACKAGE_HOST_GENIMAGE=y
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
> 
