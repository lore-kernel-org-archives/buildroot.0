From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 23 Feb 2015 22:55:01 +0100
Subject: [Buildroot] [PATCH] package/libevent: fix static build
In-Reply-To: <20150223200748.46ce9690@free-electrons.com>
References: <20150223190040.70f41d55@free-electrons.com>	<2008003175.212046.1424715113306.JavaMail.root@openwide.fr>
 <20150223200748.46ce9690@free-electrons.com>
Message-ID: <54EBA1B5.7000402@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 23/02/2015 20:07, Thomas Petazzoni a ?crit :
> Dear Romain Naour,
> 
> On Mon, 23 Feb 2015 19:11:53 +0100 (CET), Romain Naour wrote:
> 
>> Can you try to build libwebsock with your config ?
>>
>> Sorry, I meant libwebsock fix static build.
>>
>> libevent break libwebsock's build because libevent_openssl.pc is not
>> installed.
> 
> Ah, right, now I can reproduce the problem. Instead of trying to get
> AC_SEARCH_LIB to work properly with static libraries, how about using
> PKG_CHECK_MODULES() instead to rely on pkg-config? Something like:
> 
> From c603940f3d54189a3ef4a430580166cfdda468d0 Mon Sep 17 00:00:00 2001
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Date: Mon, 23 Feb 2015 19:58:21 +0100
> Subject: [PATCH 2/2] Use pkg-config to discover openssl and zlib
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

It's much better, thanks.
I was not really happy with my patch, but at least it fixed the build.

Build tested from scratch with your patch and the same config.
Can you add my:
Tested-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain
> ---
>  configure.ac       | 25 ++-----------------------
>  sample/Makefile.am |  2 +-
>  test/Makefile.am   |  2 +-
>  3 files changed, 4 insertions(+), 25 deletions(-)
> 
> diff --git a/configure.ac b/configure.ac
> index d42edd8..da5bc49 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -146,16 +146,7 @@ AC_CHECK_HEADERS([zlib.h])
>  if test "x$ac_cv_header_zlib_h" = "xyes"; then
>  dnl Determine if we have zlib for regression tests
>  dnl Don't put this one in LIBS
> -save_LIBS="$LIBS"
> -LIBS=""
> -ZLIB_LIBS=""
> -have_zlib=no
> -AC_SEARCH_LIBS([inflateEnd], [z],
> -	[have_zlib=yes
> -	ZLIB_LIBS="$LIBS"
> -	AC_DEFINE(HAVE_LIBZ, 1, [Define if the system has zlib])])
> -LIBS="$save_LIBS"
> -AC_SUBST(ZLIB_LIBS)
> +    PKG_CHECK_MODULES([ZLIB], [zlib], [have_zlib=yes])
>  fi
>  AM_CONDITIONAL(ZLIB_REGRESS, [test "$have_zlib" = "yes"])
>  
> @@ -169,23 +160,11 @@ else
>  fi
>  AC_SUBST(EV_LIB_WS32)
>  AC_SUBST(EV_LIB_GDI)
> -AC_SUBST(OPENSSL_LIBADD)
>  
>  AC_CHECK_HEADERS([openssl/bio.h])
>  
>  if test "$enable_openssl" = "yes"; then
> -save_LIBS="$LIBS"
> -LIBS=""
> -OPENSSL_LIBS=""
> -have_openssl=no
> -AC_SEARCH_LIBS([SSL_new], [ssl],
> -	[have_openssl=yes
> -	OPENSSL_LIBS="$LIBS -lcrypto $EV_LIB_GDI $EV_LIB_WS32 $OPENSSL_LIBADD"
> -	AC_DEFINE(HAVE_OPENSSL, 1, [Define if the system has openssl])],
> -	[have_openssl=no],
> -	[-lcrypto $EV_LIB_GDI $EV_LIB_WS32 $OPENSSL_LIBADD])
> -LIBS="$save_LIBS"
> -AC_SUBST(OPENSSL_LIBS)
> +   PKG_CHECK_MODULES([OPENSSL], [openssl], [have_openssl=yes], [have_openssl=no])
>  fi
>  
>  dnl Checks for header files.
> diff --git a/sample/Makefile.am b/sample/Makefile.am
> index c926f4e..a986b18 100644
> --- a/sample/Makefile.am
> +++ b/sample/Makefile.am
> @@ -21,7 +21,7 @@ http_server_SOURCES = http-server.c
>  if OPENSSL
>  noinst_PROGRAMS += le-proxy
>  le_proxy_SOURCES = le-proxy.c
> -le_proxy_LDADD = $(LDADD) ../libevent_openssl.la -lssl -lcrypto ${OPENSSL_LIBADD}
> +le_proxy_LDADD = $(LDADD) ../libevent_openssl.la -lssl -lcrypto $(OPENSSL_LIBS)
>  endif
>  
>  verify:
> diff --git a/test/Makefile.am b/test/Makefile.am
> index 0253a49..4ab6ae5 100644
> --- a/test/Makefile.am
> +++ b/test/Makefile.am
> @@ -72,7 +72,7 @@ regress_LDFLAGS = $(PTHREAD_CFLAGS)
>  
>  if OPENSSL
>  regress_SOURCES += regress_ssl.c
> -regress_LDADD += ../libevent_openssl.la -lssl -lcrypto ${OPENSSL_LIBADD}
> +regress_LDADD += ../libevent_openssl.la -lssl -lcrypto $(OPENSSL_LIBS)
>  endif
>  
>  bench_SOURCES = bench.c
> 
