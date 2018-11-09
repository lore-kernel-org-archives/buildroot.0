From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Nov 2018 17:40:17 +0100
Subject: [Buildroot] [PATCH] toolchain: Enable Glibc for all
 little-endian ARCs with atomic ops
In-Reply-To: <7fa29470264912aadb3241fb2981f1d2872aef36.camel@synopsys.com>
References: <20181109140023.21402-1-abrodkin@synopsys.com>
 <20181109173239.75ccae8f@windsurf>
 <7fa29470264912aadb3241fb2981f1d2872aef36.camel@synopsys.com>
Message-ID: <20181109174017.1236dd5e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 9 Nov 2018 16:34:50 +0000, Alexey Brodkin wrote:

> On Fri, 2018-11-09 at 17:32 +0100, Thomas Petazzoni wrote:
> > Hello,
> > 
> > On Fri,  9 Nov 2018 17:00:23 +0300, Alexey Brodkin wrote:
> >   
> > > diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> > > index 7d9428c70ed0..8d6997e7790b 100644
> > > --- a/toolchain/toolchain-buildroot/Config.in
> > > +++ b/toolchain/toolchain-buildroot/Config.in
> > > @@ -48,7 +48,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
> > >  		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
> > >  		   BR2_riscv       || BR2_sh         || BR2_sparc64     || \
> > >  		   BR2_x86_64      || BR2_microblaze || BR2_nios2       || \
> > > -		   BR2_archs38
> > > +		   BR2_arcle  
> > 
> > What about:
> > 
> > 		   (BR2_arcle && BR2_ARC_ATOMIC_EXT)
> > 
> > instead ?  
> 
> Sure, but I didn't want to ruin the beauty of above construction
> thus split in 2 parts.
> 
> If you're OK with (x & y) among other pure arch mentions
> I may send a respin.

If you truly want beauty (which is good!) then I think it would be best
to have in package/glibc/Config.in:

config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
	bool
	default y if ...
	default y if ...

and then use that in toolchain/toolchain-buildroot/Config.in. But that
requires doing the same for uclibc and musl to keep consistency :)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
