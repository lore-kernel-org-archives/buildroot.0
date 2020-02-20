From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Feb 2020 23:04:17 +0100
Subject: [Buildroot] [PATCH 2/3]
 toolchain/toolchain-external/toolchain-external-custom: add option to
 indicate SSP_STRONG support
In-Reply-To: <20200220020117.695236-3-thomas.petazzoni@bootlin.com>
References: <20200220020117.695236-1-thomas.petazzoni@bootlin.com>
 <20200220020117.695236-3-thomas.petazzoni@bootlin.com>
Message-ID: <20200220220417.GD17342@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-02-20 03:01 +0100, Thomas Petazzoni spake thusly:
> This commit adds a user-visible option
> BR2_TOOLCHAIN_EXTERNAL_HAS_SSP_STRONG, which will allow the user to
> indicate if the custom external toolchain does or does not have
> SSP_STRONG support. Depending on this, the user will be able to use
> (or not) the BR2_SSP_STRONG option.
> 
> Checking if what the user said is true or not about this is already
> done in toolchain/toolchain-external/pkg-toolchain-external.mk:
> 
>         $$(Q)$$(call check_toolchain_ssp,$$(TOOLCHAIN_EXTERNAL_CC),$(BR2_SSP_OPTION))
> 
> If the user selects BR2_SSP_STRONG, this will check if
> -fstack-protector-strong is really supported.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  .../toolchain-external-custom/Config.in.options      | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> index 302f6babac..c8cd2c03cc 100644
> --- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> +++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
> @@ -410,6 +410,18 @@ config BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
>  	  leave the default value, Buildroot will tell you if it's
>  	  correct or not.
>  
> +config BR2_TOOLCHAIN_EXTERNAL_HAS_SSP_STRONG
> +	bool "Toolchain has SSP strong support?"
> +	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 && BR2_TOOLCHAIN_EXTERNAL_GLIBC
> +	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 && BR2_TOOLCHAIN_EXTERNAL_MUSL
> +	depends on BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
> +	select BR2_TOOLCHAIN_HAS_SSP_STRONG
> +	help
> +	  Selection this option if your external toolchain has strong

*Select

Fixed, and whole series applied, thanks!

Regards,
Yann E. MORIN.

> +	  Stack Smashing Protection support enabled. If you don't
> +	  know, leave the default value, Buildroot will tell you if
> +	  it's correct or not.
> +
>  config BR2_TOOLCHAIN_EXTERNAL_INET_RPC
>  	bool "Toolchain has RPC support?"
>  	default y if BR2_TOOLCHAIN_EXTERNAL_GLIBC
> -- 
> 2.24.1
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
