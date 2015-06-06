From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Jun 2015 03:03:27 +0200
Subject: [Buildroot] [PATCH 09/12] fs/iso9660: add support for isolinux
In-Reply-To: <20150605223856.GJ3641@free.fr>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-10-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150605223856.GJ3641@free.fr>
Message-ID: <20150606030327.199f2daf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Sat, 6 Jun 2015 00:38:56 +0200, Yann E. MORIN wrote:

> This patch is quite large, and could benefit from being splitted in three:
> 
>   - first patch introduces the ROOTFS_ISO9660_BOOTLOADER_CONFIG_PATH and
>     ROOTFS_ISO9660_BOOT_IMAGE variables
> 
>   - second patch to introduce the bootloader choice, but with only a
>     single entrey 'grub', and the .mk re-organisation (still with only
>     grub handling),
> 
>   - then a third patch adds isolinux support.
> 
> That'd make it easier to review...

True, this seems like a good split. I'll work on that.

> Since I'm quite interested in the end-result of this series
> (multi-format bootable images), I can help if you don;t have time. Just
> ping me... ;-)

Actually, your review is arriving at exactly the right time. I'm having
a 10+ hours flight tomorrow, which will be a perfect opportunity to
prepare a v2 of this series.

I did the v1 on the 10+ hours flight to go, so having something to do
on the return trip is great.



> > +	$(INSTALL) -D -m 0644 $(SYSLINUX_DIR)/bios/com32/elflink/ldlinux/ldlinux.c32 \
> > +		$(ROOTFS_ISO9660_TARGET_DIR)/isolinux/ldlinux.c32
> 
> syslinux/isolinux already installs isolinux.bin and the .c32 modules in
> $(BINARIES_DIR)/syslinux, so you should probably get them from there,
> rather than cherry-pick from the package dir (in case a later version
> bump moves them, like it did when I last updated the package).
> 
> Except ldlinux.c32 is not systematically installed; we should probably
> change that first (what use would we have of a syslinux/isolinux that
> can't load a Linux kernel? :-] ).

True, will change.


> > diff --git a/fs/iso9660/isolinux.cfg b/fs/iso9660/isolinux.cfg
> > new file mode 100644
> > index 0000000..2bdf48b
> > --- /dev/null
> > +++ b/fs/iso9660/isolinux.cfg
> > @@ -0,0 +1,6 @@
> > +default 1
> > +display sample.msg
> 
> Where's that file comming from?
> 
> Also, there is the possibility for syslinux/isolinux to display
> graphics, too, but it is much more invvolved (but that'd be great!)

The precise reason why there is this leftover "display sample.msg" is
because I tried to get the splash image support of isolinux to work.
I didn't succeed and gave up (no Internet access while flying, so I was
limited to just the isolinux documentation and source code) but forgot
to kill that line. I'll kill it off for now, until someone interested
enough in having a splash image with isolinux works on that.

Thanks again for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
