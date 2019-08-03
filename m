From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Aug 2019 23:16:09 +0200
Subject: [Buildroot] [PATCH 4/5 v2] toolchain: -fstack-protector-strong
 can be back-ported
In-Reply-To: <17089_1552392582_5C87A186_17089_130_1_f6f2aff0-c673-4b8c-9779-7e671921c77f@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
References: <cover.1552392456.git.yann.morin@orange.com>
 <17089_1552392582_5C87A186_17089_130_1_f6f2aff0-c673-4b8c-9779-7e671921c77f@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
Message-ID: <f999b059-b1e5-ef8b-412c-79782db7870d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/03/2019 13:09, yann.morin at orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Currently, use of -fstack-protector-strong is only available for gcc
> starting with 4.9, on the assumption that it appeared with that version.
> 
> Although this is true, it happens that quite a few vendors will have
> back-ported -fstack-protector-strong to older gcc versions (at least 4.8
> seen in the wild).
> 
> Remove the guard against gcc>=4.9, and expand the help text.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> ---
> Notes:
> 
> We could have changed the guard to something like:
>     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || BR2_TOOLCHAIN_EXTERNAL
> 
> However, the latest gcc we support in the internal toolchain *is*
> gcc-4.9, so the condition would have always been true. Hence, we just
> drop the condition.

 This note is in fact interesting, so I've added it to the commit message.
However, it would have been more appropriate (if we would have had the
condition) to make it

 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || BR2_TOOLCHAIN_EXTERNAL_CUSTOM

(because we know our predefined external toolchains <4.9 *don't* suport this
option). In fact, we only have one 4.8 predefined external toolchain: Sourcery
ARM. So for that one toolchain, it's not worth adding that condition. The
problem will anyway be caught by the check you just added, because it's also
executed for predefined external toolchains.

 Regards,
 Arnout

> ---
>  Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index 757ad1ca40..d5a0460f98 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -746,14 +746,14 @@ config BR2_SSP_REGULAR
>  
>  config BR2_SSP_STRONG
>  	bool "-fstack-protector-strong"
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  	help
>  	  Like -fstack-protector but includes additional functions to be
>  	  protected - those that have local array definitions, or have
>  	  references to local frame addresses.
>  
> -comment "Stack Smashing Protection strong needs a toolchain w/ gcc >= 4.9"
> -	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> +	  -fstack-protector-strong officially appeared in gcc 4.9, but
> +	  some vendors have backported -fstack-protector-strong to older
> +	  versions of gcc.
>  
>  config BR2_SSP_ALL
>  	bool "-fstack-protector-all"
> 
