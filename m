From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 Jun 2017 22:45:01 +0200
Subject: [Buildroot] [PATCH v5] autofs: allow to use libtirpc instead of
 internal C implementation
In-Reply-To: <20170628105037.GA28275@waldemar-brodkorb.de>
References: <20170628105037.GA28275@waldemar-brodkorb.de>
Message-ID: <20170628204501.GA2973@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar, All,

On 2017-06-28 12:50 +0200, Waldemar Brodkorb spake thusly:
> uClibc-ng removed internal RPC implementation as it
> is ipv4 only and can not be used for most important RPC software
> rpcbind and nfs-utils.
> musl does not implement RPC and GNU C library deprecated the
> internal implementation a while ago.
> It is still possible to use the C library implementation.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1 -> v2:
>   - Thomas Petazzoni wants to keep legacy C library provided RPC
>     support
> v2 -> v3:
>   - combine with BR2_PACKAGE_LIBTIRPC conditionally, suggested by
>     Baruch Siach
> v3 -> v4:
>   - add patch to use pkg-config to search libtirpc
>   - automatically use it when BR2_TOOLCHAIN_HAS_NATIVE_RPC isn't
>     available
>   - tested with glibc/uclibc-ng toolchains
> v4 -> v5:
>   - new autofs patch, changes requested by Upstream
>   - difference to upstream patch, relative path to pkg.m4 used
> ---
>  ...fig-to-search-for-libtirpc-to-fix-cross-c.patch | 152 +++++++++++++++++++++
>  package/autofs/Config.in                           |   7 +-
>  package/autofs/autofs.mk                           |  10 +-
>  3 files changed, 164 insertions(+), 5 deletions(-)
>  create mode 100644 package/autofs/0002-use-pkg-config-to-search-for-libtirpc-to-fix-cross-c.patch
> 
> diff --git a/package/autofs/0002-use-pkg-config-to-search-for-libtirpc-to-fix-cross-c.patch b/package/autofs/0002-use-pkg-config-to-search-for-libtirpc-to-fix-cross-c.patch
> new file mode 100644
> index 0000000..2ef1a39
> --- /dev/null
> +++ b/package/autofs/0002-use-pkg-config-to-search-for-libtirpc-to-fix-cross-c.patch
> @@ -0,0 +1,152 @@
> +From 1f730dbe74721abd27a83efcaaa3db07b16d33ec Mon Sep 17 00:00:00 2001
> +From: Waldemar Brodkorb <wbx@openadk.org>
> +Date: Tue, 27 Jun 2017 18:11:56 +0200
> +Subject: [PATCH] use pkg-config to search for libtirpc to fix
> + cross-compilation
> +
> +When trying to cross-compile autofs for example with a buildsystem
> +like buildroot, the compilation fails in case the user wants to use
> +libtirpc library as RPC implementation. A hard coded include path
> +in aclocal.m4 is used. Other opensource software like rpcbind or
> +nfs-utils are suing autotools pkgconfig infrastructure to find
> +the libtirpc headers and to pass the correct linker flags.
> +
> +Convert configure.in to use PKG_CHECK_MODULES and remove the
> +hand written autoconf macros from aclocal.m4.
> +

As a reminder for the others: when autoreconfiguring libtirpc with the
change to use pkg-config, the PKG_CHECK_MODULES macros is not expanded
during autoreconf, and Waldemar fixed that by explicitly including
pkg.m4 , where the macro is defined, rather than let autoconf find it
automatically (it is in its search path, after all). Thus the following:

> +To autoreconf the package you need pkg-config or pkgconf installed,
> +which provides the needed autoconf macros in pkg.m4. For an
> +non-automake project a full path to pkg.m4 is required.

Are you sure this is the real explanation, that pkg.m4 is not found
because the projet does not use automake (but just autoconf) ?

I found that clain to be dubious, so I came up with a simple test-case,
which proves your claim wrong:

    $ cat configure.ac
    AC_PREREQ([2.67])
    AC_INIT([bar],[0.0.0],[me at threre])
    PKG_CHECK_MODULES([MYSTUFF],[mystuff])
    AC_CONFIG_FILES([tutu])
    AC_OUTPUT

    $ autoreconf -fi

    $ touch tutu.in

    $ ./configure
    checking for pkg-config... /usr/bin/pkg-config
    checking pkg-config is at least version 0.9.0... yes
    checking for MYSTUFF... no
    configure: error: Package requirements (mystuff) were not met:

    No package 'mystuff' found

    Consider adjusting the PKG_CONFIG_PATH environment variable if you
    installed software in a non-standard prefix.

    Alternatively, you may set the environment variables MYSTUFF_CFLAGS
    and MYSTUFF_LIBS to avoid the need to call pkg-config.
    See the pkg-config man page for more details.

