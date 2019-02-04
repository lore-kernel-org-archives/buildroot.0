From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 21:14:06 +0100
Subject: [Buildroot] [PATCH v1] package/qt5/qt5base: handle
 sse2/sse3/ssse3/sse4.1/sse4.2/avx/avx2 configuration
In-Reply-To: <20190201202452.11724-1-ps.report@gmx.net>
References: <20190201202452.11724-1-ps.report@gmx.net>
Message-ID: <20190204211406.48b446b9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Fri,  1 Feb 2019 21:24:52 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> +ifeq ($(BR2_X86_CPU_HAS_SSE2),)
> +QT5BASE_CONFIGURE_OPTS += -no-sse2
> +else
> +ifeq ($(BR2_X86_CPU_HAS_SSE3),)
> +QT5BASE_CONFIGURE_OPTS += -no-sse3
> +else
> +ifeq ($(BR2_X86_CPU_HAS_SSSE3),)
> +QT5BASE_CONFIGURE_OPTS += -no-ssse3
> +else
> +ifeq ($(BR2_X86_CPU_HAS_SSE4),)
> +QT5BASE_CONFIGURE_OPTS += -no-sse4.1
> +else
> +ifeq ($(BR2_X86_CPU_HAS_SSE42),)
> +QT5BASE_CONFIGURE_OPTS += -no-sse4.2
> +else
> +ifeq ($(BR2_X86_CPU_HAS_AVX),)
> +QT5BASE_CONFIGURE_OPTS += -no-avx
> +else
> +ifeq ($(BR2_X86_CPU_HAS_AVX2),)
> +QT5BASE_CONFIGURE_OPTS += -no-avx2
> +else
> +# no BR2_X86_CPU_HAS_AVX512 for qt configure option
> +# '-no-avx512' (available for latest)
> +endif
> +endif
> +endif
> +endif
> +endif
> +endif
> +endif

Instead of:

ifeq ...

else
ifeq ...

else
ifeq ...

endif
endif
endif

which requires a lot of endifs, you can do:

ifeq ...

else ifeq ...

else ifeq ...

else ifeq ...

endif

which is a bit nicer.

However, like Titouan, I'd like to get a confirmation that those "else"
conditions are what you want. For example, when you don't have SSE2,
you also don't have SSE3. But in such a situation, you're just passing
-no-sse2. Is this expected ? If so, a quick explanation in the commit
log about this would be nice. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
