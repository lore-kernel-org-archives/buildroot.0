From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 14 Oct 2019 22:12:01 +0200
Subject: [Buildroot] GNU Binutils 2.33.1 has been released.
In-Reply-To: <DB6PR0802MB2309A159E89DB2A51B3D40F2FF900@DB6PR0802MB2309.eurprd08.prod.outlook.com>
References: <87eezim2ho.fsf@redhat.com>
 <be5b0885-b1cb-875c-2fdc-30ee3078358e@gmail.com>
 <3704de99-d063-5f94-2c23-9532bc6a0b9d@redhat.com>
 <DB6PR0802MB2309A159E89DB2A51B3D40F2FF900@DB6PR0802MB2309.eurprd08.prod.outlook.com>
Message-ID: <0ddc1f6d-521b-27ef-7900-d27df1460ded@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tamar, Nick,

Le 14/10/2019 ? 15:27, Tamar Christina a ?crit?:
> Hi Romain,
> 
> What's the easiest way for me to reproduce this?
> 
> I've tried
> 
>     git clone https://github.com/RomainNaour/buildroot.git buildroot
>     cd buildroot
>     git checkout binutils-2.33.1

This is the correct way to reproduce it :)

> 
>     curl https://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/build_fragments/armv7-eabihf--uclibc--bleeding-edge-2018.11-1.defconfig > .config

This defconfig was used to only build the 2018.11-1 bleeding-edge toolchain.


Can you use the following defconfig ?
I'm able to reproduce it on my host

BR2_arm=y
BR2_cortex_m4=y
BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
BR2_KERNEL_HEADERS_4_19=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_PTHREAD_DEBUG=y
BR2_BINUTILS_VERSION_2_33_X=y
BR2_GCC_VERSION_9_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
BR2_LINUX_KERNEL_DEFCONFIG="stm32"
BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0x00000000.config"
BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="xipImage"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
BR2_TARGET_ROOTFS_INITRAMFS=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_AFBOOT_STM32=y
BR2_PACKAGE_HOST_OPENOCD=y

This defconfig was created by merging the two defconfig from [1].
The first one is used to build the toolchain.
The second one is used to build a kernel + the rootfs using the toolchain
previously generated.

[1] https://gitlab.com/kubu93/toolchains-builder/-/jobs/319395300

Best regards,
Romain

>     make olddefconfig
>     make -j
> 
> but All I keep hitting are options mismatch in gmp.
> 
> Thanks,
> Tamar
> 
>> -----Original Message-----
>> From: Nick Clifton <nickc@redhat.com>
>> Sent: Monday, October 14, 2019 6:45 AM
>> To: Romain Naour <romain.naour@gmail.com>; Tamar Christina
>> <Tamar.Christina@arm.com>
>> Cc: binutils at sourceware.org; buildroot <buildroot@buildroot.org>
>> Subject: Re: GNU Binutils 2.33.1 has been released.
>>
>> Hi Romain,
>>
>>> I tested this new version using toolchain-builder project [1] and
>>> discovered some regressions on arm cortex-m4 and SH4 architectures.
>>
>>> There is a segfault in elf2flt while building busybox:
>>> "ld (ld-elf2flt):
>>> /builds/kubu93/toolchains-builder/build/opt/armv7m--uclibc--bleeding-e
>>> dge-2/arm-buildroot-uclinux-uclibcgnueabi/bin/elf2flt
>>
>> Hmm, that is worrying, but I suppose that it could be a bug in elf2flt rather
>> than the binutils.  Maybe...
>>
>> Is this problem specific to the ARM architecture ?  (Ie does elf2flt work when
>> compiled and run for other architecures ?)  If so, then I would suspect a
>> problem with the changes to the ARM specific code in the BFD library, and I
>> would probably ask one of the ARM regulars to take a look.  (Hi Tamar...)
>>
>> Are you able to find out where the segmentation fault is occurring ?
>> Is it inside the BFD library somewhere ?
>>
>>
>>> - sh4 [4]: (sh4, binutils 2.33.1, kernel headers 4.19.79, Glibc |
>>> uClibc-ng | musl, Qemu 3.1)
>>>
>>> The system doesn't boot under Qemu.
>>
>> *sigh* This one will probably be even harder to investigate.  Not being
>> familiar with Qemu, I do not what the best approach would be.  Can we get it
>> to tell us why the boot fails ?  Does it think that a binary is invalid somehow ?
>>
>> Cheers
>>   Nick
