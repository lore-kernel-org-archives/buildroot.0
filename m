From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Jul 2016 09:19:43 +0200
Subject: [Buildroot] [PATCH] libmicrohttpd: fix thread detection on ARC
 and Blackfin
In-Reply-To: <1467587383-30328-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1467587383-30328-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160705071943.GA6533@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-07-04 01:09 +0200, Thomas Petazzoni spake thusly:
> Due to compiler deficiences, gcc on ARC and Blackfin doesn't define
> _REENTRANT, which the latest version of the ax_pthread.m4
> autoconf-archive macros looks at to determine whether thread support is
> available or not.
> 
> Fixing the compilers is definitely the right thing to do, but it's not
> doable for pre-built external toolchains like the Blackfin one, so for
> now, we simply define _REENTRANT manually on ARC and Blackfin. If more
> packages are affected by this problem, a more general solution will have
> to be found.
> 
> Fixes
> http://autobuild.buildroot.net/results/593/593b5050473a83a9ddcada9de39f8f14ab38d554/
> http://autobuild.buildroot.net/results/ff0/ff058a378b91740b5b399f32a6b375fbc3c8df06/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> This commit is an improved solution based on the discussion that occured
> on Bernd's patch at https://patchwork.ozlabs.org/patch/634835/.
> ---
>  package/libmicrohttpd/libmicrohttpd.mk | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
> index c53676f..2266d3c 100644
> --- a/package/libmicrohttpd/libmicrohttpd.mk
> +++ b/package/libmicrohttpd/libmicrohttpd.mk
> @@ -9,7 +9,17 @@ LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
>  LIBMICROHTTPD_LICENSE_FILES = COPYING
>  LIBMICROHTTPD_INSTALL_STAGING = YES
>  LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-examples
> -LIBMICROHTTPD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
> +LIBMICROHTTPD_CFLAGS = $(TARGET_CFLAGS) -std=c99
> +
> +# gcc on arc and bfin doesn't define _REENTRANT when -pthread is
> +# passed while it should. Compensate this defiency here otherwise
> +# libmicrohttpd configure script doesn't find that thread support is
> +# enabled.
> +ifeq ($(BR2_arc)$(BR2_bfin),y)
> +LIBMICROHTTPD_CFLAGS += -D_REENTRANT
> +endif
> +
> +LIBMICROHTTPD_CONF_ENV += CFLAGS="$(LIBMICROHTTPD_CFLAGS)"
>  
>  ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
>  LIBMICROHTTPD_LICENSE = LGPLv2.1+
> -- 
> 2.7.4
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
