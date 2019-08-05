From: ratbert90 <aduskett@gmail.com>
Date: Mon, 5 Aug 2019 11:39:50 +0000
Subject: [Buildroot] [PATCH v13 1/5] package/libiberty: new package
In-Reply-To: <d33c9e8f-4b57-72a4-5538-0655ae8f9641@mind.be>
References: <20190804001429.51451-1-aduskett@gmail.com>,
 <d33c9e8f-4b57-72a4-5538-0655ae8f9641@mind.be>
Message-ID: <DM6PR06MB5833EEEB29859175EFDB37B4FBDA0@DM6PR06MB5833.namprd06.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Yann and Thomas, if possible I would like your opinion on this as well.

Thanks!

Adam


________________________________
From: Arnout Vandecappelle <arnout@mind.be>
Sent: Sunday, August 4, 2019 18:23
To: aduskett at gmail.com; buildroot at buildroot.org
Cc: Yann E. MORIN
Subject: Re: [Buildroot] [PATCH v13 1/5] package/libiberty: new package



On 04/08/2019 02:14, aduskett at gmail.com wrote:
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

This is all pretty annoying. As discussed on IRC, libiberty really is only
needed for prelink-cross. And in fact, in the latest prelink-cross master, only
a single function from it is used, from the execstack executable. That gives us
the six following possible solutions to the problem:

1. This one, which has the disadvantage that it may have insofar hidden effects
on packages, like it does on gdb.

2. A separate package like this one, but install it in a different place (e.g.
--prefix=$(HOST_DIR)/libiberty), or not install it at all and instead copy the
library to prelink-cross. This avoids any influence on other packages.

3. Define it as an _EXTRA_DOWNLOAD of prelink-cross. However, that would need
either additional patching of the prelink-cross build system, or essentially two
packages (two configures, to builds, ...) in the prelink-cross package.

4. Don't build execstack, either by patching Makefile.am, or by setting
HOST_PRELINK_CROSS_MAKE_OPTS = prelink and manually copying the prelink executable.

5. Copy the required files into prelink-cross sources and add them to
Makefile.am (as an upstreamable patch). It's a pretty big patch though, 8 files
are needed: ansidecl.h filenames.h lbasename.c libiberty.h lrealpath.c
make-relative-prefix.c safe-ctype.c safe-ctype.h

6. Patch execstack to not call make_relative_prefix, or make a simplified
implementation. That may be quite a bit of work.


However, solution 1 is still an option. So

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Regards,
Arnout


> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
> Changes v1 -> v11:
> - Add this patch to the series
>
> DEVELOPERS | 1 +
> package/libiberty/libiberty.hash | 2 ++
> package/libiberty/libiberty.mk | 27 +++++++++++++++++++++++++++
> 3 files changed, 30 insertions(+)
> create mode 100644 package/libiberty/libiberty.hash
> create mode 100644 package/libiberty/libiberty.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 8a83f748d1..e9da0c7f50 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2362,6 +2362,7 @@ F: package/keyutils/
> F: package/libbsd/
> F: package/libedit/
> F: package/libgsm/
> +F: package/libiberty/
> F: package/libinput/
> F: package/libiscsi/
> F: package/libpri/
> diff --git a/package/libiberty/libiberty.hash b/package/libiberty/libiberty.hash
> new file mode 100644
> index 0000000000..270f38dfa7
> --- /dev/null
> +++ b/package/libiberty/libiberty.hash
> @@ -0,0 +1,2 @@
> +# From ftp://gcc.gnu.org/pub/binutils/releases/sha512.sum
> +sha512 d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724afa1e43bd0db45cfc9916b41519b67dfce03232aa4978704492a6994a binutils-2.32.tar.xz
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
> + --disable-multilib \
> + --enable-install-libiberty
> +
> +# Some packages (e.g. host-gdb) will pick this library and build shared
> +# objects with it. But libiberty does not honour the --enable-shared and
> +# --disable-static flags; it only ever builds a static library no matter
> +# what. So we must force -fPIC in build flags.
> +HOST_LIBIBERTY_CONF_ENV = \
> + CFLAGS="$(HOST_CFLAGS) -fPIC" \
> + LDFLAGS="$(HOST_LDFLAGS) -fPIC"
> +
> +$(eval $(host-autotools-package))
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190805/8b178b7e/attachment.html>
