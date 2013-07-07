From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 07 Jul 2013 22:24:05 +0200
Subject: [Buildroot] [PATCH 2/8] arch: Refactor BR2_SOFT_FLOAT into
	per-architecture options
In-Reply-To: <1373123292-15085-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 6 Jul 2013 17:08:06 +0200")
References: <1373123292-15085-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373123292-15085-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vc4mglui.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> As we are going to introduced a more advanced support of floating
 Thomas> point options for the ARM architecture, we need to adjust how the
 Thomas> soft-float option is handled. We replace the current hidden option
 Thomas> BR2_PREFER_SOFT_FLOAT option and the visible BR2_SOFT_FLOAT option by:

 Thomas>  * A global hidden BR2_SOFT_FLOAT option, defined in arch/Config.in,
 Thomas>    that tells whether the architecture-specific code is using software
 Thomas>    emulated floating point. This hidden option can be used throughout
 Thomas>    Buildroot to determine whether soft float is used or not.

 Thomas>  * Per-architecture visible BR2_<arch>_SOFT_FLOAT options, for the
 Thomas>    architecture for which it makes sense, which allows users to select
 Thomas>    soft float emulation when needed.

 Thomas> This change will allow each architecture to have a different way of
 Thomas> presenting its floating point capabilities.

 Thomas> diff --git a/arch/Config.in.avr32 b/arch/Config.in.avr32
 Thomas> index ebf8454..34055d9 100644
 Thomas> --- a/arch/Config.in.avr32
 Thomas> +++ b/arch/Config.in.avr32
 Thomas> @@ -3,3 +3,13 @@ config BR2_ARCH
 
 Thomas>  config BR2_ENDIAN
 Thomas>         default "BIG"
 Thomas> +
 Thomas> +config BR2_AVR32_SOFT_FLOAT
 Thomas> +	bool "Use soft-float"
 Thomas> +	default y
 Thomas> +	select BR2_SOFT_FLOAT
 Thomas> +	help
 Thomas> +	  If your target CPU does not have a Floating Point Unit (FPU)
 Thomas> +	  or a kernel FPU emulator, but you still wish to support
 Thomas> +	  floating point functions, then everything will need to be
 Thomas> +	  compiled with soft floating point support (-msoft-float).

Does avr32 SoCs with hard float even exist? Does
uClibc/kernel/.. support it? If not, we could just make this a hidden
option.
 
 Thomas> +config BR2_POWERPC_SOFT_FLOAT
 Thomas> +	bool "Use soft-float"
 Thomas> +	default y
 Thomas> +	select BR2_SOFT_FLOAT
 Thomas> +	help
 Thomas> +	  If your target CPU does not have a Floating Point Unit (FPU)
 Thomas> +	  or a kernel FPU emulator, but you still wish to support
 Thomas> +	  floating point functions, then everything will need to be
 Thomas> +	  compiled with soft floating point support (-msoft-float).

We didn't use to default to soft float for powerpc, as most cores have a
FPU.
 
 Thomas> -config BR2_PREFER_SOFT_FLOAT
 Thomas> -	bool
 Thomas> -	default y if BR2_arm
 Thomas> -	default y if BR2_armeb
 Thomas> -	default y if BR2_avr32
 Thomas> -	default y if BR2_mips
 Thomas> -	default y if BR2_mipsel

-- 
Bye, Peter Korsgaard
