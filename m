From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 25 Jun 2020 18:23:19 +0200
Subject: [Buildroot] [PATCH 1/1] rpi-firmware: do not rename startup
 files
In-Reply-To: <20200624165405.GA20645@scaer>
References: <20200624115009.15561-1-sveyret@gmail.com>
 <20200624165405.GA20645@scaer>
Message-ID: <20200625182319.4cec8d94@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann, St?phane,

On Wed, 24 Jun 2020 18:54:05 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> St?phane, All,
> 
> Please wrap your commit logs properly, at a 72-or-so boundary.
> 
> On 2020-06-24 13:50 +0200, St?phane Veyret spake thusly:
> > Bug: 13026
> > 
> > When booting, a Raspberry Pi will load the appropriate start files, depending on the provided configuration. For example, if the config.txt file contains:
> > gpu_mem=16
> > the board will automatically load the cut-down startup files (start_cd.elf and fixup_cd.dat on non-Rpi4).  
> 
> So, the startup file loaded depends on the amount of memory the user
> enables, and maybe other configurations, who knows?
> 
> This somewhat goes directly agains the user selecting a specific startup
> file to use. See below...
> 
> > Unfortunately, even when the appropriate version is selected in the configuration menu (in this example, BR2_PACKAGE_RPI_FIRMWARE_BOOT="_cd") if the rpi-firmware makefile takes the good files, it renames them to non-qualified, i.e. start.elf and fixup.dat. But as these are not the files searched by the Raspberry Pi, the board will not start.
> > 
> > Signed-off-by: St?phane Veyret <sveyret@gmail.com>
> > ---
> >  package/rpi-firmware/rpi-firmware.mk | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> > index 6ad67ab0e5..2f4b2b05bf 100644
> > --- a/package/rpi-firmware/rpi-firmware.mk
> > +++ b/package/rpi-firmware/rpi-firmware.mk
> > @@ -44,14 +44,14 @@ endif # INSTALL_VCDBG
> >  ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4),y)
> >  # bootcode.bin is not used on rpi4, because it has been replaced by boot code in the onboard EEPROM
> >  define RPI_FIRMWARE_INSTALL_BOOT
> > -	$(INSTALL) -D -m 0644 $(@D)/boot/start4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start4.elf
> > -	$(INSTALL) -D -m 0644 $(@D)/boot/fixup4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup4.dat
> > +	$(INSTALL) -D -m 0644 $(@D)/boot/start4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/
> > +	$(INSTALL) -D -m 0644 $(@D)/boot/fixup4$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/
> >  endef
> >  else
> >  define RPI_FIRMWARE_INSTALL_BOOT
> > -	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
> > -	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
> > -	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
> > +	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/
> > +	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/
> > +	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/  
> 
> I think we should instead force the name of the startup files in the
> config.txt (in package/rpi-firmware/config.txt):
> 
>     start_file=start.elf
>     fixup_file=fixup.dat

Or one step further, copy the start/fixup file verbatim and only change the
start_file/fixup_file entry in config.txt (with the advantage to make it
transparent which files are installed/in-use)...

Regards,
Peter

> 
> Which will always be exactly what to load. I was pretty farn sure that's
> what we already did, but I remembered wrong...
> 
> See: https://github.com/raspberrypi/documentation/blob/master/configuration/config-txt/boot.md
> 
> Can you respin a patch to that effect, please?
> 
> Regards,
> Yann E. MORIN.
> 
> Regards,
> Yann E. MORIN.
> 
> >  endef
> >  endif
> >  
> > -- 
> > 2.26.2
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot  
> 
