From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 26 Dec 2019 18:05:04 +0100
Subject: [Buildroot] [PATCH] arch/arc: Explicitly set "max-page-size"
 for GNU LD
In-Reply-To: <20191225223603.360a7ffa@windsurf>
References: <20191224141032.34544-1-abrodkin@synopsys.com>
 <20191225223603.360a7ffa@windsurf>
Message-ID: <20191226170504.GP26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Alexey, All,

On 2019-12-25 22:36 +0100, Thomas Petazzoni spake thusly:
> On Tue, 24 Dec 2019 17:10:32 +0300
> Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:
> > Back in the day we relied on a default value that used to be 8KiB
> > and it worked perfectly fine for ARC's default 8KiB page as well as
> > 4 KiB ones, but not for 16 KiB, see [1] for more details.
> > 
> > So that we fixed by setting "max-page-size" if 16KiB pages are in use by
> > commit d024d369b82d2 ("arch/arc: Accommodate 16 KiB MMU pages").
> > 
> > But as Yann very rightfully mentioned here [2] we should be setting this
> > thing explicitly for all page sizes because:
> >  1. Defaults might change unexpectedly
> >  2. Explicitly set stuff is better understood
> >  3. We act similarly to all settings but not only addressing some corner cases
> > 
> > [1] https://git.buildroot.org/buildroot/commit/?id=d024d369b82d2d3d9d4d75489c19e9488202bca0
> > [2] https://patchwork.ozlabs.org/patch/1212544/#2330647
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> 
> > -# By default MAXPAGESIZE for ARC is 8192 so for larger MMU pages
> > -# it needs to be overridden.
> > +# Explicitly set LD's "max-page-size" instead of relying on some defaults
> > +ifeq ($(BR2_ARC_PAGE_SIZE_4K),y)
> > +ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=4096
> > +endif
> > +
> > +ifeq ($(BR2_ARC_PAGE_SIZE_8K),y)
> > +ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=8192
> > +endif
> > +
> >  ifeq ($(BR2_ARC_PAGE_SIZE_16K),y)
> >  ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=16384
> >  endif
> 
> Since these options are mutually exclusive:
> 
> ifeq ($(BR2_ARC_PAGE_SIZE_4K),y)
> ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=4096
> else ifeq ($(BR2_ARC_PAGE_SIZE_8K),y)
> ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=8192
> else ifeq ($(BR2_ARC_PAGE_SIZE_16K),y)
> ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=16384
> endif
> 
> is a bit more compact, so I changed to use this before committing.

Agreed.

> Also, we already have an option called BR2_ARC_PAGE_SIZE, which
> contains 4K, 8K or 16K, so I thought if we could use it here as well. I
> think we can, but I'd like to hear from Yann about this, because it
> uses bash arithmetic, which I'm not sure we're allowed to use:
> 
> ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=$(shell echo $$(($(patsubst %K,%,$(BR2_ARC_PAGE_SIZE)) * 1024)))

We can do bash arithmetics, because we are guaranteed we use bash as our
shell, see: https://git.buildroot.org/buildroot/tree/Makefile#n30

But BR2_ARC_PAGE_SIZE is a string, so it is double-quoted, which would
break the above.

I was also contemplating a similar solution, but I was not too happy
with this trick to drop the suffix. I would have prefered something
like:

    config BR2_ARC_PAGE_SIZE_KB
        int
        default 4 if BR2_ARC_PAGE_SIZE_4K
        default 8 if BR2_ARC_PAGE_SIZE_8K
        default 16 if BR2_ARC_PAGE_SIZE_16K

and then:

    ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=$(shell echo $$(($(BR2_ARC_PAGE_SIZE)*1024)))

and in package/uclibc/uclibc.mk:

    UCLIBC_ARC_PAGE_SIZE = CONFIG_ARC_PAGE_SIZE_$(BR2_ARC_PAGE_SIZE)K

... and even that intermediate variable could have been dropped
altogether, to directly write:

        $(call KCONFIG_ENABLE_OPT,CONFIG_ARC_PAGE_SIZE_$(BR2_ARC_PAGE_SIZE)K,$(@D)/.config)

And that would have been a bit nicer, I believe.

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
