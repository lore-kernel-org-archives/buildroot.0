From: Erico Nunes <nunes.erico@gmail.com>
Date: Thu, 15 Sep 2016 23:43:15 +0200
Subject: [Buildroot] [PATCH 4/5] grub2: enable support for arm and
	aarch64 targets
In-Reply-To: <b3a9aff2-aadf-7ef0-6587-b329fed22510@mind.be>
References: <20160913041548.10290-1-nunes.erico@gmail.com>
 <20160913041548.10290-5-nunes.erico@gmail.com>
 <b3a9aff2-aadf-7ef0-6587-b329fed22510@mind.be>
Message-ID: <CAK4VdL3iag979N4ud6Wgq73h=Anpp0UVOQeXO17B_LPHNDpoww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

thanks for the review!

On Wed, Sep 14, 2016 at 2:39 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 13-09-16 06:15, Erico Nunes wrote:
>> This commit enables the arm-uboot, arm-efi and aarch64-efi Grub 2
>> platforms in Buildroot.
>>
>> As a uboot platform, Grub 2 image gets built as a u-boot image (i.e.
>> u-boot mkimage) and is loaded from u-boot through a regular "bootm". The
>> only requirement from u-boot side in order to allow this is that u-boot
>> is built with CONFIG_API enabled. CONFIG_API seems to not be enabled by
>> default in most in-tree configurations, however, it seems to be
>> available for quite some time now. So it might be possible to use this
>> even on older u-boot versions. This is available only for arm (32-bit).
>>
>> As an efi platform, Grub 2 gets built as an EFI executable. This allows
>> EFI firmware to find and load it similarly as it can be done for x86_64.
>> Also, since u-boot v2016.05, u-boot is able to load and boot an EFI
>> executable, so the Grub 2 efi platform can also be used from u-boot in
>> recent versions. This has been enabled (mostly) by default for ARM
>> u-boot.
>> efi platform is available for both arm and aarch64.
>>
>> These targets have been tested in the following environments:
>>
>> arm-uboot: qemu arm vexpress and BeagleBone
>> arm-efi: BeagleBone
>> aarch64-efi: qemu aarch64 virt and Odroid-C2
>>
>> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
>> ---
>>  boot/grub2/Config.in | 48 +++++++++++++++++++++++++++++++++++++++---------
>>  boot/grub2/grub2.mk  | 23 ++++++++++++++++++++++-
>>  2 files changed, 61 insertions(+), 10 deletions(-)
>>
>> diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
>> index 7dc5cae..527ff37 100644
>> --- a/boot/grub2/Config.in
>> +++ b/boot/grub2/Config.in
>> @@ -1,6 +1,6 @@
>>  config BR2_TARGET_GRUB2
>>       bool "grub2"
>> -     depends on BR2_i386 || BR2_x86_64
>> +     depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_aarch64
>>       help
>>         GNU GRUB is a Multiboot boot loader. It was derived from
>>         GRUB, the GRand Unified Bootloader, which was originally
>> @@ -66,8 +66,8 @@ config BR2_TARGET_GRUB2
>>
>>         qemu-system-{i386,x86-64} -hda disk.img
>>
>> -       Notes on using Grub2 for EFI-based platforms
>> -       ============================================
>> +       Notes on using Grub2 for i386/x86-64 EFI-based platforms
>> +       ========================================================
>>
>>         1. Create a disk image
>>            dd if=/dev/zero of=disk.img bs=1M count=32
>> @@ -96,8 +96,8 @@ config BR2_TARGET_GRUB2
>>            sudo losetup -d /dev/loop0
>>         7. Your disk.img is ready!
>>
>> -       To test your EFI image in Qemu
>> -       ------------------------------
>> +       To test your i386/x86-64 EFI image in Qemu
>> +       ------------------------------------------
>>
>>         1. Download the EFI BIOS for Qemu
>>            Version IA32 or X64 depending on the chosen Grub2
>
>  You hinted at this in your cover letter: it would be better to move all this
> documentation to e.g. boot/grub2/readme.txt and refer to it from the help text.
> This would be a separate preparatory patch. Then you can also easily add all the
> documentation for the ARM targets to that file.

Sounds good, if there are no objections I can do that for v2.

>> @@ -119,12 +119,14 @@ choice
>>
>>  config BR2_TARGET_GRUB2_I386_PC
>>       bool "i386-pc"
>> +     depends on BR2_i386 || BR2_x86_64
>>       help
>>         Select this option if the platform you're targetting is a
>>         x86 or x86-64 legacy BIOS based platform.
>>
>>  config BR2_TARGET_GRUB2_I386_EFI
>>       bool "i386-efi"
>> +     depends on BR2_i386 || BR2_x86_64
>>       help
>>         Select this option if the platform you're targetting has a
>>         32 bits EFI BIOS. Note that some x86-64 platforms use a 32
>> @@ -132,14 +134,38 @@ config BR2_TARGET_GRUB2_I386_EFI
>>
>>  config BR2_TARGET_GRUB2_X86_64_EFI
>>       bool "x86-64-efi"
>> -     depends on BR2_ARCH_IS_64
>> +     depends on BR2_x86_64
>>       help
>>         Select this option if the platform you're targetting has a
>>         64 bits EFI BIOS.
>>
>> +config BR2_TARGET_GRUB2_ARM_UBOOT
>> +     bool "arm-uboot"
>> +     depends on BR2_arm
>
>  I think this choice deserves a bit of refactoring. I think it could be:
>
> choice
>
> config BR2_TARGET_GRUB2_I386_PC
>         depends on BR2_i386 || BR2_x86_64
> config BR2_TARGET_GRUB2_EFI
>         # possible on all platforms
> config BR2_TARGET_GRUB2_UBOOT
>         depends on BR2_arm
> endchoice
>
>  I think that that would also simplify the .mk file somewhat, because most of
> the EFI options are the same for all arches.
>
>  The only problem with this change is that we don't have easy legacy handling
> for it, because you can't select a choice option.

