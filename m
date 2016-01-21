From: Julien Boibessot <julien.boibessot@free.fr>
Date: Thu, 21 Jan 2016 12:40:39 +0100
Subject: [Buildroot] [PATCH] board: add support for Freescale i.MX6UL
 Evaluation Kit
In-Reply-To: <20160120211015.79807c32@free-electrons.com>
References: <1453300220-29113-1-git-send-email-julien.boibessot@free.fr>
 <20160120211015.79807c32@free-electrons.com>
Message-ID: <56A0C3B7.40900@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On 20/01/2016 21:10, Thomas Petazzoni wrote:
> Julien,
>
> Thanks for this contribution!

you're welcome ;-)

>
> On Wed, 20 Jan 2016 15:30:20 +0100, julien.boibessot at free.fr wrote:
>
>> diff --git a/board/freescale/imx6ulevk/create-boot-sd.sh b/board/freescale/imx6ulevk/create-boot-sd.sh
>> new file mode 100755
>> index 0000000..b3c47ae
>> --- /dev/null
>> +++ b/board/freescale/imx6ulevk/create-boot-sd.sh
> Could you instead use genimage rather than providing a script to create
> the SD card contents ?
>
> You can look at the following examples:
>
> board/cubietech/cubieboard2/genimage.cfg
> board/via/imx6_vab820/genimage.cfg
> board/intel/galileo/genimage.cfg
> board/raspberrypi/genimage-raspberrypi.cfg
> board/raspberrypi/genimage-raspberrypi2.cfg
> board/orangepi/orangepipc/genimage.cfg
> board/wandboard/genimage.cfg
>
> The wandboard one should be particularly useful, since it's also an i.MX6 board.

I first started to use genimage, yes, but as I wanted to mimic Freescale
microSD partitionning I was stucked by the fact that genimage
(apparently) doesn't handle VFAT partitions. Indeed i.MX6UL microSD
Freescale's format is:
* 1MB free
* U-Boot
* VFAT partition starting at offset 8M to store kernel and dtbs (size 16MB)
* EXT2 rootfs on the remaining space.

So I ended up in using i.XM28EVK way of doing
(board/freescale/imx28evk/create-boot-sd.sh).
Do you agree ?

>
>
>> diff --git a/configs/freescale_imx6ulevk_defconfig b/configs/freescale_imx6ulevk_defconfig
>> new file mode 100644
>> index 0000000..7ba5e7b
>> --- /dev/null
>> +++ b/configs/freescale_imx6ulevk_defconfig
>> @@ -0,0 +1,31 @@
>> +# architecture
>> +BR2_arm=y
>> +BR2_cortex_a7=y
>> +BR2_ARM_EABI=y
> Why ? Any reason to use EABI over EABIhf, which is now the default in
> Buildroot for Cortex-A processors ?

Well i.MX6UL has no VFPU, only a NEON, so I thought it was a good idea,
no ? :-)

Regards,
Julien


>
>> +BR2_ARM_FPU_NEON=y
>> +
>> +# toolchain
>> +BR2_KERNEL_HEADERS_VERSION=y
>> +BR2_DEFAULT_KERNEL_VERSION="3.14.28"
>> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
>> +
>> +# system
>> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
>> +
>> +# kernel
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="imx_3.14.38_6ul_ga"
>> +BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
>> +BR2_LINUX_KERNEL_ZIMAGE=y
>> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-14x14-evk"
>> +
>> +# bootloader
>> +BR2_TARGET_UBOOT=y
>> +BR2_TARGET_UBOOT_BOARDNAME="mx6ul_14x14_evk"
>> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
>> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
>> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="imx_v2015.04_3.14.38_6ul_ga"
>> +BR2_TARGET_UBOOT_FORMAT_IMX=y
> The rest looks good to me. Thanks a lot!
>
> Thomas
