From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 18:08:00 +1300
Subject: [Buildroot] [PATCH v3 1/3] configs/altera_sockit: bump kernel
 to 4.7 and u-boot to v2016.11-rc3
In-Reply-To: <1484925159-25292-2-git-send-email-lucas.bajolet@savoirfairelinux.com>
References: <1484925159-25292-1-git-send-email-lucas.bajolet@savoirfairelinux.com>
 <1484925159-25292-2-git-send-email-lucas.bajolet@savoirfairelinux.com>
Message-ID: <20170124180800.519741d9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The commit title is wrong: you're bumping to U-Boot 2016.09. Also, I
have some other questions.

On Fri, 20 Jan 2017 10:12:37 -0500, Lucas Bajolet wrote:

> The old patch became useless, and was replaced by a new one,
> to fix a booting problem with the board we have, which could
> not load when the SPL+U-Boot were not on the first partition.
> 
> The patch also helps organize the partition table in a more
> natural way.

I don't understand why is the patch needed. The patch only the U-Boot
environment to load the kernel/DTB from partition 2 instead of
partition 1, and have the root filesystem in partition 3 instead of
partition 2.

Why is this needed? A typical scenario for such platforms is often to
have the first partition be a FAT partition with the bootloader, kernel
image and DTB, and the second partition containing the root filesystem.
Which would perfectly match the original U-Boot environment. So why
change it?

> diff --git a/board/altera/sockit/altera_sockit_config_buildroot.patch b/board/altera/sockit/altera_sockit_config_buildroot.patch
> new file mode 100644
> index 0000000..d2b5003
> --- /dev/null
> +++ b/board/altera/sockit/altera_sockit_config_buildroot.patch

The "buildroot" part of the name is not relevant. Also, it would be
better to use:

BR2_GLOBAL_PATCH_DIR=board/altera/sockit/patches

And then put your patch in board/altera/sockit/patches/uboot/

> @@ -0,0 +1,35 @@
> +From ba56b1703dde4e1be4e9d943722e382ad1348755 Mon Sep 17 00:00:00 2001
> +From: Lucas Bajolet <lucas.bajolet@savoirfairelinux.com>
> +Date: Thu, 12 Jan 2017 17:25:15 -0500
> +Subject: [PATCH] sockfpga: Changed image and device tree partition information
> + in config

This only describes what you're doing (which everyone can see in the
patch), but not *why* you're doing this.

> diff --git a/configs/altera_sockit_defconfig b/configs/altera_sockit_defconfig
> index 0addbde..9349ebc 100644
> --- a/configs/altera_sockit_defconfig
> +++ b/configs/altera_sockit_defconfig
> @@ -6,32 +6,29 @@ BR2_ARM_ENABLE_NEON=y
>  BR2_ARM_FPU_NEON=y
>  BR2_ARM_INSTRUCTIONS_THUMB2=y
>  
> -# Linux headers same as kernel, a 3.13 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
> +# Linux headers same as kernel, a 4.7 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
>  
> -BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600=y
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/altera/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_LINUX_KERNEL_INTREE_DTS_NAME)"
>  
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="http://git.rocketboards.org/linux-socfpga.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_socfpga-3.13_14.02.02"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/altera-opensource/linux-socfpga.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_socfpga-4.7_16.10.02_pr"
>  BR2_LINUX_KERNEL_DEFCONFIG="socfpga"
> -BR2_LINUX_KERNEL_UIMAGE=y
> -BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="socfpga_cyclone5_sockit"
>  
>  BR2_TARGET_ROOTFS_EXT2=y
> -BR2_TARGET_ROOTFS_EXT2_3=y

Why are you dropping this line ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
