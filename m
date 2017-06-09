From: Oleksandr G Zhadan <oleks@arcturusnetworks.com>
Date: Fri, 9 Jun 2017 11:37:11 -0400
Subject: [Buildroot] [PATCH v3 1/1] configs/arcturus_ucls1012a: new
 defconfig
In-Reply-To: <20170608231002.160f7742@free-electrons.com>
References: <20170608204400.21287-1-oleks@arcturusnetworks.com>
 <20170608231002.160f7742@free-electrons.com>
Message-ID: <ff9861e8-8774-1dbf-4626-a4b581a07a5b@arcturusnetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/08/2017 05:10 PM, Thomas Petazzoni wrote:
> Hello,
>
> Thanks for this new version!
>
> On Thu,  8 Jun 2017 16:44:00 -0400, Oleksandr Zhadan wrote:
>
>> Changes v2 -> v3:
>>      - commit title is changed (from "Arcturus uCLS1012A-SOM support")
>>      - new updates in readme.txt
>>      - ls1012a network firmware moved into kernel
> What does this means?
>
>> diff --git a/board/arcturus/aarch64-ucls1012a/post-build.sh b/board/arcturus/aarch64-ucls1012a/post-build.sh
>> new file mode 100755
>> index 000000000..e1bfd046c
>> --- /dev/null
>> +++ b/board/arcturus/aarch64-ucls1012a/post-build.sh
>> @@ -0,0 +1,5 @@
>> +#!/bin/sh
>> +
>> +# Network Driver Firmware
>> +mkdir -p ${TARGET_DIR}/lib/firmware
>> +cp -f ${BUILD_DIR}/linux-custom/firmware/ppfe/* ${TARGET_DIR}/lib/firmware/
> OK, you moved the firmware inside the kernel sources. Not really nice,
> because it means those files in the target filesystem are not
> associated with any license.
The firmware is associated with Freescale-Binary-EULA licence and that 
license is included.
I agree it's not really nice to move it inside kernel, but you asked to 
remove it from rootfs-overlay and I could not found any better place for 
now. Any suggestions welcome.
> Why aren't those firmware files contributed to the linux-firmware
> project instead?
This firmware is came from  Linux? SDK for QorIQ? Processors. SDKLINUX 
publicly available on NXP website.
I really don't know when they going to publish it to any other places, 
but my personal preferences to use buildroot instead Yocto as build 
system on all our modules.
BTW the NXP's SDK is using Linaro toolchain, even older version.
>
>> diff --git a/board/arcturus/aarch64-ucls1012a/post-image.sh b/board/arcturus/aarch64-ucls1012a/post-image.sh
>> new file mode 100755
>> index 000000000..d506724a3
>> --- /dev/null
>> +++ b/board/arcturus/aarch64-ucls1012a/post-image.sh
>> @@ -0,0 +1,9 @@
>> +#!/bin/sh
>> +
>> +echo ---------Making ITB partition image---------
> We normally don't have such debug messages in post-image scripts.
OK - removed.
>
>> +cp -f board/arcturus/aarch64-ucls1012a/ucls1012a.its ${BINARIES_DIR}/
>> +MKIMAGE=${HOST_DIR}/usr/bin/mkimage
>> +MKIMAGE_IN=${BINARIES_DIR}/ucls1012a.its
>> +MKIMAGE_OUT=${BINARIES_DIR}/part0-000000.itb
>> +${MKIMAGE} -f $MKIMAGE_IN $MKIMAGE_OUT
> Why not use ${...} everywhere ?
OK - Changed.
>
>> diff --git a/configs/arcturus_ucls1012a_defconfig b/configs/arcturus_ucls1012a_defconfig
>> new file mode 100644
>> index 000000000..64557fde7
>> --- /dev/null
>> +++ b/configs/arcturus_ucls1012a_defconfig
>> @@ -0,0 +1,23 @@
>> +BR2_aarch64=y
>> +BR2_TOOLCHAIN_EXTERNAL=y
> Still need to change this to the internal toolchain, as per our
> previous discussion.
Still requesting to keep external toolchain in this patch as 
"tested"&"trusted" on our module, plus suggested by NXP.
Or please explain the reason why you try to avoid some options, like 
BR2_TOOLCHAIN_EXTERNAL, if it allowed choice, and even after my 
explanations that we did have an issue with internal one. I believe you 
should know the difference between QEMU and real CPU.
>
>> +BR2_TARGET_GENERIC_HOSTNAME="ucls1012a"
>> +BR2_TARGET_GENERIC_ISSUE="Welcome to uCLS1012A-SOM"
>> +BR2_SYSTEM_DHCP="eth0"
>> +BR2_ROOTFS_OVERLAY="board/arcturus/aarch64-ucls1012a/rootfs_overlay"
>> +BR2_ROOTFS_POST_BUILD_SCRIPT="board/arcturus/aarch64-ucls1012a/post-build.sh"
>> +BR2_ROOTFS_POST_IMAGE_SCRIPT="board/arcturus/aarch64-ucls1012a/post-image.sh"
>> +BR2_LINUX_KERNEL=y
>> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://www.arcturusnetworks.com/OSS/kernel-ucls1012a.tar.gz"
> I didn't see this before: there is no version in the name of this
> tarball, and its name hasn't changed since you added the firmware files.
> Which means that you apparently intend to change this tarball later on.
> This is *really* bad, as it means the build is not reproducible: what
> people will build one day may be different the next day or week,
> because you changed this tarball.
>
> Could you add tarballs with a version in their name, and not change
> existing tarballs, but instead upload new ones with a different version?
>
> Or better, use a Git repository, like everyone else :)
Thanks, good point - will add version in the name.
>
>> +BR2_LINUX_KERNEL_DEFCONFIG="ucls1012a"
>> +BR2_LINUX_KERNEL_DTS_SUPPORT=y
>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME="arcturus/arc-ucls1012a"
>> +BR2_TARGET_ROOTFS_CPIO=y
>> +BR2_TARGET_ROOTFS_CPIO_GZIP=y
>> +BR2_TARGET_UBOOT=y
>> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>> +BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
>> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://www.arcturusnetworks.com/OSS/u-boot-ucls1012a.tar.gz"
> Same comment here.
Got it.
>
> Thanks,
>
> Thomas


-- 
Oleksandr Zhadan
Sr. Software Engineer
Arcturus Networks
T 416 621-0125 x235
F 416 621-0190
