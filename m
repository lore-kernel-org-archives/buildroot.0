From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 17:42:36 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/libiconv: enable extra
 encodings
In-Reply-To: <20200201125921.1193669-1-bernd.kuhls@t-online.de>
References: <20200201125921.1193669-1-bernd.kuhls@t-online.de>
Message-ID: <20200203164236.GH3299@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-02-01 13:59 +0100, Bernd Kuhls spake thusly:
> Quoting https://www.gnu.org/software/libiconv/
> 
> "When configured with the option --enable-extra-encodings, it also
>  provides support for a few extra encodings:
> 
> European languages
>     CP{437,737,775,852,853,855,857,858,860,861,863,865,869,1125}
> Semitic languages
>     CP864
> Japanese
>     EUC-JISX0213, Shift_JISX0213, ISO-2022-JP-3
> Chinese
>     BIG5-2003 (experimental)
> Turkmen
>     TDS565
> Platform specifics
>     ATARIST, RISCOS-LATIN1"
> 
> Updating Kodi from version 17.6 to 18.5 caused runtime errors on systems
> with locale support disabled, here Kodi uses libiconv but needs CP437:
> 
> ERROR: customConvert: iconv_open() for "CP437" -> "UTF-8" failed,
>  errno = 22 (Invalid argument)
> 
> Due to the size increase of libiconv.so.2.6.0 from 941K to 1,1M a new
> Config.in option was added.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: added Config.in option (Thomas, Arnout)
> 
>  package/libiconv/Config.in   | 22 ++++++++++++++++++++++
>  package/libiconv/libiconv.mk |  4 ++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/package/libiconv/Config.in b/package/libiconv/Config.in
> index ee4fd62011..6c9e6ea81b 100644
> --- a/package/libiconv/Config.in
> +++ b/package/libiconv/Config.in
> @@ -5,3 +5,25 @@ config BR2_PACKAGE_LIBICONV
>  	  unicode conversion library
>  
>  	  http://ftp.gnu.org/pub/gnu/libiconv
> +
> +if BR2_PACKAGE_LIBICONV
> +
> +config BR2_PACKAGE_LIBICONV_EXTRA_ENCODINGS
> +	bool "extra encodings"
> +	help
> +	  Provide support for a few extra encodings:
> +
> +	  European languages
> +	      CP{437,737,775,852,853,855,857,858,860,861,863,865,869,1125}

This line was too long, causing check-package to complain:

    package/libiconv/Config.in:17: help text: <tab><2 spaces><62 chars>
    (http://nightly.buildroot.org/#writing-rules-config-in)

So I removed two of the indenting spaces, and we're good.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +	  Semitic languages
> +	      CP864
> +	  Japanese
> +	      EUC-JISX0213, Shift_JISX0213, ISO-2022-JP-3
> +	  Chinese
> +	      BIG5-2003 (experimental)
> +	  Turkmen
> +	      TDS565
> +	  Platform specifics
> +	      ATARIST, RISCOS-LATIN1
> +
> +endif
> diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
> index 9a8133612b..ec79a5d735 100644
> --- a/package/libiconv/libiconv.mk
> +++ b/package/libiconv/libiconv.mk
> @@ -10,6 +10,10 @@ LIBICONV_INSTALL_STAGING = YES
>  LIBICONV_LICENSE = GPL-3.0+ (iconv program), LGPL-2.0+ (library)
>  LIBICONV_LICENSE_FILES = COPYING COPYING.LIB
>  
> +ifeq ($(BR2_PACKAGE_LIBICONV_EXTRA_ENCODINGS),y)
> +LIBICONV_CONF_OPTS = --enable-extra-encodings
> +endif
> +
>  # Don't build the preloadable library, as we don't need it (it's only
>  # for LD_PRELOAD to replace glibc's iconv, but we never build libiconv
>  # when glibc is used). And it causes problems for static only builds.
> -- 
> 2.20.1
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
