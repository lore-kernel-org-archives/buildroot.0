From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 23:28:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXfont2: disable
 usage of libbsd
In-Reply-To: <20191001054210.28371-1-bernd.kuhls@t-online.de>
References: <20191001054210.28371-1-bernd.kuhls@t-online.de>
Message-ID: <20191002232807.1b3e5c87@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Tue,  1 Oct 2019 07:42:10 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Upstream added optional support for libbsd:
> "Add strlcat & strlcpy fallbacks if not provided by libc nor libbsd"
> https://cgit.freedesktop.org/xorg/lib/libXfont/commit/?id=d4c941ea8b1dc07a14efce656bff58d31a14c985
> 
> In the case that libbsd was built before xlib_libXfont2 it gets picked
> up by configure:
> 
> checking for library containing strlcat... -lbsd
> checking for reallocarray... yes
> checking for strlcat... yes
> checking for strlcpy... yes
> 
> which leads to build errors.
> 
> Building without libbsd being built before succeeds:
> 
> checking for library containing strlcat... no
> checking for reallocarray... yes
> checking for strlcat... no
> checking for strlcpy... no
> 
> Instead of fixing a problem in the xlib_libXfont2 code we disable the
> usage of libbsd altogether:
> 
> checking for library containing strlcat... (cached) no
> 
> and force xlib_libXfont2 to use its internal headers.
> 
> Fixes:
> http://autobuild.buildroot.net/results/165/165f9f948419fc69fbf6b9281d759b37bb7d40c6/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

As usual, I am not a big fan of hacks like this. What about fixing the
real problem? It seems like the real problem is that HAVE_LIBBSD is
never defined, and that:

diff --git a/configure.ac b/configure.ac
index f507c28..131713d 100644
--- a/configure.ac
+++ b/configure.ac
@@ -52,7 +52,8 @@ AC_CHECK_HEADERS([endian.h poll.h sys/poll.h])
 
 # Checks for library functions.
 AC_CHECK_FUNCS([poll readlink])
-AC_SEARCH_LIBS([strlcat], [bsd])
+AC_SEARCH_LIBS([strlcat], [bsd],
+  [AC_DEFINE(HAVE_LIBBSD,1,[Has libbsd])])
 AC_CONFIG_LIBOBJ_DIR([src/util])
 AC_REPLACE_FUNCS([reallocarray strlcat strlcpy])

fixes it. Could you use this instead and send it upstream ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
