From: Oleksandr G Zhadan <oleks@arcturusnetworks.com>
Date: Thu, 7 Jul 2016 17:01:07 -0400
Subject: [Buildroot] [PATCH 1/1] Arcturus uCP1020 BSP support.
In-Reply-To: <20160707220656.2680078e@free-electrons.com>
References: <1467900041-4422-1-git-send-email-oleks@arcturusnetworks.com>
 <20160707220656.2680078e@free-electrons.com>
Message-ID: <577EC313.3020203@arcturusnetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for detail comments and good words. :-)

Which board would you like me to use as an example for readme.txt.
We used the freescale/p1010rdb/readme.txt as our reference, but based on 
your comments looks like it's not the best.

Will fix some and send new version of the patch.

Oleks


On 07/07/2016 04:06 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Thu,  7 Jul 2016 10:00:41 -0400, Oleksandr G Zhadan wrote:
>> The uCP1020 product family (ucp1020) is an Arcturus Networks Inc.
>> System on Modules product featuring a NXP QorIQ P1020 CPU,
>> optionally populated with 1 or 2 Gig-Ethernet PHYs,
>> DDR3, NOR Flash, eMMC NAND Flash and/or SPI Flash.
>>
>> Signed-off-by: Oleksandr Zhadan <arcsupport@arcturusnetworks.com>
>> Signed-off-by: Michael Durrant <arcsupport@arcturusnetworks.com>
> Thanks for this patch! It is great to see HW vendors directly
> contributing to Buildroot! I have a number of comments below.
>
>> ---
>>   .../ppc-ucp1020/configs/linux-4.1.x.config         | 2911 ++++++++++++++++++
> Please use a defconfig rather than a full configuration. You can run
> "make linux-update-defconfig" to create such a defconfig.
>
>>   .../arcturus/ppc-ucp1020/configs/uClibc-ng.config  |  243 ++
> As Waldemar suggested, please keep the default uClibc-ng configuration,
> unless you have a very good reason not to (in which case the reason
> should be explained in the commit log).
>
>>   .../linux/0001-linux-4.1.27-Arcturus-BSP.patch     | 3171 ++++++++++++++++++++
> This patch is extremely large because it contains another kernel
> configuration file. So you have to choose: either the kernel
> configuration is part of the patch to the kernel, or the kernel
> configuration is not part of the patch to the kernel, and instead added
> to Buildroot.
>
> But in any case:
>
>   1/ The configuration should only be added once
>
>   2/ It should be a defconfig rather than a full configuration file.
>
>>   .../linux/0002-linux-4.1.27-sdhci_esdhc.patch      |   11 +
>>   board/arcturus/ppc-ucp1020/post-build.sh           |   11 +
>>   board/arcturus/ppc-ucp1020/post-image.sh           |   11 +
>>   board/arcturus/ppc-ucp1020/readme.txt              |   56 +
>>   .../ppc-ucp1020/rootfs/etc/dhcp/dhclient.conf      |   24 +
>>   .../ppc-ucp1020/rootfs/etc/dhcp/dhcpd.conf         |   15 +
>>   .../ppc-ucp1020/rootfs/etc/init.d/S01logging       |   36 +
>>   .../ppc-ucp1020/rootfs/etc/init.d/S20urandom       |   51 +
>>   .../ppc-ucp1020/rootfs/etc/init.d/S40network       |   25 +
>>   .../arcturus/ppc-ucp1020/rootfs/etc/init.d/S50sshd |   47 +
>>   .../ppc-ucp1020/rootfs/etc/init.d/S59snmpd         |   93 +
>>   .../ppc-ucp1020/rootfs/etc/init.d/S80dhcp-server   |   41 +
>>   board/arcturus/ppc-ucp1020/rootfs/etc/init.d/rcK   |   27 +
>>   board/arcturus/ppc-ucp1020/rootfs/etc/init.d/rcS   |   27 +
>>   .../ppc-ucp1020/rootfs/etc/network/interfaces      |   11 +
>>   .../ppc-ucp1020/rootfs/etc/ssh/sshd_config         |  134 +
> Please don't add your own rootfs overlay, unless you have a very good
> reason to do so.
>
>> diff --git a/board/arcturus/ppc-ucp1020/patches/linux/0001-linux-4.1.27-Arcturus-BSP.patch b/board/arcturus/ppc-ucp1020/patches/linux/0001-linux-4.1.27-Arcturus-BSP.patch
>> new file mode 100644
>> index 0000000..c09f4f1
>> --- /dev/null
>> +++ b/board/arcturus/ppc-ucp1020/patches/linux/0001-linux-4.1.27-Arcturus-BSP.patch
> All patches must have a description and a Signed-off-by line.
>
> Also, we generally don't want to have patches for "new features" in
> Buildroot. Has the support for this platform been submitted to the
> upstream Linux kernel? I.e is there a chance of getting rid of those
> patches in the future, thanks to the support being merged upstream?
>
>> diff --git a/board/arcturus/ppc-ucp1020/patches/linux/0002-linux-4.1.27-sdhci_esdhc.patch b/board/arcturus/ppc-ucp1020/patches/linux/0002-linux-4.1.27-sdhci_esdhc.patch
>> new file mode 100644
>> index 0000000..c9bf88f
>> --- /dev/null
>> +++ b/board/arcturus/ppc-ucp1020/patches/linux/0002-linux-4.1.27-sdhci_esdhc.patch
> Ditto: patch description + Signed-off-by.
>
>> diff --git a/board/arcturus/ppc-ucp1020/post-build.sh b/board/arcturus/ppc-ucp1020/post-build.sh
>> new file mode 100755
>> index 0000000..0d1ee68
>> --- /dev/null
>> +++ b/board/arcturus/ppc-ucp1020/post-build.sh
>> @@ -0,0 +1,11 @@
>> +#!/bin/sh
>> +# post-build.sh for uCP1020 module image
>> +# 2015-2016, "Oleksandr G Zhadan" <www.ArcturusNewtworks.com>
>> +
>> +echo "......................................................."
>> +echo ".................post-build.sh for uCP1020 module image"
>> +echo "......................................................."
>> +
>> +rm -f output/target/sbin/udhcpc
> Why do you do this? I don't think this is really useful.
>
>> +
>> +exit 0
>> diff --git a/board/arcturus/ppc-ucp1020/post-image.sh b/board/arcturus/ppc-ucp1020/post-image.sh
>> new file mode 100755
>> index 0000000..7b141c7
>> --- /dev/null
>> +++ b/board/arcturus/ppc-ucp1020/post-image.sh
>> @@ -0,0 +1,11 @@
>> +#!/bin/sh
>> +# post-image.sh for uCP1020 module image
>> +# 2015-2016, "Oleksandr G Zhadan" <www.ArcturusNewtworks.com>
>> +
>> +# Simple placeholder
>> +# Create partitions to progarm from u-boot using:
>> +# B$ run program0 - to program partition 0
>> +# B$ run program1 - to program partition 1
>> +#
>> +
>> +exit 0
> This post-image script doesn't do anything, so please remove it.
>
>> diff --git a/board/arcturus/ppc-ucp1020/readme.txt b/board/arcturus/ppc-ucp1020/readme.txt
>> new file mode 100644
>> index 0000000..955c863
>> --- /dev/null
>> +++ b/board/arcturus/ppc-ucp1020/readme.txt
>> @@ -0,0 +1,56 @@
> Please look at the other readme.txt for other boards. They normally
> start with an introduction that says to which hardware it applies, then
> they explain how to build Buildroot for this board, and finally, how to
> flash the images produced by Buildroot. This last part is well
> explained below, but the first two parts are missing.
>
>> +******************** WARNING *********************************
>> +The compiled U-Boot binary is intended for NOR flash only!
>> +It won't work for NAND or SPI and will brick those bootloaders!
> You cannot brick a bootloader, but a platform.
>
>> +***************************************************************
>> +
>> +You'll need to program the files created by buildroot into the flash.
> buildroot -> Buildroot
>
>> +The fast way is to tftp transfer the files via one of the network interfaces.
> fast -> fastest
>
> (or maybe easiest)
>
> tftp -> TFTP
>
>> +
>> +Alternatively you can transfer the files via serial console with an Ymodem
>> +file transfer from your terminal program by using a "loady" command
>> +from the u-boot prompt instead of the "tftp ..." commands stated below.
>> +
>> +1. Program the new U-Boot binary to NOR flash (optional)
>> +    If you don't feel confident upgrading your bootloader then don't do it,
>> +    it's unnecessary most of the time.
>> +
>> +    B$ tftp u-boot.bin
>> +    B$ protect off 0xeff80000 +$filesize
>> +    B$ erase 0xeff80000 +$filesize
>> +    B$ cp.b $loadaddr 0xeff80000 $filesize
>> +
>> +2. Program the kernel to NOR flash
>> +
>> +    B$ tftp uImage
>> +    B$ erase 0xec140000 +$filesize
>> +    B$ cp.b $loadaddr 0xec140000 $filesize
>> +
>> +
>> +3. Program the DTB to NOR flash
>> +
>> +    B$ tftp ucp1020.dtb
>> +    B$ erase 0xec100000 +$filesize
>> +    B$ cp.b $loadaddr 0xec100000 $filesize
>> +
>> +
>> +4. Program the jffs2 root filesystem to NOR flash
>> +
>> +    B$ tftp rootfs.jffs2
>> +    B$ erase 0xec800000 0xee8fffff
>> +    B$ cp.b $loadaddr 0xec800000 $filesize
>> +
>> +5. Booting your new system
>> +
>> +    B$ setenv norboot 'setenv bootargs root=/dev/mtdblock1 rootfstype=jffs2 console=$consoledev,$baudrate;bootm 0xec140000 - 0xec100000'
>> +
>> +    If you want to set this boot option as default:
>> +
>> +    B$ setenv bootcmd 'run norboot'
>> +    B$ saveenv
>> +
>> +    ...or for a single boot:
>> +
>> +    B$ run norboot
>> +
>> +    You can login with user "root" and passwd "admin".
>> diff --git a/board/arcturus/ppc-ucp1020/rootfs/etc/dhcp/dhclient.conf b/board/arcturus/ppc-ucp1020/rootfs/etc/dhcp/dhclient.conf
>> new file mode 100644
>> index 0000000..9df829f
>> --- /dev/null
>> +++ b/board/arcturus/ppc-ucp1020/rootfs/etc/dhcp/dhclient.conf
> Not sure why this is needed. If you need DHCP on eth0, just do:
>
> BR2_SYSTEM_DHCP="eth0"
>
> in your Buildroot configuration.
>
>> diff --git a/configs/arcturus_ucp1020_defconfig b/configs/arcturus_ucp1020_defconfig
>> new file mode 100644
>> index 0000000..da93793
>> --- /dev/null
>> +++ b/configs/arcturus_ucp1020_defconfig
>> @@ -0,0 +1,35 @@
>> +BR2_powerpc=y
>> +BR2_powerpc_8548=y
>> +BR2_KERNEL_HEADERS_4_1=y
> Please use the BR2_KERNEL_HEADERS_AS_KERNEL, where Buildroot will use
> for the kernel headers the sources of the Linux kernel. See what all
> other defconfigs are doing.
>
>> +BR2_UCLIBC_CONFIG="board/arcturus/ppc-ucp1020/configs/uClibc-ng.config"
> As discussed above, this is normally not needed.
>
>> +BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
>> +BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
>> +BR2_TOOLCHAIN_BUILDROOT_CXX=y
> Please do not enable additional toolchain features. Buildroot
> configurations are supposed to be "minimalist".
>
>> +BR2_TARGET_GENERIC_HOSTNAME="UCP1020"
>> +BR2_TARGET_GENERIC_ISSUE="Welcome to Arcturus uCP1020 System on Module"
>> +BR2_ROOTFS_DEVICE_CREATION_STATIC=y
> Why ?
>
>> +BR2_TARGET_GENERIC_ROOT_PASSWD="admin"
> Doesn't seem useful, just keep the default of an empty root password.
>
>> +BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
>> +BR2_ROOTFS_OVERLAY="board/arcturus/ppc-ucp1020/rootfs"
>> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/arcturus/ppc-ucp1020/post-build.sh"
>> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/arcturus/ppc-ucp1020/post-image.sh"
> These can be removed.
>
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.27"
>> +BR2_LINUX_KERNEL_PATCH="board/arcturus/ppc-ucp1020/patches/linux"
>> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/arcturus/ppc-ucp1020/configs/linux-4.1.x.config"
>> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="ucp1020"
>> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
>> +BR2_PACKAGE_APR_UTIL=y
>> +BR2_PACKAGE_PCRE=y
>> +BR2_PACKAGE_DHCP=y
>> +BR2_PACKAGE_DHCP_SERVER=y
>> +BR2_PACKAGE_DHCP_CLIENT=y
>> +BR2_PACKAGE_OPENSSH=y
>> +BR2_PACKAGE_TAR=y
> Please don't enable any additional program, leave the default of just
> having Busybox.
>
>> +BR2_TARGET_ROOTFS_JFFS2=y
>> +BR2_TARGET_UBOOT=y
> Please make the U-Boot version explicit.
>
>> +BR2_TARGET_UBOOT_BOARDNAME="UCP1020"
>> +BR2_PACKAGE_HOST_MKE2IMG=y
> Not sure why mke2img is needed in your configuration.
>
> Could you fix the above comments and send an updated version?
>
> Thanks a lot!
>
> Thomas


-- 
Oleksandr Zhadan
Arcturus Networks
T 416 621-0125 x235
F 416 621-0190
