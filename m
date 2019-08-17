From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Aug 2019 23:00:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: fix static build
 with libidn
In-Reply-To: <20190817184058.11058-1-bernd.kuhls@t-online.de>
References: <20190817184058.11058-1-bernd.kuhls@t-online.de>
Message-ID: <20190817230015.4eb99c57@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

Thanks for your research! I started where you left off in the
debugging, you'll see below some insights/hints to go further.

On Sat, 17 Aug 2019 20:40:58 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> diff --git a/package/ghostscript/0003-pkgconfig-libidn.patch b/package/ghostscript/0003-pkgconfig-libidn.patch
> new file mode 100644
> index 0000000000..baa8d27626
> --- /dev/null
> +++ b/package/ghostscript/0003-pkgconfig-libidn.patch
> @@ -0,0 +1,23 @@
> +fix static build with libidn
> +
> +Patch sent upstream as RFC:
> +https://bugs.ghostscript.com/show_bug.cgi?id=701439
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

OK, so, let me explain what they are trying to do in their configure.ac:

dnl pkg-config is used for several tests now...
AC_PATH_TOOL(PKGCONFIG, pkg-config)

# this is an unpleasant hack
# but if we are cross compiling, and there isn't a matching
# pkconfig for the --host setting, then don't use the 'local'
# pkconfig at all
if test x"$cross_compiling" = x"yes"; then
  AC_PATH_PROG(BUILD_PKGCONFIG, pkg-config)
  if test x"$BUILD_PKGCONFIG" = x"$PKGCONFIG" ; then
    PKGCONFIG=
  fi
fi

So, AC_PATH_TOOL() checks for a tool to be available, but tries first
with the tool prefixed with the host tuple, i.e something like
arm-buildroot-linux-gnueabi-pkg-config, if it's not found, it tries to
use pkg-config.

Then, they use AC_PATH_PROG() to also search for pkg-config. This one
doesn't try to find a version of the program prefixed by the host
tuple, so it looks for pkg-config only.

Their reasoning is that when you are building natively (i.e *NOT* cross
compiling), then it's OK for both checks to return "pkg-config".

However, they think that when you're cross-compiling, there *must* be a
pkg-config named <host-tuple>-pkg-config, different from pkg-config,
assuming that <host-tuple>-pkg-config would return results valid for
compiling code for the target, while pkg-config would return results
valid for compiling code for the host.

In an ideal world, Buildroot should install its cross-capable
pkg-config as <host-tuple>-pkg-config, and let pkg-config be the
host-capable pkg-config.

We are not yet in this ideal world however. But, pratically speaking,
BUILD_PKGCONFIG is only used in ghostscript for this check, so you can
pass:

	BUILD_PKGCONFIG=/bin/false

in the environment when calling the ghostscript configure script. This
way it *will* be different from $PKGCONFIG, and everything will be fine.


> +
> +diff -uNr ghostscript-9.27.orig/configure.ac ghostscript-9.27/configure.ac
> +--- ghostscript-9.27.orig/configure.ac	2019-04-04 09:43:14.000000000 +0200
> ++++ ghostscript-9.27/configure.ac	2019-08-17 20:25:30.386869619 +0200
> +@@ -804,7 +804,11 @@
> + UTF8DEVS=''
> + if test x$with_libidn != xno; then
> +   HAVE_LIBIDN=-DHAVE_LIBIDN
> +-  LIBS="$LIBS -lidn"
> ++  if test "x$BUILD_PKGCONFIG" != x; then
> ++    LIBS="$LIBS `$BUILD_PKGCONFIG --libs libidn`"

Then here, you should use $PKGCONFIG, not $BUILD_PKGCONFIG.

*But* the configure.ac script is still using AC_CHECK_LIB() to find
libidn, a bit above the code you're patching:

if test x$with_libidn != xno; then
  AC_CHECK_LIB(idn, stringprep, [
    with_libidn=no
    AC_CHECK_HEADER([stringprep.h], [with_libidn=yes])
    ], [
    if test x$with_libidn != xmaybe; then
      AC_MSG_ERROR([libidn not found])
    fi
    with_libidn=no
  ])
fi

This is where $PKGCONFIG should be used. See for example what they are
doing for fontconfig detection: use pkg-config if available, otherwise
fallback to AC_CHECK_LIB():

if test "$enable_fontconfig" != "no"; then
        # We MUST NOT use PKG_CHECK_MODULES since it is a) not a standard
        # autoconf macro and b) requires pkg-config on the system, which is
        # NOT standard on ANY OS, including Linux!
        if test "x$PKGCONFIG" != x; then
                AC_MSG_CHECKING(for fontconfig with pkg-config)
                if $PKGCONFIG --exists fontconfig; then
                        AC_MSG_RESULT(yes)
                        FONTCONFIG_CFLAGS="$CFLAGS `$PKGCONFIG --cflags fontconfig`"
                        FONTCONFIG_LIBS="`$PKGCONFIG --libs fontconfig`"
                        HAVE_FONTCONFIG=-DHAVE_FONTCONFIG
                else
                        AC_MSG_RESULT(no)
                fi
        fi
        if test -z "$HAVE_FONTCONFIG"; then
                AC_CHECK_LIB([fontconfig], [FcInitLoadConfigAndFonts], [
                  AC_CHECK_HEADER([fontconfig/fontconfig.h], [
                    FONTCONFIG_LIBS="-lfontconfig"
                    HAVE_FONTCONFIG="-DHAVE_FONTCONFIG"
                  ])
                ])
        fi
fi

Could you do the same for libidn ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
