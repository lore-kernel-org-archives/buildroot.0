From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jun 2014 09:35:02 +0200
Subject: [Buildroot] Location of bootloader files [was: Re: [PATCH 1/2]
 at91bootstrap3: bump to v3.6.2]
In-Reply-To: <539F680B.10405@mind.be>
References: <1402839229-13076-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20140615165840.GC3568@free.fr> <539F680B.10405@mind.be>
Message-ID: <20140617093502.7f5e68a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Yann,

On Mon, 16 Jun 2014 23:56:27 +0200, Arnout Vandecappelle wrote:

> > Some of the bootloaders install their files in a sub-directory of
> > $(BINARIES_DIR) (for example rpi-userland, syslinux...), while others
> > (such as this one) install their files directly in $(BINARIES_DIR), and
> > still others install their files in $(TARGET_DIR)/boot (eg. grub.)
> > 
> > Sometime ago, I proposed a patch to install the rpi-userland files in
> > $(TARGET_DIR)/boot, but that was refused, on the principle that the boot
> > partition should not necesarily be exposed/mounted on the running
> > system. That's however what grub1 does.
> 
>  I think for most bootloaders, it just doesn't make sense to install them inside
> the target rootfs, because the (ROM) bootloader anyway can't access these files
> there. Grub is special because the actual bootloader is created by a separate
> installer. For the other bootloaders, there is IMHO no point at all to install
> the bootloader in the target filesystem.

Fully agreed. Most ARM SoCs capable of loading the bootloader for
MMC/eMMC require the bootloader to be stored in a FAT (often FAT16)
filesystem. And such a filesystem cannot be used to store the root
filesystem. So you necessarily need to have at least two partitions:
one FAT partition with the bootloader, and one ext2/3/4 partition (or
any other filesystem) for the root filesystem. So as Arnout says, there
absolutely no point in having the bootloaders installed *inside* the
root filesystem.

There are also some other SoCs where the bootloaders are not even
inside a root filesystem: you have to write the bootloader image, raw,
somewhere at the beginning of the MMC/eMMC storage (not exactly at the
beginning, as it would overwrite the partition table, but somewhere
after the first sector, but before the start of the first partition). I
*think* i.MX28 might be in this category, but it's mainly my colleague
Maxime Ripard who did some i.MX28 stuff, so I might remember incorrect
here.

So really, Grub is the exception here, not the rule.

> >   - if installing files in $(BINARIES_DIR), should we instate a policy
> >     to install them in a sub-dir? What shall that sub-dir be named?
> >     Currently, when followed, the behaviour is to install in a sub-dir
> >     named after the bootloader (eg. $(BINARIES_DIR)/rpi-userland).
> >     Should we stick to that, or just name that directory
> >     $(BINARIES_DIR)/boot ?
> 
>  I don't think $(BINARIES_DIR)/boot is a good place, because that should contain
> everything except the boot loader :-). Also, if you want to do that, you
> probably also want to put the kernel and DTB there. And then there's nothing
> left in $(BINARIES_DIR)...

I'm also unsure we should do something other than what we do currently.
The user generally ends up with very few files in $(BINARIES_DIR), so
it's pretty obvious what to do. The readme.txt for each board gives
some additional details. We could always decide to have certain
packages install a README.<bootloader> file in $(BINARIES_DIR) with
some references/details on how to use the binaries installed here, but
I'm not even sure that's really necessary.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
