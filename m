From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Aug 2020 22:50:08 +0200
Subject: [Buildroot] [PATCH v2] configs/rock_pi_n8: new defconfig
In-Reply-To: <1594986634-10056-1-git-send-email-sunil@amarulasolutions.com>
References: <20200714214814.53fe99a0@windsurf.home>
 <1594986634-10056-1-git-send-email-sunil@amarulasolutions.com>
Message-ID: <20200816225008.2d97bea2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have applied to next, after a few changes. See below for some
comments.

On Fri, 17 Jul 2020 17:20:34 +0530
Suniel Mahesh <sunil@amarulasolutions.com> wrote:

> Add initial support for RK3288 SOM based radxa rockpi-n8
> target with below features:
> 
> 	- Custom U-Boot 2020.07-rc4
> 	  https://github.com/amarula/u-boot-amarula.git
> 	  commit: "ba120841bf40ebaed049d64bb4f980083a1cf6b7"
> 	- Custom Linux 5.7.0-rc1
> 	  https://github.com/amarula/linux-amarula.git
> 	  commit: "5dcb0132685b07beb82065c5d7521e6c555c55b6"

Could you do a round of update on the defconfigs you've added recently
and try to use non-rc versions of U-Boot/Linux ? And preferably
upstream U-Boot/Linux versions instead of Amarula ones.

>  .gitlab-ci.yml                      |  1 +

Changing the .gitlab-ci.yml is no longer needed (but it was back when
you created this patch, so this is just FYI).

> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/amarula/linux-amarula.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="5dcb0132685b07beb82065c5d7521e6c555c55b6"
> +BR2_LINUX_KERNEL_USE_DEFCONFIG=y
> +BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="rk3288-rock-pi-n8"

BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

was missing here.

> +
> +# Filesystem
> +BR2_TARGET_GENERIC_HOSTNAME="rockpi-n8"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to ROCKPI-N8"
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="64M"

This was not needed, our default of 60 MB is fine.

> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=y

This was apparently not needed, since you're now using a zImage.

Appplied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
