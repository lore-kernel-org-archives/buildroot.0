From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Dec 2020 14:11:42 +0100
Subject: [Buildroot] [PATCH v3 08/11]
 configs/qemu_aarch64_sbsa_defconfig: new config for QEMU sbsa-ref
In-Reply-To: <20201218202646.1060123-9-hi@senzilla.io>
References: <20201218202646.1060123-1-hi@senzilla.io>
 <20201218202646.1060123-9-hi@senzilla.io>
Message-ID: <20201230131142.GP1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dick, All,

On 2020-12-18 20:27 +0000, Dick Olsson via buildroot spake thusly:
> This introduces a configuration for the SBSA reference machine under
> QEMU that is intended for developing and testing firmware. It consists
> of ATF that load EDK2 as BL33 which in turn will load the kernel in EFI
> stub mode with ACPI.
> 
> Signed-off-by: Dick Olsson <hi@senzilla.io>
[--SNIP--]
> diff --git a/board/qemu/aarch64-sbsa/post-image.sh b/board/qemu/aarch64-sbsa/post-image.sh
> new file mode 100755
> index 0000000000..07343e2ea9
> --- /dev/null
> +++ b/board/qemu/aarch64-sbsa/post-image.sh
> @@ -0,0 +1,20 @@
> +#!/bin/bash
> +
> +set -e
> +
> +BOARD_DIR="$(dirname $0)"
> +EFI_DIR=${BINARIES_DIR}/efi-part/EFI/BOOT
> +
> +# Set up the kernel executable according to the UEFI standard.
> +mkdir -p ${EFI_DIR}
> +ln -sf ${BINARIES_DIR}/Image ${EFI_DIR}/bootaa64.efi
> +
> +# Function taking file $1 as input and outputs file $2 padded to size $3.
> +function resize_flash {
> +  dd if=/dev/zero of="${BINARIES_DIR}/${2}" bs=1M count="${3}"
> +  dd if="${BINARIES_DIR}/${1}" of="${BINARIES_DIR}/${2}" conv=notrunc
> +}
> +
> +# The QEMU sbsa machine expects flash devices to be 256M.
> +resize_flash SBSA_FLASH0.fd SBSA_FLASH0_RESIZED.fd 256
> +resize_flash SBSA_FLASH1.fd SBSA_FLASH1_RESIZED.fd 256

As already previously suggested in patch 5:
  - don't copy the files
  - use truncate -s 256M

> diff --git a/board/qemu/aarch64-sbsa/readme.txt b/board/qemu/aarch64-sbsa/readme.txt
> new file mode 100644
> index 0000000000..5b54ad87c4
> --- /dev/null
> +++ b/board/qemu/aarch64-sbsa/readme.txt
> @@ -0,0 +1,34 @@
> +Intro
> +=====
> +
> +The QEMU sbsa-ref machine is primarily meant for firmware development and
> +testing. Thus, the Linux kernel is not necessarily meant to boot to userland.
> +
> +A successful boot should be considered:
> +
> +1. ARM Trusted Firmware (ATF) boots until BL31
> +2. ATF loads EDK2 (UEFI) as BL33
> +3. EDK2 loads the Linux kernel in EFI stub mode
> +4. Linux begins to boot, exits boot services, begins loading the address map
> +5. Freeze

Even though the purpose of that machine is for firmware testing, and
getting up to the kernel freewe is enough, can w still get better than a
freeze?

I mean, if the boot freezes in any of the previous steps (like, ATF or
EDK2 failing, or Linux failing to exit boot services, etc..), such a
freeze would be undistinguishable from a success... Getting a real,
even if minimalist, userland like a shell, would prove the boot to
indeed be successful.

But if that proves to be too complex to come up with, we can settle for
a freeze...

Regards,
Yann E. MORIN.

> +Build
> +=====
> +
> +  $ make qemu_aarch64_sbsa_defconfig
> +  $ make
> +
> +Emulation
> +=========
> +
> +Run the emulation with:
> +
> +  output/host/bin/qemu-system-aarch64 \
> +    -M sbsa-ref \
> +    -cpu cortex-a57 \
> +    -smp 4 \
> +    -m 1024 \
> +    -nographic \
> +    -drive file=output/images/SBSA_FLASH0_RESIZED.fd,if=pflash,format=raw \
> +    -drive file=output/images/SBSA_FLASH1_RESIZED.fd,if=pflash,format=raw \
> +    -hda output/images/disk.img
> diff --git a/configs/qemu_aarch64_sbsa_defconfig b/configs/qemu_aarch64_sbsa_defconfig
> new file mode 100644
> index 0000000000..e82a12524a
> --- /dev/null
> +++ b/configs/qemu_aarch64_sbsa_defconfig
> @@ -0,0 +1,44 @@
> +# Architecture
> +BR2_aarch64=y
> +
> +# Toolchain
> +BR2_TOOLCHAIN_BUILDROOT=y
> +
> +# System
> +BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +
> +# Filesystem / image
> +BR2_TARGET_ROOTFS_EXT2=y
> +BR2_TARGET_ROOTFS_EXT2_4=y
> +BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/aarch64-sbsa/post-image.sh support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/qemu/aarch64-sbsa/genimage.cfg"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.53"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/aarch64-sbsa/linux.fragment"
> +
> +# Linux headers same as kernel, a 5.4 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
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
> +BR2_PACKAGE_HOST_GENIMAGE=y
> +BR2_PACKAGE_HOST_DOSFSTOOLS=y
> +BR2_PACKAGE_HOST_MTOOLS=y
> +
> +# host-qemu for testing
> +BR2_PACKAGE_HOST_QEMU=y
> +BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
