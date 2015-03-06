From: Nikolay Dimitrov <picmaster@mail.bg>
Date: Fri, 06 Mar 2015 06:06:36 +0200
Subject: [Buildroot] [PATCH v3 1/1] board: add support for RIoTboard
In-Reply-To: <20150305212333.40293868@free-electrons.com>
References: <1425574641-28524-1-git-send-email-picmaster@mail.bg>
 <20150305212333.40293868@free-electrons.com>
Message-ID: <54F927CC.3070503@mail.bg>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 03/05/2015 10:23 PM, Thomas Petazzoni wrote:
> Dear Nikolay Dimitrov,
>
> On Thu,  5 Mar 2015 18:57:21 +0200, Nikolay Dimitrov wrote:
>> This is a small development board, based on Freescale IMX6 Solo SoC
>> (single core ARM Cortex-A9). The board has excellent support in mainline
>> U-Boot and Linux.
>>
>> Signed-off-by: Nikolay Dimitrov <picmaster@mail.bg>
>
> This looks much simpler and nicer! Some remaining comments I forgot to
> make on earlier versions.
>
>> +1. Compiling buildroot
>> +----------------------
>
> An empty line between the title and the contents of the section would
> be nice.

Fixed.

>> +make distclean
>
> We generally don't indicate to use 'make distclean' in the other
> instructions related to board specific details.

Fixed.

>> +make riotboard_defconfig
>> +make
>> +
>> +2. Installing buildroot
>> +-----------------------
>
> Same: an empty new line here.

Fixed.

>> +Prepare an SD-card and plug it into your card reader. Write the bootloader to
>> +your SD-card:
>> +
>> +sudo dd if=output/images/u-boot.imx of=/dev/sdX bs=1k seek=1
>> +
>> +Create 1 partition on the SD-card using your favourite tool. The partition
>> +should be big enough to hold your rootfs, for example 128MiB. Here's how an
>> +example of such partition layout:
>> +
>> +   Device Boot      Start         End      Blocks   Id  System
>> +/dev/sdX1            2048      264191      131072   83  Linux
>> +
>> +Format the SD-card partition with your favourite filesystem:
>> +
>> +sudo mkfs.ext2 /dev/sdX1
>> +
>> +Deploy your rootfs to the SD-card:
>> +
>> +sudo mkdir /mnt/sdcard/
>> +sudo mount /dev/sdX1 /mnt/sdcard/
>> +sudo tar xf rootfs.tar -C /mnt/sdcard/
>> +sudo umount /dev/sdX1
>> +
>> +3. Running buildroot
>> +--------------------
>
> Same.

Fixed.

>> diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
>> new file mode 100644
>> index 0000000..d5b50e9
>> --- /dev/null
>> +++ b/configs/riotboard_defconfig
>> @@ -0,0 +1,32 @@
>> +# architecture
>> +BR2_arm=y
>> +BR2_cortex_a9=y
>
> I believe you should try to enable BR2_ARM_EABIHF=y. It should really
> be the default for ARMv7 platforms nowadays, unless you have old
> non-EABIhf pre-built binaries.

Fixed.

>> +# system
>> +BR2_TARGET_GENERIC_GETTY=y
>> +BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
>> +
>> +# toolchain
>> +BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
>
> No, please don't include largefile support by default. We try to keep
> the defconfigs minimal.

Fixed.

>> +# rootfs
>> +BR2_TARGET_ROOTFS_EXT2=y
>> +BR2_TARGET_ROOTFS_EXT2_2r1=y
>> +BR2_ROOTFS_OVERLAY="board/embest/riotboard/rootfs_overlay"
>> +
>> +# bootloader
>> +BR2_TARGET_UBOOT=y
>> +BR2_TARGET_UBOOT_VERSION="2015.01"
>> +BR2_TARGET_UBOOT_BOARDNAME="riotboard"
>> +BR2_TARGET_UBOOT_FORMAT_IMX=y
>> +
>> +# kernel headers
>> +BR2_KERNEL_HEADERS_3_18=y
>
> For the kernel headers, please use:
>
> BR2_KERNEL_HEADERS_VERSION=y
> BR2_DEFAULT_KERNEL_VERSION="3.18"
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
>
> That's because the BR2_KERNEL_HEADERS_3_18 option may become
> deprecated/removed in the future.

Fixed.

>> +# kernel
>> +BR2_LINUX_KERNEL=y
>
> Please specify:
>
> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.18"
>
> Even if the current default version is fine for you, this default
> version will change over time, and we want to be sure to rebuild the
> same kernel version.

Fixed.

v4 is on the way.

Regards.
Nikolay
