From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 27 Dec 2019 09:00:21 +0000
Subject: [Buildroot] [arc-buildroot] [PATCH] arch/arc: Explicitly set
 "max-page-size" for GNU LD
In-Reply-To: <20191226170504.GP26395@scaer>
References: <20191224141032.34544-1-abrodkin@synopsys.com>
 <20191225223603.360a7ffa@windsurf> <20191226170504.GP26395@scaer>
Message-ID: <CY4PR1201MB0120748B829AE787E4B3A097A12A0@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Thomas,

[snip]

> > > -# By default MAXPAGESIZE for ARC is 8192 so for larger MMU pages
> > > -# it needs to be overridden.
> > > +# Explicitly set LD's "max-page-size" instead of relying on some defaults
> > > +ifeq ($(BR2_ARC_PAGE_SIZE_4K),y)
> > > +ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=4096
> > > +endif
> > > +
> > > +ifeq ($(BR2_ARC_PAGE_SIZE_8K),y)
> > > +ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=8192
> > > +endif
> > > +
> > >  ifeq ($(BR2_ARC_PAGE_SIZE_16K),y)
> > >  ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=16384
> > >  endif
> >
> > Since these options are mutually exclusive:
> >
> > ifeq ($(BR2_ARC_PAGE_SIZE_4K),y)
> > ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=4096
> > else ifeq ($(BR2_ARC_PAGE_SIZE_8K),y)
> > ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=8192
> > else ifeq ($(BR2_ARC_PAGE_SIZE_16K),y)
> > ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=16384
> > endif
> >
> > is a bit more compact, so I changed to use this before committing.
> 
> Agreed.
> 
> > Also, we already have an option called BR2_ARC_PAGE_SIZE, which
> > contains 4K, 8K or 16K, so I thought if we could use it here as well. I
> > think we can, but I'd like to hear from Yann about this, because it
> > uses bash arithmetic, which I'm not sure we're allowed to use:
> >
> > ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=$(shell echo $$(($(patsubst
> %K,%,$(BR2_ARC_PAGE_SIZE)) * 1024)))
> 
> We can do bash arithmetics, because we are guaranteed we use bash as our
> shell, see: https://urldefense.proofpoint.com/v2/url?u=https-
> 3A__git.buildroot.org_buildroot_tree_Makefile-
> 23n30&d=DwIBaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=Z74rKOsEpOUneCxYxwKcXHwrAmW8mJhNZjcWnDDJI2U&m=G0xH-
> XYcb2iYOg2bibx_AguTrgrtfR3aD7pVbOW09Q0&s=_K73mNAFEXxJcdkCnKJRzs-VXkSvcFKryO2ZYmXj1LI&e=
> 
> But BR2_ARC_PAGE_SIZE is a string, so it is double-quoted, which would
> break the above.
> 
> I was also contemplating a similar solution, but I was not too happy
> with this trick to drop the suffix. I would have prefered something
> like:
> 
>     config BR2_ARC_PAGE_SIZE_KB
>         int
>         default 4 if BR2_ARC_PAGE_SIZE_4K
>         default 8 if BR2_ARC_PAGE_SIZE_8K
>         default 16 if BR2_ARC_PAGE_SIZE_16K
> 
> and then:
> 
>     ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=$(shell echo $$(($(BR2_ARC_PAGE_SIZE)*1024)))
> 
> and in package/uclibc/uclibc.mk:
> 
>     UCLIBC_ARC_PAGE_SIZE = CONFIG_ARC_PAGE_SIZE_$(BR2_ARC_PAGE_SIZE)K
> 
> ... and even that intermediate variable could have been dropped
> altogether, to directly write:
> 
>         $(call KCONFIG_ENABLE_OPT,CONFIG_ARC_PAGE_SIZE_$(BR2_ARC_PAGE_SIZE)K,$(@D)/.config)
> 
> And that would have been a bit nicer, I believe.

Agree. So, Yann [as usually] are you OK if I implement that improvement?

-Alexey
