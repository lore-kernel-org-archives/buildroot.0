From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 15:48:04 +0100
Subject: [Buildroot] [PATCH v5 13/36] package/efl/libefl: add jp2k
 config option
In-Reply-To: <1445720476-21517-14-git-send-email-romain.naour@openwide.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-14-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151025144804.GJ11692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-10-24 23:00 +0200, Romain Naour spake thusly:
> Like for webp format, add an option to enable the JPEG 2000
> codec support in the efl libraries.

Suddenly, I wonder why you added a bunch of image loaders in the first
patch adding libelf, but you add a few more such loaders in separate
patches.

Can't you do either:
  - introduce all of them as separate patches, or
  - introduce all of them in the first patch adding libefl?

Or is there an underlying good reason to do as you did?

Regards,
Yann E. MORIN.

> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
> v4: rename to libefl
>     improve commit log
> ---
>  package/efl/libefl/Config.in | 7 +++++++
>  package/efl/libefl/libefl.mk | 7 +++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/package/efl/libefl/Config.in b/package/efl/libefl/Config.in
> index e25911f..53adea2 100644
> --- a/package/efl/libefl/Config.in
> +++ b/package/efl/libefl/Config.in
> @@ -51,6 +51,13 @@ config BR2_PACKAGE_LIBEFL_PNG
>  	  This enables the loader code that loads png files using
>  	  libpng.
>  
> +config BR2_PACKAGE_LIBEFL_JP2K
> +	bool "libevas jp2k loader"
> +	select BR2_PACKAGE_OPENJPEG
> +	help
> +	  This enables the loader code that loads jp2k files using
> +	  openjpeg.
> +
>  config BR2_PACKAGE_LIBEFL_JPEG
>  	bool "libevas jpeg loader"
>  	help
> diff --git a/package/efl/libefl/libefl.mk b/package/efl/libefl/libefl.mk
> index 3a4aab1..e53470d 100644
> --- a/package/efl/libefl/libefl.mk
> +++ b/package/efl/libefl/libefl.mk
> @@ -201,6 +201,13 @@ else
>  LIBEFL_CONF_OPTS += --enable-image-loader-tiff=no
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBEFL_JP2K),y)
> +LIBEFL_CONF_OPTS += --enable-image-loader-jp2k=yes
> +LIBEFL_DEPENDENCIES += openjpeg
> +else
> +LIBEFL_CONF_OPTS += --enable-image-loader-jp2k=no
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBEFL_WEBP),y)
>  LIBEFL_CONF_OPTS += --enable-image-loader-webp=yes
>  LIBEFL_DEPENDENCIES += webp
> -- 
> 2.4.3
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
