From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jun 2017 11:37:49 +0200
Subject: [Buildroot] [PATCH 11/14] liboping: no need to check for
 clock_gettime
In-Reply-To: <6900d7e2542b4f689b7a6ee94eaa9987995c186b.1497583686.git.baruch@tkos.co.il>
References: <cover.1497583686.git.baruch@tkos.co.il>
 <6900d7e2542b4f689b7a6ee94eaa9987995c186b.1497583686.git.baruch@tkos.co.il>
Message-ID: <20170618093749.GM2918@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2017-06-16 06:32 +0300, Baruch Siach spake thusly:
> Buildroot no longer supports toolchains with glibc older than 2.17, so there
> is no need to check whether librt is required for clock_* system calls.
> 
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Removing one of my patches? I'm all for it! :-)

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  ...001-configure-also-check-for-clockgettime.patch | 39 ----------------------
>  package/liboping/liboping.mk                       |  2 --
>  2 files changed, 41 deletions(-)
>  delete mode 100644 package/liboping/0001-configure-also-check-for-clockgettime.patch
> 
> diff --git a/package/liboping/0001-configure-also-check-for-clockgettime.patch b/package/liboping/0001-configure-also-check-for-clockgettime.patch
> deleted file mode 100644
> index b2c585559a99..000000000000
> --- a/package/liboping/0001-configure-also-check-for-clockgettime.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From a45f3610beba1f7e6e1a038e3a1fe4150057c262 Mon Sep 17 00:00:00 2001
> -From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -Date: Tue, 5 Jul 2016 15:31:28 +0200
> -Subject: [PATCH] configure: also check for clockgettime()
> -
> -clock_gettime() is also in -lrt so we also need to check for it.
> -
> -Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ----
> - configure.ac | 10 +++++++---
> - 1 file changed, 7 insertions(+), 3 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index f83f5ab..3b6ae09 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -199,12 +199,16 @@ fi
> - 
> - AC_SUBST(LIBOPING_PC_LIBS_PRIVATE)
> - 
> --nanosleep_needs_rt="no"
> -+needs_rt="no"
> - AC_CHECK_FUNCS(nanosleep, [],
> - 	AC_CHECK_LIB(rt, nanosleep,
> --		[nanosleep_needs_rt="yes"],
> -+		[needs_rt="yes"],
> - 		AC_MSG_ERROR(cannot find nanosleep)))
> --AM_CONDITIONAL(BUILD_WITH_LIBRT, test "x$nanosleep_needs_rt" = "xyes")
> -+AC_CHECK_FUNCS(clock_gettime, [],
> -+	AC_CHECK_LIB(rt, clock_gettime,
> -+		[needs_rt="yes"],
> -+		AC_MSG_ERROR(cannot find clock_gettime)))
> -+AM_CONDITIONAL(BUILD_WITH_LIBRT, test "x$needs_rt" = "xyes")
> - 
> - with_ncurses="no"
> - AC_CHECK_HEADERS(ncursesw/ncurses.h ncurses.h, [with_ncurses="yes"], [])
> --- 
> -2.7.4
> -
> diff --git a/package/liboping/liboping.mk b/package/liboping/liboping.mk
> index 895d530e64b0..114e0c27e578 100644
> --- a/package/liboping/liboping.mk
> +++ b/package/liboping/liboping.mk
> @@ -13,6 +13,4 @@ LIBOPING_CONF_OPTS = --without-perl-bindings
>  LIBOPING_LICENSE = LGPL-2.1+, GPL-2.0
>  LIBOPING_LICENSE_FILES = COPYING
>  
> -LIBOPING_AUTORECONF = YES
> -
>  $(eval $(autotools-package))
> -- 
> 2.11.0
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
