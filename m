From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 22:39:52 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain: Fix the toolchain-wrapper to
 support more recent GCC versions
In-Reply-To: <1515514108-18962-1-git-send-email-johannes.schmitz1@gmail.com>
References: <1515514108-18962-1-git-send-email-johannes.schmitz1@gmail.com>
Message-ID: <20180112223952.754b344d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Jan 2018 17:08:27 +0100, Johannes Schmitz wrote:
> This fix is necessary for to build for MIPS, for example for the MIPS
> XBurst architecture used on ci20 boards.
> 
> Signed-off-by: Johannes Schmitz <johannes.schmitz1@gmail.com>

This is a bit short on explanation. Can you explain what it is fixing?
Why is -mno-fused-madd no longer sufficient in recent gcc versions?

The commit title is also not quite good, it doesn't mention that it's
MIPS-related. Perhaps:

toolchain: use -ffp-contract=off on MIPS XBust in the wrapper when needed

> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> index 2928ea4..dd3a25e 100644
> --- a/toolchain/toolchain-wrapper.c
> +++ b/toolchain/toolchain-wrapper.c
> @@ -79,8 +79,14 @@ static char *predef_args[] = {
>  #ifdef BR_OMIT_LOCK_PREFIX
>  	"-Wa,-momit-lock-prefix=yes",
>  #endif
> -#ifdef BR_NO_FUSED_MADD
> -	"-mno-fused-madd",
> +#ifdef BR2_TOOLCHAIN_GCC_AT_LEAST_4_6

This condition is not needed, because toolchain-wrapper.mk is already
taking care of passing BR_NO_FUSED_MADD or BR2_FP_CONTRACT_OFF.

> +	#ifdef BR_FP_CONTRACT_OFF
> +		"-ffp-contract=off",
> +	#endif
> +#else
> +	#ifdef BR_NO_FUSED_MADD
> +		"-mno-fused-madd",
> +	#endif
>  #endif
>  #ifdef BR_BINFMT_FLAT
>  	"-Wl,-elf2flt",
> diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
> index 7f72a0c..b7a4b9b 100644
> --- a/toolchain/toolchain-wrapper.mk
> +++ b/toolchain/toolchain-wrapper.mk
> @@ -28,7 +28,11 @@ endif
>  
>  # Avoid FPU bug on XBurst CPUs
>  ifeq ($(BR2_mips_xburst),y)
> -TOOLCHAIN_WRAPPER_ARGS += -DBR_NO_FUSED_MADD
> +	ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_4_6),y)
> +		TOOLCHAIN_WRAPPER_ARGS += -DBR_FP_CONTRACT_OFF
> +	else
> +		TOOLCHAIN_WRAPPER_ARGS += -DBR_NO_FUSED_MADD
> +	endif

Please don't indent lines. That's the Buildroot convention.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
