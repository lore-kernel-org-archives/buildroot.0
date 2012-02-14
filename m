From: Spenser Gilliland <spenser309@gmail.com>
Date: Mon, 13 Feb 2012 23:02:26 -0600
Subject: [Buildroot] [PATCH] Added microblaze patch
In-Reply-To: <CA+appbPADbFMF4qp2fnDw7mhkEcVZ2mUUTFRLKrPycV4PqQB6w@mail.gmail.com>
References: <CA+appbNdaSajXPdKk4OTyj0WOmeu=9PKr-Sa=cwAZNr76ujLnA@mail.gmail.com>
 <1329095038-32117-1-git-send-email-Spenser309@gmail.com>
 <201202132237.18495.arnout@mind.be>
 <CA+appbP7552z3cjwoN-1bN0u78xf8bMkCdVFXofDC=YtXz81Xw@mail.gmail.com>
 <CA+appbPADbFMF4qp2fnDw7mhkEcVZ2mUUTFRLKrPycV4PqQB6w@mail.gmail.com>
Message-ID: <CA+appbMRckavhx=0tQ5zeLQeM=pi-N1Xv6AN6SD8LOC1_c+=uQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

I'm having an issue generating the dtb.  What is the command in the
kernel build needed to make a dts into a dtb. (should I just use dtc
directly?)

Spenser

