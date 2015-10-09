From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Fri, 9 Oct 2015 14:54:54 +0100
Subject: [Buildroot] [PATCH v2] board: add support for Synopsys VDK
 Software Development Platform
In-Reply-To: <20151004161042.2e8e6782@free-electrons.com>
References: <33ba74fe14a0cf32e5dbddac4c135529e124cf10.1443620378.git.jpinto@synopsys.com>
 <20151004161042.2e8e6782@free-electrons.com>
Message-ID: <5617C72E.5090807@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas and Arnout,

Thank you for your feedback.
I am going to re-work the patches for VDK and Juno r1 and send the new ones soon.

Thanks,
Joao

On 10/4/2015 4:10 PM, Thomas Petazzoni wrote:
> Joao,
> 
> On Wed, 30 Sep 2015 14:45:48 +0100, Joao Pinto wrote:
>> The Virtualizer Development Kit (VDK) Family for ARM Cortex Products 
>> consists of a set of virtual prototypes that provide a virtualizer 
>> for the ARM core variants. The VDK is a standalone package that runs
>> on an host computer.
>>
>> Remark: The ext2 generator is essential since it is the expected 
>> filesystem format expected by the VDK platform.
>>
>> Signed-off-by: Joao Pinto <jpinto@synopsys.com>
> 
> This looks good, but there are still a few issues.
> 
>> diff --git a/board/synopsys/vdk/fs-overlay/etc/inittab b/board/synopsys/vdk/fs-overlay/etc/inittab
>> new file mode 100644
>> index 0000000..9cd272f
>> --- /dev/null
>> +++ b/board/synopsys/vdk/fs-overlay/etc/inittab
>> @@ -0,0 +1,36 @@
>> +# /etc/inittab
>> +#
>> +# Copyright (C) 2001 Erik Andersen <andersen@codepoet.org>
>> +#
>> +# Note: BusyBox init doesn't support runlevels.  The runlevels field is
>> +# completely ignored by BusyBox init. If you want runlevels, use
>> +# sysvinit.
>> +#
>> +# Format for each entry: <id>:<runlevels>:<action>:<process>
>> +#
>> +# id        == tty to run on, or empty for /dev/console
>> +# runlevels == ignored
>> +# action    == one of sysinit, respawn, askfirst, wait, and once
>> +# process   == program to run
>> +
>> +# Startup the system
>> +null::sysinit:/bin/mount -t proc proc /proc
>> +null::sysinit:/bin/mount -o remount,rw /
>> +null::sysinit:/bin/mkdir -p /dev/pts
>> +null::sysinit:/bin/mkdir -p /dev/shm
>> +null::sysinit:/bin/mount -a
>> +null::sysinit:/bin/hostname -F /etc/hostname
>> +# now run any rc scripts
>> +::sysinit:/etc/init.d/rcS
>> +
>> +# Put a getty on the serial port
>> +console::respawn:/sbin/getty -L  console 0 vt100 # GENERIC_SERIAL
>> +tty1::respawn:/sbin/getty 0 tty1
> 
> Like Arnout said, do we really need to have two gettys?
> 
>> diff --git a/board/synopsys/vdk/linux-vdk-defconfig b/board/synopsys/vdk/linux-vdk-defconfig
>> new file mode 100644
>> index 0000000..e3eb277
>> --- /dev/null
>> +++ b/board/synopsys/vdk/linux-vdk-defconfig
>> @@ -0,0 +1,817 @@
>> +CONFIG_ARM64=y
>> +CONFIG_64BIT=y
>> +CONFIG_ARCH_PHYS_ADDR_T_64BIT=y
> 
> [... snip ...]
> 
> This is clearly not a kernel defconfig. It looks like you have just
> removed the commented lines, which is not correct. Can you please
> generate it with "make linux-update-defconfig" ?
> 
> See
> http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf,
> slide 78 for details on how to do that.
> 
> 
>> diff --git a/configs/snps_vdk_defconfig b/configs/snps_vdk_defconfig
>> new file mode 100644
>> index 0000000..39eb86f
>> --- /dev/null
>> +++ b/configs/snps_vdk_defconfig
> 
> This file should be named snps_aarch64_vdk_defconfig
> 
> The VDK exists for other architectures than AArch64: we also have
> defconfigs for the VDK emulated the ARC HS38 CPU, so we need a way to
> distinguish that.
> 
>> @@ -0,0 +1,16 @@
>> +BR2_aarch64=y
>> +BR2_KERNEL_HEADERS_3_18=y
>> +BR2_TARGET_GENERIC_HOSTNAME="vdk-buildroot"
>> +BR2_TARGET_GENERIC_ISSUE="Welcome to SNPS VDK by Buildroot"
>> +BR2_ROOTFS_OVERLAY="board/synopsys/vdk/fs-overlay"
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_CUSTOM_GIT=y
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.linaro.org/kernel/linux-linaro-tracking.git"
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux-linaro-3.18-2014.12"
>> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/synopsys/vdk/linux-vdk-defconfig"
> 
> Same here, vdk-aarch64 or something like that.
> 
> 
>> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
>> +BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
>> +BR2_PACKAGE_BASH=y
> 
> No bash please.
> 
>> +BR2_TARGET_ROOTFS_EXT2=y
> 
> If you need ext2, then please disable the tarball.
> 
> I'll mark your patch as Changes Requested in our patch tracking system,
> so please resubmit a new version that fixes the above comments,
> otherwise we'll forget about your contribution.
> 
> Thanks!
> 
> Thomas
> 
