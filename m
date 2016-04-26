From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Apr 2016 22:05:22 +0200
Subject: [Buildroot] [PATCH 1/2] uboot and arm trusted firmware build
 added to juno board
In-Reply-To: <eeb5c500573a8584bfbfe6d33bf160c725683a18.1461688139.git.jpinto@synopsys.com>
References: <eeb5c500573a8584bfbfe6d33bf160c725683a18.1461688139.git.jpinto@synopsys.com>
Message-ID: <20160426220522.5897a74f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patch should be the second patch in the series, since it relies on
the atfirmware package being added.

The title of the patch should be something like:

configs: use atfirmware package in arm_juno_defconfig

On Tue, 26 Apr 2016 17:35:55 +0100, Joao Pinto wrote:


> +Other ARM Trusted Firmware options
> +==================================

One empty new line here.

> +If you need to include the bootlader into the fip package, please

bootlader -> bootloader

can you say "into the ARM Trusted Firmware fip image" instead of
"into the fip package". In the context of Buildroot, "package" has a
specific meaning, and there is nothing like a "fip package" in
Buildroot.

> +configure BR2_TARGET_ATFIRMWARE_PAYLOAD_PATH to specify the path to the
> +binary.

Why don't you automatically put the bootloader as the payload of the
ATF firmware? How can the ATF firmware be useful without the bootloader
as the payload? This is a real question, maybe there's a real use for
it.

> +If you need to include the SCP Firmware into the fip package please

Same comment about "into the fip package".

> +specify SCP_BL2=<binary_path> in BR2_TARGET_ATFIRMWARE_ADDITIONAL_VARIABLES.

Just for info, what is this SCP Firmware ?

>  
>  Preparing your rootfs
>  ======================
> @@ -89,8 +104,8 @@ NOR3LOAD: 00000000               ;Image Load Address
>  NOR3ENTRY: 00000000              ;Image Entry Point
>  ......
>  
> -Installing kernel image and DTB
> -===============================
> +Installing kernel image, DTB and bootloader
> +===========================================
>  
>  1. Connect to the ARM Juno UART0 and execute USB_ON in the terminal
>  2. Connect a USB cable between your PC and ARM Juno USB type B connector
> @@ -98,7 +113,8 @@ Installing kernel image and DTB
>  3. Open the software/ folder
>  4. Copy the 'Image' file to software/
>  5. Copy the 'juno-r1.dtb' (r1) or the 'juno.dtb' (r0) file to software/
> -6. Press the red button in the front pannel of ARM Juno
> +6. Copy the 'bl1.bin' and 'fip.bin' files to software/
> +7. Press the red button in the front pannel of ARM Juno
>  
>  At this time, the board will erase the Flash entry for each new item and
>  replace it with the lastest ones.
> diff --git a/configs/arm_juno_defconfig b/configs/arm_juno_defconfig
> index 87b6374..b94d04c 100644
> --- a/configs/arm_juno_defconfig
> +++ b/configs/arm_juno_defconfig
> @@ -12,3 +12,15 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>  BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/arm/juno/linux-juno-defconfig"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/juno arm/juno-r1"
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> +BR2_TARGET_UBOOT_BOARDNAME="vexpress_aemv8a_juno"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.03"
> +BR2_TARGET_ATFIRMWARE=y
> +BR2_TARGET_ATFIRMWARE_CUSTOM_GIT=y
> +BR2_TARGET_ATFIRMWARE_VERSION="v1.2"
> +BR2_TARGET_ATFIRMWARE_CUSTOM_GIT_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
> +BR2_TARGET_ATFIRMWARE_CUSTOM_GIT_VERSION="v1.2"
> +BR2_TARGET_ATFIRMWARE_PLATFORM="juno"
> +

The last empty new line is useless.

Could you fix those issues and send an updated version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
