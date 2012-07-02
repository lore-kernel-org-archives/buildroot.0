From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 02 Jul 2012 17:30:18 +0200
Subject: [Buildroot] [PATCH] Add some support for device tree kernels
 with appended trees
In-Reply-To: <4FEF4A9C.7020901@mind.be>
References: <1340615122-6006-1-git-send-email-maxime.ripard@free-electrons.com>
 <4FEF4A9C.7020901@mind.be>
Message-ID: <4FF1BE8A.1090208@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thanks for the review!

Le 30/06/2012 20:51, Arnout Vandecappelle a ?crit :
> On 06/25/12 11:05, Maxime Ripard wrote:
>> This is a refactoring of the previous basic device tree
>> options available for microblaze.
>>
>> The previous option only made it possible for microblaze targets
>> to give a path to an external device tree, and build a simpleImage
>> with it. This involved using a custom target name as simpleImages
>> are built with the simpleImage.dt_name.
>>
>> This is also the case on powerpc with cuImages.
>>
>> This patch extends the previous mechanism by adding simpleImage
>> and cuImage to the image name list and no longer rely on custom
>> image name. A field is also added to specify either the device tree
>> name if it is already present in the kernel or a path to a custom
>> one.
>>
>> Finally, this patch also support generating kernel images with
>> appended device trees, including regenerating uboot images to
>> update the header. If the appending feature is not used, the
>> generated dtb file is copied into output/images.
>>
>> Signed-off-by: Maxime Ripard<maxime.ripard@free-electrons.com>
>>
>> Cc: Stephan Hoffmann<sho@relinux.de>
> 
>  That's a big feature list!  It may be worthwhile to split into two
> or three patches to expedite acceptance.  Especially with the competing
> 'Add dtb image generation' patch by Philippe Reynes still floating around.

You're right. I will split them into smaller commits.

>> ---
>>   linux/Config.in |   55 ++++++++++++++++++++++++++++++++++++------
>>   linux/linux.mk  |   71
>> ++++++++++++++++++++++++++++++++++++++++++-------------
>>   2 files changed, 103 insertions(+), 23 deletions(-)
>>
>> diff --git a/linux/Config.in b/linux/Config.in
>> index 4562b1b..5618629 100644
>> --- a/linux/Config.in
>> +++ b/linux/Config.in
>> @@ -124,24 +124,53 @@ config BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE
>>       help
>>         Path to the kernel configuration file
>>
>> +config BR2_LINUX_KERNEL_DTS_SUPPORT
>> +       bool "Device Tree Support"
> 
>  I'm not sure if this capitalization is appropriate.  I would call it
>  "Device tree support"
> 
>  Missing help text.  E.g.:
>       Compile a device tree source into a device tree blob.
>       Select the dts file to compile in the options below.
> 
>  I prefer to put a 'if BR2_LINUX_KERNEL_DTS_SUPPORT' here
> rather than all the depends on statements below.

Ok

>> +
>> +config BR2_LINUX_KERNEL_APPENDED_DTB
>> +       bool "Append the Device Tree binary to the kernel"
>> +       depends on BR2_LINUX_KERNEL_DTS_SUPPORT
> 
>     help
>       In addition to generating a dtb file, append it to
>       the kernel image. This is used in simpleImage on
>       microblaze and in cuImage on PowerPC.
> 

This is also an option for ARM images. Actually, this feature is mostly
for ARM images, since the kernel build system abstracts this from the
user for simpleImage and cuImage, while on ARM, this is really something
the user has to do (append the dtb to the zImage and if necessary
generate a uImage from that new zImage). But I get your point.

