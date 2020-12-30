From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Dec 2020 14:30:37 +0100
Subject: [Buildroot] [PATCH v3 09/11]
 configs/qemu_aarch64_virt_efi_defconfig: new config for QEMU Virt EFI
In-Reply-To: <20201218202646.1060123-10-hi@senzilla.io>
References: <20201218202646.1060123-1-hi@senzilla.io>
 <20201218202646.1060123-10-hi@senzilla.io>
Message-ID: <20201230133037.GQ1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dick, All,

On 2020-12-18 20:27 +0000, Dick Olsson via buildroot spake thusly:
> This introduces a configuration for QEMU Virt that boots Linux with ATF
> and the EDK2 EFI firmware without any additional bootloaders. ATF is
> loading EDK2 in EL2 using the BL33 payload configuration.
> 
> Signed-off-by: Dick Olsson <hi@senzilla.io>
> 
> diff --git a/board/qemu/aarch64-virt-efi/genimage.cfg b/board/qemu/aarch64-virt-efi/genimage.cfg
> new file mode 100644
> index 0000000000..f653b1f35d
> --- /dev/null
> +++ b/board/qemu/aarch64-virt-efi/genimage.cfg
> @@ -0,0 +1,24 @@
> +image efi-part.vfat {
> +  vfat {
> +    file EFI {
> +      image = "efi-part/EFI"
> +    }
> +  }
> +  size = 32M
> +}
> +
> +image disk.img {
> +  hdimage {
> +    gpt = true
> +  }
> +
> +  partition boot {
> +    partition-type = 0xEF
> +    image = "efi-part.vfat"
> +  }
> +
> +  partition root {
> +    partition-type = 0x83
> +    image = "rootfs.ext2"
> +  }
> +}
> diff --git a/board/qemu/aarch64-virt-efi/linux.fragment b/board/qemu/aarch64-virt-efi/linux.fragment
> new file mode 100644
> index 0000000000..03d553a18d
> --- /dev/null
> +++ b/board/qemu/aarch64-virt-efi/linux.fragment
> @@ -0,0 +1 @@
> +CONFIG_CMDLINE="root=/dev/vda2 rootwait console=ttyAMA0"
> diff --git a/board/qemu/aarch64-virt-efi/post-image.sh b/board/qemu/aarch64-virt-efi/post-image.sh
> new file mode 100755
> index 0000000000..82eb05798d
> --- /dev/null
> +++ b/board/qemu/aarch64-virt-efi/post-image.sh
> @@ -0,0 +1,15 @@
> +#!/bin/bash
> +
> +set -e
> +
> +BOARD_DIR="$(dirname $0)"

BOARD_DIR is not used anywhere else, so drop it.

> +EFI_DIR=${BINARIES_DIR}/efi-part/EFI/BOOT
> +
> +# Set up the kernel executable according to the UEFI standard.
> +mkdir -p ${EFI_DIR}
> +ln -sf ${BINARIES_DIR}/Image ${EFI_DIR}/bootaa64.efi

So, if I understand correctly, ${EFI_DIR}/bootaa64.efi will be an
absolute symlink to ${BINARIES_DIR}/Image, and then ${EFI_DIR} will be
used to populate the VFAT image used as first partition.

But two things:
  1. the symlinks target will be invalid at runtime, as it contains a
     path on the build machine;
  2. VFAT can't handle symlinks anyway.

So, does genimage follow symlinks when it generates the VFAT image?

> +# The QEMU virt machine expects the BIOS flash device to be 64M.
> +rm -rf ${BINARIES_DIR}/flash.bin
> +dd if=${BINARIES_DIR}/bl1.bin of=${BINARIES_DIR}/flash.bin bs=4096 conv=notrunc
> +dd if=${BINARIES_DIR}/fip.bin of=${BINARIES_DIR}/flash.bin seek=64 bs=4096 conv=notrunc

You said "flash device [must] be 64M" but 64*4K is not 64M. Also, this
just starts the dump at offset 64*4K, but does not guarantee the
resulting file to be exactly 64M...

Quid?

Maybe:

    cp "${BINARIES_DIR}/bl1.bin" "${BINARIES_DIR}/flash.bin"
    truncate -s $((64*4096)) "${BINARIES_DIR}/flash.bin"
    cat "${BINARIES_DIR}/fip.bin" >> "${BINARIES_DIR}/flash.bin"
    truncate -s 64M "${BINARIES_DIR}/flash.bin"

But yes, I can see here how using truncate is sub-optimal... Keeping
some incantations of dd is acceptable here.

> diff --git a/board/qemu/aarch64-virt-efi/readme.txt b/board/qemu/aarch64-virt-efi/readme.txt
> new file mode 100644
> index 0000000000..35fc257855
> --- /dev/null
> +++ b/board/qemu/aarch64-virt-efi/readme.txt
> @@ -0,0 +1,27 @@
> +Intro
> +=====
> +
> +This board allows to build a minimal Linux system that boot directly
> +with Arm Trusted Firmware, EDK2 (UEFI), ACPI and GICv3 without any
> +additional bootloaders like GRUB2.
> +
> +Build
> +=====
> +
> +  $ make qemu_aarch64_virt_efi_defconfig
> +  $ make
> +
> +Emulation
> +=========
> +
> +Run the emulation with:
> +
> +  output/host/bin/qemu-system-aarch64 \
> +    -M virt,secure=on,gic-version=3 \
> +    -cpu cortex-a57 \
> +    -smp 4 \
> +    -m 1024 \
> +    -nographic \
> +    -bios output/images/flash.bin \
> +	-drive file=output/images/disk.img,if=none,format=raw,id=hd0 \
> +	-device virtio-blk-device,drive=hd0

Mix of leading space and TAB s (use spaces only, please).

> diff --git a/configs/qemu_aarch64_virt_efi_defconfig b/configs/qemu_aarch64_virt_efi_defconfig
> new file mode 100644
> index 0000000000..e1d3bcda4b
> --- /dev/null
> +++ b/configs/qemu_aarch64_virt_efi_defconfig
> @@ -0,0 +1,46 @@
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
> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/aarch64-virt-efi/post-image.sh support/scripts/genimage.sh"

Ah, something I forgot to comment on on the other patches: the name
'post-image.sh' is a bit too generic. Please try to find a better name
that explains what the script actually does, e.g.:

    board/qemu/aarch64-virt-efi/assemble-bios-flash-image

(and no need to end the filename with '.sh')

Regards,
Yann E. MORIN.

> +BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/qemu/aarch64-virt-efi/genimage.cfg"
> +
> +# Kernel
> +BR2_LINUX_KERNEL=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.53"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
> +BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/aarch64-virt-efi/linux.fragment"
> +
> +# Linux headers same as kernel, a 5.4 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
> +
> +# UEFI firmware
> +BR2_TARGET_EDK2=y
> +BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL=y
> +
> +# ARM Trusted Firmware
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_EDK2_AS_BL33=y
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="QEMU_USE_GIC_DRIVER=QEMU_GICV3"
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
