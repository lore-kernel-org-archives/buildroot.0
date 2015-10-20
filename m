From: Kinsella, Ray <ray.kinsella@intel.com>
Date: Tue, 20 Oct 2015 09:28:27 +0000
Subject: [Buildroot] [PATCH] Buildroot support for Intel X1000
In-Reply-To: <20151020100656.3d979ad1@free-electrons.com>
References: <1445252572.4143.12.camel@intel.com>
 <20151020100656.3d979ad1@free-electrons.com>
Message-ID: <1445333306.3204.6.camel@intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for that.

I took a quick check of my board/galileo patchset.
It is free for errant trailing spaces and has the required "category"
prefix. 

However, I had a question on tabbing, for files like grub.cfg or
genimage.cfg.
Is there a convention? are tabs _or_ spaces fine?

Thanks,

Ray K

On Tue, 2015-10-20 at 10:06 +0200, Thomas Petazzoni wrote:
> Ray,
> 
> On Mon, 19 Oct 2015 11:02:52 +0000, Kinsella, Ray wrote:
> > The Intel X1000 is the Pentium class microprocessor that ships with Galileo
> > Gen 1/2. This patch adds changes to arch and toolchain-wrapper to omit the lock
> > prefix for the X1000.
> > 
> > Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> 
> I've applied your patch, after doing some small tweaks (see below).
> 
> > ---
> >  arch/Config.in.x86             | 10 ++++++++++
> >  toolchain/toolchain-wrapper.c  |  3 +++
> >  toolchain/toolchain-wrapper.mk |  4 ++++
> >  3 files changed, 17 insertions(+)
> > 
> > diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
> > index 43f6abc..28b8adf 100644
> > --- a/arch/Config.in.x86
> > +++ b/arch/Config.in.x86
> > @@ -34,6 +34,14 @@ config BR2_x86_i486
> >  config BR2_x86_i586
> >  	bool "i586"
> >  	depends on !BR2_x86_64
> > +config BR2_x86_x1000
> > +	bool "x1000"
> > +	depends on !BR2_x86_64
> > +	help
> > +	    The Intel X1000 is a Pentium class microprocessor in the Quark 
> 
> Indentation for help text is one tab + two spaces. Also, there was a
> trailing space on this line.
> 
> > +	    (sub-Atom) Product Line. The X1000 has a bug on the lock prefix
> > +	    requiring that prefix must be stripped at build time. See
> > +	    https://en.wikipedia.org/wiki/Intel_Quark
> 
> And the lines were a bit too long, so I rewrapped them.
> 
> > +#ifdef BR_OMIT_LOCK_PREFIX
> > +	"-Wa,-momit-lock-prefix=yes", 
> 
> There was also a trailing space here.
> 
> And finally, I've changed  the commit title to:
> 
> 	arch/x86: add support for Intel x1000
> 
> We indeed like to have some sort of "category" prefix for all patches.
> Generally it's just the package name (when the patch is touching a
> package), but we also try to do the same for patches touching other
> things as well.
> 
> Thanks!
> 
> Thomas
