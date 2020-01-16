From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 16 Jan 2020 11:33:08 +0100
Subject: [Buildroot] [PATCH v14 1/5] package/libiberty: new package
In-Reply-To: <20191021200438.97453-2-aduskett@gmail.com>
References: <20191021200438.97453-1-aduskett@gmail.com>
 <20191021200438.97453-2-aduskett@gmail.com>
Message-ID: <CAGm1_ksFbqq+a9OULXZFVYSEG5FvMAePcjDMwVkTHPbVbnXBaA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Adam,

On Mon, Oct 21, 2019 at 10:05 PM <aduskett@gmail.com> wrote:
>
> From: Adam Duskett <Aduskett@gmail.com>
>
> Some packages, like prelink-cross, will want to use libiberty but do
> not bundle their own instance (which is good!).
>
> However, libiberty is made for being bundled in packages: all GNU
> packages that use libiberty (gcc, binutils, gdb et al...) all have
> their own bundled variant. This means that there is no official
> upstream for libiberty; the closest being as part of the
> combined binutils-gdb tree.
>
> So we introduce a new host-only package, that installs just libiberty
> from a binutils released tarball.
>
> Again, as libiberty is usually bundled in packages, it usually only
> install a static version. Furthermore, it does not obey to the usual

s/install/installs and perhaps remove "to" after obey

Any plans for v15? Or are you waiting for the next
gobject-introspection release that would make some related patches as
obsolete?

Regards,
Yegor

> --enable-shared and --disable-static flags; it only ever builds a
> static version.
>
> Furthermore, this library is not built with -fPIC, but some packages
> may pick it to build shared objects. This is the case for host-gdb,
> for example, which accidentally picks that library instead of its
> internal one.
>
> So, rather than fix the various gdb versions and variants we can use,
> we ensure that the libiberty we install is usable in shared objects,
> and we ensure it is always built before host-gdb.
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v11:
>   - Add this patch to the series
>
>  DEVELOPERS                       |  1 +
>  package/libiberty/libiberty.hash |  2 ++
>  package/libiberty/libiberty.mk   | 27 +++++++++++++++++++++++++++
>  3 files changed, 30 insertions(+)
>  create mode 100644 package/libiberty/libiberty.hash
>  create mode 100644 package/libiberty/libiberty.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 906ccae006..f10711ee6a 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2426,6 +2426,7 @@ F:        package/keyutils/
>  F:     package/libbsd/
>  F:     package/libedit/
>  F:     package/libgsm/
> +F:     package/libiberty/
>  F:     package/libinput/
>  F:     package/libiscsi/
>  F:     package/libpri/
> diff --git a/package/libiberty/libiberty.hash b/package/libiberty/libiberty.hash
> new file mode 100644
> index 0000000000..270f38dfa7
> --- /dev/null
> +++ b/package/libiberty/libiberty.hash
> @@ -0,0 +1,2 @@
> +# From ftp://gcc.gnu.org/pub/binutils/releases/sha512.sum
> +sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724afa1e43bd0db45cfc9916b41519b67dfce03232aa4978704492a6994a  binutils-2.32.tar.xz
> diff --git a/package/libiberty/libiberty.mk b/package/libiberty/libiberty.mk
> new file mode 100644
> index 0000000000..17976fdd4f
> --- /dev/null
> +++ b/package/libiberty/libiberty.mk
> @@ -0,0 +1,27 @@
> +################################################################################
> +#
> +# libiberty
> +#
> +################################################################################
> +
> +LIBIBERTY_VERSION = 2.32
> +LIBIBERTY_SOURCE = binutils-$(LIBIBERTY_VERSION).tar.xz
> +LIBIBERTY_SITE = $(BR2_GNU_MIRROR)/binutils
> +LIBIBERTY_DL_SUBDIR = binutils
> +LIBIBERTY_SUBDIR = libiberty
> +
> +# We explicitly disable multilib, as we do in binutils.
> +# By default, libiberty installs nothing, so we must force it.
> +HOST_LIBIBERTY_CONF_OPTS = \
> +       --disable-multilib \
> +       --enable-install-libiberty
> +
> +# Some packages (e.g. host-gdb) will pick this library and build shared
> +# objects with it. But libiberty does not honour the --enable-shared and
> +# --disable-static flags; it only ever builds a static library no matter
> +# what. So we must force -fPIC in build flags.
> +HOST_LIBIBERTY_CONF_ENV = \
> +       CFLAGS="$(HOST_CFLAGS) -fPIC" \
> +       LDFLAGS="$(HOST_LDFLAGS) -fPIC"
> +
> +$(eval $(host-autotools-package))
> --
> 2.21.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
