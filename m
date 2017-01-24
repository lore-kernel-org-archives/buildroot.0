From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 18:13:50 +1300
Subject: [Buildroot] [PATCH v3 2/3] board/altera: added genimage script
 to SoCkit
In-Reply-To: <1484925159-25292-3-git-send-email-lucas.bajolet@savoirfairelinux.com>
References: <1484925159-25292-1-git-send-email-lucas.bajolet@savoirfairelinux.com>
 <1484925159-25292-3-git-send-email-lucas.bajolet@savoirfairelinux.com>
Message-ID: <20170124181350.53d9379f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Jan 2017 10:12:38 -0500, Lucas Bajolet wrote:
> Previously, the Altera SoCkit image has to be built manually by
> the developer who wanted to use it.
> 
> This patch introduces a `genimage.cfg` file to build the image
> automatically when done building the files from source.
> 
> Signed-off-by: Lucas Bajolet <lucas.bajolet@savoirfairelinux.com>

This is really good to have.

> diff --git a/board/altera/genimage.cfg b/board/altera/genimage.cfg
> new file mode 100644
> index 0000000..3107939
> --- /dev/null
> +++ b/board/altera/genimage.cfg
> @@ -0,0 +1,31 @@
> +image rootfs-img.vfat {

This really isn't the "root filesystem".

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

This layout is weird, because it doesn't match the U-Boot default
environment (as exposed in my review of PATCH 1/3). I imagine that if
U-Boot is using partition 1 to store the kernel+DTB and partition 2 to
store the root filesystem, it's because there is no need for a
partition to store the bootloader itself, it can probably be stored raw
at the beginning of the SD card ?

>  # create a DTB file copy with the name expected by the u-boot config
>  # Name of the DTB is passed as the second argument to the script.
> -cp -af $BINARIES_DIR/${2}.dtb  $BINARIES_DIR/socfpga.dtb

So you're removing the code, but not the comment that explains what it
does? This seems weird :)

> +set -e
> +
> +BOARD_DIR=$(dirname $0)
> +
> +# Create SPL + bootloader image
> +fallocate -l 1M $BINARIES_DIR/uboot-part.img
> +dd if=$BINARIES_DIR/u-boot-spl.bin of=$BINARIES_DIR/uboot-part.img bs=64k seek=0
> +dd if=$BINARIES_DIR/u-boot-spl.bin.crc of=$BINARIES_DIR/uboot-part.img bs=64k seek=1
> +dd if=$BINARIES_DIR/u-boot.img of=$BINARIES_DIR/uboot-part.img bs=64k seek=4

I guess this really doesn't need a partition, right?

> +#########################################
> +# Final image generation (using genimage)
> +#########################################
> +# Prepare data for image
> +T=`mktemp -d`
> +echo $T
> +mkdir -p $T/root
> +mkdir -p $T/tmp

Please look at how other genimage scripts do this instead of using a
different solution. See board/raspberrypi/post-image.sh for example.

> diff --git a/configs/altera_sockit_defconfig b/configs/altera_sockit_defconfig
> index 9349ebc..fef54ac 100644
> --- a/configs/altera_sockit_defconfig
> +++ b/configs/altera_sockit_defconfig
> @@ -11,6 +11,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
>  
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/altera/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_LINUX_KERNEL_INTREE_DTS_NAME)"
> +BR2_PACKAGE_HOST_GENIMAGE=y

You also need:

BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_MTOOLS=y

if your genimage configuration creates a FAT partition (which it
currently does).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
