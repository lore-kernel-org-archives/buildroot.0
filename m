From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 Oct 2016 20:22:13 +0200
Subject: [Buildroot] [PATCH v2 1/2] MIPS: add support for XBurst cores
In-Reply-To: <20161021094557.41859-1-Vincent.Riera@imgtec.com>
References: <20161021094557.41859-1-Vincent.Riera@imgtec.com>
Message-ID: <695f8b59-fb16-eaf9-8a0c-de733b810743@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-10-16 11:45, Vicente Olivert Riera wrote:
> - There isn't any matching -march option for this core family, so we
>   need to stick with the generic mips32r2.
> - Add an option to the toolchain wrapper to avoid an FPU bug.

 You commit log should explain in more detail that this is actually a generic
mips32r2 core, but it has a hardware bug that has to be worked around.

> 
> Related: http://www.ingenic.com/en/?xburst.html
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> ---
> Changes v1 -> v2:
>  - Do not add -mmxu to the wrapper.
> ---
>  arch/Config.in.mips            | 5 +++++
>  toolchain/toolchain-wrapper.c  | 3 +++
>  toolchain/toolchain-wrapper.mk | 5 +++++
>  3 files changed, 13 insertions(+)
> 
> diff --git a/arch/Config.in.mips b/arch/Config.in.mips
> index 3662fed..3075d3f 100644
> --- a/arch/Config.in.mips
> +++ b/arch/Config.in.mips
> @@ -63,6 +63,10 @@ config BR2_mips_p5600
>  	bool "P5600"
>  	depends on !BR2_ARCH_IS_64
>  	select BR2_MIPS_CPU_MIPS32R5
> +config BR2_mips_xburst
> +	bool "XBurst"
> +	depends on !BR2_ARCH_IS_64
> +	select BR2_MIPS_CPU_MIPS32R2

 Since this is a special case, it makes sense to add a help text here to explain
the details and add a reference. Like it's done for BR2_x86_x1000.

>  config BR2_mips_64
>  	bool "Generic MIPS64"
>  	depends on BR2_ARCH_IS_64
> @@ -137,6 +141,7 @@ config BR2_GCC_TARGET_ARCH
>  	default "m5101"		if BR2_mips_m5101
>  	default "m6201"		if BR2_mips_m6201
>  	default "p5600"		if BR2_mips_p5600
> +	default "mips32r2"	if BR2_mips_xburst
>  	default "mips64"	if BR2_mips_64
>  	default "mips64r2"	if BR2_mips_64r2
>  	default "mips64r5"	if BR2_mips_64r5
> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> index 925d013..d59629b 100644
> --- a/toolchain/toolchain-wrapper.c
> +++ b/toolchain/toolchain-wrapper.c
> @@ -66,6 +66,9 @@ static char *predef_args[] = {
>  #ifdef BR_OMIT_LOCK_PREFIX
>  	"-Wa,-momit-lock-prefix=yes",
>  #endif
> +#ifdef BR_NO_FUSED_MADD
> +	"-mno-fused-madd",
> +#endif

 So this is definitely NOT what we want. We want it in TARGET_FLAGS, i.e. we
want it in a series together with http://patchwork.ozlabs.org/patch/683830/
At least I do :-)

 Regards,
 Arnout

>  #ifdef BR_BINFMT_FLAT
>  	"-Wl,-elf2flt",
>  #endif
> diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
> index af39071..dc3210d 100644
> --- a/toolchain/toolchain-wrapper.mk
> +++ b/toolchain/toolchain-wrapper.mk
> @@ -26,6 +26,11 @@ ifeq ($(BR2_x86_x1000),y)
>  TOOLCHAIN_WRAPPER_ARGS += -DBR_OMIT_LOCK_PREFIX
>  endif
>  
> +# Avoid FPU bug on XBurst CPUs
> +ifeq ($(BR2_mips_xburst),y)
> +TOOLCHAIN_WRAPPER_ARGS += -DBR_NO_FUSED_MADD
> +endif
> +
>  ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
>  TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
>  endif
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
