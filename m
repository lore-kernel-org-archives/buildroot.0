From: Damien Le Moal <Damien.LeMoal@wdc.com>
Date: Tue, 8 Sep 2020 08:02:15 +0000
Subject: [Buildroot] [PATCH 5/5] Add support for Kendryte K210 based
 RISC-V boards
References: <20200908051624.425573-1-damien.lemoal@wdc.com>
 <20200908051624.425573-6-damien.lemoal@wdc.com>
 <20200908091728.6351079d@windsurf.hq.k.grp>
Message-ID: <CY4PR04MB3751463068ACC779C758B3CDE7290@CY4PR04MB3751.namprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020/09/08 16:17, Thomas Petazzoni wrote:
> Hello Damien,
> 
> Thanks for this contribution, glad to see more RISC-V support in
> Buildroot! Some questions/comments below.
> 
> On Tue,  8 Sep 2020 14:16:24 +0900
> Damien Le Moal <damien.lemoal@wdc.com> wrote:
> 
>>  board/kendryte/k210/busybox.config            | 1181 +++++++++++++++++
> 
> Do we really need a complete Busybox configuration? We already have a
> somewhat minimal Busybox configuration at
> package/busybox/busybox-minimal.config, which precisely is used on
> noMMU platforms:
> 
> configs/qemu_arm_versatile_nommu_defconfig:BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
> configs/qemu_m68k_mcf5208_defconfig:BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
> configs/stm32f429_disco_defconfig:BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
> configs/stm32f469_disco_defconfig:BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
> 
> Could you try to use this one ?

Yes, the minimal config work. but it gives me a rootfs cpio image  of 650KB
while the one I added is even smaller and results in a rootf of 350KB. 300KB
saved on a board with only 8MB of SRAM, that is not negligible...

> 
>> diff --git a/board/kendryte/k210/device_table_dev.txt b/board/kendryte/k210/device_table_dev.txt
>> new file mode 100644
>> index 0000000000..7af3106d3e
>> --- /dev/null
>> +++ b/board/kendryte/k210/device_table_dev.txt
>> @@ -0,0 +1,17 @@
>> +# See package/makedevs/README for details
>> +#
>> +# This device table is used only to create device files when a static
>> +# device configuration is used (entries in /dev are static).
>> +#
>> +# <name>	<type>	<mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
>> +
>> +# Minimal device set before mounting devtpmfs
>> +/dev/null	c	666	0	0	1	3	0	0	-
>> +/dev/zero	c	666	0	0	1	5	0	0	-
>> +/dev/random	c	666	0	0	1	8	0	0	-
>> +/dev/urandom	c	666	0	0	1	9	0	0	-
>> +/dev/console	c	666	0	0	5	1	-	-	-
>> +/dev/tty	c	666	0	0	5	0	-	-	-
>> +/dev/tty0	c	666	0	0	4	0	0	0	-
>> +/dev/ttySIF0	c	666	0	0	4	64	0	0	-
>> +/dev/ptmx	c	666	0	0	5	2	-	-	-
> 
> I see in your /init script that you are mount devtmpfs, so a custom
> device table for static /dev should not be needed. Could you explain
> why this device table is necessary ?

The init process is just a shell. So if I do not create at least the console
files, I see errors "could not open console" when the init process is started by
the kernel as devtmpfs is not yet mounted. Will check again.

>> diff --git a/board/kendryte/k210/fakeroot.sh b/board/kendryte/k210/fakeroot.sh
>> new file mode 100755
>> index 0000000000..6a5e96ae0c
>> --- /dev/null
>> +++ b/board/kendryte/k210/fakeroot.sh
>> @@ -0,0 +1,8 @@
>> +#!/bin/sh
>> +
>> +echo "Simplifying target rootfs ($TARGET_DIR)"
>> +
>> +rm -rf "$TARGET_DIR"/var/www > /dev/null 2>&1
>> +rm -rf "$TARGET_DIR"/media > /dev/null 2>&1
> 
> What is in /var/www and /media that takes so much space? In a default
> Buildroot configuration, those folders should be empty.

They are. Frankly, I could drop this. But as that is totally not needed,
removing them can save a block or so on the cpio image. Memory saving again, but
likely not much here.

> 
>> diff --git a/board/kendryte/k210/patches/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch b/board/kendryte/k210/patches/uclibc/0001-Revert-Fix-static-linking-with-GCC-10.patch
> 
> None of the uClibc patches here are board-specific, so  they should be
> added to package/uclibc/. In fact, I think the gcc10 patches would fix
> some build issues we have in our autobuilders:
> 
>   http://autobuild.buildroot.net/?reason=uclibc-1.0.35

I could not get gcc10 builds to work. The static build is broken and uclibc seem
to imply as much. As I was afraid of the potential impact of these patches on
other builds, I put them as board specific for now. I intend to send them to
uclibc too. Thoughts ? Should I keep this as is for now ?

