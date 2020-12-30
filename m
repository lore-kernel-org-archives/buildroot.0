From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Dec 2020 13:54:18 +0100
Subject: [Buildroot] [PATCH v3 05/11] configs/aarch64_efi_defconfig:
 build the EDK2 firmware from source
In-Reply-To: <20201218202646.1060123-6-hi@senzilla.io>
References: <20201218202646.1060123-1-hi@senzilla.io>
 <20201218202646.1060123-6-hi@senzilla.io>
Message-ID: <20201230125418.GN1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dick, All,

On 2020-12-18 20:27 +0000, Dick Olsson via buildroot spake thusly:
> Prior to this, you had to manually download a pre-built EDK2 flash
> device image (QEMU_EFI.fd) in order to boot this configuration with
> QEMU. Now, the configuration is building EDK2 from source.
> 
> Signed-off-by: Dick Olsson <hi@senzilla.io>
> 
> ---
> 
> Revision 3:
> 
>  * post-image.sh will now provide resized flash devices
>  * readme.txt suggests pflash instead of bios
> 
> Revision 2:
> 
>  * Explicitly added the default EDK2 platform to defconfig
> ---
>  board/aarch64-efi/post-image.sh | 12 +++++++++++-
>  board/aarch64-efi/readme.txt    |  9 ++++-----
>  configs/aarch64_efi_defconfig   |  2 ++
>  3 files changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/board/aarch64-efi/post-image.sh b/board/aarch64-efi/post-image.sh
> index f0214dc866..c90dfa21e0 100755
> --- a/board/aarch64-efi/post-image.sh
> +++ b/board/aarch64-efi/post-image.sh
> @@ -1,5 +1,15 @@
> -#!/bin/sh
> +#!/bin/bash
>  
>  BOARD_DIR="$(dirname $0)"
>  
>  cp -f ${BOARD_DIR}/grub.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
> +
> +# Function taking file $1 as input and outputs file $2 padded to size $3.
> +function resize_flash {
> +  dd if=/dev/zero of="${BINARIES_DIR}/${2}" bs=1M count="${3}"
> +  dd if="${BINARIES_DIR}/${1}" of="${BINARIES_DIR}/${2}" conv=notrunc

There is a better and simpler way to achieve that:

    truncate -s 64M "${BINARIES_DIR}/QEMU_EFI.fd"
    truncate -s 64M "${BINARIES_DIR}/QEMU_VARS.fd"

(as I understand it, these files are just meant for QEMU, not actual
hardware, so we can resize them in-place without copying).

Regards,
Yann E. MORIN.

> +}
> +
> +# The QEMU virt machine expects flash devices to be 64M.
> +resize_flash QEMU_EFI.fd QEMU_EFI_RESIZED.fd 64
> +resize_flash QEMU_VARS.fd QEMU_VARS_RESIZED.fd 64
> diff --git a/board/aarch64-efi/readme.txt b/board/aarch64-efi/readme.txt
> index 65a6345b6c..d0f900c616 100644
> --- a/board/aarch64-efi/readme.txt
> +++ b/board/aarch64-efi/readme.txt
> @@ -22,13 +22,12 @@ qemu-system-aarch64 \
>  	-cpu cortex-a57 \
>  	-m 512 \
>  	-nographic \
> -	-bios </path/to/QEMU_EFI.fd> \
> +	-drive file=output/images/QEMU_EFI_RESIZED.fd,if=pflash,format=raw \
> +	-drive file=output/images/QEMU_VARS_RESIZED.fd,if=pflash,format=raw \
>  	-drive file=output/images/disk.img,if=none,format=raw,id=hd0 \
>  	-device virtio-blk-device,drive=hd0 \
>  	-netdev user,id=eth0 \
>  	-device virtio-net-device,netdev=eth0
>  
> -Note that </path/to/QEMU_EFI.fd> needs to point to a valid aarch64 UEFI
> -firmware image for qemu.
> -It may be provided by your distribution as a edk2-aarch64 or AAVMF
> -package, in path such as /usr/share/edk2/aarch64/QEMU_EFI.fd .
> +Note that output/images/QEMU_*.fd are the flash device files built by
> +the EDK2 package.
> diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
> index 2aab6e9699..3da6542ea0 100644
> --- a/configs/aarch64_efi_defconfig
> +++ b/configs/aarch64_efi_defconfig
> @@ -12,6 +12,8 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>  BR2_PACKAGE_HOST_GENIMAGE=y
>  
>  # Bootloader
> +BR2_TARGET_EDK2=y
> +BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU=y
>  BR2_TARGET_GRUB2=y
>  BR2_TARGET_GRUB2_ARM64_EFI=y
>  
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
