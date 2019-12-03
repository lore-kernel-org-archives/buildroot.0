From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 3 Dec 2019 21:16:49 +0100
Subject: [Buildroot] [PATCHv2 2/2] configs: add raspberrypi4 64bits
 defconfig
In-Reply-To: <20191203132658.863709-2-arthur.courtel@smile.fr>
References: <20191203132658.863709-1-arthur.courtel@smile.fr>
 <20191203132658.863709-2-arthur.courtel@smile.fr>
Message-ID: <20191203211649.26f4425a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arthur,

On Tue,  3 Dec 2019 14:26:58 +0100, Arthur Courtel <arthur.courtel@smile.fr> wrote:

> This configuration builds a 64bit image for RaspberryPi 4.
>
> Signed-off-by: Arthur Courtel <arthur.courtel@smile.fr>
> ---
>  .../raspberrypi/genimage-raspberrypi4-64.cfg  | 30 +++++++++++++++
>  board/raspberrypi4-64                         |  1 +
>  configs/raspberrypi4_64_defconfig             | 37 +++++++++++++++++++
>  3 files changed, 68 insertions(+)
>  create mode 100644 board/raspberrypi/genimage-raspberrypi4-64.cfg
>  create mode 120000 board/raspberrypi4-64
>  create mode 100644 configs/raspberrypi4_64_defconfig
>
> diff --git a/board/raspberrypi/genimage-raspberrypi4-64.cfg b/board/raspberrypi/genimage-raspberrypi4-64.cfg
> new file mode 100644
> index 0000000000..3c480e98f0
> --- /dev/null
> +++ b/board/raspberrypi/genimage-raspberrypi4-64.cfg
> @@ -0,0 +1,30 @@
> +image boot.vfat {
> +  vfat {
> +    files = {
> +      "bcm2711-rpi-4-b.dtb",
> +      "rpi-firmware/cmdline.txt",
> +      "rpi-firmware/config.txt",
> +      "rpi-firmware/fixup4.dat",
> +      "rpi-firmware/start4.elf",
> +      "rpi-firmware/overlays",
> +      "Image"
> +    }
> +  }
> +  size = 32M
> +}
> +
> +image sdcard.img {
> +  hdimage {
> +  }
> +
> +  partition boot {
> +    partition-type = 0xC
> +    bootable = "true"
> +    image = "boot.vfat"
> +  }
> +
> +  partition rootfs {
> +    partition-type = 0x83
> +    image = "rootfs.ext4"
> +  }
> +}
> diff --git a/board/raspberrypi4-64 b/board/raspberrypi4-64
> new file mode 120000
> index 0000000000..fcdafc81ed
> --- /dev/null
> +++ b/board/raspberrypi4-64
> @@ -0,0 +1 @@
> +raspberrypi
> \ No newline at end of file
> diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
> new file mode 100644
> index 0000000000..c88923d507
> --- /dev/null
> +++ b/configs/raspberrypi4_64_defconfig
> @@ -0,0 +1,37 @@
> +BR2_aarch64=y
> +BR2_cortex_a72=y
> +
> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> +
> +BR2_SYSTEM_DHCP="eth0"
> +
> +# Linux headers same as kernel, a 4.19 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
> +
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,raspberrypi-kernel_1.20190819-1)/linux-raspberrypi-kernel_1.20190819-1.tar.gz"
> +BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
> +
> +# Build the DTB from the kernel sources
> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b"

No chance to test myself for pi4 (because of lack of hardware yet), but I believe
BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y is needed for an 64-bit kernel, see
[1] and [2] for pi3...

Regards,
Peter

[1] https://git.buildroot.net/buildroot/commit/?id=2aa92335cdc5f71c2d09391dc49fcf3c7627d6f0
[2] https://git.buildroot.net/buildroot/commit/?id=e747d33bd9d319481a67a376c97e5100dd93f62a

> +
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +
> +BR2_PACKAGE_RPI_FIRMWARE=y
> +BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
> +
> +# Required tools to create the SD image
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +
> +# Filesystem / image
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay --aarch64"
