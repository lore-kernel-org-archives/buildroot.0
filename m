From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2016 21:46:38 +0200
Subject: [Buildroot] [PATCH] MIPS: add support for M6201 cores
In-Reply-To: <20161018155525.29327-1-Vincent.Riera@imgtec.com>
References: <20161018155525.29327-1-Vincent.Riera@imgtec.com>
Message-ID: <572899bc-b196-b9de-082b-3e43547f1ecd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-10-16 17:55, Vicente Olivert Riera wrote:
> -march=m6201 is not yet supported in GCC upstream, so disabling all
> versions when selecting this core.
> 
> Note that M6201 implies a MIPS R6 CPU, and some GCC versions are already
> disabled for R6, so we don't need to disable those ones for M6201 as
> well.
> 
> The external Codescape IMG GNU Linux Toolchain has support for this
> core.

 However, BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS supports MIPS32R6 and I don't expect
it supports this core...

 Regards,
 Arnout

> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  arch/Config.in.mips        | 5 +++++
>  package/gcc/Config.in.host | 5 +++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/Config.in.mips b/arch/Config.in.mips
> index f7bfa21..3662fed 100644
> --- a/arch/Config.in.mips
> +++ b/arch/Config.in.mips
> @@ -55,6 +55,10 @@ config BR2_mips_m5101
>  	bool "M5101"
>  	depends on !BR2_ARCH_IS_64
>  	select BR2_MIPS_CPU_MIPS32R5
> +config BR2_mips_m6201
> +	bool "M6201"
> +	depends on !BR2_ARCH_IS_64
> +	select BR2_MIPS_CPU_MIPS32R6
>  config BR2_mips_p5600
>  	bool "P5600"
>  	depends on !BR2_ARCH_IS_64
> @@ -131,6 +135,7 @@ config BR2_GCC_TARGET_ARCH
>  	default "interaptiv"	if BR2_mips_interaptiv
>  	default "m5100"		if BR2_mips_m5100
>  	default "m5101"		if BR2_mips_m5101
> +	default "m6201"		if BR2_mips_m6201
>  	default "p5600"		if BR2_mips_p5600
>  	default "mips64"	if BR2_mips_64
>  	default "mips64r2"	if BR2_mips_64r2
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index df60c65..d204bf7 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -63,7 +63,8 @@ choice
>  		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
>  		# Unsupported MIPS cores
>  		depends on !BR2_mips_interaptiv && !BR2_mips_m5100 && \
> -			!BR2_mips_m5101 && !BR2_mips_i6400 && !BR2_mips_p6600
> +			!BR2_mips_m5101 && !BR2_mips_m6201 && !BR2_mips_i6400 && \
> +			!BR2_mips_p6600
>  		# musl mips64 unsupported
>  		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
>  		select BR2_TOOLCHAIN_GCC_AT_LEAST_5
> @@ -73,7 +74,7 @@ choice
>  		# Broken or unsupported architectures
>  		depends on !BR2_arc
>  		# Unsupported MIPS cores
> -		depends on !BR2_mips_p6600
> +		depends on !BR2_mips_m6201 && !BR2_mips_p6600
>  		select BR2_TOOLCHAIN_GCC_AT_LEAST_6
>  
>  endchoice
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
