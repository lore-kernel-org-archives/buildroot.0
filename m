From: michal.lyszczek at bofc.pl <michal.lyszczek@bofc.pl>
Date: Sun, 11 Nov 2018 18:15:54 +0100
Subject: [Buildroot] [PATCH v2] uboot: add support for bundling ATF BL31
 in ELF format into U-Boot
In-Reply-To: <871s7r7du6.fsf@tkos.co.il>
References: <20181111164532.12185-1-michal.lyszczek@bofc.pl>
 <871s7r7du6.fsf@tkos.co.il>
Message-ID: <20181111171554.6xjrsinheyb6yk4b@c-ml-p3510.redembedded.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-11-11 18:56:17, Baruch Siach wrote:
Hi Baruch

> > +ifeq ($(BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF),y)
> > +define ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL_ELF
> > +	cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/bl31/bl31.elf $(BINARIES_DIR)/
> > +endef
> > +endif
> 
> Why not add this 'ifeq' into ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL ...
> 
> > +
> >  define ARM_TRUSTED_FIRMWARE_BUILD_CMDS
> >  	$(ARM_TRUSTED_FIRMWARE_BUILD_FIPTOOL)
> >  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(ARM_TRUSTED_FIRMWARE_MAKE_OPTS) \
> > @@ -104,6 +110,7 @@ endef
> >  define ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES_CMDS
> >  	cp -dpf $(ARM_TRUSTED_FIRMWARE_IMG_DIR)/*.bin $(BINARIES_DIR)/
> >  	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL)
> > +	$(ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL_ELF)
> 
> ... and drop this part.
> 

Because ARM_TRUSTED_FIRMWARE_BL31_UBOOT_INSTALL is inside
BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT ifeq and that option is not
required for my change. What's more, ATP won't build for rk3328 when
BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT is enabled, because some
functions are no implemented and undefined reference error occurs.
