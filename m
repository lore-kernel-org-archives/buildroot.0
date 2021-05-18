From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 16:21:42 +0200
Subject: [Buildroot] [PATCHv2 1/3] package/poke: new package
In-Reply-To: <20210517155628.267749-1-romain.naour@gmail.com>
References: <20210517155628.267749-1-romain.naour@gmail.com>
Message-ID: <20210518142142.GP2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2021-05-17 17:56 +0200, Romain Naour spake thusly:
> Backport a patch to disable tcl/tk dependencies when gui support
> is disabled.
> 
> Backport and rebase a patch to avoid host poisoning while
> cross-compiling.
> 
> Add another local patch when HELP2MAN is missing.
> 
> Disable uClibc-ng toolchain for now due to issues with
> bundled gnulib.
> 
> The license of gnulib is not easy to describe because
> it bundle several sources files with different license [1][2].
> Even if not SPDX compliant, use "gnulib license".
> 
> [1] https://git.savannah.gnu.org/cgit/gnulib.git/tree/COPYING
> [2] https://src.fedoraproject.org/rpms/gnulib/blob/rawhide/f/gnulib.spec#_53
> 
> See:
> http://www.jemarch.net/poke-1.0-relnotes.html
> http://www.jemarch.net/poke-1.1-relnotes.html
> http://www.jemarch.net/poke-1.2-relnotes.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Jose E. Marchesi <jemarch@gnu.org>
> Cc: Luca Saiu <positron@gnu.org>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
[--SNIP--]
> diff --git a/package/poke/Config.in b/package/poke/Config.in
> new file mode 100644
> index 0000000000..d3334dfdd4
> --- /dev/null
> +++ b/package/poke/Config.in
> @@ -0,0 +1,29 @@
> +config BR2_PACKAGE_POKE
> +	bool "poke"
> +	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # bdwgc

You forgot to propagate that dependency to the comment...

> +	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # less

I've switched to selecting that, otherwise you'd have to also propagate
it to the ocmment somehow.

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
> +comment "poke needs a glibc or musl toolchain w/ NPTL, wchar"
> +	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR

I think this was not correct. Indeed, if you have a glibc or a musl
toolchain, the first dependency is not met, so the comment is hidden.
However, if you do not have wchar, you still want to see the comment.

I've fixed that, with the LIBATOMIC_OPS_ARCH_SUPPORTS.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> diff --git a/package/poke/poke.hash b/package/poke/poke.hash
> new file mode 100644
> index 0000000000..b3a79d90dc
> --- /dev/null
> +++ b/package/poke/poke.hash
> @@ -0,0 +1,4 @@
> +# Locally calculated
> +sha256  f61cf8da5b64c01a1359373725aad1ca257f35c1c9269e4d50dd0664183ddf62  poke-1.2.tar.gz
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  jitter/COPYING
> diff --git a/package/poke/poke.mk b/package/poke/poke.mk
> new file mode 100644
> index 0000000000..c0217b6fad
> --- /dev/null
> +++ b/package/poke/poke.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# poke
> +#
> +################################################################################
> +
> +POKE_VERSION = 1.2
> +POKE_SITE = $(BR2_GNU_MIRROR)/poke
> +# gnulib license is a mix/mess of public-domain and various GPL and LGPL versions.
> +POKE_LICENSE = GPL-3.0+, GPL-3.0+ (jitter), gnulib license (gnulib)
> +POKE_LICENSE_FILES = COPYING jitter/COPYING
> +
> +# 0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
> +# 0003-configure.ac-HELP2MAN-replace-by-false-when-cross-co.patch
> +POKE_AUTORECONF = YES
> +
> +POKE_DEPENDENCIES = host-flex host-bison host-pkgconf bdwgc readline
> +
> +POKE_CONF_OPTS = \
> +	--disable-gui \
> +	--disable-libnbd \
> +	--disable-mi \
> +	--with-libreadline-prefix=$(STAGING_DIR)
> +
> +$(eval $(autotools-package))
> -- 
> 2.31.1
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
