From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Tue, 3 Mar 2020 22:30:18 +0100
Subject: [Buildroot] [PATCH] package/linux-firmware: fix symlink support
In-Reply-To: <20200303211552.GC12449@scaer>
References: <20200303133356.859800-1-antoine.tenart@bootlin.com>
 <20200303164302.GB12449@scaer> <20200303184755.GG3179@kwain>
 <20200303211552.GC12449@scaer>
Message-ID: <20200303213018.GH3179@kwain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Tue, Mar 03, 2020 at 10:15:52PM +0100, Yann E. MORIN wrote:
> On 2020-03-03 19:47 +0100, Antoine Tenart spake thusly:
> > On Tue, Mar 03, 2020 at 05:43:02PM +0100, Yann E. MORIN wrote:
> > > On 2020-03-03 14:33 +0100, Antoine Tenart spake thusly:
> > > > +# Some firmware are distributed as a symlink, for drivers to load them using a
> > > > +# defined name other than the real one. Since 9cfefbd7fbda ("Remove duplicate
> > > > +# symlinks") those symlink aren't distributed in linux-firmware but are created
> > > > +# automatically by its copy-firmware.sh script during the installation, which
> > > > +# parses the WHENCE file where symlinks are described. We follow the same logic
> > > > +# here, adding symlink only for firmwares installed in the target directory.
> > > > +# The grep/sed parsing is taken from the script mentioned before.
> > > > +define LINUX_FIRMWARE_CREATE_SYMLINKS
> > > > +	grep -E '^Link:' $(@D)/WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; do \
> > > 
> > > You can combine the grep and sed into a single sed call:
> > > 
> > >     sed -r -e '/^Link: (.+) -> (.+)$$/!d; s//\1 \2/' $(@D)/WHENCE
> > 
> > The reasoning here was to reuse with as little change as possible the
> > code used in Linux-firmware's copy-firmware.sh script, to be easily
> > maintainable should they decide to update the link definition format.
> 
> I see, and that's a good reason. Yet, I've looked at the copy-firmware
> script, and I am not impressed... I find the above to be more readable.

That is the least we can say, not impressed :-)

> > I'm not pushing for either solution, I can change this for v2 if you
> > believe the two command should still be combined.
> 
> no need for a v2: the major road-block (the globs above) is not. I can
> fix the sed and hook stuff locally (I already did it).

Thanks!

Antoine

-- 
Antoine T?nart, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
