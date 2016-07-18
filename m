From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 23:16:38 +0200
Subject: [Buildroot] [PATCH 1/1] configs: add Arcturus uCP1020 BSP
 support
In-Reply-To: <1468853633-12192-1-git-send-email-oleks@arcturusnetworks.com>
References: <1468853633-12192-1-git-send-email-oleks@arcturusnetworks.com>
Message-ID: <20160718231638.24e099f4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Jul 2016 10:53:53 -0400, Oleksandr G Zhadan wrote:
> The uCP1020 product family (ucp1020) is an Arcturus Networks Inc.
> System on Modules product featuring a Freescale P1020 CPU,
> optionally populated with 1 or 2 Gig-Ethernet PHYs,
> DDR3, NOR Flash, eMMC NAND Flash and/or SPI Flash.
> 
> Signed-off-by: Oleksandr G Zhadan <oleks@arcturusnetworks.com>
> Signed-off-by: Michael Durrant <arcsupport@arcturusnetworks.com>

Thanks for this new iteration! When sending a new version of a patch,
please format it with:

	git format-patch -v3 ....

where -v3 is the version of the patch series. Also, it is a good idea
to include a changelog of what changed since the previous iterations...

> ---

here.

>  .../ppc-ucp1020/configs/linux-4.1.x.config         | 269 ++++++++++++
>  .../linux/0001-Arcturus-uCP1020-BSP-support.patch  | 462 +++++++++++++++++++++
>  .../0002-p1020-esdhc-controller-reserved-bit.patch |  28 ++
>  board/arcturus/ppc-ucp1020/readme.txt              |  73 ++++
>  configs/arcturus_ucp1020_defconfig                 |  29 ++
>  5 files changed, 861 insertions(+)
>  create mode 100644 board/arcturus/ppc-ucp1020/configs/linux-4.1.x.config
>  create mode 100644 board/arcturus/ppc-ucp1020/patches/linux/0001-Arcturus-uCP1020-BSP-support.patch
>  create mode 100644 board/arcturus/ppc-ucp1020/patches/linux/0002-p1020-esdhc-controller-reserved-bit.patch
>  create mode 100644 board/arcturus/ppc-ucp1020/readme.txt
>  create mode 100644 configs/arcturus_ucp1020_defconfig
> diff --git a/configs/arcturus_ucp1020_defconfig b/configs/arcturus_ucp1020_defconfig
> new file mode 100644
> index 0000000..e9d04b2
> --- /dev/null
> +++ b/configs/arcturus_ucp1020_defconfig
> @@ -0,0 +1,29 @@
> +# Architecture
> +BR2_powerpc=y
> +BR2_powerpc_8548=y
> +
> +# Linux headers same as kernel, a 4.1 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
> +
> +# System settings
> +BR2_TARGET_GENERIC_HOSTNAME="UCP1020"
> +BR2_TARGET_GENERIC_ISSUE="Welcome to Arcturus uCP1020 System on Module"
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +BR2_SYSTEM_DHCP="eth0"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.27"
> +BR2_LINUX_KERNEL_PATCH="board/arcturus/ppc-ucp1020/patches/linux"
> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/arcturus/ppc-ucp1020/configs/linux-4.1.x.config"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="ucp1020"
> +
> +# Filesystem
> +BR2_TARGET_ROOTFS_JFFS2=y
> +
> +# U-boot
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARDNAME="UCP1020"

So that's the only part that remains. You need to specify a specific
U-Boot version. Indeed, using the "latest" one is not good, as the
"latest" will change, and then it will no longer match with a version
we have tested. We want our defconfigs to use a kernel version and
bootloader version that have been tested. So please do like other
defconfigs in Buildroot:

BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
BR2_TARGET_UBOOT_USE_DEFCONFIG=y
BR2_TARGET_UBOOT_BOARD_DEFCONFIG="wandboard"
BR2_TARGET_UBOOT_CUSTOM_VERSION=y
BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"
BR2_TARGET_UBOOT_FORMAT_IMG=y
BR2_TARGET_UBOOT_SPL=y
BR2_TARGET_UBOOT_SPL_NAME="SPL"
BR2_TARGET_UBOOT_ENVIMAGE=y
BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/wandboard/uboot-env.txt"
BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x2000"

I.E, see the options:

BR2_TARGET_UBOOT_CUSTOM_VERSION=y
BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2015.07"

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