I agree that this can use some refactor, however I was a little
conservative on this in order to not add much more complexity and
delay to this series. Maybe this could also come in a patch later on
after this series?

>> +     help
>> +       Select this option if the platform you're targetting is an
>> +       ARM u-boot platform, and you want to boot Grub 2 as an u-boot
>> +       compatible image.
>> +
>> +config BR2_TARGET_GRUB2_ARM_EFI
>> +     bool "arm-efi"
>> +     depends on BR2_arm
>> +     help
>> +       Select this option if the platform you're targetting is an
>> +       ARM platform and you want to boot Grub 2 as an EFI
>> +       application.
>> +
>> +config BR2_TARGET_GRUB2_ARM64_EFI
>> +     bool "arm64-efi"
>> +     depends on BR2_aarch64
>> +     help
>> +       Select this option if the platform you're targetting is an
>> +       Aarch64 platform and you want to boot Grub 2 as an EFI
>> +       application.
>> +
>>  endchoice
>>
>> -if BR2_TARGET_GRUB2_I386_PC
>> +if BR2_TARGET_GRUB2_I386_PC || BR2_TARGET_GRUB2_ARM_UBOOT
>>
>>  config BR2_TARGET_GRUB2_BOOT_PARTITION
>>       string "boot partition"
>> @@ -150,13 +176,17 @@ config BR2_TARGET_GRUB2_BOOT_PARTITION
>>         first disk if using a legacy partition table, or 'hd0,gpt1'
>>         if using GPT partition table.
>>
>> -endif # BR2_TARGET_GRUB2_I386_PC
>> +endif # BR2_TARGET_GRUB2_I386_PC || BR2_TARGET_GRUB2_ARM_UBOOT
>>
>>  config BR2_TARGET_GRUB2_BUILTIN_MODULES
>>       string "builtin modules"
>>       default "boot linux ext2 fat squash4 part_msdos part_gpt normal biosdisk" if BR2_TARGET_GRUB2_I386_PC
>>       default "boot linux ext2 fat squash4 part_msdos part_gpt normal efi_gop" \
>> -             if BR2_TARGET_GRUB2_I386_EFI || BR2_TARGET_GRUB2_X86_64_EFI
>> +             if BR2_TARGET_GRUB2_I386_EFI || \
>> +             BR2_TARGET_GRUB2_X86_64_EFI || \
>> +             BR2_TARGET_GRUB2_ARM_EFI || \\
>> +             BR2_TARGET_GRUB2_ARM64_EFI
>> +     default "linux ext2 fat part_msdos normal" if BR2_TARGET_GRUB2_ARM_UBOOT
>>
>>  config BR2_TARGET_GRUB2_BUILTIN_CONFIG
>>       string "builtin config"
>> diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
>> index 8a063f1..910967e 100644
>> --- a/boot/grub2/grub2.mk
>> +++ b/boot/grub2/grub2.mk
>> @@ -38,6 +38,27 @@ GRUB2_PREFIX = /EFI/BOOT
>>  GRUB2_TUPLE = x86_64-efi
>>  GRUB2_TARGET = x86_64
>>  GRUB2_PLATFORM = efi
>> +else ifeq ($(BR2_TARGET_GRUB2_ARM_UBOOT),y)
>> +GRUB2_IMAGE = $(BINARIES_DIR)/boot-part/grub.img
>> +GRUB2_CFG = $(BINARIES_DIR)/boot-part/grub.cfg
>> +GRUB2_PREFIX = ($(GRUB2_BOOT_PARTITION))
>> +GRUB2_TUPLE = arm-uboot
>> +GRUB2_TARGET = arm
>> +GRUB2_PLATFORM = uboot
>> +else ifeq ($(BR2_TARGET_GRUB2_ARM_EFI),y)
>> +GRUB2_IMAGE = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootarm.efi
>> +GRUB2_CFG = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
>> +GRUB2_PREFIX = /EFI/BOOT
>> +GRUB2_TUPLE = arm-efi
>> +GRUB2_TARGET = arm
>> +GRUB2_PLATFORM = efi
>> +else ifeq ($(BR2_TARGET_GRUB2_ARM64_EFI),y)
>> +GRUB2_IMAGE = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootaa64.efi
>> +GRUB2_CFG = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
>> +GRUB2_PREFIX = /EFI/BOOT
>> +GRUB2_TUPLE = arm64-efi
>> +GRUB2_TARGET = aarch64
>> +GRUB2_PLATFORM = efi
>>  endif
>>
>>  # Grub2 is kind of special: it considers CC, LD and so on to be the
>> @@ -83,7 +104,7 @@ endif
>>  define GRUB2_INSTALL_IMAGES_CMDS
>>       mkdir -p $(dir $(GRUB2_IMAGE))
>>       $(HOST_DIR)/usr/bin/grub-mkimage \
>> -             -d $(HOST_DIR)/usr/lib/grub/$(GRUB2_TUPLE) \
>> +             -d $(@D)/grub-core/ \
>
>  Does this belong to this patch or the previous one?

I will check this again for v2. My first thought is that it doesn't
make much difference as it worked fine before without ARM support, and
this is the first patch in which ARM support gets added.

Thanks

Erico
