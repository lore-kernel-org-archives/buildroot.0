From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 May 2014 18:09:03 +0200
Subject: [Buildroot] [PATCH] php: fix more iconv related build failures
In-Reply-To: <1398215534-1893-1-git-send-email-gustavo@zacarias.com.ar>
References: <1398215534-1893-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140525160903.GB3542@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-04-22 22:12 -0300, Gustavo Zacarias spake thusly:
> See php-01-no-iconv.patch for the gory details. Fixes:
> http://autobuild.buildroot.net/results/1c9/1c9bdfe55288430dca80a1bb514b85353d2f1c54/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

This should probably go in 2014.05.

I'm also testing whether that would also fix other ARM+php build
failures, notably:
    http://autobuild.buildroot.net/results/5bc/5bcf8475f5ef7800efdff6be3aa4d7109ab76b67/
    http://autobuild.buildroot.net/results/c0e/c0e206399ebe53d4998fd5a141bdefd754f1929f/

Regards,
Yann E. MORIN.

> ---
>  package/php/php-01-no-iconv-search.patch | 81 ++++++++++++++++++++++----------
>  1 file changed, 57 insertions(+), 24 deletions(-)
> 
> diff --git a/package/php/php-01-no-iconv-search.patch b/package/php/php-01-no-iconv-search.patch
> index d2a7ae3..1979b7d 100644
> --- a/package/php/php-01-no-iconv-search.patch
> +++ b/package/php/php-01-no-iconv-search.patch
> @@ -1,32 +1,65 @@
> -Just assume ICONV_DIR is fine since we pass the correct parameters
> -to configure.
> -Otherwise configure will try to guess on absolute directories and
> -sometimes messes up on some weird edge conditions.
> +Tweak PHP_SETUP_ICONV from aclocal/acinclude.m4 to not
> +PHP_ADD_INCLUDE $ICONV_DIR/include since the tests use
> +test instead of AC_TRY_LINK to find headers which is bad,
> +specially when adding /usr and /usr/local to the mix.
> +Do basically the same with ext/iconv/config.m4 by tweaking
> +PHP_ICONV_H_PATH which, again, uses test and absolute paths.
> +And all this directly in configure since autoreconf isn't
> +happy with php.
>  
>  Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>  
> -diff -Nura php-5.3.27.orig/configure php-5.3.27/configure
> ---- php-5.3.27.orig/configure	2013-11-26 09:33:30.874253800 -0300
> -+++ php-5.3.27/configure	2013-11-26 09:41:41.495363637 -0300
> -@@ -48212,20 +48212,7 @@
> - 
> - 
> -   if test "$iconv_avail" != "no"; then
> --    if test -z "$ICONV_DIR"; then
> --      for i in /usr/local /usr; do
> --        if test -f "$i/include/iconv.h" || test -f "$i/include/giconv.h"; then
> --          PHP_ICONV_PREFIX="$i"
> --          break
> --        fi
> --      done
> --      if test -z "$PHP_ICONV_PREFIX"; then
> --        PHP_ICONV_PREFIX="/usr"
> +diff -Nura php-5.5.11.orig/configure php-5.5.11/configure
> +--- php-5.5.11.orig/configure	2014-04-16 14:55:52.300838499 -0300
> ++++ php-5.5.11/configure	2014-04-22 21:54:01.499097295 -0300
> +@@ -45751,12 +45751,6 @@
> +   if test -n "$unique" && test "`eval $cmd`" = "" ; then
> +     eval "INCLUDEPATH$unique=set"
> + 
> +-      if test ""; then
> +-        INCLUDES="-I$ai_p $INCLUDES"
> +-      else
> +-        INCLUDES="$INCLUDES -I$ai_p"
>  -      fi
> +-
> +   fi
> + 
> +   fi
> +@@ -45786,14 +45780,7 @@
> +       PHP_ICONV_PREFIX="$ICONV_DIR"
> +     fi
> + 
> +-    CFLAGS="-I$PHP_ICONV_PREFIX/include $CFLAGS"
> +-    LDFLAGS="-L$PHP_ICONV_PREFIX/$PHP_LIBDIR $LDFLAGS"
> +-
> +-    if test -r "$PHP_ICONV_PREFIX/include/giconv.h"; then
> +-      PHP_ICONV_H_PATH="$PHP_ICONV_PREFIX/include/giconv.h"
>  -    else
> --      PHP_ICONV_PREFIX="$ICONV_DIR"
> +-      PHP_ICONV_H_PATH="$PHP_ICONV_PREFIX/include/iconv.h"
>  -    fi
> ++      PHP_ICONV_H_PATH="iconv.h"
> + 
> +     { $as_echo "$as_me:${as_lineno-$LINENO}: checking if iconv is glibc's" >&5
> + $as_echo_n "checking if iconv is glibc's... " >&6; }
> +@@ -46191,8 +46178,6 @@
> +   ext_builddir=ext/iconv
> +   ext_srcdir=$abs_srcdir/ext/iconv
> + 
> +-  ac_extra=`echo "-I\"$PHP_ICONV_PREFIX/include\""|$SED s#@ext_srcdir@#$ext_srcdir#g|$SED s#@ext_builddir@#$ext_builddir#g`
> +-
> +   if test "$ext_shared" != "shared" && test "$ext_shared" != "yes" && test "" != "cli"; then
> +     PHP_ICONV_SHARED=no
> + 
> +@@ -97419,12 +97404,6 @@
> +   if test -n "$unique" && test "`eval $cmd`" = "" ; then
> +     eval "INCLUDEPATH$unique=set"
> + 
> +-      if test ""; then
> +-        INCLUDES="-I$ai_p $INCLUDES"
> +-      else
> +-        INCLUDES="$INCLUDES -I$ai_p"
> +-      fi
>  -
> -+    PHP_ICONV_PREFIX="$ICONV_DIR"
> -     CFLAGS="-I$PHP_ICONV_PREFIX/include $CFLAGS"
> -     LDFLAGS="-L$PHP_ICONV_PREFIX/$PHP_LIBDIR $LDFLAGS"
> +   fi
>   
> +   fi
> -- 
> 1.8.3.2
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
