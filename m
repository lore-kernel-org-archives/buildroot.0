From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 23:24:08 +0200
Subject: [Buildroot] [PATCHv2 12/15] fs/iso9660: add isolinux support
In-Reply-To: <20150614154754.GJ3615@free.fr>
References: <1433802108-14351-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433802108-14351-13-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150614154754.GJ3615@free.fr>
Message-ID: <20150614232408.0716aa6c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 14 Jun 2015 17:47:54 +0200, Yann E. MORIN wrote:

> > +else ifeq ($(BR2_TARGET_ROOTFS_ISO9660_ISOLINUX),y)
> > +ROOTFS_ISO9660_DEPENDENCIES += syslinux
> > +ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH = \
> > +	$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/isolinux.cfg
> > +ROOTFS_ISO9660_BOOT_IMAGE = isolinux/isolinux.bin
> > +define ROOTFS_ISO9660_INSTALL_BOOTLOADER
> > +	$(INSTALL) -D -m 0644 $(BINARIES_DIR)/syslinux/isolinux.bin \
> > +		$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/isolinux.bin
> > +	$(INSTALL) -D -m 0644 $(HOST_DIR)/usr/share/syslinux/ldlinux.c32 \
> > +		$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/ldlinux.c32
> 
> In my previous review, I suggested we always install ldlinux.c32 from
> the syslinux package, and into $(BINARIES_DIR)/syslinux, to which you
> seemed to agree.
> 
> However, it looks like you overlooked that part. ;-)

Na, na, I did not overlooked it at all! If you look at my previous
version, it was taking ldlinux.c32 directly from the syslinux build
directory $(SYSLINUX_DIR). And your concern was that the organization
of the syslinux source tree can change.

And I've discovered that in fact all the .c32 modules get installed by
the syslinux package in $(HOST_DIR)/usr/share/syslinux/.

So it was not necessary to install ldlinux.c32 to $(BINARIES_DIR):
taking it from $(HOST_DIR)/usr/share/syslinux/ was solving your
concern.

I was not really happy with installing ldlinux.c32 to $(BINARIES_DIR),
because it would make it a special case compared to the syslinux
Config.in option we already have to install modules to the target
filesystem.

So, I considered that taking ldlinux.c32 from
$(HOST_DIR)/usr/share/syslinux/ was a good enough solution.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
