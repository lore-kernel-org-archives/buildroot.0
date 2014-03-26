From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Mar 2014 18:18:35 +0100
Subject: [Buildroot] [PATCH v3] Disable o32 ABI for MIPS64 architectures
In-Reply-To: <1395843340-18539-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1395843340-18539-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <53330BEB.3090206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/03/14 15:15, Vicente Olivert Riera wrote:
> Building o32 ELF files for MIPS64 is an exotic configuration that nobody
> should be using. If o32 is required, then is better if it's built for
> MIPS 32-bit cores so only 32-bit instructions will be used leading to a
> more efficient o32 usage.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  CHANGES             |    8 ++++++++
>  arch/Config.in.mips |   12 +++++++-----
>  2 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/CHANGES b/CHANGES
> index 45a31c4..f07ccfd 100644
> --- a/CHANGES
> +++ b/CHANGES
> @@ -1,3 +1,11 @@
> +2014.05, Not yet released:
> +
> +Support for MIPS o32 ABI on MIPS-64 targets has been removed. Building 
> +o32 ELF files for MIPS64 is an exotic configuration that nobody should 
> +be using. If o32 is required, then is better if it's built for MIPS 
> +32-bit cores so only 32-bit instructions will be used leading to a more 
> +efficient o32 usage.
> +
>  2014.02, Released February 27th, 2014
>  
>  	Minor fixes.
> diff --git a/arch/Config.in.mips b/arch/Config.in.mips
> index d9c0c02..f558705 100644
> --- a/arch/Config.in.mips
> +++ b/arch/Config.in.mips
> @@ -38,15 +38,12 @@ endchoice
>  
>  choice
>  	prompt "Target ABI"
> -	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
> -	default BR2_MIPS_OABI32 if !BR2_ARCH_IS_64
> -	default BR2_MIPS_NABI32 if BR2_ARCH_IS_64
> +	depends on BR2_mips64 || BR2_mips64el
> +	default BR2_MIPS_NABI32
>  
>  	help
>  	  Application Binary Interface to use
>  
> -config BR2_MIPS_OABI32
> -	bool "o32"
>  config BR2_MIPS_NABI32
>  	bool "n32"
>  	depends on BR2_ARCH_IS_64
> @@ -86,6 +83,11 @@ config BR2_GCC_TARGET_ARCH
>  	default "mips64"	if BR2_mips_64
>  	default "mips64r2"	if BR2_mips_64r2
>  
> +config BR2_MIPS_OABI32
> +	bool
> +	default y		if BR2_mips || BR2_mipsel
> +	default n		if BR2_mips64 || BR2_mips64el

 Did you forget to remove this or is there a reason to keep it? In the
latter case, please add an explanatory comment.

 Regards,
 Arnout

> +
>  config BR2_GCC_TARGET_ABI
>  	default "32"		if BR2_MIPS_OABI32
>  	default "n32"		if BR2_MIPS_NABI32
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
