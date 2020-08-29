From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 29 Aug 2020 23:11:47 +0200
Subject: [Buildroot] [git commit] package/uclibc: use HOSTCC_NOCCACHE as
 kconfig HOSTCC
Message-ID: <20200829210515.AE7B78527C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=689fe66100b140666770ed864a820fe91239ce18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uclibc is part of the toolchain, and as such does not have a dependency
on it. As a consequence, it does not have a dependency on host-ccache,
when this is needed.

Usually, host-ccache is built before uclibc, as part of the dependency
of gcc-initial, host-binutils, and a few other host packages that are
built before uclibc.

However, during top-level parallel builds, this ordering is only ever
guaranteed at the beginning of the configure step, and not before.

But for kconfig-packages, the moment we apply the configuration to
prepare the .config file is a pseudo step that happens somewhere in
limbo between the patch step and the configure step. As such, the
build ordering that is otherwise guaranteed by the _DEPENDENCIES is not
applicable yet.

And so, with top-level parallel builds with ccache enabled, there is
nothing that guarantees host-ccache to be built and installed by the
time we are trying to generate uclibc's .config file, which can be quite
early in the build process, and thus the build fails:

    /home/raphael/github/ftcommunity-TXT/buildroot-rootfs/output/per-package/uclibc/host/bin/ccache /usr/bin/gcc /home/raphael/github/ftcommunity-TXT/buildroot-rootfs/output/build/uclibc-1.0.34/extra/config/conf.c  -c -o ../../extra/config/conf.o -Os -I/usr/include/ncursesw -DCURSES_LOC="<curses.h>"  -DNCURSES_WIDECHAR=1 -DLOCALE -DKBUILD_NO_NLS -DCONFIG_='""'   -I/usr/include/ncursesw -DCURSES_LOC="<curses.h>"  -DNCURSES_WIDECHAR=1 -DLOCALE -DKBUILD_NO_NLS -DCONFIG_='""'
    /bin/sh: 1: /home/raphael/github/ftcommunity-TXT/buildroot-rootfs/output/per-package/uclibc/host/bin/ccache: not found
    make[2]: *** [Makefile:64: ../../extra/config/conf.o] Error 127
    make[1]: *** [Makefile.in:475: extra/config/conf] Error 2
    make[1]: Leaving directory '/home/raphael/github/ftcommunity-TXT/buildroot-rootfs/output/build/uclibc-1.0.34'
    make: *** [package/uclibc/uclibc.mk:458: /home/raphael/github/ftcommunity-TXT/buildroot-rootfs/output/build/uclibc-1.0.34/.stamp_dotconfig] Error 2
    make: *** Waiting for unfinished jobs....

The root cause is that uclibc sets;

    UCLIBC_KCONFIG_OPTS = $(UCLIBC_MAKE_FLAGS) [...]

with:

    UCLIBC_MAKE_FLAGS = [...] HOSTCC="$(HOSTCC)"

And then the kconfig-package infra calls to the configurators,
menuconfig, xconfig et al, but also olddefconfig et al.. with:

    [...] $($(1)_MAKE) [...] $(PKG_KCONFIG_COMMON_OPTS) $($(1)_KCONFIG_OPTS) [...]

with (note a latent bug in there, will be fixed in another patch):

    PKG_KCONFIG_COMMON_OPTS = HOSTCC=$(HOSTCC_NOCCACHE)

So, a HOSTCC as set by a package will always win onver the one set by
the infra, which is exactly what we want.

But in this case, uclibc sets HOSTCC so that it can build its host tools
needed during the build, and in doing so uses the ccache-enabled host c
compiler. Which might not yet be available for the kconfig-package infra
to generate the .config file.

We had a similar (non-)issue for the linux package, which was fixed in
commit 71a31b2357 (linux: use HOSTCC_NOCCACHE as kconfig HOSTCC).

But here, uclibc does not have the toolchain in its dependencies (as said
earlier, uclibc *is* part of the toolchain).

Since the host compiler is only used to build very few files to generate
the simple executable needed to generate the .config file, doing without
the ccache-enabled host compiler will be amply enough.

So, we override HOSTCC in UCLIBC_KCONFIG_OPTS, to use the non-cached
host compiler.

Note that, in a first approximation, one would be tempted to change the
ordering in the kconfig-package infra:

        $($(1)_KCONFIG_OPTS) $(PKG_KCONFIG_COMMON_OPTS)

so that the non-cached HOSTCC always wins over the cached one. But this
would be incorrect, in cases where the package really needs to override
HOSTCC; indeed we want the package-provided values to always win over
the default ones providing by the infra.

Reported-by: Raphael Jacob <r.jacob2002@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/uclibc/uclibc.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 3ba4589672..daf81d29b2 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -31,8 +31,13 @@ endif
 UCLIBC_KCONFIG_FILE = $(UCLIBC_CONFIG_FILE)
 UCLIBC_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_UCLIBC_CONFIG_FRAGMENT_FILES))
 
+# UCLIBC_MAKE_FLAGS set HOSTCC to the default HOSTCC, which may be
+# wrapped with ccache. However, host-ccache may not already be built
+# and installed when we apply the configuration, so we override that
+# to use the non-ccached host compiler.
 UCLIBC_KCONFIG_OPTS = \
 	$(UCLIBC_MAKE_FLAGS) \
+	HOSTCC="$(HOSTCC_NOCCACHE)" \
 	PREFIX=$(STAGING_DIR) \
 	DEVEL_PREFIX=/usr/ \
 	RUNTIME_PREFIX=$(STAGING_DIR)/
