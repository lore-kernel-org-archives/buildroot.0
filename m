From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Mar 2012 23:23:30 +0100
Subject: [Buildroot] [PATCH] ext-toolchain: Automatically set -m64 if
 the architecture is x86_64
In-Reply-To: <201203132255.09448.arnout@mind.be>
References: <1327169083-15538-1-git-send-email-arnout@mind.be>
 <20120305111246.68ec6324@skate> <201203132255.09448.arnout@mind.be>
Message-ID: <20120314232330.540d0ee2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 13 Mar 2012 22:55:08 +0100,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

> > I disagree with this change. If you select "i386" or "i486" as the
> > Target Architecture Variant, then this Sourcery CodeBench toolchain
> > will not work: it only has libc variants for Pentium 4, Atom, Xeon and
> > Core 2, so if you try to use it on something older than Pentium 4, it
> > might use nonexistent instructions.
> 
>  Ah, I hadn't thought of the pre-P4 variants.
> 
> > Can you explain why you made this change, or revert it?
> 
>  My customer, after reading this help text, thought that it wouldn't work
> on his Athlon processor.  And the same would go for Celerons and whatnot.
> So instead of enumerating all of them, I thought I'd simplify the help 
> text.

Well, I think it's quite important to know which multilib variants are
available. Maybe we could make the wording a bit different by saying
that such and such multilib variant is for processor XXX or later ?

>  And the second part of the patch removed the necessity of the
> -m64 option so that didn't need to be mentioned anymore either.

Maybe, but we have the same text for other multilib variants of all
toolchains, many of which require special options.

> > I don't agree here. -m64 is not an option that exists for all
> > 64-bits architectures. For example, it does not exist on MIPS. -m64 is
> > part of the architecture-specific options of gcc, so your change should
> > rather be:
> > 
> > ifeq ($(BR2_x86_64),y)
> > TOOLCHAIN_EXTERNAL_CFLAGS += -m64
> > TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_64
> > endif
> 
>  OK.

Can you respin the patch with this?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
