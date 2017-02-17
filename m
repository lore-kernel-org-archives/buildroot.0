From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Feb 2017 14:26:18 +0100
Subject: [Buildroot] [PATCH] linux-tools/perf: fix build for MIPS by
 using the right emulation on LD
In-Reply-To: <20170217105905.32151-1-Vincent.Riera@imgtec.com>
References: <20170217105905.32151-1-Vincent.Riera@imgtec.com>
Message-ID: <20170217142618.61aa568d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Feb 2017 10:59:05 +0000, Vicente Olivert Riera wrote:

> +# We need to pass an argument to ld for setting the emulation when
> +# building for MIPS architecture, otherwise the default one will always
> +# be used and the compilation for most variants will fail.
> +ifeq ($(BR2_mips),y)
> +PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf32btsmip"
> +else ifeq ($(BR2_mipsel),y)
> +PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf32ltsmip"
> +else ifeq ($(BR2_mips64),y)
> +ifeq ($(BR2_MIPS_NABI32),y)
> +PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf32btsmipn32"
> +else
> +PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf64btsmip"
> +endif
> +else ifeq ($(BR2_mips64el),y)
> +ifeq ($(BR2_MIPS_NABI32),y)
> +PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf32ltsmipn32"
> +else
> +PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf64ltsmip"
> +endif
>  endif

This is really getting nasty, especially since gcc already knows about
this. Why not use gcc instead of ld?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