>> +
>> +choice
>> +    prompt "Device Tree choice"
> 
>  "Device tree source"
> 
>> +    depends on BR2_LINUX_KERNEL_DTS_SUPPORT
>> +    default BR2_LINUX_KERNEL_USE_DEFAULT_DTS
>> +
>> +config BR2_LINUX_KERNEL_USE_DEFAULT_DTS
>> +    bool "Using a device tree present in the kernel"
> 
>  Using -> Use
> 
>     help
>       Use a device tree source that is distributed with
>       the kernel source.  The dts file is found in
>       arch/<arch>/boot/dts.
> 
>> +
>> +config BR2_LINUX_KERNEL_USE_CUSTOM_DTS
>> +    bool "Using a custom device tree file"
> 
>     help
>       Use a custom device tree file.
> 
>> +
>> +endchoice
>> +
>>   config BR2_LINUX_KERNEL_DTS_FILE
>> -    string "Device Tree dts file location"
>> -    depends on BR2_microblaze
>> -    help
>> -      Path from where the dts file has to be copied
>> -      The final "custom target" name depends on the
>> -      dts file name:
>> -<name>.dts -->  simpleImage.<name>
>> +    string "DTS name"
>> +    depends on BR2_LINUX_KERNEL_USE_DEFAULT_DTS
>> +    help
>> +     Name of the default device tree, without the
>> +     trailing .dts
>> +
>> +config BR2_LINUX_KERNEL_CUSTOM_DTS_FILE
>> +    string "Device tree file path"
>> +    depends on BR2_LINUX_KERNEL_USE_CUSTOM_DTS
>> +    help
>> +      Path to the kernel configuration file
> 
>       (relative to the buildroot directory).
> 
>  I have a use case where I want several dtb's to be generated
> in a single buildroot config.  Now I do it by calling dtc outside
> of buildroot, but it would be nice if this use case were supported
> as well.  Of course, that would be impossible to combine with the
> BR2_LINUX_KERNEL_APPENDED_DTB option.

How would you integrate it ? Through a "additionnal device tree sources"
options ? or in these same options?

Anyway, maybe we can get this merge and build on top of that later?


>> +
>>   #
>>   # Binary format
>>   #
>>
>> +config BR2_LINUX_KERNEL_UBOOT_IMAGE
>> +       bool
>> +
>>   choice
>>       prompt "Kernel binary format"
>>
>>   config BR2_LINUX_KERNEL_UIMAGE
>>       bool "uImage"
>>       depends on BR2_arm || BR2_armeb || BR2_bfin || BR2_powerpc ||
>> BR2_avr32 || BR2_sh || BR2_sh64
>> +    select BR2_LINUX_KERNEL_UBOOT_IMAGE
>>
>>   config BR2_LINUX_KERNEL_BZIMAGE
>>       bool "bzImage"
>> @@ -151,6 +180,18 @@ config BR2_LINUX_KERNEL_ZIMAGE
>>       bool "zImage"
>>       depends on BR2_arm || BR2_armeb || BR2_powerpc || BR2_sparc ||
>> BR2_sh || BR2_sh64 || BR2_xtensa
>>
>> +config BR2_LINUX_KERNEL_CUIMAGE
>> +    bool "cuImage"
>> +    depends on BR2_LINUX_KERNEL_DTS_SUPPORT
> 
>  Does it make sense to change this into a select?  In that case, the
> DTS support part should go below the image name, otherwise it's less
> intuitive for the user.

Definitely.

>> +    depends on BR2_powerpc
>> +    select BR2_LINUX_KERNEL_UBOOT_IMAGE
>> +
>> +config BR2_LINUX_KERNEL_SIMPLEIMAGE
>> +    bool "simpleImage"
>> +    depends on BR2_LINUX_KERNEL_DTS_SUPPORT
>> +    depends on BR2_microblaze
>> +    select BR2_LINUX_KERNEL_UBOOT_IMAGE
>> +
>>   config BR2_LINUX_KERNEL_VMLINUX_BIN
>>       bool "vmlinux.bin"
>>       depends on BR2_mips || BR2_mipsel || BR2_sh || BR2_sh64
>> diff --git a/linux/linux.mk b/linux/linux.mk
>> index 34f8623..3eb5e6d 100644
>> --- a/linux/linux.mk
>> +++ b/linux/linux.mk
>> @@ -34,6 +34,10 @@ LINUX_PATCHES = $(call
>> qstrip,$(BR2_LINUX_KERNEL_PATCH))
>>   LINUX_INSTALL_IMAGES = YES
>>   LINUX_DEPENDENCIES  += host-module-init-tools
>>
>> +ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
>> +    LINUX_DEPENDENCIES+=host-uboot-tools
>> +endif
>> +
>>   LINUX_MAKE_FLAGS = \
>>       HOSTCC="$(HOSTCC)" \
>>       HOSTCFLAGS="$(HOSTCFLAGS)" \
>> @@ -46,6 +50,12 @@ LINUX_MAKE_FLAGS = \
>>   # going to be installed in the target filesystem.
>>   LINUX_VERSION_PROBED = $(shell $(MAKE) $(LINUX_MAKE_FLAGS) -C
>> $(LINUX_DIR) --no-print-directory -s kernelrelease)
>>
>> +ifeq ($(BR2_LINUX_KERNEL_USE_DEFAULT_DTS),y)
>> +KERNEL_DTS_NAME = $(BR2_LINUX_KERNEL_DTS_FILE)
>> +else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
>> +KERNEL_DTS_NAME = $(basename $(notdir
>> $(BR2_LINUX_KERNEL_CUSTOM_DTS_FILE)))
>> +endif
>> +
> 
>  Additional check (esp. if we want to support multiple DTSes):
> 
> ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
> ifneq ($(words $(KERNEL_DTS_NAME)),1)
> $(error Kernel with appended device tree needs exactly one DTS source.\
>   Check BR2_LINUX_KERNEL_DTS_FILE or BR2_LINUX_KERNEL_CUSTOM_DTS_FILE.)
> endif
> endif

