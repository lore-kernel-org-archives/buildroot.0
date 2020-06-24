From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Jun 2020 21:20:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnids: disable libnet only if
 not available
In-Reply-To: <20200624121742.20034-1-guillaume.bressaix@gmail.com>
References: <20200624121742.20034-1-guillaume.bressaix@gmail.com>
Message-ID: <20200624192033.GD20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guillaume, All,

On 2020-06-24 14:17 +0200, Guillaume W. Bres spake thusly:
> libnids can be built against an existing libnet lib,
> take advantage of that.
> 
> Unfortunately, pkg-config is not available for libnet,
> so configure --with-libnet is our only option at the
> moment.
> 
> --with-libnet expects a build directory,
> not an installation path like in our context.
> We use --with-libnet=yes to skip tests that would fail.
> In this situation, 'LIBNET' goes undefined, so we
> need to define it ourselves.
> This works because we make sure -lnet is installed
> prior anything related to libnids.
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
>  package/libnids/libnids.mk | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libnids/libnids.mk b/package/libnids/libnids.mk
> index f0330787c7..01d50879b6 100644
> --- a/package/libnids/libnids.mk
> +++ b/package/libnids/libnids.mk
> @@ -11,7 +11,21 @@ LIBNIDS_LICENSE_FILES = COPYING
>  LIBNIDS_INSTALL_STAGING = YES
>  LIBNIDS_DEPENDENCIES = host-pkgconf libpcap
>  LIBNIDS_AUTORECONF = YES
> -LIBNIDS_CONF_OPTS = --disable-libnet
> +
> +# disable libnet if not available
> +# Tests in configure.in expect --with-libnet=$build_dir
> +# not an installation patch like in our context.
> +# We use with-libnet=yes to skip the unusual paths tests.
> +# But 'LNETLIB' gets left out, so we need to define it ourselves.
> +ifeq ($(BR2_PACKAGE_LIBNET),y)
> +LIBNIDS_DEPENDENCIES += libnet
> +
> +LIBNIDS_CONF_OPTS += --with-libnet=yes \
> +	LNETLIB=-lnet \
> +	--enable-libnet

I've reordered the options in a more logical way. Additionally, when an
assignment (or any other statement) fits on a 80-char line, we don't
split it on multiple lines, so I;ve changed to:

    LIBNIDS_CONF_OPTS += --enable-libnet --with-libnet=yes LNETLIB=-lnet

and applied to master, thanks.

Regards,
Yann E. MORIN.

> +else
> +LIBNIDS_CONF_OPTS += --disable-libnet
> +endif
>  
>  # disable libglib2 if not available
>  # The test in configure.in is flawed: passing --enable-libglib would also
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
