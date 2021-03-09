From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 9 Mar 2021 21:25:25 +0100
Subject: [Buildroot] [RFC/next v2 1/2] package/rpi-firmware: rework
 boot/config file handling
In-Reply-To: <20210308220431.GC2737665@scaer>
References: <20210216201148.26688-1-ps.report@gmx.net>
 <20210308220431.GC2737665@scaer>
Message-ID: <20210309212525.2c57f6ce@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Mon, 8 Mar 2021 23:04:31 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
>
> Second part of the review... ;-)
>
> On 2021-02-16 21:11 +0100, Peter Seiderer spake thusly:
> > Try to be less smart (focused on the one target/one use-case),
> > instead reduce the rpi-firmware package to a selectable list
> > of (verbatim) installed firmware files.
> >
> > - change rpi-firmware config handling from rpi-variant/rpi-flavour
> >   choices to bootcode.bin, pi-default/-extended/-cut-down and
> >   pi4-/default/-extended/-cut-down selection
> >
> > - add BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE option to select installable
> >   config.txt file
> >
> > - remove config.txt modify code/handling from raspberry post-image.sh
> >   script
> >
> > - add different customized config.txt files to the raspberry board
> >   section
> >
> > - change raspberry defconfigs to select appropiate rpi-firmware
> >   and config.txt files
> >
> > - change genimage-raspberrypi4.cfg/genimage-raspberrypi4-64.cfg to
> >   use start4.elf and fixup4.dat
> >
> > With this changes a better support for custom use-cases should
> > be possible, specially multi-target SD cards as suggested by
> > Stefan Agner ([1]).
> >
> > [1] http://lists.busybox.net/pipermail/buildroot/2021-February/303318.html
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> [--SNIP--]
> > diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> > index f3d28ef825..a7ab8f0f14 100644
> > --- a/package/rpi-firmware/rpi-firmware.mk
> > +++ b/package/rpi-firmware/rpi-firmware.mk
> > @@ -10,6 +10,46 @@ RPI_FIRMWARE_LICENSE = BSD-3-Clause
> >  RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
> >  RPI_FIRMWARE_INSTALL_IMAGES = YES
> >
> > +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN),y)
> > +RPI_FIRMWARE_FILES += bootcode.bin
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI),y)
> > +RPI_FIRMWARE_FILES += start.elf fixup.dat
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X),y)
> > +RPI_FIRMWARE_FILES += startx.elf fixupx.dat
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD),y)
> > +RPI_FIRMWARE_FILES += start_cd.elf fixup_cd.dat
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4),y)
> > +RPI_FIRMWARE_FILES += start4.elf fixup4.dat
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_X),y)
> > +RPI_FIRMWARE_FILES += start4x.elf fixup4x.dat
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD),y)
> > +RPI_FIRMWARE_FILES += start4cd.elf fixup4cd.dat
> > +endif
>
> What about:
>
>     RPI_FIRMWARE_FILES = \
>         $(if $(BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN),bootcode.bin) \
>         $(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI),start.elf fixup.dat) \
>         $(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X),startx.elf fixupx.dat) \
>         $(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD),start_cd.elf fixup_cd.dat) \
>         $(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4),start4.elf fixup4.dat) \
>         $(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_X),start4x.elf fixup4x.dat) \
>         $(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD),start4cd.elf fixup4cd.dat)
>
> Or alternatively:
>
>     RPI_FIRMWARE_FILES_$(BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN) += bootcode.bin
>     RPI_FIRMWARE_FILES_$(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI) += start.elf fixup.dat
>     RPI_FIRMWARE_FILES_$(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X) += startx.elf fixupx.dat
>     RPI_FIRMWARE_FILES_$(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD) += start_cd.elf fixup_cd.dat
>     RPI_FIRMWARE_FILES_$(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4) += start4.elf fixup4.dat
>     RPI_FIRMWARE_FILES_$(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_X) += start4x.elf fixup4x.dat
>     RPI_FIRMWARE_FILES_$(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD) += start4cd.elf fixup4cd.dat

Unsettled which of the three versions is the nicest one, seems a matter of
taste (and a matter of trading more lines against long lines), and personal not
much of a friend of the '.._y' pattern...

>
>     define RPI_FIRMWARE_INSTALL_BIN
>         $(foreach f,$(RPI_FIRMWARE_FILES_y),
>             $(INSTALL) -D -m 0644 $(@D)/$(f) $(BINARIES_DIR)/rpi-firmware/$(f)
>         )
>     endef
>
> > +define RPI_FIRMWARE_INSTALL_BIN
> > +	for firmwbin in  $(RPI_FIRMWARE_FILES); do \
> > +		$(INSTALL) -D -m 0644 $(@D)/boot/$${firmwbin} $(BINARIES_DIR)/rpi-firmware/$${firmwbin} || exit 1; \
> > +	done
>
> Use a make-level $(foreach) loop rather than a shell loop (see example
> above).

Definitely an improvement as it avoids the '|| exit 1;' part...

Will rework the patch accordingly...

Regards,
Peter

>
> Regards,
> Yann E. MORIN.
>
