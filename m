From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 4 Oct 2015 13:28:40 +0100
Subject: [Buildroot] [PATCH v2 00/18] Internal toolchain wrapper & ccache
	support
Message-ID: <1443961738-12149-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series introduces two features that were discussed on the list and
in the Buildroot Summer Camp: a wrapper for the internal toolchain, and
fixing ccache. See below why the two are combined in one series.

[Note: to make review easier, all the potentially contentious stuff
from the individual patches is repeated here. So for the first few
iterations, it's probably enough to reply to just this e-mail.]

The idea of a wrapper for the internal toolchain has been floating
around for a while now. It allows us to make sure that
BR2_TARGET_OPTIMIZATION and BR2_TARGET_LDFLAGS are passed down to the
compiler and linker even if the package build system doesn't use CFLAGS
and LDFLAGS. This is something which is not tested in the autobuilders
(they never set these options) so probably there are packages out there
that are not built with these flags.

A second reason for the wrapper is to be able to use the unsafe path
check also for internal toolchains without patching gcc.

More recently, and additional motivation for an internal toolchain
wrapper was discovered: it makes the support for a per-package staging
directory significantly simpler. See the discussion in [1][2].

And finally, the wrapper makes the ccache handling simpler, as
explained below.

To create the wrapper for the internal toolchain, this series refactors
as much as possible with the external toolchain. Therefore, the first
few patch moves things around a bit as an enabler of the internal
toolchain wrapper. The same patch also does some related cleanups.

The second patch adds the toolchain wrapper for the internal toolchain.
It uses the same toolchain-wrapper.c as the external toolchain. The
wrapper is created both for gcc-initial and gcc-final. It is rebuilt
for gcc-final, which is not exactly

The real gcc, g++, etc. executables are moved to gcc.real etc. and a
symlink is created to toolchain-wrapper. This requires the wrapper code
to be extended with an additional BR_CROSS_PATH_SUFFIX to find the real
executable. I could have reused the same approach of the external
toolchain, installing in /opt, but that would require copying a bunch
files around as well and overall would be much more invasive, so I
opted for this simpler change.

The creation of the wrapper symlinks is covered by a fairly complex
case-condition which is similar to the external toolchain wrapper. I
didn't refactor these two commands, because there are suble differences
that would make the refactored code very complicated.

The third patch implements the second use case: it removes the 
now-redundant gcc patches that add the unsafe path check. This check is
now handled by the toolchain wrapper. Note that the patches for 
binutils are still needed, since ld isn't wrapped. We actually should 
also wrap cpp and ld to cover the first use case.

The first use case (passing TARGET_CFLAGS through the wrapper) isn't
implemented yet because it is a bit complicated, because some packages
do _not_ want TARGET_CFLAGS, e.g. gcc and linux. So some infrastructure
needs to be added that allows overriding TARGET_CFLAGS.

The third use case should be handled by Fabio in his per-package
staging series.

The fourth use case brings us to the ccache problem.

The problem with our current ccache is that we disable hashing of the
compiler executable itself. If we don't do that, using ccache is
pointless since we always rebuild the compiler (for the external
toolchain we rebuild the wrapper) so the cache would always miss.
But in the current situation, if a user changes the compiler
configuration (which would result in the compiler generating different
object files than before) and does 'make clean all', ccache may in fact
reuse object files from the previous run. This rarely gives problems,
because
(1) the cache expires quite quickly (it's only 1GB by default),
(2) radically changing compiler options will cause cache misses because
    different header files are used,
(3) many compiler changes (e.g. changing -mtune) have little practical
    effect because the resulting code is usually still compatible,
(4) we currently don't use CCACHE_BASEDIR, and almost all object files
    will contain an absolute path (e.g. in debug info), so when
    building in a different directory, most of it will miss,
(5) we do mostly build test, and many of the potential problems only
    appear at runtime.
Still, when ccache _does_ use the wrong cached object files, the
effects are really weird and hard to debug. Also, we want reproducible
builds and obviously the above makes builds non-reproducible. So we
have a FAQ entry that warns against using ccache and tells the user to
clear the cache in case of problems.

To fix the situation, this series sets the CCACHE_COMPILERCHECK
environment variable to a hash of the compiler options. I already
analyzed the options that should be checked a while ago in [3].

Unfortunately, it's not so simple, since for the host compiler we
should not use the same hash: on the one hand, it's possible that the
host compiler has changed while the target compiler options are still
the same, and on the other hand when we change the target compiler
options, the cached host object files are still valid.

My first attempt was to create a ccache wrapper that sets the
CCACHE_COMPILERCHECK environment variable, and compiles it differently
for host and target (i.e. use ccache-host for host compilation, and
ccache-target for target compilation). However, it was very difficult
to insert the calculation of the target compiler hash correctly in the
dependency chain. The calculation of the hash really belongs to the
toolchain build, but ccache is already built before everything else.
It's much simpler, instead, to use the toolchain wrapper and insert
ccache in there. That's why these two features (internal toolchain
wrapper and ccache fix) are combined in a single series.

The ccache part of the series starts with moving the ccache handling
into the toolchain wrapper. This allows a lot of follow-up patches to
remove ccache handling in individual packages, including some patches
to handle the fact that CC has multiple words. These patches were
tested by doing a ccache-enabled build of the affected packages, then
cleaning them, then rebuilding, and checking the evolution of the
ccache stats while building. If the number of cache hits is increasing
significantly faster than the number of cache misses, all is well.

Moving the ccache handling into the toolchain wrapper has one nasty
side effect: when you change the value of BR2_CCACHE, this will have no
effect unless host-gcc-final is rebuilt. Of course, we don't really
support the incremental build scenario so it's not such a big deal.
Still, I've added a patch (marked RFC) to support this scenario, by
exporting a BR_NO_CCACHE that tells the wrapper to skip ccache. Note
that this works only to turn ccache off, but I think that's the most
important use case.

Once ccache moves to the wrapper, we can fix the compilercheck. All of
that is done in a single commit - I didn't think splitting it up was
really worthwhile. It reverts the default compilercheck to 'mtime' like
it is in upstream, and it adds an option to the toolchain wrapper to
set the CCACHE_COMPILERCHECK environment variable. The hash is
calculated based on the config options passed to gcc and on the sources
and patches.

A final cleanup step, also marked RFC, is to support changing the
output directory. Many of the build commands have a -I argument
pointing somewhere in the staging directory, so when you rebuild in
a different directory, this will mot match and the cache isn't used.
ccache has the CCACHE_BASEDIR potion to deal with that, but it's not
bullet-proof so I added a Kconfig option for it.

It would be really nice if someone else could take over this series,
since it is rather 'deep' stuff and if someone else really gets their
hands dirty on this code, there's a better chance of catching some
issues that I overlooked.

Changelog:

v2: - Rebased on master.
    - Updated comments to remove the 'external' from the wrapper.
    - Include BR2_GLOBAL_PATCH_DIR in the wrapper hash; also use
      $(wildcard ...) for all patches.
    - Remove --enable-poison-system-directories from gcc-final
      configure.
    - Explain in commit message why gcc-initial also needs the wrapper.


[1] http://lists.busybox.net/pipermail/buildroot/2015-March/121005.html
[2] http://lists.busybox.net/pipermail/buildroot/2015-June/131051.html
[3] http://lists.busybox.net/pipermail/buildroot/2015-April/127341.html

Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: J?r?me Oufella <jerome.oufella@savoirfairelinux.com>
Cc: Danomi Manchego <danomimanchego123@gmail.com>
Cc: K?roly Kasza <kaszak@gmail.com>
Cc: Romain Naour <romain.naour@openwide.fr>


The following changes since commit 0611258aeae3b2e311b1c8fbebd337c9567830fb:

  package/freerdp: needs C++ (2015-10-04 14:16:27 +0200)

are available in the git repository at:

  https://github.com/arnout/buildroot.git toolchain-wrapper-2

for you to fetch changes up to 11995e8efc5b34d78a45a1ea44bcb9cbdc4e53d3:

  [RFC] ccache: support changing the output directory (2015-10-04 13:23:38 +0100)

----------------------------------------------------------------
Arnout Vandecappelle (Essensium/Mind) (18):
      toolchain-external: move wrapper to toolchain directory
      gcc: use toolchain wrapper
      gcc: remove unsafe patch check (poison system dirs) patch
      infra: move ccache handling to the toolchain wrapper
      perl: Remove ccache handling
      imx-lib: remove now-redundant ccache handling
      imx-vpu: remove now-redundant ccache handling
      linux: remove now-redundant ccache handling
      uboot: remove now-redundant ccache handling
      barebox: remove now-redundant ccache handling
      cryptodev-linux: remove now-redundant fix-ccache-compile patch
      qt5base: remove now-redundant ccache handling
      package-cmake: remove now-redundant target ccache support
      qpid-proton: remove now-redundant ccache handling patch
      Makefile.in: remove now-unused TARGET_CC/CXX_NOCCACHE
      toolchain-wrapper: support change of BR2_CCACHE
      ccache: use mtime for external toolchain, CONF_OPTS for internal toolchain
      [RFC] ccache: support changing the output directory

 Config.in                                          |  27 +++
 Makefile                                           |   2 +
 boot/barebox/barebox.mk                            |   3 +-
 boot/uboot/uboot.mk                                |   2 +-
 docs/manual/ccache-support.txt                     |  20 ++
 linux/linux.mk                                     |   2 +-
 package/Makefile.in                                |   8 -
 package/ccache/ccache.mk                           |   5 -
 .../cryptodev-linux/0002-fix-ccache-compile.patch  |  20 --
 package/freescale-imx/imx-lib/imx-lib.mk           |   2 +-
 package/freescale-imx/imx-vpu/imx-vpu.mk           |   2 +-
 .../4.7.4/910-gcc-poison-system-directories.patch  | 207 -------------------
 .../4.8.5/910-gcc-poison-system-directories.patch  | 207 -------------------
 .../4.9.3/910-gcc-poison-system-directories.patch  | 207 -------------------
 .../5.2.0/200-gcc-poison-system-directories.patch  | 207 -------------------
 .../910-gcc-poison-system-directories.patch        | 221 ---------------------
 package/gcc/gcc-final/gcc-final.mk                 |  14 +-
 package/gcc/gcc-initial/gcc-initial.mk             |   4 +
 package/gcc/gcc.mk                                 |  65 +++++-
 package/perl/perl.mk                               |   5 +-
 package/pkg-cmake.mk                               |   5 +-
 ...fix-C-compiler-detection-with-_ARG1-_ARG2.patch |  52 -----
 package/qt5/qt5base/0002-mkspecs-files.patch       |   6 +-
 .../qt5/qt5base/0009-fix-build-with-ccache.patch   |  49 -----
 package/qt5/qt5base/qt5base.mk                     |   1 -
 support/misc/toolchainfile.cmake.in                |  32 +--
 toolchain/toolchain-external/toolchain-external.mk |  55 ++---
 ...ext-toolchain-wrapper.c => toolchain-wrapper.c} |  51 ++++-
 toolchain/toolchain-wrapper.mk                     |  34 ++++
 29 files changed, 231 insertions(+), 1284 deletions(-)
 delete mode 100644 package/cryptodev-linux/0002-fix-ccache-compile.patch
 delete mode 100644 package/gcc/4.7.4/910-gcc-poison-system-directories.patch
 delete mode 100644 package/gcc/4.8.5/910-gcc-poison-system-directories.patch
 delete mode 100644 package/gcc/4.9.3/910-gcc-poison-system-directories.patch
 delete mode 100644 package/gcc/5.2.0/200-gcc-poison-system-directories.patch
 delete mode 100644 package/gcc/arc-2015.06/910-gcc-poison-system-directories.patch
 delete mode 100644 package/qpid-proton/0001-proton-c-fix-C-compiler-detection-with-_ARG1-_ARG2.patch
 delete mode 100644 package/qt5/qt5base/0009-fix-build-with-ccache.patch
 rename toolchain/{toolchain-external/ext-toolchain-wrapper.c => toolchain-wrapper.c} (81%)
 create mode 100644 toolchain/toolchain-wrapper.mk
