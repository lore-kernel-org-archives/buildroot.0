From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Dec 2017 08:17:23 +0100
Subject: [Buildroot] [RFC 1/2] busybox: avoid conflict with other
 packages
In-Reply-To: <20171214065807.74cqtgpex5oldpx3@sapphire.tkos.co.il>
References: <20171213130131.15744-1-thomas.petazzoni@free-electrons.com>
 <20171213130131.15744-2-thomas.petazzoni@free-electrons.com>
 <20171213144305.zs2iowvzy4n5xzqj@sapphire.tkos.co.il>
 <20171214061850.62bb4ae9@windsurf.png.is.keysight.com>
 <20171214065807.74cqtgpex5oldpx3@sapphire.tkos.co.il>
Message-ID: <20171214081723.64855d25@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Dec 2017 08:58:07 +0200, Baruch Siach wrote:

> Quoting busybox.mk:
> 
> # Enable "noclobber" in install.sh, to prevent BusyBox from overwriting any
> # full-blown versions of apps installed by other packages with sym/hard links.
> 
> Unfortunately, the noclobber implementation is racy. So the alternative is to 
> remove apps from the generated busybox.links file that install.sh uses as 
> input.

The problem is that this busybox.links file gets generated as part of
the "install" target. So unless we explicitly call "make busybox.links"
in a pre-install hook, and then tweak it to remove the applets we don't
want, I don't see how it could work. Can be done, but it starts to be a
bit tricky :)

> >  2. The Busybox binary would contain lots of useless code, which simply
> >     can't be reached, except by calling explicitly "busybox cmd".  
> 
> This is not different than the situation we have now. The added useless code 
> size is in most cases negligible compared to any one of the full-blown 
> version. In the end it's the responsibility of the user to fine tune the 
> target image size.

I admit the size difference is minimal, and is clearly not the primary
motivation for this. To me, it was merely a nice side effect. I
measured a 70-80 KB reduction in the Busybox size when
BR2_PACKAGE_COREUTILS=y, so it's clearly not much compared to how much
disk space is consumed by the full-blown coreutils.

Still, I find it weird that we build support in the binary for
something that we don't expose in the target, while in terms of
complexity, disabling them in the configuration is as simple (perhaps
even more?) than preventing the symlinks from being created.

But again, if it's the general consensus, I'm fine with it. As long as
it helps things move forward towards per-package SDK and TLP support.

It would be nice to hear from Peter, Arnout or Yann for example.

Thanks for the feedback!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