On Mon, Feb 13, 2012 at 9:50 PM, Spenser Gilliland <spenser309@gmail.com> wrote:
> Arnout,
>
> I'm running into an issue downloading the toolchain. ?The toolchain is
> located in a tar ball inside a git repo. ?I tried the following in
> toolchain/toolchain-external/ext-tool.mk and it works from the command
> line but fails in a buildroot build.
>
> ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_20),y)?
> TOOLCHAIN_EXTERNAL_SITE="http://git.xilinx.com/?p=xldk/microblaze_v2.0.git;a=blob;f="?
> TOOLCHAIN_EXTERNAL_SOURCE=microblaze-unknown-linux-gnu.tgz
>
> It may be easier to just host these externally. ?Is there a host
> available for hosting tarballs?
>
> Spenser
>
> On Mon, Feb 13, 2012 at 6:07 PM, Spenser Gilliland <spenser309@gmail.com> wrote:
>> Arnout,
>>
>> I agree with the comments. ?I'll get on it and have something ASAP. ?I
>> want to have this in the coming release.
>>
>> Additionally, I have been working on a Microblaze specific patch which
>> adds the ability to copy parameters.h to the required directory in
>> uboot. ?This is required to build a working u-boot for a custom board.
>>
>> Spenser
>>
>>
>>
>> On Mon, Feb 13, 2012 at 3:37 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>> On Monday 13 February 2012 02:03:58 Spenser Gilliland wrote:
>>>> Arnout,
>>>>
>>>> This is the patch with some minor adjustments. ?I've tested it using a big endian toolchain. ?Stephen used a little endian toolchain.
>>>>
>>>> I got rid of the BR2_GCC_TARGET_TUNE as the build errored out when I attempt it with the raw patch. ?The error stated that target tune was not supported by the compiler.
>>>>
>>>> Spenser
>>>
>>> ?Thanks for this patch!
>>>
>>> ?A few remarks:
>>>
>>> * Please add a relevant commit message. ?It starts with a single line
>>> short description followed by an empty line. ?Then one or more paragraphs
>>> of explanation (probably not much needed in this case). ?And finally, one
>>> or more Signed-off-by lines.
>>>
>>> * Add a Signed-off-by line for yourself. ?This is a short way for you to
>>> assert that you are entitled to contribute the patch under buildroot's
>>> GPL license. ?See ?http://kerneltrap.org/files/Jeremy/DCO.txt for more
>>> details.
>>>
>>> * In addition, include the Signed-off-by line of the original poster:
>>> Signed-off-by: Stephan Hoffmann <sho@relinux.de>
>>>
>>> * There were also a few remarks from Peter Kosgaard, Alvaro Gamez and
>>> Thomas Petazonni. ?Could you include those?
>>>
>>> * See additional remarks below.
>>>
>>> ?If you don't have the time to do all this yourself, please let us know
>>> so someone else can take it over. ?Hopefully it won't fall between the
>>> cracks again :-)
>>>
>>> [snip]
>>>> diff --git a/configs/spartan6lx9_mb_defconfig b/configs/spartan6lx9_mb_defconfig
>>>> new file mode 100644
>>>> index 0000000..5ae1ede
>>>> --- /dev/null
>>>> +++ b/configs/spartan6lx9_mb_defconfig
>>>> @@ -0,0 +1,18 @@
>>>> +BR2_microblaze=y
>>>> +BR2_microblazel=y
>>>> +BR2_TOOLCHAIN_EXTERNAL=y
>>>> +BR2_TOOLCHAIN_EXTERNAL_PATH="/opt/microblazeel-unknown-linux-gnu/"
>>>> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="microblazeel-unknown-linux-gnu"
>>>
>>> ?I don't think we should have defconfigs that depend on pre-extracted toolchains.
>>> Instead, the Xilinx toolchain should be added to the supported external toolchains
>>> like Sourcery.
>>>
>>>> +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
>>>> +BR2_TOOLCHAIN_EXTERNAL_CXX=y
>>>
>>>> +BR2_TARGET_GENERIC_HOSTNAME="Microblaze Buildroot"
>>>> +BR2_TARGET_GENERIC_ISSUE="Welcome to Microblaze Buildroot"
>>> ?No need to change the defaults here.
>>>
>>>> +BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
>>>> +# BR2_TARGET_ROOTFS_TAR is not set
>>>> +BR2_TARGET_ROOTFS_INITRAMFS=y
>>>> +BR2_LINUX_KERNEL=y
>>>> +BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
>>>> +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(TOPDIR)/board/relinux/avnet_LX9MicroBoard/lx9_mmu_defconfig"
>>>> +BR2_LINUX_KERNEL_DTS_FILE="$(TOPDIR)/board/relinux/avnet_LX9MicroBoard/lx9_mmu.dts"
>>> ?The $(TOPDIR)/ is redundant: the build is always executed from $(TOPDIR).
>>>
>>>> +BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
>>>> +BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="simpleImage.lx9_mmu"
>>>> diff --git a/linux/Config.in b/linux/Config.in
>>>> index 86dc32a..138feb3 100644
>>>> --- a/linux/Config.in
>>>> +++ b/linux/Config.in
>>>> @@ -120,6 +120,14 @@ config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
>>>> ? ? ? help
>>>> ? ? ? ? Path to the kernel configuration file
>>>>
>>>> +config BR2_LINUX_KERNEL_DTS_FILE
>>>> + ? ?string "Device Tree dts file location"
>>>> + ? ?depends on BR2_microblaze
>>>> + ? ?help
>>>> + ? ? ?Path from where the dts file has to be copied
>>>> + ? ? ?The final "custom target" name depends on the
>>>> + ? ? ?dts file name:
>>>> + ? ? ? ? ?<name>.dts --> simpleImage.<name>
>>> ?Device tree support isn't specific to microblaze. ?It's incredible that
>>> we didn't have that in buildroot yet! ?Can you make a separate patch to
>>> add device tree support? ?The generic device tree support of course
>>> wouldn't have the combination of zImage and .dtb into a simpleImage,
>>> so you'd have to add an explicit '$(MAKE) ....dtb' to the linux
>>> build commands.
>>>
>>> ?Of course, there should also be support to select an in-kernel dts
>>> (just like the in-kernel defconfigs).
>>>
>>>> ?#
>>>> ?# Binary format
>>>> ?#
>>>> diff --git a/linux/linux.mk b/linux/linux.mk
>>>> index ae236d4..ade867a 100644
>>>> --- a/linux/linux.mk
>>>> +++ b/linux/linux.mk
>>>> @@ -117,6 +117,18 @@ endef
>>>>
>>>> ?LINUX_POST_PATCH_HOOKS += LINUX_APPLY_PATCHES
>>>>
>>>> +ifeq ($(KERNEL_ARCH),microblaze)
>>>> +# on microblaze, we always want mkimage
>>>> +LINUX_DEPENDENCIES+=host-uboot-tools
>>>
>>> ?I think you should define a new image type BR2_LINUX_KERNEL_SIMPLEIMAGE
>>> for microblaze, and only add this dependency if that image type is chosen.
>>>
>>>
>>>> +
>>>> +define LINUX_COPY_DTS
>>>> + ? ?if test -f "$(BR2_LINUX_KERNEL_DTS_FILE)" ; then \
>>>> + ? ? ? ?cp $(BR2_LINUX_KERNEL_DTS_FILE) $(@D)/arch/microblaze/boot/dts ; \
>>>> + ? ?else \
>>>> + ? ? ? ?echo "Cannot copy dts file!" ; \
>>>> + ? ?fi
>>>> +endef
>>>
>>> ?The path should be $(KERNEL_ARCH_PATH)/boot/dts.
>>>
>>> ?It requires an mkdir -p to make sure the target directory exists.
>>>
>>> ?The test -f is redundant, since cp will simply fail and terminate the build
>>> if the source file doesn't exist.
>>>
>>> ?You also need an extra make variable to remove the quotes:
>>> LINUX_KERNEL_DTS_FILE = $(call qstrip,$(BR2_LINUX_KERNEL_DTS_FILE))
>>>
>>> ?And the define should be wrapped in a
>>> ifneq ($(LINUX_KERNEL_DTS_FILE),)
>>> ...
>>> endif
>>>
>>>> +endif
>>>>
>>>> ?ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
>>>> ?KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
>>>> @@ -131,6 +143,8 @@ define LINUX_CONFIGURE_CMDS
>>>> ? ? ? $(if $(BR2_ARM_EABI),
>>>> ? ? ? ? ? ? ? $(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config),
>>>> ? ? ? ? ? ? ? $(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(@D)/.config))
>>>> + ? ?$(if $(BR2_microblaze),
>>>> + ? ? ? ?$(call LINUX_COPY_DTS))
>>> ?No call is needed here, the COPY_DTS is not a function. ?And the
>>> condition isn't necessary: the variable will default to empty.
>>>
>>>> ? ? ? # As the kernel gets compiled before root filesystems are
>>>> ? ? ? # built, we create a fake cpio file. It'll be
>>>> ? ? ? # replaced later by the real cpio archive, and the kernel will be
>>>> @@ -215,6 +229,8 @@ $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LI
>>>> ? ? ? $(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
>>>> ? ? ? # Copy the kernel image to its final destination
>>>> ? ? ? cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
>>>> + ? ? # If there is a .ub file copy it to the final destination
>>>> + ? ? test -f $(LINUX_IMAGE_PATH).ub && cp $(LINUX_IMAGE_PATH).ub $(BINARIES_DIR)
>>>> ? ? ? $(Q)touch $@
>>>>
>>>> ?# The initramfs building code must make sure this target gets called
>>>> diff --git a/target/Config.in.arch b/target/Config.in.arch
>>>> index 417441d..0524307 100644
>>>> --- a/target/Config.in.arch
>>>> +++ b/target/Config.in.arch
>>>> @@ -21,6 +21,8 @@ config BR2_i386
>>>> ?config BR2_m68k
>>>> ? ? ? bool "m68k"
>>>> ? ? ? depends on BROKEN # ice in uclibc / inet_ntoa_r
>>>> +config BR2_microblaze
>>>> + ? ?bool "microblaze"
>>>> ?config BR2_mips
>>>> ? ? ? bool "mips"
>>>> ?config BR2_mipsel
>>>> @@ -477,6 +479,19 @@ config BR2_powerpc_SPE
>>>> ? ? ? depends on BR2_powerpc_8540 || BR2_powerpc_8548 || BR2_powerpc_e500mc
>>>> ?endchoice
>>>>
>>>> +choice
>>>> + ? ? prompt "Target Endianess"
>>>> + ? ? depends on BR2_microblaze
>>>> + ? ? default BR2_microblazeel
>>>> + ? ? help
>>>> + ? ? ? Endianess of the Microblaze Processor
>>>> +
>>>> +config BR2_microblazeel
>>>> + ? ? bool "Little Endian"
>>>> +config BR2_microblazebe
>>>> + ? ? bool "Big Endian"
>>>> +endchoice
>>>
>>> ?For ARM and MIPS we define the endianness as the main architecture, not
>>> as a subarchitecture. ?I would do the same for microblaze.
>>>
>>> ?It does make sense to add a summarizing hidden BR2_microblaze, like this:
>>>
>>> config BR2_microblaze
>>> ? ? ? ?bool
>>> ? ? ? ?default y if BR2_microblazeel || BR2_microblazebe
>>>
>>>> +
>>>> ?config BR2_ARCH
>>>> ? ? ? string
>>>> ? ? ? default "arm" ? ? ? ? ? if BR2_arm
>>>> @@ -508,6 +523,7 @@ config BR2_ARCH
>>>> ? ? ? default "i686" ? ? ? ? ?if BR2_x86_athlon
>>>> ? ? ? default "i686" ? ? ? ? ?if BR2_x86_athlon_4
>>>> ? ? ? default "m68k" ? ? ? ? ?if BR2_m68k
>>>> + ? ? default "microblaze" ? ?if BR2_microblaze
>>>> ? ? ? default "mips" ? ? ? ? ?if BR2_mips
>>>> ? ? ? default "mipsel" ? ? ? ?if BR2_mipsel
>>>> ? ? ? default "powerpc" ? ? ? if BR2_powerpc
>>>> @@ -533,11 +549,13 @@ config BR2_ARCH
>>>>
>>>> ?config BR2_ENDIAN
>>>> ? ? ? string
>>>> - ? ? default "LITTLE" if BR2_arm || BR2_bfin || BR2_i386 || BR2_mipsel || \
>>>> - ? ? ? ? ? ? ? ? ? ? ? ? BR2_sh3 || BR2_sh4 || BR2_sh4a || BR2_x86_64 || BR2_sh64
>>>> + ? default "LITTLE" if BR2_arm || BR2_bfin || BR2_i386 || BR2_mipsel || \
>>>> + ? ? ? ? ? ? ? ? ? ? ? ? BR2_sh3 || BR2_sh4 || BR2_sh4a || BR2_x86_64 || BR2_sh64 || \
>>>> + ? ? ? ? ? ? ? ? ? ? ? ? BR2_microblazeel
>>>> ? ? ? default "BIG" ? ?if BR2_armeb || BR2_avr32 || BR2_m68k || BR2_mips || \
>>>> - ? ? ? ? ? ? ? ? ? ? ? ? BR2_powerpc || BR2_sh2 || BR2_sh2a || \
>>>> - ? ? ? ? ? ? ? ? ? ? ? ? BR2_sh3eb || BR2_sh4eb || BR2_sh4aeb || BR2_sparc
>>>> + ? ? ? ? ? ? ? ? ? ? ? ? BR2_powerpc || BR2_sh2 || BR2_sh2a || BR2_sh3eb || \
>>>> + ? ? ? ? ? ? ? ? ? ? ? ? BR2_sh4eb || BR2_sh4aeb || BR2_sparc || \
>>>> + ? ? ? ? ? ? ? ? ? ? ? ? ? ? BR2_microblazebe
>>>>
>>>> ?config BR2_GCC_TARGET_TUNE
>>>> ? ? ? string
>>>>
>>>
>>>
>>> ?Regards,
>>> ?Arnout
>>>
>>> --
>>> Arnout Vandecappelle ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? arnout at mind be
>>> Senior Embedded Software Architect ? ? ? ? ? ? ? ? +32-16-286540
>>> Essensium/Mind ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? http://www.mind.be
>>> G.Geenslaan 9, 3001 Leuven, Belgium ? ? ? ? ? ? ? ?BE 872 984 063 RPR Leuven
>>> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>>> GPG fingerprint: ?7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>>
>>
>>
>> --
>> Spenser Gilliland
>> Computer Engineer
>> Illinois Institute of Technology
>
>
>
> --
> Spenser Gilliland
> Computer Engineer
> Illinois Institute of Technology



-- 
Spenser Gilliland
Computer Engineer
Illinois Institute of Technology
