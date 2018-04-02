From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Apr 2018 13:57:54 +0200
Subject: [Buildroot] [v4 09/13] pkg-generic: introduce _SAME_SOURCE_AS
In-Reply-To: <20180402081434.4411-9-maxime.hadjinlian@gmail.com>
References: <20180402081434.4411-1-maxime.hadjinlian@gmail.com>
 <20180402081434.4411-9-maxime.hadjinlian@gmail.com>
Message-ID: <20180402115754.GF3625@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2018-04-02 10:14 +0200, Maxime Hadjinlian spake thusly:
> This per package variable can be used to specify that a package shares
> the same sources as another package.
> 
> The use case here is for example linux-headers and linux, which share
> the same sources (because they are the same upstream project), so we
> don't want to download twice the kernel, nor store it multiple times
> either.
> 
> Make will automatically try to help by introducing leading and trailing
> spaces when replacing a line-continuation '\', so we need to call
> $(strip) on the variable.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/pkg-generic.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index c84b1eb4a2..a034c7ea02 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -432,7 +432,10 @@ endif
>  
>  $(2)_BASENAME	= $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
>  $(2)_BASENAME_RAW = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
> -$(2)_DL_DIR 	=  $$(DL_DIR)/$$($(2)_RAWNAME)
> +$(2)_DL_DIR = $$(strip $$(if $$($(2)_SAME_SOURCE_AS), \
> +		$$($$(call UPPERCASE,$$($(2)_SAME_SOURCE_AS))_DL_DIR), \
> +		$$(DL_DIR)/$$($(2)_RAWNAME)) \
> +	)
>  $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASENAME)
>  
>  ifndef $(2)_SUBDIR
> -- 
> 2.16.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
