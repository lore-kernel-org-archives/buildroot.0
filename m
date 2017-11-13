From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon, 13 Nov 2017 23:10:14 +0300
Subject: [Buildroot] [PATCH/next 3/5] atf: add support for Marvell
 Armada SoCs
In-Reply-To: <20171113082339.wzqq5ijnhlksuklq@sapphire.tkos.co.il>
References: <20171112201646.15558-1-geomatsi@gmail.com>
 <20171112201646.15558-4-geomatsi@gmail.com>
 <20171113082339.wzqq5ijnhlksuklq@sapphire.tkos.co.il>
Message-ID: <20171113201014.boksxitl6fssuzzh@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > Add support for Marvell Armada SoCs to arm-trusted-firmware package.
> > 
> > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> > ---
> >  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> > 
> > diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > index 7b1cc6ebb6..d6bde29894 100644
> > --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> > @@ -39,6 +39,19 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += SCP_BL2=$(BINARIES_DIR)/scp-fw.bin
> >  ARM_TRUSTED_FIRMWARE_DEPENDENCIES += vexpress-firmware
> >  endif
> >  
> > +ifeq ($(BR2_TARGET_ARMADA_FIRMWARE),y)
> > +ARMADA_FIRMWARE_IMAGE = $(call qstrip,$(BR2_TARGET_ARMADA_FIRMWARE_IMAGE))
> > +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
> > +	SCP_BL2=$(BINARIES_DIR)/$(ARMADA_FIRMWARE_IMAGE)
> > +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += armada-firmware
> > +endif
> > +
> > +ifeq ($(BR2_TARGET_ARMADA_DDR),y)
> > +ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
> > +	MV_DDR_PATH=$(DL_DIR)/mv-ddr-marvell
> > +ARM_TRUSTED_FIRMWARE_DEPENDENCIES += armada-ddr
> > +endif
> 
> These are not really optional dependencies of ATF in general. It's only the 
> Marvell specific ATF version that needs them, and they are not optional.
> 
> I don't have any better suggestion at the moment.

Neither do I. Another obvious option is to create a separate ATF package
for Marvell. But it doesn't look like a good idea. I opted the same
approach as for Versatile firmware, at least for the time being.

Regards,
Sergey
