From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2015 21:55:42 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/ffmpeg: Add support for
	GnuTLS
In-Reply-To: <1445110736-1663-1-git-send-email-bernd.kuhls@t-online.de>
References: <1445110736-1663-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151017195542.GF3717@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-10-17 21:38 +0200, Bernd Kuhls spake thusly:
> Besides OpenSSL ffmpeg also supports GnuTLS.
> 
> If both GnuTLS and OpenSSL are enabled, the former takes precedence over
> the latter:
> http://git.videolan.org/?p=ffmpeg.git;a=blob;f=configure;h=7f9fed31a491ed0991aee2d354dba82e54e3291e;hb=refs/heads/release/2.8#l2719
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
> v4: Removed Kconfig options (Thomas)

And I agreed with Thomas when we talked about this on IRC yesterday. ;-)

Regards,
Yann E. MORIN.

> v3: rebased
> v2: OpenSSL and gpl'ed code from ffmpeg play together when nonfree
> 
>  package/ffmpeg/ffmpeg.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index 287338d..d4815ca 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -200,6 +200,11 @@ else
>  FFMPEG_CONF_OPTS += --disable-libfdk-aac
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GNUTLS),y)
> +FFMPEG_CONF_OPTS += --enable-gnutls --disable-openssl
> +FFMPEG_DEPENDENCIES += gnutls
> +else
> +FFMPEG_CONF_OPTS += --disable-gnutls
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  # openssl isn't license compatible with GPL
>  ifeq ($(BR2_PACKAGE_FFMPEG_GPL)x$(BR2_PACKAGE_FFMPEG_NONFREE),yx)
> @@ -211,6 +216,7 @@ endif
>  else
>  FFMPEG_CONF_OPTS += --disable-openssl
>  endif
> +endif
>  
>  ifeq ($(BR2_PACKAGE_LIBDCADEC),y)
>  FFMPEG_CONF_OPTS += --enable-libdcadec
> -- 
> 2.6.1
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
