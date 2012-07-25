From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jul 2012 20:25:03 +0200
Subject: [Buildroot] [PATCH] Clarify MIPS ABIs support
In-Reply-To: <50102DAA.1030400@mind.be>
References: <1343162828-13060-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <50102DAA.1030400@mind.be>
Message-ID: <20120725202503.7ecae923@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 25 Jul 2012 19:32:26 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>   As far as I understand, the situation is a bit similar to PCs, where
> i386 and x86_64 are in fact quite different even at instruction set
> level.  So wouldn't it make more sense to distinguish mips and mips64
> at the 'Target Architecture' level?  Then mips would always select
> o32, and the ABI choice would only exist for mips64.  And there
> would be a 1-to-1 mapping between BR2_ARCH and the user choice,
> which makes more sense to me.

Makes sense. Gustavo, what do you think?

>   It would require a bit of research to find out which sub-architectures
> are 64-bit, of course.

Right, but it should be doable. The linux-mips.org Wiki has some info,
and I know someone who has quite a bit of experience with MIPS stuff,
so I could ask.

> > -ifeq ($(findstring yy,$(BR2_mips)$(BR2_MIPS_ABI64)),yy)
> > +ifeq ($(findstring yy,$(BR2_mips)$(BR2_MIPS_NABI64)),yy)
> 
>   Any reason why this isn't just
> 
> ifeq ($(BR2_MIPS_NABI64),y)

No, it could be this way. The bigger question is:

> >   TARGET_CFLAGS+=-fno-pic -mno-abicalls

Why are those special CFLAGS needed from the beginning?

> >   	default mmixware	if BR2_mmix &&  BR2_MMIX_ABI_native
> >   	default gnu		if BR2_mmix &&  !BR2_MMIX_ABI_native
> 
>   Unrelated, but what is this BR2_mmix?

It seems like the BR2_mmix option never existed in Buildroot. But from
a quick Google search, MMIX appears to be the fake architecture created
by Donald Knuth, which is the descendant of the MIX architecture he
created to illustrate the Art of Computer Programming. See
http://www-cs-faculty.stanford.edu/~uno/mmix.html. I don't think we
really want to support this architecture.

>   This one is already covered by the mips.* expression.  Actually,
> so is the mipsel.* one.

Right.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
