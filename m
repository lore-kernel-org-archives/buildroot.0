From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Jul 2016 13:04:59 +0200
Subject: [Buildroot] [PATCH 1/3] package/libuio: fix build with external
 intl library
In-Reply-To: <1467450008-27597-1-git-send-email-romain.naour@smile.fr>
References: <1467450008-27597-1-git-send-email-romain.naour@smile.fr>
Message-ID: <20160702110459.GL22343@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-07-02 11:00 +0200, Romain Naour spake thusly:
> When intl library is not provided by the libc, libuio forget to link
> with -lintl.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8f7/8f715b4e9b826dac13f3d49da25576e6e1d79449
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/libuio/libuio.mk | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libuio/libuio.mk b/package/libuio/libuio.mk
> index e019fe9..6a73d23 100644
> --- a/package/libuio/libuio.mk
> +++ b/package/libuio/libuio.mk
> @@ -21,7 +21,16 @@ LIBUIO_CONF_ENV += MAKEINFO=true
>  
>  ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
>  LIBUIO_DEPENDENCIES += argp-standalone
> -LIBUIO_CONF_ENV += LIBS="-largp"
> +LIBUIO_ARGP_LIBS += -largp

What about:

    LIBUIO_LIBS = -largp

>  endif
>  
> +# libuio pulls in libintl if needed, so ensure we also
> +# link against it, otherwise static linking fails
> +ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
> +LIBUIO_DEPENDENCIES += gettext
> +LIBUIO_INTL_LIBS += -lintl

And:

    LIBUIO_LIBS += -lintl

> +endif
> +
> +LIBUIO_CONF_ENV += LIBS="$(LIBUIO_ARGP_LIBS) $(LIBUIO_INTL_LIBS)"

With finally;

    LIBUIO_CONF_ENV += LIBS="$(LIBUIO_LIBS)"

Regards,
Yann E. MORIN.

>  $(eval $(autotools-package))
> -- 
> 2.5.5
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
