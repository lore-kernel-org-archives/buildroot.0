From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Thu, 16 Nov 2017 00:15:25 +0300
Subject: [Buildroot] [PATCH/next 1/5] armada-firmware: new package
In-Reply-To: <dbbc1ce7-1847-a08d-fca0-a667b555b71c@mind.be>
References: <20171112201646.15558-1-geomatsi@gmail.com>
 <20171112201646.15558-2-geomatsi@gmail.com>
 <dbbc1ce7-1847-a08d-fca0-a667b555b71c@mind.be>
Message-ID: <20171115211525.kthewizyrikb4wiz@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thanks for the review !

> > This package adds SCP BL2 firmware for Marvell Armada 7040 and 8040 SoCs.

...

> > diff --git a/boot/Config.in b/boot/Config.in
> > index 2f46c8546e..0ffbd7288b 100644
> > --- a/boot/Config.in
> > +++ b/boot/Config.in
> > @@ -17,5 +17,6 @@ source "boot/ts4800-mbrboot/Config.in"
> >  source "boot/uboot/Config.in"
> >  source "boot/vexpress-firmware/Config.in"
> >  source "boot/xloader/Config.in"
> > +source "boot/armada-firmware/Config.in"
> 
>  Please keep things alphabetic. However, I don't think the boot loader menu is
> appropriate. Yes, it's an image that is used by the bootloader, but really it is
> a piece of firmware, not really related to booting the SoC.

Will fix the order. However it looks like boot menu is the right place for this
package. This package is similar to versatile-firmware. It is SCP_BL2 image
which is used by ATF to boot SCP coprocessor. A bit more details are available
in ATF design document:
https://github.com/ARM-software/arm-trusted-firmware/blob/master/docs/firmware-design.rst#scp-bl2-system-control-processor-firmware-image-load

> > diff --git a/boot/armada-firmware/Config.in b/boot/armada-firmware/Config.in
> > new file mode 100644
> > index 0000000000..530b5622c8
> > --- /dev/null
> > +++ b/boot/armada-firmware/Config.in
> > @@ -0,0 +1,19 @@
> > +config BR2_TARGET_ARMADA_FIRMWARE
> > +	bool "armada-firmware"
> > +	depends on BR2_aarch64
> > +	help
> > +	  Marvell Armada SCP BL2 firmware images.
> 
>  Could you write a little more help text? Like, that it's the firmware for the
> management coprocessor and that it is needed for power management. The first
> paragraph of [1] can be a source of inspiration.
> 
>  We normally also want an upstream URL. [1] might be usable but I'm not sure.

Sure, I will add more details about this package.

> > diff --git a/boot/armada-firmware/armada-firmware.mk b/boot/armada-firmware/armada-firmware.mk
> > new file mode 100644
> > index 0000000000..d75dc7cb6c
> > --- /dev/null
> > +++ b/boot/armada-firmware/armada-firmware.mk
> > @@ -0,0 +1,18 @@
> > +################################################################################
> > +#
> > +# Marvell Armada SCP BL2 firmware images
> > +#
> > +################################################################################
> > +
> > +ARMADA_FIRMWARE_VERSION = $(call qstrip,$(BR2_TARGET_ARMADA_FIRMWARE_VERSION))
> > +ARMADA_FIRMWARE_SITE = $(call github,MarvellEmbeddedProcessors,binaries-marvell,$(ARMADA_FIRMWARE_VERSION))
> 
>  We try to keep the upstream name as the package name. Is there anything wrong
> with binaries-marvell?

Ok, makes sense. Will do.

> > +ARMADA_FIRMWARE_LICENSE = Proprietary
> > +
> > +ARMADA_FIRMWARE_INSTALL_IMAGES  = YES
> > +
> > +define ARMADA_FIRMWARE_INSTALL_IMAGES_CMDS
> > +	$(INSTALL) -D -m 0644 $(@D)/mrvl_scp_bl2_7040.img $(BINARIES_DIR)/mrvl_scp_bl2_7040.img
> > +	$(INSTALL) -D -m 0644 $(@D)/mrvl_scp_bl2_8040.img $(BINARIES_DIR)/mrvl_scp_bl2_8040.img
> 
>  I don't think the name is really relevant, is it? So maybe you could always
> copy it to the same file in BINARIES_DIR so on the ATF side you don't need to
> access variables of this package.

This file depends on platform. Now we are adding MacchiatoBin, but another
interesting networking board called EspressoBin from the same vendor is on the
horizon. So it makes sense to keep things a little bit more flexible.

It looks like, together with review comments from Baruch, this brings us
to the following implementation:
- choice submenu for available platforms in armada-firmware config menu
  ..
  config BR2_TARGET_ARMADA_FIRMWARE_IMAGE
    string
    default "mrvl_scp_bl2_8040.img" if BR2_PACKAGE_ARMADA_8040
    default "mrvl_scp_bl2_7040.img" if BR2_PACKAGE_ARMADA_7040

- copy only selected BR2_TARGET_ARMADA_FIRMWARE_IMAGE to BINARIES_DIR

- use the same BR2_TARGET_ARMADA_FIRMWARE_FIRMWARE variable in ATF package
  to specify correct firmware

Regards,
Sergey
