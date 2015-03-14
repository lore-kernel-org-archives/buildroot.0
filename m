From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Mar 2015 00:01:19 +0100
Subject: [Buildroot] [PATCH] package/czmq: fix discovery of libzmq for
 static build
In-Reply-To: <1426368725-27750-1-git-send-email-romain.naour@openwide.fr>
References: <1426368725-27750-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150314230119.GS4009@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-03-14 22:32 +0100, Romain Naour spake thusly:
> Backport and rebase a patch from upstream:
> https://github.com/zeromq/czmq/commit/313714f8b73c23d68b1216bc2df3d0ccc6ab1ffd
> 
> Also, remove the fix in czmq.mk for static build.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ec4/ec414b52f9cdd8d7d365283e21479519e63c7d97/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[build tested-only]
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  ...igure.ac-to-prevent-contradictory-discove.patch | 206 +++++++++++++++++++++
>  package/czmq/czmq.mk                               |   4 -
>  2 files changed, 206 insertions(+), 4 deletions(-)
>  create mode 100644 package/czmq/0001-Simply-configure.ac-to-prevent-contradictory-discove.patch
> 
> diff --git a/package/czmq/0001-Simply-configure.ac-to-prevent-contradictory-discove.patch b/package/czmq/0001-Simply-configure.ac-to-prevent-contradictory-discove.patch
> new file mode 100644
> index 0000000..556a8df
> --- /dev/null
> +++ b/package/czmq/0001-Simply-configure.ac-to-prevent-contradictory-discove.patch
> @@ -0,0 +1,206 @@
> +From 23591404610b1eeffb69712d93c77c2327b9ef7a Mon Sep 17 00:00:00 2001
> +From: Phillip Mienk <mienkphi@gmail.com>
> +Date: Fri, 31 Oct 2014 00:55:35 -0700
> +Subject: [PATCH] Simply configure.ac to prevent contradictory discovery of
> + libzmq.
> +
> +[Romain: rebase on top of 3.0.0]
> +Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> +---
> + Makefile.am                   |  3 ++-
> + addons/Makefile.am.supplement |  3 ++-
> + configure.ac                  | 46 ++-----------------------------------------
> + model/build-autoconf.gsl      | 28 ++++++++++++++++++++++++++
> + model/project.xml             |  3 +++
> + src/Makefile.am.supplement    | 12 ++++++++++-
> + 6 files changed, 48 insertions(+), 47 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 10f21fb..187c62b 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -1,7 +1,8 @@
> + ACLOCAL_AMFLAGS = -I config
> + 
> + AM_CPPFLAGS = \
> +-    -I$(srcdir)/include
> ++	${zmq_CFLAGS} \
> ++	-I$(srcdir)/include
> + 
> + EXTRA_DIST = \
> + 	version.sh \
> +diff --git a/addons/Makefile.am.supplement b/addons/Makefile.am.supplement
> +index 8800db4..74f0c60 100644
> +--- a/addons/Makefile.am.supplement
> ++++ b/addons/Makefile.am.supplement
> +@@ -4,7 +4,8 @@ EXTRA_DIST += \
> + bin_PROGRAMS += makecert
> + 
> + makecert_LDADD = \
> +-    libczmq.la
> ++    libczmq.la \
> ++    ${zmq_LIBS}
> + 
> + makecert_SOURCES = \
> +     addons/makecert.c
> +diff --git a/configure.ac b/configure.ac
> +index 1a4667e..1ccae06 100755
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -74,50 +74,8 @@ if test "x${CZMQ_GCOV}" == "xyes"; then
> +     fi
> + fi
> + 
> +-# Check for libzmq library
> +-libzmq_prefix=detect
> +-AC_ARG_WITH([libzmq], 
> +-    [AS_HELP_STRING([--with-libzmq=PREFIX], 
> +-        [build with ZeroMQ library installed in PREFIX [default=autodetect]])],
> +-    [case "x$withval" in
> +-        xno)
> +-            AC_MSG_ERROR([CZMQ requires the ZeroMQ library])
> +-            ;;
> +-        xyes|x)
> +-            ;;
> +-        *)
> +-            CPPFLAGS="$CPPFLAGS -I${withval}/include"
> +-            LDFLAGS="$LDFLAGS -L${withval}/lib"
> +-            zeromq_prefix=${withval}
> +-            ;;
> +-    esac ]
> +-)
> +-if test "x$libzmq_prefix" = "xdetect"; then
> +-    PKG_CHECK_MODULES(
> +-        [ZeroMQ], [libzmq], [libzmq_prefix=pkgconfig], [libzmq_prefix=])
> +-        if test "x$libzmq_prefix" = "xpkgconfig"; then
> +-            CPPFLAGS="$CPPFLAGS ${ZeroMQ_CFLAGS}"
> +-            LDFLAGS="$LDFLAGS ${ZeroMQ_LIBS}"
> +-        fi
> +-fi
> +-
> +-if test "x$czmq_search_libzmq" = "xyes"; then
> +-    if test -r "${with_libzmq}/include/zmq.h"; then
> +-        CFLAGS="-I${with_libzmq}/include ${CFLAGS}"
> +-        LDFLAGS="-L${with_libzmq}/lib ${LDFLAGS}"
> +-    fi
> +-fi
> +-
> +-AC_CHECK_HEADER([zmq.h], [], [AC_MSG_ERROR([cannot find zmq.h])])
> +-
> +-AC_CHECK_LIB(zmq, zmq_init, ,[AC_MSG_ERROR([cannot link with -lzmq, install libzmq.])])
> +-
> +-AC_MSG_CHECKING([whether libzmq installation works])
> +-AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <zmq.h>],
> +-                                [zmq_init(1);])
> +-               ],
> +-               [AC_MSG_RESULT([yes])],
> +-               [AC_MSG_ERROR([no. Please specify libzmq installation prefix using --with-libzmq])])
> ++# Check for libzmq
> ++PKG_CHECK_MODULES([zmq], [libzmq])
> + 
> + # Platform specific checks
> + czmq_on_mingw32="no"
> +diff --git a/model/build-autoconf.gsl b/model/build-autoconf.gsl
> +index d012a3c..30aff14 100644
> +--- a/model/build-autoconf.gsl
> ++++ b/model/build-autoconf.gsl
> +@@ -46,12 +46,39 @@ lib$(project.name)_la_SOURCES = \\
> + 
> + bin_PROGRAMS = $(project.name)_selftest
> + 
> ++$(project.name)_selftest_CPPFLAGS = \\
> ++.for package_dependency where defined (package_dependency.for_test)
> ++    \${$(package_dependency.name)_CFLAGS} \\
> ++.endfor
> ++    \${lib$(project.name)_la_CFLAGS}
> ++
> + $(project.name)_selftest_LDADD = \\
> ++.if count (package_dependency, defined (count.for_lib) | defined (count.for_test) | defined (count.for_all)) > 0
> ++    lib$(project.name).la \\
> ++.else
> +     lib$(project.name).la
> ++.endif
> ++.for package_dependency where defined (package_dependency.for_lib) | defined (package_dependency.for_test) | defined (package_dependency.for_all)
> ++.   if last()
> ++    \${$(package_dependency.name)_LIBS}
> ++.   else
> ++    \${$(package_dependency.name)_LIBS} \\
> ++.endif
> ++.endfor
> + 
> + $(project.name)_selftest_SOURCES = \\
> +     src/$(project.name)_selftest.c
> + 
> ++lib$(project.name)_la_CPPFLAGS = \\
> ++.for package_dependency where defined (package_dependency.for_lib)
> ++.   if last()
> ++    \${$(package_dependency.name)_CFLAGS}
> ++.   else
> ++    \${$(package_dependency.name)_CFLAGS} \\
> ++.   endif
> ++.endfor
> ++    ${AM_CPPFLAGS}
> ++
> + lib$(project.name)_la_LDFLAGS = \\
> +     -version-info @LTVER@
> + 
> +@@ -62,6 +89,7 @@ lib$(project.name)_la_LDFLAGS += \\
> + endif
> + 
> + TESTS = $(project.name)_selftest
> ++
> + .for model
> + .   if first ()
> + 
> +diff --git a/model/project.xml b/model/project.xml
> +index 91306cf..b7bab4a 100644
> +--- a/model/project.xml
> ++++ b/model/project.xml
> +@@ -2,6 +2,9 @@
> +     name = "czmq"
> +     script = "project.gsl"
> +     >
> ++
> ++    <package_dependency name="zmq" pkg_name="libzmq" for_all="1" />
> ++
> +     <header name = "czmq" />
> +     <header name = "czmq_prelude" />
> + 
> +diff --git a/src/Makefile.am.supplement b/src/Makefile.am.supplement
> +index 91e5b62..929aa07 100644
> +--- a/src/Makefile.am.supplement
> ++++ b/src/Makefile.am.supplement
> +@@ -95,12 +95,19 @@ libczmq_la_SOURCES = \
> + 
> + bin_PROGRAMS = czmq_selftest
> + 
> ++czmq_selftest_CPPFLAGS = \
> ++    ${src_libczmq_la_CFLAGS}
> ++
> + czmq_selftest_LDADD = \
> +-    libczmq.la
> ++    libczmq.la \
> ++    ${zmq_LIBS}
> + 
> + czmq_selftest_SOURCES = \
> +     src/czmq_selftest.c
> + 
> ++libczmq_la_CPPFLAGS = \
> ++    ${AM_CPPFLAGS}
> ++
> + libczmq_la_LDFLAGS = \
> +     -version-info @LTVER@
> + 
> +@@ -112,6 +119,9 @@ endif
> + 
> + TESTS = czmq_selftest
> + 
> ++# define custom target for all products of /src
> ++src: src/libczmq.la src/czmq_selftest
> ++
> + # Produce generated models; do this manually in src directory
> + code:
> + 	gsl -q src/sockopts.xml
> +-- 
> +1.9.3
> +
> diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
> index b585c94..d25bf01 100644
> --- a/package/czmq/czmq.mk
> +++ b/package/czmq/czmq.mk
> @@ -18,10 +18,6 @@ CZMQ_LICENSE_FILES = LICENSE
>  # host-python, so disable asciidoc entirely.
>  CZMQ_CONF_ENV = ac_cv_prog_czmq_have_asciidoc=no
>  
> -ifeq ($(BR2_STATIC_LIBS),y)
> -CZMQ_CONF_OPTS += LIBS="-lstdc++ -lm"
> -endif
> -
>  define CZMQ_CREATE_CONFIG_DIR
>  	mkdir -p $(@D)/config
>  endef
> -- 
> 1.9.3
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
