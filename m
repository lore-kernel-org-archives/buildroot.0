From: Lucas Bajolet <lucas.bajolet@savoirfairelinux.com>
Date: Thu, 19 Jan 2017 14:12:22 -0500 (EST)
Subject: [Buildroot] [PATCH 3/4] board/altera: update patch to support
 new official SoCkit
In-Reply-To: <cbf96c6f-f916-e858-9efa-0d619c2ac73b@savoirfairelinux.com>
References: <1484839933-17637-1-git-send-email-lucas.bajolet@savoirfairelinux.com>
 <1484839933-17637-4-git-send-email-lucas.bajolet@savoirfairelinux.com>
 <cbf96c6f-f916-e858-9efa-0d619c2ac73b@savoirfairelinux.com>
Message-ID: <643291429.229759.1484853142921.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You're right, an error when rebasing, I'll send a new version of the patch

----- Original Message -----
From: "Sebastien Bourdelin" <sebastien.bourdelin@savoirfairelinux.com>
To: "Lucas Bajolet" <lucas.bajolet@savoirfairelinux.com>, buildroot at buildroot.org
Cc: kernel at savoirfairelinux.com
Sent: Thursday, January 19, 2017 12:00:28 PM
Subject: Re: [PATCH 3/4] board/altera: update patch to support new official SoCkit

Hi Lucas.

You commit title should introduce genimage instead.

On 01/19/2017 10:32 AM, Lucas Bajolet wrote:
> The old patch was unnecessary now that there is a proper SoCkit
> configuration file in the Altera repository.
> 
> However, on the test board, unless partition 0:1 was set as
> the SPL/U-Boot partition, the device would not boot.
> 
> The generated configuration by u-boot expected 0:1 to contain the
> dtb and zImage files to boot linux, hence this patch to change the
> behaviour and have 0:2 contain these informations.
> 
> The patch also cleans the partition table a bit, as it can now
> be properly ordered.
> 

I think your commit message here should not be the same then the
previous commit you sent but should introduce the support to genimage
for the SoCkit instead.

> Signed-off-by: Lucas Bajolet <lucas.bajolet@savoirfairelinux.com>
> ---
>  board/altera/genimage.cfg       | 31 +++++++++++++++++++++++++++++++
>  board/altera/post-image.sh      | 29 ++++++++++++++++++++++++++++-
>  configs/altera_sockit_defconfig |  1 +
>  3 files changed, 60 insertions(+), 1 deletion(-)
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
> index 03e7819..a9aefc9 100755
> --- a/board/altera/post-image.sh
> +++ b/board/altera/post-image.sh
> @@ -5,4 +5,31 @@
>  
>  # create a DTB file copy with the name expected by the u-boot config
>  # Name of the DTB is passed as the second argument to the script.
> -cp -af $BINARIES_DIR/${2}.dtb  $BINARIES_DIR/socfpga.dtb
> +set -e
> +
> +BOARD_DIR=$(dirname $0)
> +
> +# Create SPL + bootloader image
> +fallocate -l 1M $BINARIES_DIR/uboot-part.img
> +dd if=$BINARIES_DIR/u-boot-spl.bin of=$BINARIES_DIR/uboot-part.img bs=64k seek=0
> +dd if=$BINARIES_DIR/u-boot-spl.bin.crc of=$BINARIES_DIR/uboot-part.img bs=64k seek=1
> +dd if=$BINARIES_DIR/u-boot.img of=$BINARIES_DIR/uboot-part.img bs=64k seek=4
> +

I'm just curious if you can't do that directly in the genimage config.

> +#########################################
> +# Final image generation (using genimage)
> +#########################################
> +# Prepare data for image
> +T=`mktemp -d`
> +echo $T

You don't need to "echo" here

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
> index 1c9a499..ee1bd95 100644
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
