From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 8 Mar 2017 09:17:08 +0200
Subject: [Buildroot] [PATCH] rpi-bt-firmware: new package
In-Reply-To: <CAFGQKxeGBY2xbtsKOrdS5P-JN30FvZJqnDCthbZ9x9YfKwCXdQ@mail.gmail.com>
References: <53c705753b20aca425aa8acb2af8d19a36cd6ac4.1485955423.git.baruch@tkos.co.il>
 <CAFGQKxeGBY2xbtsKOrdS5P-JN30FvZJqnDCthbZ9x9YfKwCXdQ@mail.gmail.com>
Message-ID: <20170308071708.l3lh5au6gmzirjs6@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Martin,

On Tue, Mar 07, 2017 at 10:34:02AM +0000, Martin Bark wrote:
> On 1 February 2017 at 13:23, Baruch Siach <baruch@tkos.co.il> wrote:
> > Add firmware file for the Raspberry Pi 3 Bluetooth module.
> >
> > Note that to successfully download the firmware bluez5_utils needs a
> > patch[1].
> >
> > [1] http://www.spinics.net/lists/linux-bluetooth/msg69470.html
> 
> This seems a minor patch, is it safe it just add it to blue5_utils?

Upstream rejected the patch, and Buildroot generally does not add feature 
patches. This is arguably not a "feature" patch, but I still don't think 
Buildroot should carry it.

> > +config BR2_PACKAGE_RPI_BT_FIRMWARE
> > +       bool "rpi-bt-firmware"
> > +       depends on BR2_arm || BR2_aarch64
> > +       help
> > +         Raspberry Pi 3 Broadcom BCM43438 Bluetooth module firmware.
> 
> I think this will also be needed on the raspberry pi zero w so might be
> worth updating the comment.

Have you tested it on the Pi Zero W?

> > +RPI_BT_FIRMWARE_VERSION = a439f892bf549ddfefa9ba7ad1999cc515f233bf
> > +RPI_BT_FIRMWARE_SITE = https://aur.archlinux.org/pi-bluetooth.git
> 
> Is aur a good place to pull this from? Hopefully one day BCM43430A1.hcd
> will make it's way into linux-firmware but until then it seems like
> raspbian is the source of this file so i think it's better to get it from
> them.

See below.

> > +RPI_BT_FIRMWARE_SITE_METHOD = git
> > +RPI_BT_FIRMWARE_LICENSE = PROPRIETARY
> > +RPI_BT_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
> > +
> > +# The BlueZ hciattach utility looks for firmware in /etc/firmware. Add a
> > +# compatibility symlink.
> > +define RPI_BT_FIRMWARE_INSTALL_TARGET_CMDS
> > +       ln -sf ../lib/firmware $(TARGET_DIR)/etc/firmware
> 
> +       $(INSTALL) -D -m 0644 $(@D)/BCM43430A1.hcd \
> > +               $(TARGET_DIR)/lib/firmware/BCM43430A1.hcd
> >
> 
> Given you have to patch hciattach_bcm43xx.c to use this firmware why not
> also correct the path to the firmware? Assuming BCM43430A1.hcd ends up in
> linux-firmware then it would reside in /lib/firmware/brcm.  If you patch
> the correct path to BCM43430A1.hcd then there is no need for the symlink.

I prefer to keep the upstream patch as minimal as possible. Also, although 
unlikely, upstream may change firmware search location to /lib/firmware. So I 
would like to keep compatibility with both paths.

> > +endef
> > +
> > +$(eval $(generic-package))
> 
> So i was thinking something more like this where we get the firmware from
> the raspbian package. what do you think?
> 
> RPI_BT_FIRMWARE_VERSION = 1.2
> RPI_BT_FIRMWARE_SOURCE=bluez-firmware_$(RPI_BT_FIRMWARE_VERSION).orig.tar.gz
> RPI_BT_FIRMWARE_SITE =
> https://archive.raspberrypi.org/debian/pool/main/b/bluez-firmware

Does archive.raspberrypi.org keep older versions of source packages forever 
like snapshot.debian.org?

> RPI_BT_FIRMWARE_EXTRA_DOWNLOADS =
> bluez-firmware_$(RPI_BT_FIRMWARE_VERSION)-3+rpi1.debian.tar.xz
> RPI_BT_FIRMWARE_LICENSE = Proprietary
> RPI_BT_FIRMWARE_LICENSE_FILES = broadcom/BCM-LEGAL.txt
> 
> # Extract the Debian tarball inside the sources
> define RPI_BT_FIRMWARE_DEBIAN_EXTRACT
>         $(call suitable-extractor,$(notdir
> $(RPI_BT_FIRMWARE_EXTRA_DOWNLOADS))) \
>                 $(DL_DIR)/$(notdir $(RPI_BT_FIRMWARE_EXTRA_DOWNLOADS)) | \
>                 $(TAR) -C $(@D) $(TAR_OPTIONS) -
> endef
> RPI_BT_FIRMWARE_POST_EXTRACT_HOOKS += RPI_BT_FIRMWARE_DEBIAN_EXTRACT

This is overly complicated, in my opinion. I prefer my simpler approach.

> define RPI_BT_FIRMWARE_INSTALL_TARGET_CMDS
> $(INSTALL) -D -m 0644 $(@D)/broadcom/BCM43430A1.hcd
> $(TARGET_DIR)/lib/firmware/brcm/BCM43430A1.hcd
> endef
> 
> Finally for this firmware to be useful don't we also need sysv and systemd
> scripts to call hciattach?

You may use either of the two Rpi UARTs to communicate with the Bluetooth 
module. I don't think we should hard code that decision into a startup script. 
This is something for local user to customize.

Thanks for reviewing.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
