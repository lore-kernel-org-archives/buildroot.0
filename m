From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Mar 2019 23:22:11 +0100
Subject: [Buildroot] [PATCH v3 1/3] arch: add support for Andes
 32-bit(nds32)
In-Reply-To: <20190307021125.8530-2-nylon7@andestech.com>
References: <20190307021125.8530-1-nylon7@andestech.com>
 <20190307021125.8530-2-nylon7@andestech.com>
Message-ID: <20190314222211.GB6876@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nylon, All,

On 2019-03-07 10:11 +0800, Nylon Chen spake thusly:
> This commit provides basic support for the Andes 32-bit(nds32) architecture.

Out of curiosity, and just for my information: do you have examples of
products shipping with an nds32 CPU?

I have a few comments (the last one very minor), see below...

> Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
> Signed-off-by: Greentime Hu <greentime@andestech.com>
> Signed-off-by: Nylon Chen <nylon7@andestech.com>
> ---
>  DEVELOPERS           |  3 +++
>  arch/Config.in       | 12 ++++++++++++
>  arch/Config.in.nds32 | 19 +++++++++++++++++++
>  3 files changed, 34 insertions(+)
>  create mode 100644 arch/Config.in.nds32
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c17ba6db99..06a20c68b6 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1605,6 +1605,9 @@ F:	package/trousers/
>  N:	Norbert Lange <nolange79@gmail.com>
>  F:	package/tcf-agent/
>  
> +N:	Nylon Chen <nylon7@andestech.com>
> +F:	arch/Config.in.nds32
> +
>  N:	Olaf Rempel <razzor@kopf-tisch.de>
>  F:	package/ctorrent/
>  
> diff --git a/arch/Config.in b/arch/Config.in
> index f50760a0cf..d82803c828 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -154,6 +154,14 @@ config BR2_mips64el
>  	  http://www.mips.com/
>  	  http://en.wikipedia.org/wiki/MIPS_Technologies
>  
> +config BR2_nds32
> +	bool "nds32"
> +	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT

It would be nice that you provide a package for a pre-built toolchain,
like we have for a few of them, see:

    toolchain/toolchain-external/

This is not mandatory, but would be a good addition.

It would even make the defconfig in your second patch a bit simpler.

> +	select BR2_ARCH_HAS_MMU_MANDATORY
> +	help
> +	  nds32 is a 32-bit architecture developed by Andes Technology.
> +	  https://en.wikipedia.org/wiki/Andes_Technology
> +
>  config BR2_nios2
>  	bool "Nios II"
>  	select BR2_ARCH_HAS_MMU_MANDATORY
> @@ -419,6 +427,10 @@ if BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el
>  source "arch/Config.in.mips"
>  endif
>  
> +if BR2_nds32
> +source "arch/Config.in.nds32"
> +endif
> +
>  if BR2_nios2
>  source "arch/Config.in.nios2"
>  endif
> diff --git a/arch/Config.in.nds32 b/arch/Config.in.nds32
> new file mode 100644
> index 0000000000..38b1c2d4eb
> --- /dev/null
> +++ b/arch/Config.in.nds32
> @@ -0,0 +1,19 @@
> +config BR2_ARCH
> +	default "nds32"
> +
> +config BR2_ANDES_NDS32_FPU
> +	bool "Enable FPU coprocessor"
> +	help
> +	  You can say y here if your Andes CPU have a Floating-Point Coprocessor
> +	  or if you need FPU support for your user-space programs.

So, the situation about FPU is always a bit icky for me.

If you say 'n' above, does that mean that you need to do a pure
soft-float build, or that the FP instrcution get trapped an emulated
by the kernel?

If the former, then you may want to check whether you need to select
BR2_SOFT_FLOAT (a few packages have conditions based on that).

> +config BR2_GCC_TARGET_ARCH
> +	default "v3"  if !BR2_ANDES_NDS32_FPU
> +	default "v3f" if BR2_ANDES_NDS32_FPU

I always find it nicer to have the positive logic come first. Also,
kconfig will stop on the first default stanza which condition is true,
so:

    config BR2_GCC_TARGET_ARCH
        default "v3f" if BR2_ANDES_NDS32_FPU
        default "v3"

> +config BR2_ENDIAN
> +	default "LITTLE"
> +
> +config BR2_READELF_ARCH_NAME
> +	default "Andes Technology compact code size embedded RISC processor family"
> +
> -- 
> 2.18.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