Ok
>>   ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
>>   LINUX_IMAGE_NAME=$(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
>>   else
>> @@ -56,11 +66,14 @@ LINUX_IMAGE_NAME=vmImage
>>   else
>>   LINUX_IMAGE_NAME=uImage
>>   endif
>> -LINUX_DEPENDENCIES+=host-uboot-tools
>>   else ifeq ($(BR2_LINUX_KERNEL_BZIMAGE),y)
>>   LINUX_IMAGE_NAME=bzImage
>>   else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
>>   LINUX_IMAGE_NAME=zImage
>> +else ifeq ($(BR2_LINUX_KERNEL_CUIMAGE),y)
>> +LINUX_IMAGE_NAME=cuImage.$(KERNEL_DTS_NAME)
>> +else ifeq ($(BR2_LINUX_KERNEL_SIMPLEIMAGE),y)
>> +LINUX_IMAGE_NAME=simpleImage.$(KERNEL_DTS_NAME)
>>   else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_BIN),y)
>>   LINUX_IMAGE_NAME=vmlinux.bin
>>   else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
>> @@ -117,19 +130,6 @@ endef
>>
>>   LINUX_POST_PATCH_HOOKS += LINUX_APPLY_PATCHES
>>
>> -ifeq ($(KERNEL_ARCH),microblaze)
>> -# on microblaze, we always want mkimage
>> -LINUX_DEPENDENCIES+=host-uboot-tools
>> -
>> -define LINUX_COPY_DTS
>> -    if test -f "$(BR2_LINUX_KERNEL_DTS_FILE)" ; then \
>> -        cp $(BR2_LINUX_KERNEL_DTS_FILE)
>> $(@D)/arch/microblaze/boot/dts ; \
>> -    else \
>> -        echo "Cannot copy dts file!" ; \
>> -    fi
>> -endef
>> -endif
>> -
>>   ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
>>   KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call
>> qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
>>   else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG),y)
>> @@ -140,11 +140,12 @@ define LINUX_CONFIGURE_CMDS
>>       cp $(KERNEL_SOURCE_CONFIG)
>> $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
>>       $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D)
>> buildroot_defconfig
>>       rm $(KERNEL_ARCH_PATH)/configs/buildroot_defconfig
>> +    $(if $(BR2_LINUX_KERNEL_DTS_SUPPORT),
>> +        $(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
> 
>  The first if is redundant, because the second one can't be true if the
> first one isn't.

True :)

>> +            cp $(BR2_LINUX_KERNEL_CUSTOM_DTS_FILE)
>> $(KERNEL_ARCH_PATH)/boot/dts/))
> 
>  In 3.0, the boot/dts directory only exists for microblaze and powerpc,
> while
> some OF support does exist already for arm.  It's a bit far-fetched, but to
> be on the safe side I'd do an mkdir first.

Ok, will do

>  Also, I don't think this belongs in the configure commands.  At the
> beginning
> of the build commands seems more appropriate, so the copy is re-done
> when you
> run 'make linux-rebuild'.

Ok

