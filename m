From: michal.lyszczek at bofc.pl <michal.lyszczek@bofc.pl>
Date: Sun, 11 Nov 2018 22:28:55 +0100
Subject: [Buildroot] [PATCH v2] uboot: add support for bundling ATF BL31
 in ELF format into U-Boot
In-Reply-To: <20181111213647.12da8e5a@windsurf.home>
References: <20181111164532.12185-1-michal.lyszczek@bofc.pl>
 <20181111213647.12da8e5a@windsurf.home>
Message-ID: <20181111212855.rlbcvfi3jlqtfv2i@c-ml-p3510.redembedded.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-11-11 21:36:47, Thomas Petazzoni wrote:
> Hello,
> 
> Thanks for this contribution!
> 
> On Sun, 11 Nov 2018 17:45:32 +0100, Micha? ?yszczek wrote:
> 
> > diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > index 23f493653d..8f0f745ac0 100644
> > --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > @@ -94,6 +94,12 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += RESET_TO_BL31=1
> >  ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-uboot-tools
> >  endif
> >  
> > +ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF),y)
> > +define ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL_ELF
> > +	cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/bl31/bl31.elf $(BINARIES_DIR)/
> > +endef
> > +endif
> > +
> >  define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
> >  	$(ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL)
> >  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
> > @@ -104,6 +110,7 @@ endef
> >  define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
> >  	cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/*.bin $(BINARIES_DIR)/
> >  	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL)
> > +	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL_ELF)
> >  endef
> >  
> >  # Configuration check
> > diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> > index ac6f8bc8c1..7f2f7945ac 100644
> > --- a/boot/uboot/Config.in
> > +++ b/boot/uboot/Config.in
> > @@ -179,6 +179,13 @@ config BR2_TARGET_UBOOT_NEEDS_ATF_BL31
> >  	  variable pointing to ATF's BL31 binary, is passed during the
> >  	  Buildroot build.
> >  
> > +config BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF
> > +	bool "U-Boot needs bl31.elf"
> > +	depends on BR2_TARGET_UBOOT_NEEDS_ATF_BL31
> > +	help
> > +		Uses bl31.elf instead of bl31.bin image.  This is needed by some
> > +		platforms (like rk3328) to generate valid uboot.itb with ATF
> 
> Nit: the indentation for the help text should be one tab + two spaces.

Oops, didn't notice, fixed.
> >  ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31),y)
> >  UBOOT_DEPENDENCIES += arm-trusted-firmware
> > +ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF),y)
> > +UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.elf
> > +else
> >  UBOOT_MAKE_OPTS += BL31=$(BINARIES_DIR)/bl31.bin
> >  endif
> 
> So this code means that you can either use the bl31 as ELF *or* the
> bl31 as binary. So I believe it should not be possible to select both.
> Therefore, I would suggest to instead have:
> 
> config BR2_TARGET_UBOOT_NEEDS_ATF_BL31
>         bool "U-Boot needs ATF BL31"
> 	... as it already exists ...
> 
> choice
> 	prompt "U-Boot ATF BL31 format"
> 	default BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN
> 
> config BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN
> 	bool "bl31.bin"
> 
> config BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF
> 	bool "bl31.elf"
> 
> endchoice
> 
> And then use that in both arm-trusted-firmware.mk and uboot.mk.
> 
> What do you think ?

This is definately better option. And it even looks I won't have to
change anything other than uboot's Config.in.

I was also thinking to delete this line when elf is used:

> cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/*.bin $(BINARIES_DIR)/

But since it's wildcard I'd leave it as is. This will cause bl31.bin to
be copied to $BINARIES_DIR alongside with bl31.elf, but it may be possible
someone will need to have, let's say bl31.elf but bl32.bin, and removing
this line would takie this option away from him.

I will prepare new patch shortly.