> 
>> diff --git a/board/kendryte/k210/rootfs_overlay/init b/board/kendryte/k210/rootfs_overlay/init
>> new file mode 100755
>> index 0000000000..945ac13789
>> --- /dev/null
>> +++ b/board/kendryte/k210/rootfs_overlay/init
>> @@ -0,0 +1,11 @@
>> +#!/bin/sh
>> +
>> +mount -t devtmpfs devtmpfs /dev
>> +mount -t proc proc /proc
>> +
>> +echo ""
>> +echo "-----------------------------"
>> +echo "| Kendryte K210 NOMMU Linux |"
>> +echo "-----------------------------"
>> +
>> +exec /bin/sh
> 
> So with the normal Busybox init you don't have enough memory? Is this
> platform using XIP, or is the code loaded into SRAM ? Indeed, 8 MB of
> SRAM is quite a lot if you are running code from flash. But if indeed
> the entire kernel is loaded into SRAM because you don't have XIP
> support, the story is a bit different.

No XIP. Kernel + embedded initramfs and dtb all end up in memory. SD card is not
working yet, so this is really the only solution for now. Once I get the SD card
to work, the initramfs can go onto the SD card, which will improve things.

But for now, it is very easy to trigger the oom killer in init phase if care is
not taken. And I did see it with the default busybox /init shell + /sbin/init
process. Hence this small init shell script which only mounts devtmpfs and proc
and exec a shell.

> 
>> diff --git a/board/kendryte/k210/uClibc-ng.config b/board/kendryte/k210/uClibc-ng.config
>> new file mode 100644
>> index 0000000000..409139fa7e
>> --- /dev/null
>> +++ b/board/kendryte/k210/uClibc-ng.config
> 
> Do you really need your own custom uclibc configuration file? What is
> the difference compared to the default one?

Need to try again. I can probably drop this.

>> diff --git a/configs/kendryte_k210_defconfig b/configs/kendryte_k210_defconfig
>> new file mode 100644
>> index 0000000000..ff3812b4d4
>> --- /dev/null
>> +++ b/configs/kendryte_k210_defconfig
>> @@ -0,0 +1,36 @@
>> +BR2_riscv=y
>> +BR2_CCACHE=y
> 
> We normally don't enable ccache in our defconfigs.

OK. Will remove it.

>> +BR2_GLOBAL_PATCH_DIR="board/kendryte/k210/patches"
>> +# BR2_COMPILER_PARANOID_UNSAFE_PATH is not set
>> +BR2_KERNEL_HEADERS_VERSION=y
>> +BR2_DEFAULT_KERNEL_VERSION="5.8"
> 
> Since this defconfig also builds the kernel, you should select the
> option "kernel headers same as kernel".
> 
>> +BR2_UCLIBC_CONFIG="board/kendryte/k210/uClibc-ng.config"
>> +# BR2_UCLIBC_INSTALL_UTILS is not set
>> +BR2_GCC_ENABLE_LTO=y
>> +BR2_PACKAGE_HOST_ELF2FLT=y
>> +# BR2_USE_MMU is not set
>> +BR2_INIT_NONE=y
>> +BR2_ROOTFS_DEVICE_CREATION_STATIC=y
>> +BR2_ROOTFS_STATIC_DEVICE_TABLE="board/kendryte/k210/device_table_dev.txt"
>> +BR2_ROOTFS_MERGED_USR=y
>> +# BR2_TARGET_ENABLE_ROOT_LOGIN is not set
>> +# BR2_TARGET_GENERIC_GETTY is not set
>> +# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
>> +BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin"
> 
> Any reason to tweak this option ?

I do not think I changed anything here... Weird. I will check again.

> 
>> +BR2_ENABLE_LOCALE_WHITELIST="C"
> 
> Or this one ?

Same. A bug. Will fix that.

> 
>> +BR2_ROOTFS_OVERLAY="board/kendryte/k210/rootfs_overlay"
>> +BR2_ROOTFS_POST_FAKEROOT_SCRIPT="board/kendryte/k210/fakeroot.sh"
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8"
>> +BR2_LINUX_KERNEL_DEFCONFIG="nommu_k210"
>> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>> +BR2_LINUX_KERNEL_IMAGE_NAME="loader.bin"
>> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>> +BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT=y
>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="kendryte/k210"
>> +BR2_PACKAGE_BUSYBOX_CONFIG="board/kendryte/k210/busybox.config"
>> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
>> +# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
>> +BR2_TARGET_ROOTFS_INITRAMFS=y
>> +# BR2_TARGET_ROOTFS_TAR is not set
> 
> Thanks a lot!

Thank you for your comments. Will revirew this and send a V2.


-- 
Damien Le Moal
Western Digital Research
