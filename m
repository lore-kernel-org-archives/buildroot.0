From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 7 Oct 2017 11:27:32 +0200
Subject: [Buildroot] [PATCH 3/8] toolchain/external-custom: hide
 versions too old for the current arch
In-Reply-To: <a9dc18ece6b62e3ac4ce274b708081a9d16bb6aa.1504431850.git.yann.morin.1998@free.fr>
References: <cover.1504431850.git.yann.morin.1998@free.fr>
 <a9dc18ece6b62e3ac4ce274b708081a9d16bb6aa.1504431850.git.yann.morin.1998@free.fr>
Message-ID: <8dbdd051-e288-fd2d-433b-a441a9e4e6bc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All

Le 03/09/2017 ? 11:44, Yann E. MORIN a ?crit?:
> When an architecture expresses a requirement on the gcc version, limit
> the version choice in the custom external toolchain.
> 
> The ratioanle being that there is no point in offering that version to

rationale

> the user if we know before-hand that the gcc version will not work for
> that architecture.
> 
> All versions below the minimum we support is just made conditional to
> that minimum as well, including the "older" entry.
> 
> However, this means that the "older" entry is no longer available when
> the architecture requires a minimum gcc version. A user who wants to use
> a toolchain with a gcc older than the minimum will have no choice but to
> realise the toolchain is not suitable (or lie and we would catch that

realize

> when checking the gcc version anyway).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
> Note: this implies that it is no longer possible to use a custom
> external toolchain in which a specific core has been back-ported
> Thus, this patch may cause regressions in very specific and rare
> corner cases. Do we want to support those cases? If yes, then we
> should drop this patch.

This can be a problem for Linaro toolchains [1] where the GCC support for some
new cpu are backported. (Ok this example is moot since Buildroot doesn't support
these cpu).

Also since BR2_TOOLCHAIN_EXTERNAL_GCC_XXX is an user choice, we can print a
warning instead of completely disabling the gcc version ?

Best regards,
Romain

[1] https://releases.linaro.org/components/toolchain/binaries/5.4-2017.05/

> ---
>  .../toolchain-external-custom/Config.in.options           | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> index ae343ddad5..eb7c30f171 100644
> --- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> +++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> @@ -18,6 +18,11 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
>  
>  choice
>  	bool "External toolchain gcc version"
> +	default BR2_TOOLCHAIN_EXTERNAL_GCC_7   if BR2_ARCH_NEEDS_GCC_AT_LEAST_7
> +	default BR2_TOOLCHAIN_EXTERNAL_GCC_6   if BR2_ARCH_NEEDS_GCC_AT_LEAST_6
> +	default BR2_TOOLCHAIN_EXTERNAL_GCC_5   if BR2_ARCH_NEEDS_GCC_AT_LEAST_5
> +	default BR2_TOOLCHAIN_EXTERNAL_GCC_4_9 if BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
> +	default BR2_TOOLCHAIN_EXTERNAL_GCC_4_8 if BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
>  	default BR2_TOOLCHAIN_EXTERNAL_GCC_4_3
>  	help
>  	  Set to the gcc version that is used by your external
> @@ -29,42 +34,52 @@ config BR2_TOOLCHAIN_EXTERNAL_GCC_7
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_6
>  	bool "6.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_5
>  	bool "5.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_4_9
>  	bool "4.9.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_4_8
>  	bool "4.8.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_4_7
>  	bool "4.7.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_4_6
>  	bool "4.6.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_4_5
>  	bool "4.5.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_4_4
>  	bool "4.4.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_4_3
>  	bool "4.3.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
>  
>  config BR2_TOOLCHAIN_EXTERNAL_GCC_OLD
>  	bool "older"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
>  	help
>  	  Use this option if your GCC version is older than any of the
>  	  above.
> 
