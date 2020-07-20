From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Jul 2020 23:15:30 +0200
Subject: [Buildroot] [PATCH 6/8]
 configs/qemu_aarch64_sbsa_sbbr_defconfig: new config for SBBR on QEMU SBSA
In-Reply-To: <20200719180727.28202-7-hi@senzilla.io>
References: <20200719180727.28202-1-hi@senzilla.io>
 <20200719180727.28202-7-hi@senzilla.io>
Message-ID: <20200720231530.4ce99aa0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 19 Jul 2020 18:10:40 +0000
Dick Olsson <hi@senzilla.io> wrote:

> diff --git a/board/aarch64-sbsa/linux.config b/board/aarch64-sbsa/linux.config
> new file mode 100644
> index 0000000000..03d553a18d
> --- /dev/null
> +++ b/board/aarch64-sbsa/linux.config
> @@ -0,0 +1 @@
> +CONFIG_CMDLINE="root=/dev/vda2 rootwait console=ttyAMA0"

This is really a fragment, so it should be called "linux.fragment".

But why is hardcoding the kernel command line needed? EDK2 is a complex
firmware, and it would not be capable of passing a Linux kernel command
line?

> diff --git a/board/aarch64-sbsa/post-image.sh b/board/aarch64-sbsa/post-image.sh
> new file mode 100755
> index 0000000000..a9a1eeb227
> --- /dev/null
> +++ b/board/aarch64-sbsa/post-image.sh
> @@ -0,0 +1,22 @@
> +#!/bin/bash
> +
> +BOARD_DIR="$(dirname $0)"
> +EFI_DIR=${BINARIES_DIR}/efi-part/EFI/BOOT
> +
> +# Set up the kernel executable according to the UEFI standard.
> +mkdir -p ${EFI_DIR} && \

No need for &&. Maybe a set -e at the beginning of the file would suffice.

> +ln -sf ${BINARIES_DIR}/Image ${EFI_DIR}/bootaa64.efi
> +
> +function resize_or_link_flash {

Perhaps a comment above this function to explain what is going would be
nice.

> +  if [ -n "${3}" ]; then
> +    dd if=/dev/zero of="${BINARIES_DIR}/${2}" bs=1M count=${3} && \

So this is going to create a 256MB file in the case of this platform ?

> +    dd if="${BINARIES_DIR}/${1}" of="${BINARIES_DIR}/${2}" conv=notrunc || exit 1

Drop && and exit 1, rely on set -e.

> +  else
> +    ln -srf "${BINARIES_DIR}/${1}" "${BINARIES_DIR}/${2}" || exit 1

Ditto.

> +  fi
> +}

> +if grep -Eq "^BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=\"qemu_sbsa\"$" ${BR2_CONFIG}; then
> +  resize_or_link_flash "SBSA_FLASH0.fd" "secureflash.bin" "256"
> +  resize_or_link_flash "SBSA_FLASH1.fd" "flash0.bin" "256"
> +fi
> diff --git a/board/aarch64-sbsa/readme.txt b/board/aarch64-sbsa/readme.txt
> new file mode 100644
> index 0000000000..84fe1d3652
> --- /dev/null
> +++ b/board/aarch64-sbsa/readme.txt
> @@ -0,0 +1,28 @@
> +The aarch64-sbsa board is generic and will work for platforms that are

As explained in my reply to the commit log, there is no such thing as
an "aarch64-sbsa" board in Buildroot.

> diff --git a/configs/qemu_aarch64_sbsa_sbbr_defconfig b/configs/qemu_aarch64_sbsa_sbbr_defconfig
> new file mode 100644
> index 0000000000..05d662fd17
> --- /dev/null
> +++ b/configs/qemu_aarch64_sbsa_sbbr_defconfig
> @@ -0,0 +1,44 @@
> +# Architecture
> +BR2_aarch64=y
> +
> +# Toolchain, required for eudev and grub

You don't use grub.

> +BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> +
> +# System
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y

Any reason to need eudev ?

> +
> +## Required tools to create bootable media
> +BR2_PACKAGE_HOST_GENIMAGE=y

Could probably move together with dosfstools and mtools.

> +
> +# Filesystem / image
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/aarch64-sbsa/post-image.sh support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/aarch64-sbsa/genimage-sbsa.cfg"
> +
> +# Linux headers same as kernel, a 4.18 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"

That's a pretty old kernel and not even an LTS branch. What about using
something more recent, such as at least 5.4, which is LTS ?

> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/aarch64-sbsa/linux.config"
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> +
> +# UEFI firmware
> +BR2_TARGET_EDK2=y
> +BR2_TARGET_EDK2_PLATFORM_QEMU_SBSA=y
> +
> +# ARM Trusted Firmware
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu_sbsa"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
> +
> +# Host tools for genimage
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_MTOOLS=y

Please note that most comments made on this patch apply to 7/8 and 8/8
as well.

Thanks for all this work!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
