From: Joris Offouga <offougajoris@gmail.com>
Date: Mon, 8 Jul 2019 23:52:51 +0200
Subject: [Buildroot] [PATCH] configs/warp7: Bump kernel and U-Boot
 versions
In-Reply-To: <1562616678-20056-1-git-send-email-pjtexier@koncepto.io>
References: <1562616678-20056-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <c89ef2ad-8051-a726-e727-5cb6e97d993a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Pierre-Jean

Le 08/07/2019 ? 22:11, Pierre-Jean Texier a ?crit?:
> Bump U-Boot to 2019.07 and kernel to version 5.1.16.
>
> Also
>   - adjust the U-Boot binary name after DM conversion.
>   - add missing notes about DFU
>
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
> Logs:
> U-Boot 2019.07 (Jul 08 2019 - 21:48:39 +0200)
>
> CPU:   Freescale i.MX7S rev1.2 800 MHz (running at 792 MHz)
> CPU:   Extended Commercial temperature grade (-20C to 105C) at 41C
> Reset cause: POR
> Model: Warp i.MX7 Board
> Board: WARP7 in secure mode OPTEE DRAM 0x9d000000-0xa0000000
> DRAM:  464 MiB
> PMIC: PFUZE3000 DEV_ID=0x30 REV_ID=0x11
> MMC:   FSL_SDHC: 1, FSL_SDHC: 0
>
> => run bootcmd
> switch to partitions #0, OK
> mmc0(part 0) is current device
> switch to partitions #0, OK
> mmc0(part 0) is current device
> 8188560 bytes read in 118 ms (66.2 MiB/s)
> Booting from mmc ...
> ...
> Starting kernel ...
>
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 5.1.16 (pjtexier at menoah)
>
>   board/warp7/readme.txt  | 22 ++++++++++++++++++----
>   configs/warp7_defconfig | 10 +++++-----
>   2 files changed, 23 insertions(+), 9 deletions(-)
>
> diff --git a/board/warp7/readme.txt b/board/warp7/readme.txt
> index 47458e9..aff7a60 100644
> --- a/board/warp7/readme.txt
> +++ b/board/warp7/readme.txt
> @@ -20,7 +20,7 @@ You will find in output/images/ the following files:
>     - rootfs.ext4
>     - rootfs.tar
>     - sdcard.img
> -  - u-boot.imx
> +  - u-boot-dtb.imx
>     - zImage
>   
>   Flash the eMMC image
> @@ -61,11 +61,11 @@ Connect a USB to serial adapter between the host PC and warp7 serial
>   USB port, and also a USB cable between the OTG warp7 port and the host
>   PC.
>   
> -Copy u-boot.imx to the imx_usb_loader folder.
> +Copy u-boot-dtb.imx to the imx_usb_loader folder.
>   
> -Load u-boot.imx via USB:
> +Load u-boot-dtb.imx via USB:
>   
> -$ sudo ./imx_usb u-boot.imx
> +$ sudo ./imx_usb u-boot-dtb.imx
>   
>   Then U-Boot should start and its messages will appear in the console program.
>   
> @@ -75,6 +75,20 @@ Use the default environment variables:
>   
>   => env default -f -a
>   => saveenv
> +
> +Run the DFU command:
> +=> dfu 0 mmc 0
> +
> +Transfer u-boot-dtb.imx that will be flashed into the eMMC:
> +
> +$ sudo dfu-util -D u-boot-dtb.imx -a boot
> +
> +Then on the U-Boot prompt the following message should be seen after a
> +successful upgrade:
> +
> +#DOWNLOAD ... OK
> +Ctrl+C to exit ...
> +
>   => ums 0 mmc 0
>   
>   sudo dd if=output/images/sdcard.img of=/dev/<your-emmc-device>
> diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
> index 8acd730..9b10085 100644
> --- a/configs/warp7_defconfig
> +++ b/configs/warp7_defconfig
> @@ -3,8 +3,8 @@ BR2_arm=y
>   BR2_cortex_a7=y
>   BR2_ARM_FPU_NEON_VFPV4=y
>   
> -# Linux headers same as kernel, a 5.0 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
> +# Linux headers same as kernel, a 5.1 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=y
>   
>   # system
>   BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
> @@ -15,7 +15,7 @@ BR2_ROOTFS_OVERLAY="board/warp7/rootfs_overlay"
>   # Kernel
>   BR2_LINUX_KERNEL=y
>   BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0.9"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.1.16"
>   BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
>   BR2_LINUX_KERNEL_DTS_SUPPORT=y
>   BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
> @@ -25,8 +25,8 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>   BR2_TARGET_UBOOT=y
>   BR2_TARGET_UBOOT_BOARDNAME="warp7"
>   BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
> -BR2_TARGET_UBOOT_FORMAT_IMX=y
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.07"
> +BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
>   
>   # wifi firmware for brcm43430
>   BR2_PACKAGE_LINUX_FIRMWARE=y

it works for me

U-Boot 2019.07 (Jul 08 2019 - 23:35:25 +0200)

CPU:?? Freescale i.MX7S rev1.2 800 MHz (running at 792 MHz)
CPU:?? Extended Commercial temperature grade (-20C to 105C) at 46C
Reset cause: POR
Model: Warp i.MX7 Board
Board: WARP7 in secure mode OPTEE DRAM 0x9d000000-0xa0000000
DRAM:? 464 MiB
PMIC: PFUZE3000 DEV_ID=0x30 REV_ID=0x11
MMC:?? FSL_SDHC: 1, FSL_SDHC: 0
Loading Environment from MMC... OK
In:??? serial at 30860000
Out:?? serial at 30860000
Err:?? serial at 30860000
SEC0: RNG instantiated
Net:?? usb_ether
Warning: usb_ether (eth0) using random MAC address - 4a:ec:76:9f:4e:28

Hit any key to stop autoboot:? 0
switch to partitions #0, OK
mmc0(part 0) is current device
switch to partitions #0, OK
mmc0(part 0) is current device
8188688 bytes read in 119 ms (65.6 MiB/s)
Booting from mmc ...
26889 bytes read in 10 ms (2.6 MiB/s)
Kernel image @ 0x80800000 [ 0x000000 - 0x7cf310 ]
## Flattened Device Tree blob at 83000000
 ?? Booting using the fdt blob at 0x83000000
 ?? Using Device Tree in place at 83000000, end 83009908

Starting kernel ...

Tested-by: Joris Offouga <offougajoris@gmail.com>

Best Regards,

Joris Offouga

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190708/9be20de2/attachment.html>
