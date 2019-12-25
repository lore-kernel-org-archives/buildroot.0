From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Dec 2019 22:36:03 +0100
Subject: [Buildroot] [PATCH] arch/arc: Explicitly set "max-page-size"
 for GNU LD
In-Reply-To: <20191224141032.34544-1-abrodkin@synopsys.com>
References: <20191224141032.34544-1-abrodkin@synopsys.com>
Message-ID: <20191225223603.360a7ffa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 24 Dec 2019 17:10:32 +0300
Alexey Brodkin <Alexey.Brodkin@synopsys.com> wrote:

> Back in the day we relied on a default value that used to be 8KiB
> and it worked perfectly fine for ARC's default 8KiB page as well as
> 4 KiB ones, but not for 16 KiB, see [1] for more details.
> 
> So that we fixed by setting "max-page-size" if 16KiB pages are in use by
> commit d024d369b82d2 ("arch/arc: Accommodate 16 KiB MMU pages").
> 
> But as Yann very rightfully mentioned here [2] we should be setting this
> thing explicitly for all page sizes because:
>  1. Defaults might change unexpectedly
>  2. Explicitly set stuff is better understood
>  3. We act similarly to all settings but not only addressing some corner cases
> 
> [1] https://git.buildroot.org/buildroot/commit/?id=d024d369b82d2d3d9d4d75489c19e9488202bca0
> [2] https://patchwork.ozlabs.org/patch/1212544/#2330647
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

I have applied to master, with one change (see below), and I have one
suggestion (see below as well).


> -# By default MAXPAGESIZE for ARC is 8192 so for larger MMU pages
> -# it needs to be overridden.
> +# Explicitly set LD's "max-page-size" instead of relying on some defaults
> +ifeq ($(BR2_ARC_PAGE_SIZE_4K),y)
> +ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=4096
> +endif
> +
> +ifeq ($(BR2_ARC_PAGE_SIZE_8K),y)
> +ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=8192
> +endif
> +
>  ifeq ($(BR2_ARC_PAGE_SIZE_16K),y)
>  ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=16384
>  endif

Since these options are mutually exclusive:

ifeq ($(BR2_ARC_PAGE_SIZE_4K),y)
ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=4096
else ifeq ($(BR2_ARC_PAGE_SIZE_8K),y)
ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=8192
else ifeq ($(BR2_ARC_PAGE_SIZE_16K),y)
ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=16384
endif

is a bit more compact, so I changed to use this before committing.

Also, we already have an option called BR2_ARC_PAGE_SIZE, which
contains 4K, 8K or 16K, so I thought if we could use it here as well. I
think we can, but I'd like to hear from Yann about this, because it
uses bash arithmetic, which I'm not sure we're allowed to use:

ARCH_TOOLCHAIN_WRAPPER_OPTS += -Wl,-z,max-page-size=$(shell echo $$(($(patsubst %K,%,$(BR2_ARC_PAGE_SIZE)) * 1024)))

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
