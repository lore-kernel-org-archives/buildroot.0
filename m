From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 23 Jun 2020 21:36:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/libnids: disable libglib2 only
 if not available
In-Reply-To: <20200623183549.12105-1-guillaume.bressaix@gmail.com>
References: <20200623183549.12105-1-guillaume.bressaix@gmail.com>
Message-ID: <20200623193619.GZ2351@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guillaume, All,

On 2020-06-23 20:35 +0200, Guillaume W. Bres spake thusly:
> Take advantage of a possibly existing BR2_PACKAGE_LIBGLIB2
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

Thanks, applied to master, with the following changes:

  - add missing dependency on libglib2
  - expand commit log to explain why we don't --enable-libglib
  - add a simmilar blurb in the .mk
  - fix condition, use positive logic since we have an else-clause

Please see the resulting commit for inspiration for your future
contributions! ;-)

Regards,
Yann E. MORIN.

> ---
>  package/libnids/libnids.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libnids/libnids.mk b/package/libnids/libnids.mk
> index ee7c71ee88..83719a712f 100644
> --- a/package/libnids/libnids.mk
> +++ b/package/libnids/libnids.mk
> @@ -12,8 +12,13 @@ LIBNIDS_INSTALL_STAGING = YES
>  LIBNIDS_DEPENDENCIES = host-pkgconf libpcap
>  LIBNIDS_AUTORECONF = YES
>  LIBNIDS_CONF_OPTS = \
> -	--disable-libglib \
>  	--disable-libnet
> +
> +# disable libglib2 if not available
> +ifeq ($(BR2_PACKAGE_LIBGLIB2),n)
> +LIBNIDS_CONF_OPTS += --disable-libglib
> +endif
> +
>  # hand-written Makefile.in, not using automake, needs a custom
>  # variable for the installation path.
>  LIBNIDS_INSTALL_STAGING_OPTS = install_prefix=$(STAGING_DIR) install
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
