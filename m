From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Mar 2016 19:27:53 +0100
Subject: [Buildroot] [PATCH 1/2] m68k: enable internal toolchain
In-Reply-To: <20160319172656.GA19850@waldemar-brodkorb.de>
References: <20160319172656.GA19850@waldemar-brodkorb.de>
Message-ID: <20160319192753.45ac97e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar,

On Sat, 19 Mar 2016 18:26:56 +0100, Waldemar Brodkorb wrote:
> This allows to build a m68k toolchain.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Thanks! One question below, though.

> diff --git a/arch/Config.in b/arch/Config.in
> index 401bd28..3f1453f 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -95,7 +95,6 @@ config BR2_i386
>  config BR2_m68k
>  	bool "m68k"
>  	select BR2_ARCH_HAS_MMU_MANDATORY

Are you sure all the m68k have a MMU ?

According to https://en.wikipedia.org/wiki/Motorola_68000_series, it
seems like the MMU appeared in 68030, so 68000, 68010 and 68020
probably don't have a MMU.

According to http://www.linux-m68k.org/faq/reqs.html:

  You need a Motorola 680x0 processor with a programmable memory
  management unit (PMMU). There is no way to run Linux/m68k without
  one. This reduces the list of possible processors to 68020+68851,
  68030, 68040, 68LC040, and 68060. This list of processors excludes
  the 68000, 68HC000, 68008, 68010, 68EC020, 68EC030, and 68EC040. It
  also excludes the CPU32 processors (683x0 series) and the ColdFire
  processor.

However, I believe this is not completely correct, as Linux definitely
runs on some Coldfire, as the later variants have gotten a MMU.

> -config BR2_GCC_TARGET_ARCH
> +choice
> +	prompt "Target CPU"
> +	depends on BR2_m68k
> +	default BR2_m68k_68040
> +	help
> +	  Specific CPU variant to use
> +
> +config BR2_m68k_68000
> +	bool "68000"
> +config BR2_m68k_68010
> +	bool "68010"
> +config BR2_m68k_68020
> +	bool "68020"
> +config BR2_m68k_68030
> +	bool "68030"
> +config BR2_m68k_68040
> +	bool "68040"
> +config BR2_m68k_68060
> +	bool "68060"
> +
> +endchoice
> +
> +config BR2_GCC_TARGET_CPU
>  	default "68000"		if BR2_m68k_68000
>  	default "68010"		if BR2_m68k_68010
>  	default "68020"		if BR2_m68k_68020

Maybe to get started you should simply support the 68040 which you have
tested, and leave the rest for later, once it is understood which
variant has a MMU, which variant does not?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
