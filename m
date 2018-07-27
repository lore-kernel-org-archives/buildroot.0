From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Jul 2018 16:00:18 +0200
Subject: [Buildroot] [PATCH] package/uboot-tools: version.h collision
In-Reply-To: <CANQCQpZW+maukTjSf5ZP_LcpzDyiKZ=6Cws2ak_PbPDBa48XfQ@mail.gmail.com>
References: <20180727035044.4313-1-matthew.weber@rockwellcollins.com>
 <20180727090347.2b0de571@windsurf>
 <CANQCQpZW+maukTjSf5ZP_LcpzDyiKZ=6Cws2ak_PbPDBa48XfQ@mail.gmail.com>
Message-ID: <20180727160018.50824219@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 27 Jul 2018 08:46:37 -0500, Matthew Weber wrote:

> > This issue has already been fixed. It was btrfs-progs that was
> > installing a version.h header directly in usr/include. It has been
> > fixed by:
> >
> >   https://git.buildroot.org/buildroot/commit/package/btrfs-progs?id=83b40e1ea2e3ce046d7db442b01c3bfe52886ce8
> >
> > I agree it is nice to fix it properly upstream so that the presence of
> > a header with a conflicting name doesn't confuse U-Boot, but I don't
> > think it's worth having this patch in Buildroot since the problem no
> > longer occurs.
> 
> Figured out why I though it was still an error, 2018.05.x doesn't have
> that btrfs patch and occasionally fails.

I notified Peter about this, and he said he backported it to 2018.05:

  http://lists.busybox.net/pipermail/buildroot/2018-July/226228.html

And indeed:

  https://git.buildroot.org/buildroot/commit/?h=2018.05.x&id=2bc7184ba3b86149e473a266c185352418120abd

So it should already be fixed in 2018.05.

If you look at
http://autobuild.buildroot.net/?reason=uboot-tools-2018.03, the
PLAIN_VERSION issue stopped on July 19. The more recent issue on July
27 is different, it is:

/home/peko/autobuild/instance-0/output/host/lib/gcc/arm-buildroot-linux-musleabihf/6.4.0/libgcc.a(_dvmd_lnx.o): In function `__aeabi_idiv0':
/home/peko/autobuild/instance-0/output/build/host-gcc-final-6.4.0/build/arm-buildroot-linux-musleabihf/libgcc/../../../libgcc/config/arm/lib1funcs.S:1354: undefined reference to `raise'
collect2: error: ld returned 1 exit status

This is due to -static missing while linking, in a purely static musl
configuration. So that's obviously not related to version.h/btrfs-progs.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
