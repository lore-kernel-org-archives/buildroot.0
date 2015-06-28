From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Jun 2015 11:50:50 +0200
Subject: [Buildroot] [PATCH] uclibc: deprecate locale support
In-Reply-To: <20150628071417.GA13377@waldemar-brodkorb.de>
References: <20150628071417.GA13377@waldemar-brodkorb.de>
Message-ID: <20150628095049.GA3950@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar, All,

On 2015-06-28 09:14 +0200, Waldemar Brodkorb spake thusly:
> The quality of the locale implementation in uClibc seems
> to be bad. Recently a discussion on the uClibc mailinglist
> showed that the uClibc maintainer has no time to fix
> remaining issues in the locale implementation.
> http://lists.uclibc.org/pipermail/uclibc/2015-June/049000.html
> 
> Because of the bad state of the code I would like to deprecate
> it. I never used it myself and see no good reason why I would
> need it for an embedded system.
> 
> I believe not many people are using it. For good working
> locale support there is still GNU libc and musl.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

While on principle I'm not opposed to deprecating locale support in
uClibc altogether.

However, we've had locales working in uClinc so far, it's only with
uClibc-ng that we started to have build failures (AFAICS).

So, I find it a bit cavalier that we remove support for locales when
uClibc-ng / uClibc is used, like we'd hide the dirt under the rug.

Also, when we add something to the legacy entries, this is not
deprecating, this is removing. Deprecating is done by adding a
dependency to a symbol, like is done now for the blackbox package.

But for what it's worth:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  Config.in.legacy         |    6 ++++++
>  package/uclibc/Config.in |    8 --------
>  2 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index d86d585..1814acb 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -107,6 +107,12 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2015.08"
>  
> +config BR2_TOOLCHAIN_BUILDROOT_LOCALE
> +	bool "Toolchain locale/i18n setting removed"
> +	select BR2_LEGACY
> +	help
> +	  uClibc locale support have been removed.
> +
>  config BR2_TARGET_UBOOT_NETWORK
>  	bool "U-Boot custom network settings removed"
>  	select BR2_LEGACY
> diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
> index 15a590f..03d7171 100644
> --- a/package/uclibc/Config.in
> +++ b/package/uclibc/Config.in
> @@ -100,14 +100,6 @@ config BR2_TOOLCHAIN_BUILDROOT_WCHAR
>  	  wide characters (i.e characters longer than 8 bits, needed
>  	  for locale support).
>  
> -config BR2_TOOLCHAIN_BUILDROOT_LOCALE
> -	bool "Enable toolchain locale/i18n support"
> -	select BR2_TOOLCHAIN_BUILDROOT_WCHAR
> -	select BR2_ENABLE_LOCALE
> -	help
> -	  Enable this option if you want your toolchain to support
> -	  localization and internationalization.
> -
>  choice
>  	prompt "Thread library implementation"
>  	default BR2_PTHREADS_NATIVE if BR2_UCLIBC_VERSION_SUPPORTS_NPTL
> -- 
> 1.7.10.4
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
