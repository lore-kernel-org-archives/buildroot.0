From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 30 Oct 2014 11:05:24 +0000
Subject: [Buildroot] [PATCH] arch/arc: add support of ARC HS38 core
In-Reply-To: <20141029221847.33373037@free-electrons.com>
References: <1414585517-5957-1-git-send-email-abrodkin@synopsys.com>
 <20141029221847.33373037@free-electrons.com>
Message-ID: <1414667123.11768.20.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2014-10-29 at 22:18 +0100, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Wed, 29 Oct 2014 15:25:17 +0300, Alexey Brodkin wrote:
> 
> > diff --git a/arch/Config.in.arc b/arch/Config.in.arc
> > index fcb5d7d..1a862d7 100644
> > --- a/arch/Config.in.arc
> > +++ b/arch/Config.in.arc
> > @@ -1,5 +1,22 @@
> > +# Choise of CPU
> 
> I don't think this comment is very useful, so you can get rid of it.
> And anyway, s/Choise/Choice/.

Ok, makes sense and right - Gedit doesn't do spell-checking so I made
this mistake and it went into the wild :(

> > +choice
> > +	prompt "Target CPU"
> > +	depends on BR2_arc
> > +	default BR2_arc700
> > +	help
> > +	    Specific CPU to use
> > +
> > +config BR2_arc700
> > +	bool "ARC 700"
> > +
> > +config BR2_archs
> > +	bool "ARC HS"
> 
> The commit log says that the core is called HS38, but now it's just
> "HS". Can you clarify?

Ok, here's an explanation.
ARC has currently 4 families of CPU cores.
2 of those families may have MMU, they are:
 1) ARC700 series (ARC750D and ARC770D have MMU while others like
ARC705, ARC725 have no MMU)
 2) ARC HS series (HS38 has MMU while HS34 and HS36 are MMU-less models)

But since Buildroot is used for building tools and packages for
Linux-driven systems I don't even mention other HS family members.

Also what's important that ARC700 and ARC HS families implement
different ISAs and that's why I had to add another type of CPU -
different settings of gcc and uclibc are required for ARC700 and HS.

Probably what I need to do is to list explicitly all relevant CPU
modifications that could be used for Linux. then we'll have ARC750D,
ARC770D and ARC HS38. In this case there will be no confusions.

> >  # Choise of atomic instructions presence
> >  config BR2_ARC_ATOMIC_EXT
> > +	default y if BR2_archs
> 
> Why? Are atomic instructions *always* available on HS38, or are they
> also optional like on ARC700 ?

Well with ARC things a bit more complex compared to other architectures.
Because we provide a LEGO-like IP - user may select each and every tiny
detail he wants or doesn't want.

And all those "names" mentioned above like ARC770D, ARC HS are only
names of "templates" - sets of components and features that are most
likely will be used. But nobody can stop user to down-configure
anything.

So in case of HS38 by default atomic options are enabled - that's why I
enabled them in Buildroot for ARC HS by default. But since there's a
probability one customer decides to down-configure atomic instructions
(even though we don't recommend to do it) we need to have an ability to
build software without atomic ops.

> >  config BR2_GCC_TARGET_CPU
> > -	default "arc700"
> > +	default "arc700" if BR2_arc700
> > +	default "archs"	 if BR2_archs
> 
> So from gcc's point of view, the processor is called archs, but from a
> marketing point of view it's HS38. What happens if tomorrow Synopsys
> creates a different CPU core called HS100 ?

See above. We need to have arc700 and archs to distinguish 2 different
ISAs and ABIs. Still as I commented above I'll add selection of a
particular CPU so for example we may pass fine-tuning options to gcc
like "-mtune=ARCxxx".

> Is this processor already supported by the current binutils/gcc/uClibc
> versions used for the ARC architecture in Buildroot?

Right, arc-2014.08 tools (gcc, binutils, uClibc) already support ARC HS.
Moreover uClibc has ARC HS support even in upstream master branch.

> The rest of the patch looks good to me.

I'll do a respin with fixed comments and more fine-grained ARC CPU
selection shortly.

-Alexey
