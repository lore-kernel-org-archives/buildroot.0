From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 May 2021 22:12:25 +0200
Subject: [Buildroot] [PATCH] configs/aarch64_efi: bump kernel version
 and update
In-Reply-To: <20210423082833.17674-1-vincent.stehle@arm.com>
References: <20210423082833.17674-1-vincent.stehle@arm.com>
Message-ID: <8a2fa551-2130-6def-64b7-94f202127f8e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23/04/2021 10:28, Vincent Stehl? wrote:
> - Bump kernel to version 5.11.16.
> 
> We remove the hardcoded ttyAMA0 and rely on the firmware to discover our
> console. This enables serial console on systems, which do not have an Arm
> pl011 UART.
> 
> We switch to GPT disklabel and discover our root filesystem using its
> PARTLABEL. This enables booting from more media, such as HDD, SD card or
> USB.
> 
> We update the readme, which hinted that ACPI was mandatory. This is not
> strictly the case as we can also boot with a dtb and/or a U-Boot based
> firmware, with no ACPI. While at it, mention EBBR, SystemReady and explain
> how to build and use a U-Boot-based qemu firmware.
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@arm.com>
> Cc: Erico Nunes <nunes.erico@gmail.com>
> ---
> 
> 
> Hi,
> 
> The aarch64_efi_defconfig by Erico working on Qemu is a good starting point for
> Arm 64b UEFI systems; thank you Erico for that.
> 
> I would like to propose a few updates to this defconfig, to make it the
> reference buildroot defconfig for all Arm 64b SystemReady[1] platforms.
> Feedbacks are welcome.

 Very nice!

[snip]
> diff --git a/configs/aarch64_efi_defconfig b/configs/aarch64_efi_defconfig
> index 99600575edf..da9ee45defc 100644
> --- a/configs/aarch64_efi_defconfig
> +++ b/configs/aarch64_efi_defconfig
> @@ -5,7 +5,7 @@ BR2_aarch64=y
>  BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
>  
>  # System
> -BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> +BR2_TARGET_GENERIC_GETTY_PORT="console"

 This is the default, so I just removed that line.

 Regards,
 Arnout

>  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>  
>  ## Required tools to create bootable media
> @@ -23,13 +23,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="200M"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/aarch64-efi/post-image.sh support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/aarch64-efi/genimage-efi.cfg"
>  
> -# Linux headers same as kernel, a 5.9 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_9=y
> +# Linux headers same as kernel, a 5.11 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_11=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.9.11"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.11.16"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  
> 