As you can see, this trivial configure.ac does not use automake, yet
pkg-config *is* found.

As an aside, the above is a native test, of course, but when this is
added as a Buildroot package (bar), and we have:
    BAR_AUTORECONF = YES
    BAR_DEPENDENCIES = host-pkgconf

then the result is similar to the above, not the issue you experienced.

So, no, explicitly including pkg.m4 is not the solution...

I'd like to understand why in this specific case the pkg-config macros
are not found/used, rather than monkey-patch it...

Regards,
Yann E. MORIN.

> +This fixes cross-compilation of autofs and allows to use
> +alternative C libraries as uClibc-ng without internal RPC
> +support to be used in cross-compiling environments.
> +
> +Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> +---
> + Makefile.conf.in |  3 ++-
> + Makefile.rules   |  2 +-
> + aclocal.m4       | 48 ------------------------------------------------
> + configure.in     | 16 ++++++++++++++--
> + 4 files changed, 17 insertions(+), 52 deletions(-)
> +
> +diff --git a/Makefile.conf.in b/Makefile.conf.in
> +index 2bc3202..f879e26 100644
> +--- a/Makefile.conf.in
> ++++ b/Makefile.conf.in
> +@@ -64,7 +64,8 @@ RPCGEN = @PATH_RPCGEN@
> + RANLIB = @PATH_RANLIB@
> + 
> + # Use libtirpc if requested and available
> +-TIRPCLIB = @TIRPCLIB@
> ++TIRPCLIB = @TIRPC_LIBS@
> ++TIRPCCFLAGS = @TIRPC_CFLAGS@
> + 
> + # Use dmalloc for memory debuging
> + DMALLOCLIB = @DMALLOCLIB@
> +diff --git a/Makefile.rules b/Makefile.rules
> +index 7d1af2e..0edf9bf 100644
> +--- a/Makefile.rules
> ++++ b/Makefile.rules
> +@@ -46,7 +46,7 @@ CFLAGS += -D_REENTRANT -D_FILE_OFFSET_BITS=64
> + LIBS += -lpthread
> + 
> + ifdef TIRPCLIB
> +-CFLAGS += -I/usr/include/tirpc
> ++CFLAGS += $(TIRPCCFLAGS)
> + LIBS += $(TIRPCLIB)
> + endif
> + 
> +diff --git a/aclocal.m4 b/aclocal.m4
> +index 00811e0..31ca602 100644
> +--- a/aclocal.m4
> ++++ b/aclocal.m4
> +@@ -399,51 +399,3 @@ fi
> + LIBS="$af_check_ldap_parse_page_control_save_libs"
> + ])
> + 
> +-dnl --------------------------------------------------------------------------
> +-dnl AF_CHECK_LIBTIRPC
> +-dnl
> +-dnl Use libtirpc for rpc transport
> +-dnl --------------------------------------------------------------------------
> +-AC_DEFUN([AF_CHECK_LIBTIRPC],
> +-[
> +-# save current flags
> +-af_check_libtirpc_save_cflags="$CFLAGS"
> +-af_check_libtirpc_save_libs="$LIBS"
> +-CFLAGS="$CFLAGS -I/usr/include/tirpc"
> +-LIBS="$LIBS -ltirpc"
> +-
> +-AC_TRY_LINK(
> +-    [ #include <rpc/rpc.h> ],
> +-    [ CLIENT *cl;
> +-      struct sockaddr_in addr;
> +-      int fd;
> +-      unsigned long ul; struct timeval t; unsigned int ui;
> +-      cl = clntudp_bufcreate(&addr,ul,ul,t,&fd,ui,ui); ],
> +-    [ af_have_libtirpc=yes
> +-      AC_MSG_RESULT(yes) ],
> +-    [ AC_MSG_RESULT(no) ])
> +-
> +-if test "$af_have_libtirpc" = "yes"; then
> +-    AC_DEFINE(WITH_LIBTIRPC,1, [Define to 1 if you have the libtirpc library installed])
> +-    AC_DEFINE(TIRPC_WORKAROUND,1, [Define to 1 to use the libtirpc tsd usage workaround])
> +-    TIRPCLIB="-ltirpc"
> +-fi
> +-
> +-AC_CHECK_FUNCS([getrpcbyname getservbyname])
> +-
> +-# restore flags
> +-CFLAGS="$af_check_libtirpc_save_cflags"
> +-LIBS="$af_check_libtirpc_save_libs"
> +-])
> +-
> +-AC_DEFUN([AF_WITH_LIBTIRPC],
> +-[AC_MSG_CHECKING([if libtirpc is requested and available])
> +-AC_ARG_WITH(libtirpc,
> +-[  --with-libtirpc         use libtirpc if available],
> +-[if test "$withval" = yes; then
> +-  AF_CHECK_LIBTIRPC()
> +-else
> +-  AC_MSG_RESULT(no)
> +-fi], [AC_MSG_RESULT(no)])
> +-])
> +-
> +diff --git a/configure.in b/configure.in
> +index 0521252..71e9573 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -11,6 +11,9 @@ define([AC_CACHE_LOAD], )dnl
> + define([AC_CACHE_SAVE], )dnl
> + AC_INIT(.autofs-5.1.3)
> + 
> ++# for pkg-config macros
> ++m4_include([pkg.m4])
> ++
> + #
> + # autofs installs by default in /usr
> + #
> +@@ -124,8 +127,17 @@ AC_SUBST(flagdir)
> + #
> + # Use libtirpc
> + #
> +-AF_WITH_LIBTIRPC()
> +-AC_SUBST(TIRPCLIB)
> ++PKG_PROG_PKG_CONFIG()
> ++AC_ARG_WITH([libtirpc], AS_HELP_STRING([--with-libtirpc], [use libtirpc if available]))
> ++if test "x$with_libtirpc" = "xyes"; then
> ++  PKG_CHECK_MODULES([TIRPC],[libtirpc],[
> ++		AC_DEFINE(WITH_LIBTIRPC,1,
> ++			[Define to 1 if you have the libtirpc library installed])
> ++		AC_DEFINE(TIRPC_WORKAROUND,1,
> ++			[Define to 1 to use the libtirpc tsd usage workaround])
> ++    ])
> ++  AC_CHECK_FUNCS([getrpcbyname getservbyname])
> ++fi
> + 
> + #
> + # Optional include dmalloc
> +-- 
> +2.1.4
> +
> diff --git a/package/autofs/Config.in b/package/autofs/Config.in
> index 8e08357..efb0ec2 100644
> --- a/package/autofs/Config.in
> +++ b/package/autofs/Config.in
> @@ -2,8 +2,8 @@ config BR2_PACKAGE_AUTOFS
>  	bool "autofs"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	depends on BR2_USE_MMU
> -	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	depends on !BR2_STATIC_LIBS # dlfcn
> +	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
>  	help
>  	  Autofs controls the operation of the automount daemons. The
>  	  automount daemons automatically mount filesystems when they
> @@ -15,7 +15,6 @@ config BR2_PACKAGE_AUTOFS
>  
>  	  http://www.linuxfromscratch.org/blfs/view/svn/general/autofs.html
>  
> -comment "autofs needs a toolchain w/ NPTL, RPC, dynamic library"
> +comment "autofs needs a toolchain w/ NPTL and dynamic library"
>  	depends on BR2_USE_MMU
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
> -		!BR2_TOOLCHAIN_HAS_NATIVE_RPC
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
> diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
> index 148ab1b..eb28306 100644
> --- a/package/autofs/autofs.mk
> +++ b/package/autofs/autofs.mk
> @@ -9,7 +9,8 @@ AUTOFS_SOURCE = autofs-$(AUTOFS_VERSION).tar.xz
>  AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
>  AUTOFS_LICENSE = GPL-2.0+
>  AUTOFS_LICENSE_FILES = COPYING COPYRIGHT
> -AUTOFS_DEPENDENCIES = host-flex host-bison
> +AUTOFS_DEPENDENCIES = host-flex host-bison host-pkgconf
> +AUTOFS_AUTORECONF = YES
>  
>  # autofs looks on the build machine for the path of modprobe, so tell
>  # it explicitly where it will be located on the target.
> @@ -31,4 +32,11 @@ AUTOFS_CONF_OPTS = \
>  
>  AUTOFS_MAKE_ENV = DONTSTRIP=1
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_NATIVE_RPC),)
> +AUTOFS_CONF_OPTS += --with-libtirpc
> +AUTOFS_DEPENDENCIES += libtirpc
> +else
> +AUTOFS_CONF_OPTS += --without-libtirpc
> +endif
> +
>  $(eval $(autotools-package))
> -- 
> 2.1.4
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
