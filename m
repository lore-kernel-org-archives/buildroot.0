From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Jan 2016 00:58:59 +0100
Subject: [Buildroot] [PATCH 2/2] Update the Beaglbone configuration:
In-Reply-To: <1451854885-12011-2-git-send-email-clarocq@gmail.com>
References: <1451854885-12011-1-git-send-email-clarocq@gmail.com>
 <1451854885-12011-2-git-send-email-clarocq@gmail.com>
Message-ID: <568B0743.5090602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Chris,

 This patch should be squashed with the previous one, i.e. you should send a
single patch that updates everything. Otherwise, if only the first patch is
applied and not the second, you won't have a console or working M3.

On 03-01-16 22:01, Chris LaRocque wrote:
> Patched the bb.org_defconfig to enable the beaglebone console on ttyS0
> De-Selected the am33xx_cm3 firmware installation: the M3 control is handled differently in ver 4.1
> Selected the uio-PRUSS driver to be installed.
> Fixed the kernel patch path and file names.
> 
> Signed-off-by: Chris LaRocque <clarocq@gmail.com>
> ---
>  .../linux-4.1.13-ti-r36-am335x-boneblack_01.patch  | 128 +++++++++++++++++++++

 Instead of patching the kernel, you should create a config fragment. That's
much shorter. Alternatively, you could create a full defconfig for buildroot.
Patching the in-tree defconfig like you do below is really ugly.

 Note that it would also be nice if the config fragment would contain comments
that explain why these changes are needed.


>  configs/beaglebone_defconfig                       |   8 +-
>  2 files changed, 134 insertions(+), 2 deletions(-)
>  create mode 100644 board/beaglebone/patches/linux-4.1.13-ti-r36/linux-4.1.13-ti-r36-am335x-boneblack_01.patch
> 
> diff --git a/board/beaglebone/patches/linux-4.1.13-ti-r36/linux-4.1.13-ti-r36-am335x-boneblack_01.patch b/board/beaglebone/patches/linux-4.1.13-ti-r36/linux-4.1.13-ti-r36-am335x-boneblack_01.patch
> new file mode 100644
> index 0000000..76075d7
> --- /dev/null
> +++ b/board/beaglebone/patches/linux-4.1.13-ti-r36/linux-4.1.13-ti-r36-am335x-boneblack_01.patch
> @@ -0,0 +1,128 @@
> +--- a/arch/arm/configs/bb.org_defconfig	2016-01-02 09:21:52.569371375 -0500
> ++++ b/arch/arm/configs/bb.org_defconfig	2016-01-02 09:26:48.072415069 -0500
> +@@ -37,10 +37,8 @@
> + CONFIG_HAVE_KERNEL_XZ=y
> + CONFIG_HAVE_KERNEL_LZO=y
> + CONFIG_HAVE_KERNEL_LZ4=y
> +-# CONFIG_KERNEL_GZIP is not set
> + # CONFIG_KERNEL_LZMA is not set
> +-# CONFIG_KERNEL_XZ is not set
> +-CONFIG_KERNEL_LZO=y
> ++# CONFIG_KERNEL_LZO is not set

 There's no reason to change this, buildroot will do that automatically.

> + # CONFIG_KERNEL_LZ4 is not set
> + CONFIG_DEFAULT_HOSTNAME="(none)"
> + CONFIG_SWAP=y
> +@@ -544,7 +542,6 @@
> + CONFIG_HZ=100
> + CONFIG_SCHED_HRTICK=y
> + # CONFIG_THUMB2_KERNEL is not set
> +-CONFIG_AEABI=y

 That's not really needed.

> + # CONFIG_OABI_COMPAT is not set
> + CONFIG_ARCH_HAS_HOLES_MEMORYMODEL=y
> + # CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
> +@@ -596,7 +593,7 @@
> + #
> + CONFIG_USE_OF=y
> + CONFIG_ATAGS=y
> +-# CONFIG_DEPRECATED_PARAM_STRUCT is not set
> ++CONFIG_DEPRECATED_PARAM_STRUCT=y

 Why do you need this?

 If you do need it, just add

CONFIG_DEPRECATED_PARAM_STRUCT=y

to the config fragment.

> + CONFIG_ZBOOT_ROM_TEXT=0x0
> + CONFIG_ZBOOT_ROM_BSS=0x0
> + # CONFIG_ARM_APPENDED_DTB is not set
> +@@ -804,7 +801,7 @@
> + CONFIG_NETLABEL=y
> + CONFIG_NETWORK_SECMARK=y
> + CONFIG_NET_PTP_CLASSIFY=y
> +-# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> ++CONFIG_NETWORK_PHY_TIMESTAMPING=y

 I also don't see why you need this.

> + CONFIG_NETFILTER=y
> + # CONFIG_NETFILTER_DEBUG is not set
> + CONFIG_NETFILTER_ADVANCED=y
> +@@ -1467,8 +1464,6 @@
> + #
> + CONFIG_UEVENT_HELPER=y
> + CONFIG_UEVENT_HELPER_PATH=""
> +-CONFIG_DEVTMPFS=y
> +-CONFIG_DEVTMPFS_MOUNT=y

 Will be handled automatically by buildroot.

> + CONFIG_STANDALONE=y
> + CONFIG_PREVENT_FIRMWARE_BUILD=y
> + CONFIG_FW_LOADER=y
> +@@ -1716,7 +1711,7 @@
> + CONFIG_SRAM=y
> + CONFIG_VEXPRESS_SYSCFG=y
> + CONFIG_BONE_CAPEMGR=y
> +-# CONFIG_DEV_OVERLAYMGR is not set
> ++CONFIG_DEV_OVERLAYMGR=y

 Add the following to the config fragment:

