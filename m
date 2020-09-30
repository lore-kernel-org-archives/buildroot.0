From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Sep 2020 22:52:03 +0200
Subject: [Buildroot] [PATCH 1/2] package/gdb: fix build of
 gdbserver-only on the ARC gdb version
In-Reply-To: <20200928201128.78005-1-thomas.petazzoni@bootlin.com>
References: <20200928201128.78005-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200930205203.GW11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-09-28 22:11 +0200, Thomas Petazzoni spake thusly:
> The GDB version used on ARC is based on a recent gdb code base, post
> gdb 9.2. This recent gdb code base, which pre-figures what will be in
> gdb 10, has a significant change: gdbserver is not longer in
> gdb/gdbserver, but at the top-level, and the mechanism to build
> gdbserver only has changed. Due to this change, a build of ARC GDB for
> gdbserver only fails with:
> 
> /bin/bash: line 0: cd: /opt/output/build/gdb-arc-2020.03-release-gdb/gdb/gdbserver: No such file or directory
[--SNIP--]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index 6b63a6214b..2e5588bfbc 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -12,6 +12,9 @@ ifeq ($(BR2_arc),y)
>  GDB_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(GDB_VERSION))
>  GDB_SOURCE = gdb-$(GDB_VERSION).tar.gz
>  GDB_FROM_GIT = y
> +# recent gdb versions (>= 10) have gdbserver moved at the top-level,
> +# which requires a different build logic.
> +GDB_GDBSERVER_TOPLEVEL = y

I was wondering if that should not instead be defined in Config.in, and
have the various gdb versions select it.

But it turns out that we do not have a version choice for the target
variant of gdb; it's really onlythe arc fork, and then gdb-10 when we
bump it, that have it.

So, it is easier to handle from gdb.mk, indeed.

Regards,
Yann E. MORIN.

>  endif
>  
>  ifeq ($(BR2_csky),y)
> @@ -23,23 +26,22 @@ endif
>  GDB_LICENSE = GPL-2.0+, LGPL-2.0+, GPL-3.0+, LGPL-3.0+
>  GDB_LICENSE_FILES = COPYING COPYING.LIB COPYING3 COPYING3.LIB
>  
> -# We only want gdbserver and not the entire debugger.
> -ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),)
> +# On gdb < 10, if you want to build only gdbserver, you need to
> +# configure only gdb/gdbserver.
> +ifeq ($(BR2_PACKAGE_GDB_DEBUGGER)$(GDB_GDBSERVER_TOPLEVEL),)
>  GDB_SUBDIR = gdb/gdbserver
> +
> +# When we want to build the full gdb, or for very recent versions of
> +# gdb with gdbserver at the top-level, out of tree build is mandatory,
> +# so we create a 'build' subdirectory in the gdb sources, and build
> +# from there.
>  else
> -GDB_DEPENDENCIES = ncurses \
> -	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
>  GDB_SUBDIR = build
> -
> -# Since gdb 9, in-tree builds for GDB are not allowed anymore,
> -# so we create a 'build' subdirectory in the gdb sources, and
> -# build from there.
>  define GDB_CONFIGURE_SYMLINK
>  	mkdir -p $(@D)/$(GDB_SUBDIR)
>  	ln -sf ../configure $(@D)/$(GDB_SUBDIR)/configure
>  endef
>  GDB_PRE_CONFIGURE_HOOKS += GDB_CONFIGURE_SYMLINK
> -
>  endif
>  
>  # For the host variant, we really want to build with XML support,
> @@ -137,13 +139,29 @@ GDB_CONF_OPTS = \
>  	--without-x \
>  	--disable-sim \
>  	$(GDB_DISABLE_BINUTILS_CONF_OPTS) \
> -	$(if $(BR2_PACKAGE_GDB_SERVER),--enable-gdbserver,--disable-gdbserver) \
> -	--with-curses \
>  	--without-included-gettext \
>  	--disable-werror \
>  	--enable-static \
>  	--without-mpfr
>  
> +ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),y)
> +GDB_CONF_OPTS += \
> +	--enable-gdb \
> +	--with-curses
> +GDB_DEPENDENCIES = ncurses \
> +	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
> +else
> +GDB_CONF_OPTS += \
> +	--disable-gdb \
> +	--without-curses
> +endif
> +
> +ifeq ($(BR2_PACKAGE_GDB_SERVER),y)
> +GDB_CONF_OPTS += --enable-gdbserver
> +else
> +GDB_CONF_OPTS += --disable-gdbserver
> +endif
> +
>  # When gdb is built as C++ application for ARC it segfaults at runtime
>  # So we pass --disable-build-with-cxx config option to force gdb not to
>  # be built as C++ app.
> -- 
> 2.26.2
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
