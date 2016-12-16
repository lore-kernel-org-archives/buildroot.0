From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Dec 2016 14:47:07 +0100
Subject: [Buildroot] [PATCH] BeagleBoard X15: new board
In-Reply-To: <20161215223730.4890-1-theo.debrouwere@skynet.be> (Theo
 Debrouwere's message of "Thu, 15 Dec 2016 23:37:30 +0100")
References: <20161215223730.4890-1-theo.debrouwere@skynet.be>
Message-ID: <87d1gsasv8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Theo" == Theo Debrouwere <theo.debrouwere@skynet.be> writes:

 > From: Theo Debrouwere <Theo.Debrouwere@gmail.com>
 > This configuration provides a basic setup for using Buildroot
 > to create a sd-card image a BeagleBoard X15 board.

 > The same image can also be used the boot the AM57XX-EVM's.

 > Signed-off-by: Theo Debrouwere <Theo.Debrouwere@gmail.com>

Nice. It looks good to me, but I have a few questions (see below)

 > diff --git a/board/beagleboardx15/uEnv.txt b/board/beagleboardx15/uEnv.txt
 > new file mode 100644
 > index 0000000..0af0eef
 > --- /dev/null
 > +++ b/board/beagleboardx15/uEnv.txt
 > @@ -0,0 +1,9 @@
 > +# This uEnv.txt file can contain additional environment settings that you
 > +# want to set in U-Boot at boot time.  This can be simple variables such
 > +# as the serverip or custom variables.  The format of this file is:
 > +#    variable=value
 > +# NOTE: This file will be evaluated after the bootcmd is run and the
 > +#       bootcmd must be set to load this file if it exists (this is the
 > +#       default on all newer U-Boot images.  This also means that some
 > +#       variables such as bootdelay cannot be changed by this file since
 > +#       it is not evaluated until the bootcmd is run.

Is this file really needed if it only contains comments?

> diff --git a/configs/beagleboardx15_defconfig b/configs/beagleboardx15_defconfig
 > new file mode 100644
 > index 0000000..17181d9
 > --- /dev/null
 > +++ b/configs/beagleboardx15_defconfig
 > @@ -0,0 +1,33 @@
 > +BR2_arm=y
 > +BR2_cortex_a15=y
 > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 > +BR2_TARGET_GENERIC_HOSTNAME="beagleboardx15"
 > +BR2_TARGET_GENERIC_GETTY_PORT="ttyS2"

Does the kernel not boot with console=ttyS2,.. ? If so, then the default
of /dev/console should work as well.

> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beagleboardx15/post-image.sh"
 > +BR2_LINUX_KERNEL=y
 > +BR2_LINUX_KERNEL_CUSTOM_GIT=y
 > +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/processor-sdk/processor-sdk-linux.git"
 > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="db0b54cdadef2d754ef7c2d8dd7300ef085985ef"
 > +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 > +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/beagleboardx15/linux-4.4.config"
 > +BR2_LINUX_KERNEL_DTS_SUPPORT=y
 > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="am57xx-beagle-x15 am57xx-beagle-x15-revb1 am57xx-evm am57xx-evm-reva3"
 > +BR2_LINUX_KERNEL_INSTALL_TARGET=y
 > +BR2_TARGET_ROOTFS_EXT2=y
 > +BR2_TARGET_ROOTFS_EXT2_4=y
 > +BR2_TARGET_UBOOT=y
 > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 > +BR2_TARGET_UBOOT_CUSTOM_GIT=y
 > +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.ti.com/ti-u-boot/ti-u-boot.git"
 > +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="2f757e5b2c6b260c647a8a1bb295537f07c3a8b9"
 > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am57xx_evm"

Are the custom repos needed? I see that mainline u-boot and Linux
atleast has "some" support for this defconfig / dts'es.

-- 
Bye, Peter Korsgaard