CONFIG_DEV_OVERLAYMGR=y

> + CONFIG_TIEQEP=m
> + CONFIG_C2PORT=m
> + 
> +@@ -2214,8 +2209,9 @@
> + # CONFIG_DP83867_PHY is not set
> + # CONFIG_FIXED_PHY is not set
> + # CONFIG_MDIO_BITBANG is not set
> ++CONFIG_MDIO_BUS_MUX=y

 Is this needed? Does the beaglebone have an MDIO mux?

> + # CONFIG_MDIO_BUS_MUX_GPIO is not set
> +-# CONFIG_MDIO_BUS_MUX_MMIOREG is not set
> ++CONFIG_MDIO_BUS_MUX_MMIOREG=y
> + # CONFIG_MDIO_BCM_UNIMAC is not set
> + # CONFIG_MICREL_KS8995MA is not set
> + # CONFIG_PLIP is not set
> +@@ -2716,7 +2712,8 @@
> + CONFIG_CONSOLE_POLL=y
> + # CONFIG_SERIAL_JSM is not set
> + CONFIG_SERIAL_OF_PLATFORM=y
> +-# CONFIG_SERIAL_OMAP is not set
> ++CONFIG_SERIAL_OMAP=y
> ++CONFIG_SERIAL_OMAP_CONSOLE=y

 These two you can add to the config fragment.

> + # CONFIG_SERIAL_SCCNXP is not set
> + # CONFIG_SERIAL_SC16IS7XX is not set
> + # CONFIG_SERIAL_BCM63XX is not set
> +@@ -2897,10 +2894,7 @@
> + # PTP clock support
> + #
> + CONFIG_PTP_1588_CLOCK=y
> +-
> +-#
> +-# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> +-#
> ++# CONFIG_DP83640_PHY is not set

 Ah, that's why you enabled the timestamping above. But I don't think the
beaglebone has this PHY. Did you copy it from your custom board?

> + CONFIG_PINCTRL=y
> + 
> + #
> +@@ -5128,7 +5122,7 @@
> + CONFIG_ASYNC_TX_DMA=y
> + # CONFIG_DMATEST is not set
> + # CONFIG_AUXDISPLAY is not set
> +-CONFIG_UIO=m
> ++CONFIG_UIO=y

 Why is this needed?

> + # CONFIG_UIO_CIF is not set
> + CONFIG_UIO_PDRV_GENIRQ=m
> + CONFIG_UIO_DMEM_GENIRQ=m
> +@@ -5136,7 +5130,7 @@
> + # CONFIG_UIO_SERCOS3 is not set
> + # CONFIG_UIO_PCI_GENERIC is not set
> + # CONFIG_UIO_NETX is not set
> +-# CONFIG_UIO_PRUSS is not set
> ++CONFIG_UIO_PRUSS=m

 I guess you do want this one.

> + # CONFIG_UIO_MF624 is not set
> + # CONFIG_VFIO is not set
> + CONFIG_VIRT_DRIVERS=y
> +@@ -5680,7 +5674,8 @@
> + # File systems
> + #
> + CONFIG_DCACHE_WORD_ACCESS=y
> +-# CONFIG_EXT2_FS is not set
> ++CONFIG_EXT2_FS=y

 Is this needed? The ext4 driver will mount ext2 just fine, no?

> ++# CONFIG_EXT2_FS_XATTR is not set
> + # CONFIG_EXT3_FS is not set
> + CONFIG_EXT4_FS=y
> + CONFIG_EXT4_USE_FOR_EXT23=y
> +@@ -6478,3 +6473,8 @@
> + CONFIG_FONT_8x16=y
> + CONFIG_ARCH_HAS_SG_CHAIN=y
> + CONFIG_VIRTUALIZATION=y
> ++CONFIG_KERNEL_GZIP=y
> ++# CONFIG_KERNEL_XZ is not set
> ++CONFIG_AEABI=y
> ++CONFIG_DEVTMPFS=y
> ++CONFIG_DEVTMPFS_MOUNT=y

 Heh, these are the changes applied by buildroot and duplicates of what you had
above already...

> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index dea34d9..da4f0a2 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -27,7 +27,7 @@ BR2_TARGET_GENERIC_HOSTNAME="beaglebone"
>  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>  # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="board/measbone/post-image.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"

 Ah, so you fix it again here :-)

>  
>  # filesystem
>  BR2_PACKAGE_AM33X_CM3=y
> @@ -56,10 +56,14 @@ BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/beagleboard/linux.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4.1.13-ti-r36"
> -BR2_LINUX_KERNEL_PATCH="board/measbone/patches/linux/"
> +BR2_LINUX_KERNEL_PATCH="$(TOPDIR)/board/beaglebone/patches/linux-4.1.13-ti-r36"
>  BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(TOPDIR)/output/build/linux-4.1.13-ti-r36/arch/arm/configs/bb.org_defconfig"
>  BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_USE_INTREE_DTS=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-bone am335x-boneblack"
> +
> +# Firmware
> +# BR2_PACKAGE_AM33X_CM3 is not set

 This isn't needed, it's off by default.

> +BR2_PACKAGE_AM335X_PRU_PACKAGE=y

 This one _is_ needed.

 Regards,
 Arnout

> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
