From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 May 2021 21:11:53 +0200
Subject: [Buildroot] [PATCH] New board: pine64+
In-Reply-To: <20191229214821.15301-1-avraham.shukron@gmail.com>
References: <20191229214821.15301-1-avraham.shukron@gmail.com>
Message-ID: <e054c335-a67a-40aa-4c14-73a726efece8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Avi,

 One and a half years after you submitted this patch, you're probably not too
motivated to follow up on it... Still, I have some feedback. I've marked the
patch as Changes Requested in patchwork.

On 29/12/2019 22:48, Avi Shukron wrote:
> The pine64+ is a variant of the original pine64 with 1/2 GB RAM and
> GbE phy.
> 
> The pine64+ has a distinct dts file in both mainline kernel and uboot,
> thus it cannot be supported with the existing pine64_defconfig.
> 
> The board is added with mainline ATF, Uboot and kernel support, all at
> the latest (or almost) version.
> 
> The new defconfig for the board was tested and booted successfully with
> serial console access + console output to HDMI. Network interface eth0
> is working properly and configured with DHCP at boot time.
> 
> Signed-off-by: Avi Shukron <avraham.shukron@gmail.com>
> ---
>  board/pine64/pine64-plus/boot.cmd     |  6 +++
>  board/pine64/pine64-plus/genimage.cfg | 39 +++++++++++++++++++
>  board/pine64/pine64-plus/readme.txt   | 55 +++++++++++++++++++++++++++
>  configs/pine64_plus_defconfig         | 35 +++++++++++++++++
>  4 files changed, 135 insertions(+)
>  create mode 100644 board/pine64/pine64-plus/boot.cmd
>  create mode 100644 board/pine64/pine64-plus/genimage.cfg
>  create mode 100644 board/pine64/pine64-plus/readme.txt
>  create mode 100644 configs/pine64_plus_defconfig
> 
> diff --git a/board/pine64/pine64-plus/boot.cmd b/board/pine64/pine64-plus/boot.cmd
> new file mode 100644
> index 0000000000..511111e2ee
> --- /dev/null
> +++ b/board/pine64/pine64-plus/boot.cmd
> @@ -0,0 +1,6 @@
> +setenv bootargs console=tty0 console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
> +
> +fatload mmc 0 $kernel_addr_r Image
> +fatload mmc 0 $fdt_addr_r sun50i-a64-pine64-plus.dtb
> +
> +booti $kernel_addr_r - $fdt_addr_r
> diff --git a/board/pine64/pine64-plus/genimage.cfg b/board/pine64/pine64-plus/genimage.cfg
> new file mode 100644
> index 0000000000..60dac9d882
> --- /dev/null
> +++ b/board/pine64/pine64-plus/genimage.cfg
> @@ -0,0 +1,39 @@
> +image boot.vfat {
> +	vfat {
> +		files = {
> +			"Image",
> +			"sun50i-a64-pine64-plus.dtb",
> +			"boot.scr"
> +		}
> +	}
> +	size = 64M
> +}
> +
> +image sdcard.img {
> +	hdimage {
> +	}
> +
> +	partition spl {
> +		in-partition-table = "no"
> +		image = "sunxi-spl.bin"
> +		offset = 8192
> +	}
> +
> +	partition u-boot {
> +		in-partition-table = "no"
> +		image = "u-boot.itb"
> +		offset = 40K
> +		size = 1M # 1MB - 40K

 I guess you copied the comment from somewhere - 1M is not 1MB - 40K :-) Hm,
apparently that comment is wrong in quite a lot of genimage.cfg files... Anyway,
let's not propagate the madness!

> +	}
> +
> +	partition boot {
> +		partition-type = 0xC
> +		bootable = "true"
> +		image = "boot.vfat"

 Modern upstream U-Boot generally supports using /boot in the ext4. Any reason
not to use that? (It's OK to do it like this even if it's just because "that's
what the wiki page says".) Similarly, modern devices generally use a GPT
partition table.

> +	}
> +
> +	partition rootfs {
> +		partition-type = 0x83
> +		image = "rootfs.ext4"
> +	}
> +}

[snip]
> diff --git a/configs/pine64_plus_defconfig b/configs/pine64_plus_defconfig
> new file mode 100644
> index 0000000000..d1b267b64e
> --- /dev/null
> +++ b/configs/pine64_plus_defconfig
> @@ -0,0 +1,35 @@
> +BR2_aarch64=y

 Please explicitly set BR2_cortex_a53=y

 Also, it's nice if you beautify the defconfig and split it in sections. See
e.g. pine64_defconfig.

> +BR2_ARM_FPU_VFPV4=y
> +BR2_CCACHE=y

 We don't use ccache in our defconfigs. Defconfigs are supposed to be minimal.

> +BR2_TOOLCHAIN_EXTERNAL=y

 We use an internal toolchain (with uClibc) unless there's a *very* good reason
not to.

> +BR2_TARGET_GENERIC_ISSUE="Welcome to PINE64+"
> +BR2_SYSTEM_DHCP="eth0"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/pine64-plus/genimage.cfg"
> +BR2_LINUX_KERNEL=y

 Always use BR2_LINUX_KERNEL_CUSTOM_VERSION=y and use an explicit *tested*
kernel version. Otherwise, when the default kernel version is bumped in
Buildroot, the board may suddenly break.

> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-a64-pine64-plus"
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="100M"

 Is there a reason to make a larger rootfs? We normally only do that for configs
which have large extra requirements.

> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.2"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_DEBUG=y

 Is there a reason to turn on debugging?


 Regards,
 Arnout


> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pine64_plus"
> +BR2_TARGET_UBOOT_NEEDS_DTC=y
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="spl/sunxi-spl.bin"
> +BR2_TARGET_UBOOT_BOOT_SCRIPT=y
> +BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/pine64/pine64-plus/boot.cmd"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> 