>>       $(if $(BR2_ARM_EABI),
>>           $(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config),
>>           $(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(@D)/.config))
>> -    $(if $(BR2_microblaze),
>> -        $(call LINUX_COPY_DTS))
>>       # As the kernel gets compiled before root filesystems are
>>       # built, we create a fake cpio file. It'll be
>>       # replaced later by the real cpio archive, and the kernel will be
>> @@ -164,9 +165,35 @@ define LINUX_CONFIGURE_CMDS
>>           $(call
>> KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
>>       $(if $(BR2_PACKAGE_SYSTEMD),
>>           $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config))
>> +    $(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
>> +        $(call
>> KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
>>       yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C
>> $(@D) oldconfig
>>   endef
>>
>> +ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
>> +define LINUX_BUILD_DTB
> 
>  I've had at least one kernel where I had to build dtc explicitly:
> 
>     $(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) ./scripts/dtc/

Hmmm, I'm pretty sure that it is built when the device tree is enabled.
Do you remember in what case you had to do this ?

>> +    $(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D)
>> $(KERNEL_DTS_NAME).dtb
>> +endef
>> +endif
>> +
>> +ifeq ($(BR2_LINUX_KERNEL_APPENDED_DTB),y)
>> +ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
>> +define LINUX_APPEND_DTB
>> +    cat $(KERNEL_ARCH_PATH)/boot/zImage
>> $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb> 
>> $(KERNEL_ARCH_PATH)/boot/zImage_dtb
> 
>  A space before the > would make things more readable.

Hmmm, it's there in the patch. Maybe some weird wrapping on your side ?

>> +    mv $(KERNEL_ARCH_PATH)/boot/zImage_dtb
>> $(KERNEL_ARCH_PATH)/boot/zImage
>> +    LOAD=`$(MKIMAGE) -l $(LINUX_IMAGE_PATH) | sed -n 's/Load Address:
>> \([0-9]*\)/\1/p'`; \
>> +    ENTRY=`$(MKIMAGE) -l $(LINUX_IMAGE_PATH) | sed -n 's/Entry Point:
>> \([0-9]*\)/\1/p'`; \
>> +    $(MKIMAGE) -A $(KERNEL_ARCH) -O linux -T kernel -C none -a
>> $${LOAD} -e $${ENTRY} -n 'Linux Buildroot' \
>> +        -d $(KERNEL_ARCH_PATH)/boot/zImage
>> $(KERNEL_ARCH_PATH)/boot/$(KERNEL_IMAGE_NAME)
> 
>  Since we're anyway running mkimage manually here, it doesn't make much
> sense
> to build a uImage in the first place.  So perhaps there should be an
> additional
> LINUX_IMAGE_TARGET variable that is set to zImage for the appended images.

True.

>  BTW, is KERNEL_IMAGE_NAME defined anywhere?

Oops, typo...

> 
>> +endef
>> +else
>> +define LINUX_APPEND_DTB
>> +    cat $(KERNEL_ARCH_PATH)/boot/zImage
>> $(KERNEL_ARCH_PATH)/boot/$(KERNEL_DTS_NAME).dtb> 
>> $(KERNEL_ARCH_PATH)/boot/zImage_dtb
>> +    mv $(KERNEL_ARCH_PATH)/boot/zImage_dtb
>> $(KERNEL_ARCH_PATH)/boot/zImage
> 
>  Assuming that it's a zImage if it's not a u-boot image is perhaps a bit
> optimistic...  How about
> 
> else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
> ...
> else
> $(error Appending DTB to the kernel image is only possible for u-boot
> images and zImage.)
> 

Right
>> +endef
>> +endif
>> +endif
>> +
>>   # Compilation. We make sure the kernel gets rebuilt when the
>>   # configuration has changed.
>>   define LINUX_BUILD_CMDS
>> @@ -174,6 +201,9 @@ define LINUX_BUILD_CMDS
>>       @if grep -q "CONFIG_MODULES=y" $(@D)/.config; then     \
>>           $(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D)
>> modules ;    \
>>       fi
>> +    $(if $(BR2_LINUX_KERNEL_DTS_SUPPORT),
>> +        $(LINUX_BUILD_DTB)
>> +        $(LINUX_APPEND_DTB))
> 
>  if is redundant, the variables will be empty if it's not configured
> like that.

True

>>   endef
>>
>>
>> @@ -183,12 +213,21 @@ define LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET
>>   endef
>>   endif
>>
>> +ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
>> +ifneq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
>> +define LINUX_INSTALL_DTB
>> +    cp $(KERNEL_ARCH_PATH/boot/$(KERNEL_DTS_NAME).dtb $(BINARIES_DIR)/
> 
>  I would install the DTB even if it's a u-boot image.  It should
> definitely be installed if it's a non-appended uImage...

Ooooh, you're obviously right here.

> 
>> +endef
>> +endif
>> +endif
>> +
>>   define LINUX_INSTALL_IMAGES_CMDS
>>       cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
>>   endef
>>
>>   define LINUX_INSTALL_TARGET_CMDS
>>       $(LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET)
>> +    $(LINUX_INSTALL_DTB)
>>       # Install modules and remove symbolic links pointing to build
>>       # directories, not relevant on the target
>>       @if grep -q "CONFIG_MODULES=y" $(@D)/.config; then     \

Thanks!

Maxime

-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
