From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 May 2021 15:25:08 +0200
Subject: [Buildroot] [PATCH 3/5] package/poke: new package
In-Reply-To: <20210502214919.1826571-4-romain.naour@gmail.com>
References: <20210502214919.1826571-1-romain.naour@gmail.com>
 <20210502214919.1826571-4-romain.naour@gmail.com>
Message-ID: <20210517132508.GX2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2021-05-02 23:49 +0200, Romain Naour spake thusly:
> Backport a patch to disable tcl/tk dependencies when gui support
> is disabled.
> 
> Add a local patch to workaround a path poisoning issue. Issue
> reported upstream.

Upstream has applied a patch similar to yours:
    http://git.ageinghacker.net/jitter/commit?id=428406c7b8d4c20f3472d41ed57c12c1a88ad37e

> Add another local patch when HELP2MAN is missing.
> 
> Disable uClibc-ng toolchain for now due to issues with
> bundled gnulib.
> 
> See:
> http://www.jemarch.net/poke-1.0-relnotes.html
> http://www.jemarch.net/poke-1.1-relnotes.html
> http://www.jemarch.net/poke-1.2-relnotes.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Jose E. Marchesi <jemarch@gnu.org>
> Cc: Luca Saiu <positron@gnu.org>
[--SNIP--]
> diff --git a/package/poke/Config.in b/package/poke/Config.in
> new file mode 100644
> index 0000000000..5d391bfb43
> --- /dev/null
> +++ b/package/poke/Config.in
> @@ -0,0 +1,31 @@
> +config BR2_PACKAGE_POKE
> +	bool "poke"
> +	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # bdwgc
> +	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # less
> +	depends on BR2_USE_WCHAR # needs wctomb
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # gnulib
> +	select BR2_PACKAGE_BDWGC
> +	select BR2_PACKAGE_LESS # runtime
> +	select BR2_PACKAGE_READLINE
> +	help
> +	  GNU poke is a new interactive editor for binary data. Not
> +	  limited to editing basic entities such as bits and bytes,
> +	  it provides a full-fledged procedural, interactive
> +	  programming language designed to describe data structures
> +	  and to operate on them. Once a user has defined a structure
> +	  for binary data (usually matching some file format) she can
> +	  search, inspect, create, shuffle and modify abstract entities
> +	  such as ELF relocations, MP3 tags, DWARF expressions,
> +	  partition table entries, and so on, with primitives
> +	  resembling simple editing of bits and bytes. The program
> +	  comes with a library of already written descriptions (or
> +	  "pickles" in poke parlance) for many binary formats.
> +
> +	  https://www.gnu.org/software/poke/
> +
> +comment "poke needs a toolchain w/ NPTL, wchar"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
> +
> +comment "poke needs glibc or musl"
> +	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)

This can (should) be made a single comment:

    comment "poke needs a glibc or musl toolchain w/ NPTL, wchar"
        depends on ...

> diff --git a/package/poke/poke.hash b/package/poke/poke.hash
> new file mode 100644
> index 0000000000..f8d23e635a
> --- /dev/null
> +++ b/package/poke/poke.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  f61cf8da5b64c01a1359373725aad1ca257f35c1c9269e4d50dd0664183ddf62  poke-1.2.tar.gz
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/poke/poke.mk b/package/poke/poke.mk
> new file mode 100644
> index 0000000000..ecf2221acd
> --- /dev/null
> +++ b/package/poke/poke.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# poke
> +#
> +################################################################################
> +
> +POKE_VERSION = 1.2
> +POKE_SITE = $(BR2_GNU_MIRROR)/poke
> +POKE_LICENSE = GPL-3.0+
> +POKE_LICENSE_FILES = COPYING

poke bundles jitter and gnulib; we need the licensing info for those,
too, license names and files (jitter: GPL-3.0+; gnulib: a bit of a
mess.)

> +# 0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
> +# 0003-configure.ac-HELP2MAN-replace-by-false-when-cross-co.patch
> +POKE_AUTORECONF = YES
> +
> +POKE_DEPENDENCIES = host-flex host-bison host-pkgconf bdwgc readline
> +
> +POKE_CONF_OPTS = --disable-gui \
> +	--disable-libnbd \
> +	--disable-mi \
> +	--with-libreadline-prefix=$(STAGING_DIR)

Nitpick: with multi-line assignment, have even the first item on its own
line:

    POKE_CONF_OPTS = \
        --disable-gui \
        --disable-libnbd \
        --disable-mi \
        --with-libreadline-prefix=$(STAGING_DIR)

> +$(eval $(autotools-package))
> -- 
> 2.30.2
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
