From: Stephan Hoffmann <sho@relinux.de>
Date: Sun, 18 Mar 2012 21:15:01 +0100
Subject: [Buildroot] [PATCH 1/2] Microblaze: build kernel with device
 tree
In-Reply-To: <201203181928.09249.arnout@mind.be>
References: <1331978750-11724-1-git-send-email-sho@relinux.de>
 <201203181928.09249.arnout@mind.be>
Message-ID: <4F664245.8020707@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 18.03.2012 19:28, schrieb Arnout Vandecappelle:
>  Many of my comments below were already made by ThomasP as well.  If
> you cannot incorporate them for any reason, it is courteous to say why.
> But probably you just hadn't noticed that he had comments on your patch.
Hello Arnout,

in fact I had noticed the comments, but lost them in the discussion
about doing dts and simpleimage handling in a more general way that
would make most of my patch obsolete.
You wrote:

I will not be able to addess the points within the next two or three
weeks because I'm too busy. Maybe until then Spenser's patch from
February is ready and I can build on it.

Kind regards

Stephan
>
> On Saturday 17 March 2012 11:05:49 Stephan Hoffmann wrote:
> [snip]
>> +ifeq ($(KERNEL_ARCH),microblaze)
>> +# on microblaze, we always want mkimage
>> +LINUX_DEPENDENCIES+=host-uboot-tools
>  Spaces around +=
>
>  And, quoting Thomas:
> Can't you create a new kernel image type (along
> BR2_LINUX_KERNEL_UIMAGE, BR2_LINUX_KERNEL_BZIMAGE,
> BR2_LINUX_KERNEL_ZIMAGE, etc.) which would add this dependency?
>
>  Actually you probably have to do something like that, because with
> this patch the simpleImage.xxx doesn't get copied into the images
> directory, right?
>
>> +
>> +define LINUX_COPY_DTS
>> +    if test -f "$(BR2_LINUX_KERNEL_DTS_FILE)" ; then \
>  The filename should be qstripped.  So
>
> if test -f "$(call qstrip,$(BR2_LINUX_KERNEL_DTS_FILE))"; then \
>
>  It looks a bit crazy to strip the quotes and then add them again, but
> that helps to support situations where the variable is assigned from
> the command line.
>
>  Also, I prefer to use single quotes instead of double quotes, so nothing
> gets expanded by the shell.
>
>> +        cp $(BR2_LINUX_KERNEL_DTS_FILE) $(@D)/arch/microblaze/boot/dts ; \
>  Use KERNEL_ARCH_PATH instead of $(@D)/arch/microblaze, so it works on 
> other architectures as well.
>
>> +    else \
>> +        echo "Cannot copy dts file!" ; \
>  This message will get lost in the long make output.  Either there 
> should be a check at the make level (i.e. using $(error), but that's 
> tricky to get right), or the else branch should end with an 'exit 1'.
> Or skip the check entirely, the kernel build will error out on it 
> anyway.
>
>> +    fi
>> +endef
>> +endif
>>  
>>  ifeq ($(BR2_LINUX_KERNEL_USE_DEFCONFIG),y)
>>  KERNEL_SOURCE_CONFIG = $(KERNEL_ARCH_PATH)/configs/$(call qstrip,$(BR2_LINUX_KERNEL_DEFCONFIG))_defconfig
>> @@ -131,6 +143,8 @@ define LINUX_CONFIGURE_CMDS
>>  	$(if $(BR2_ARM_EABI),
>>  		$(call KCONFIG_ENABLE_OPT,CONFIG_AEABI,$(@D)/.config),
>>  		$(call KCONFIG_DISABLE_OPT,CONFIG_AEABI,$(@D)/.config))
>> +    $(if $(BR2_microblaze),
>> +        $(call LINUX_COPY_DTS))
>  The if is not needed, the LINUX_COPY_DTS is already defined
> conditionally.
>
>>  	# As the kernel gets compiled before root filesystems are
>>  	# built, we create a fake cpio file. It'll be
>>  	# replaced later by the real cpio archive, and the kernel will be
>> @@ -215,6 +229,8 @@ $(LINUX_DIR)/.stamp_initramfs_rebuilt: $(LINUX_DIR)/.stamp_target_installed $(LI
>>  	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_IMAGE_NAME)
>>  	# Copy the kernel image to its final destination
>>  	cp $(LINUX_IMAGE_PATH) $(BINARIES_DIR)
>> +	# If there is a .ub file copy it to the final destination
>> +	test -f $(LINUX_IMAGE_PATH).ub && cp $(LINUX_IMAGE_PATH).ub $(BINARIES_DIR)
>  I'm sorry, but that comment doesn't help me.  I see that the .ub file is
> copied if it exists, but what is this .ub file?
>
>  Regards,
>  Arnout
>
>
>>  	$(Q)touch $@
>>  
>>  # The initramfs building code must make sure this target gets called
>>


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
