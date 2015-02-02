From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 02 Feb 2015 17:18:11 +0100
Subject: [Buildroot] [PATCH 2/4] arm: update processor types
In-Reply-To: <1421951608-31233-3-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1421951608-31233-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1421951608-31233-3-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <54CFA343.9090806@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ezequiel,

Le 22/01/2015 19:33, Ezequiel Garcia a ?crit :
> From: Guido Mart?nez <guido@vanguardiasur.com.ar>
> 
> Add the Cortex M3 variant. These microcontrollers don't support regular
> ARM instructions and don't have an MMU.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> ---
>  arch/Config.in                | 8 ++++----
>  arch/Config.in.arm            | 5 +++++
>  toolchain/toolchain-common.in | 6 ++++--
>  3 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/Config.in b/arch/Config.in
> index 890e7e2..6f7d608 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -258,13 +258,13 @@ config BR2_BINFMT_SUPPORTS_SHARED
>  # Set up target binary format
>  choice
>  	prompt "Target Binary Format"
> -	default BR2_BINFMT_ELF if !(BR2_bfin || BR2_m68k)
> +	default BR2_BINFMT_ELF if !(BR2_bfin || BR2_m68k || BR2_cortex_m3)
>  	default BR2_BINFMT_FDPIC if BR2_bfin
> -	default BR2_BINFMT_FLAT if BR2_m68k
> +	default BR2_BINFMT_FLAT if BR2_m68k || BR2_cortex_m3

What do you think about adding BR2_ARCH_HAS_EFL_SUPPORT in each architecture
Config.in.x instead of black-listing them here ?

>  
>  config BR2_BINFMT_ELF
>  	bool "ELF"
> -	depends on !BR2_bfin && !BR2_m68k
> +	depends on !BR2_bfin && !BR2_m68k && !BR2_cortex_m3
>  	select BR2_BINFMT_SUPPORTS_SHARED
>  	help
>  	  ELF (Executable and Linkable Format) is a format for libraries and
> @@ -283,7 +283,7 @@ config BR2_BINFMT_FDPIC
>  
>  config BR2_BINFMT_FLAT
>  	bool "FLAT"
> -	depends on BR2_bfin || BR2_m68k
> +	depends on BR2_bfin || BR2_m68k || BR2_cortex_m3

Same here with BR2_ARCH_HAS_FLAT_SUPPORT.

>  	help
>  	  FLAT binary is a relatively simple and lightweight executable format
>  	  based on the original a.out format. It is widely used in environment
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index a2d113a..1e22ab8 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -134,6 +134,10 @@ config BR2_cortex_a15
>  	select BR2_ARM_CPU_HAS_VFPV4
>  	select BR2_ARM_CPU_HAS_THUMB2
>  	select BR2_ARM_CPU_ARMV7A
> +config BR2_cortex_m3
> +	bool "cortex-M3"
> +	select BR2_ARM_CPU_HAS_THUMB
> +	select BR2_ARM_CPU_HAS_THUMB2
>  config BR2_fa526
>  	bool "fa526/626"
>  	select BR2_ARM_CPU_HAS_ARM
> @@ -396,6 +400,7 @@ config BR2_GCC_TARGET_CPU
>  	default "cortex-a9"	if BR2_cortex_a9
>  	default "cortex-a12"	if BR2_cortex_a12
>  	default "cortex-a15"	if BR2_cortex_a15
> +	default "cortex-m3"	if BR2_cortex_m3
>  	default "fa526"		if BR2_fa526
>  	default "marvell-pj4"	if BR2_pj4
>  	default "strongarm"	if BR2_strongarm
> diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
> index 2ee2019..fd6ef53 100644
> --- a/toolchain/toolchain-common.in
> +++ b/toolchain/toolchain-common.in
> @@ -114,8 +114,10 @@ config BR2_NEEDS_GETTEXT_IF_LOCALE
>  	default y if (BR2_NEEDS_GETTEXT && BR2_ENABLE_LOCALE)
>  
>  config BR2_USE_MMU
> -	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_sh || BR2_xtensa
> -	default y if !BR2_bfin
> +	bool "Enable MMU support"
> +	depends on BR2_arm || BR2_armeb || BR2_sh || BR2_xtensa
> +	depends on !BR2_cortex_m3 && !BR2_bfin
> +	default y

And here with BR2_ARCH_HAS_MMU_SUPPORT ?

>  	help
>  	  If your target has a MMU, you should say Y here.  If you
>  	  are unsure, just say Y.
> 

Best regards,
Romain Naour
