From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Mar 2018 15:19:59 +0100
Subject: [Buildroot] [PATCH v4 0/9] Preparation for per-package host/target
 directories
Message-ID: <20180324142008.10375-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a fourth iteration of the per-package host and target
directory work, but without the actual per-package host and directory
patches: it's only some preparation patches.

If you're interested in testing it, you can find the patch series at:

  http://git.free-electrons.com/users/thomas-petazzoni/buildroot/log/?h=ppsh-v4-preparation

I'm keeping the full explanation about per-package SDK below, but
obviously this is only to give some context, because this series by
itself does not implement it.

Changes since v3
================

 - Dropped patches that have been merged upstream:
   pkgconf: use relative path to  STAGING_DIR instead of absolute path
   toolchain: post-pone evaluation of  TOOLCHAIN_EXTERNAL_BIN

 - For now, removed the most controversial/complicated patches
   (changing the rpath strategy, and switching to per-package
   host/target directories). The goal for now is to merge only the
   preparation patches.

 - Fixed "Makefile, skeleton: move the host skeleton logic to
   host-skeleton package" to use $(Q) instead of @ as suggested by
   Yann.

 - Reviewed-by from Yann added on:
   Makefile, skeleton: move the host skeleton logic to host-skeleton package
   pkg-cmake: install CMake files as part of a package
   package/pkg-generic: add the concept of extract dependency
   package/pkg-generic: handle host-tar as an extract dependency
   package/pkg-generic: handle host-xz as an extract dependency
   package/pkg-generic: handle host-lzip as an extract dependency
   package/pkg-generic: handle host-fakedate as a regular dependency

 - Acked-by from Yann added on:
   core: kill DEPENDENCIES_HOST_PREREQ

 - Fix typo in _EXTRACT_DEPENDENCIES documentation.

 - Add BR2_TAR_HOST_DEPENDENCY as a dependency of the tar filesystem
   format, as suggested by Yann.

 - Use = instead of += when defining BR2_TAR_HOST_DEPENDENCY.

 - Make sure host-ccache is not added as a dependency of itself.

 - Make sure host-fakedate is not added as a dependency of itself.

Changes since v2
================

 - Solved the problem of all DEPENDENCIES_HOST_PREREQ targets:
   host-ccache, host-tar, host-lzip, host-xz, host-fakedate.

   To achieve this, introduced <pkg>_EXTRACT_DEPENDENCIES and used
   that to handle the dependencies on host-tar, host-lzip and host-xz.

   Used regular dependencies for host-ccache and host-fakedate.

   See below for more details.

Changes since v1
================

 - Rebased on the latest Buildroot next branch

 - The pkg-config changes are reworked according to Arnout's comments:
   only @STAGING_SUBDIR@ is replaced in pkg-config.in to generate
   pkg-config, the rest of the logic is internal to the script.

 - New patch to move the "host skeleton" logic into a proper
   host-skeleton package.

 - New patch to have the CMake related files generated as part of the
   toolchain package.

 - New patch to add a new "install" step that depends on the different
   install steps (target, staging, images, host). This is needed to
   later add some logic that is executed once all install steps of a
   package have been done.

 - Fix the approach to solve the RPATH logic: instead of using
   LD_LIBRARY_PATH, we actually fix with patchelf the RPATH of host
   binaries right after their installation.

 - Misc other improvements in the per-package SDK implementation.

What is per-package SDK and target?
===================================

Currently, output/host (SDK) and output/target are global directories:
all packages use files installed by other packages in those global
directories, and in turn into those global directories.

The idea of per-package SDK and target is that instead of having such
global directories, we would have one SDK directory and one target
directory per-package, containing just what this package needs
(dependencies), and in which the package installs its files.

Why do we want per-package SDK and target?
==========================================

There are two main motivations for per-package SDK and target
directories, which are related:

 1. Since the SDK directory is global, a package can currently see
    libraries/headers that it has not explicitly expressed a
    dependency on. So package A may not have a dependency on package
    B, but if package B happens to have been installed before, and
    package A "configure" script automaticatically detects a library
    installed by package B, it will use it. We have added tons of
    conditional dependencies in Buildroot to make such situations less
    problematic, but it is an endless fight, as upstream developers
    constantly add more optional dependencies to their software.

    Using per-package SDK, a given package uses as its SDK a directory
    that only contains the libraries/headers from packages explicitly
    listed in its dependencies. So it cannot mistakenly see a
    library/header installed by another package.

 2. Top-level parallel build (building multiple packages in parallel)
    is currently not enabled because we have global SDK and target
    directories.

    Let's imagine package A configure script auto-detects a library
    provided by package B, but Buildroot does not encode this
    dependency in package A's .mk file. Package A and package B are
    therefore totally independent from a build dependency point of
    view.

    Without top-level parallel build (current situation), you have a
    guarantee on the build order: either A is always built before B,
    or B is always built before A. So at least, every build gives the
    same result: A is built with B's functionality or without it, but
    it is consistent accross rebuilds.

    If you enable top-level parallel build, because A and B are
    totally independent, you can get A built before B or B built
    before A depending on the build scheduling. This can change at
    every build! This means that for a given configuration, A will
    sometimes be built with B's functionality, sometimes not. Totally
    unacceptable.

    And of course, this extends to case where package B gets installed
    while package A is being configured. So package A configure script
    will see some parts of B being installed, other parts not
    installed, causing all sort of weird and difficult to debug race
    conditions.

    By having per-package SDK directories, we ensure that package A
    will only see the dependencies its has explicitly expressed, and
    that no other package gets installed in parallel in the same SDK
    directory.

How is it implemented?
======================

The basic idea is pretty simple:

 - For each package, we have:

   output/per-package/<package>/host, which is the specific SDK
   directory for <package>.

   output/per-package/<package>/target, which is the specific target
   directory for <package>.

 - Before <package> is configured, we copy into its specific SDK and
   target directories the SDK and target directories from its direct
   dependencies. This basically populates its SDK with the
   cross-compiler and all libraries that <package> needs. This copy is
   done using rsync with hard links, so it is very fast and cheap from
   a storage consumption point of view.

 - While <package> is being built, HOST_DIR, STAGING_DIR and
   TARGET_DIR are tweaked to point to the current <package> specific
   SDK and target directories. I.e, HOST_DIR no longer points to
   output/host, but to output/per-package/<package>/host/.

And this is basically enough to get things working!

There are of course a few additional things to do:

 - At the end of the build, we still want a global target directory
   (to generate the filesystem images) and a global SDK. Therefore, in
   target-finalize, we assemble such global directories by copying the
   per-package SDK and target directories from all packages listed in
   the $(PACKAGES) variable.

 - We need to fix our pkg-config wrapper script so that it uses
   relative path instead of absolute paths. This allows the wrapper
   script to work regardless of which per-package SDK directory it is
   installed in.

 - We need to move away from using absolute RPATH for host binaries,
   and to achieve that we fix the RPATH to $ORIGIN/../lib in host
   binaries right after the installation of each package.

 - We need to get away from the DEPENDENCIES_HOST_PREREQ mechanism,
   used for host-ccache, host-tar, host-lzip, host-xz and
   host-fakedate. The problem with this mechanism is that because
   those dependencies are not accounted in each package
   <pkg>_DEPENDENCIES variable, the per-package host/target folders
   produced by those packages are not rsync'ed when building other
   packages. Due to this, ccache/tar/lzip/xz/date cannot be found in
   the host directory of the package being built.

   To solve this, we basically move all those packages to be proper
   dependencies of all other packages. This involves adding a few
   exceptions, but more importantly, it requires adding the concept of
   "extract dependency", i.e a dependency that is ready before the
   extract step of a package. This is used for host-tar, host-lzip and
   host-xz. host-ccache and host-fakedate are regular dependencies.

What remains to be done?
========================

 - Completely get rid of the global HOST_DIR, TARGET_DIR and
   STAGING_DIR definitions, so that nothing uses them, and they really
   become per-package variables.

 - While the toolchain sysroot, pkg-config paths and host RPATHs are
   properly handled, there are quite certainly a lot of other places
   that have absolute paths that won't work well with per-package SDK,
   and that need to be adjusted.

 - Perhaps use a temporary per-package SDK and target directory when
   building a package, and rename it to the final name once the
   package has finished building. This would allow to detect
   situations where the per-package SDK directory of package A
   contains absolute paths referring to the per-package SDK directory
   of package B. Such absolute paths are wrong, but we currently don't
   see them because the per-package SDK directory for package B still
   exists.

 - Think about what needs to be done about the output/images/
   folder. Should it also be per-package like we do for output/target?

 - Many other issues that I'm sure people will report.

Comparison with Gustavo's patch series
======================================

Gustavo Zacarias did a previous implementation of this, available in
http://repo.or.cz/buildroot-gz.git/shortlog/refs/heads/pps3-next. Compared
to Gustavo's patch series, this patch series:

 - Implement per-package SDK and target directories, while Gustavo was
   only doing per-package staging.

 - Gustavo had several patches to pass BR_TOOLCHAIN_SYSROOT to the
   toolchain wrapper to pass the location of the current sysroot.

   This is no longer needed, because 1/ we're doing a full per-package
   SDK directory rather than per-package staging, which means the
   sysroot is always at the same relative location compared to the
   cross-compiler binary and 2/ the toolchain wrapper derives the
   sysroot location relatively to the wrapper location. Thanks to
   this, the following patches from Gustavo are (I believe) not
   needed:

   http://repo.or.cz/buildroot-gz.git/commitdiff/1ef6e798064649726d396bcb581ddbe4573c2460
   http://repo.or.cz/buildroot-gz.git/commitdiff/d15f6c6917b555bbbbbf97c292fad4db9d4007d4
   http://repo.or.cz/buildroot-gz.git/commitdiff/95900b65c29a010d85a769c9c6374cf3835f2169
   http://repo.or.cz/buildroot-gz.git/commitdiff/7ed53a5437ab09b85bf6d1953f6ff6049dfcc114

 - Gustavo had a patch to make our pkg-config wrapper script look at
   BR_TOOLCHAIN_SYSROOT, in order to find the
   /usr/{lib,share}/pkgconfig folders of the current sysroot. Just
   like for the toolchain-wrapper, such a change is no longer needed,
   and a simple change to our pkg-config script to use relative paths
   is sufficient.

 - I haven't integrated Gustavo patches that move from $(shell ...) to
   using backticks to delay the evaluation of
   STAGING_DIR/HOST_DIR/TARGET_DIR:

   http://repo.or.cz/buildroot-gz.git/commitdiff/0c11c60865f1445830643bb404f92c20d563260c
   http://repo.or.cz/buildroot-gz.git/commitdiff/207d2248ec8542293b6201b5c86f971021a3a591
   http://repo.or.cz/buildroot-gz.git/commitdiff/7f6a69819fbb176e29a1c3a53b4a76efe87dad15
   http://repo.or.cz/buildroot-gz.git/commitdiff/3328a9745eee555f5e5ef7df835afc26612ecd7b
   http://repo.or.cz/buildroot-gz.git/commitdiff/45a9d8c2aa6f3c0d2d8ed989d843890025faa3e8

 - I haven't looked at Qt specific issues, such as the ones fixed by
   Gustavo in:

   http://repo.or.cz/buildroot-gz.git/commitdiff/643e982e635f4386ccefcda9da4b84536af84d04

 - I am not doing all the .la files, *-config, *.prl, etc. tweaks that
   Gustavo is doing in:

   http://repo.or.cz/buildroot-gz.git/commitdiff/3f7b227b4c8e4514df6e5d54f88fcfb3a3a4bae0

   It is part of the "remaining absolute paths that need to be fixed"
   item that I mentionned above.

Best regards,

Thomas


Thomas Petazzoni (9):
  Makefile, skeleton: move the host skeleton logic to host-skeleton
    package
  pkg-cmake: install CMake files as part of a package
  package/pkg-generic: add the concept of extract dependency
  package/pkg-generic: handle host-tar as an extract dependency
  package/pkg-generic: handle host-xz as an extract dependency
  package/pkg-generic: handle host-lzip as an extract dependency
  package/pkg-generic: handle host-ccache as a regular dependency
  package/pkg-generic: handle host-fakedate as a regular dependency
  core: kill DEPENDENCIES_HOST_PREREQ

 Makefile                                 | 16 +-------------
 docs/manual/adding-packages-generic.txt  |  7 ++++++
 fs/tar/tar.mk                            |  2 ++
 package/ccache/ccache.mk                 |  5 +++++
 package/lzip/lzip.mk                     |  2 +-
 package/pkg-cmake.mk                     | 12 +++++-----
 package/pkg-generic.mk                   | 38 +++++++++++++++++++++++++++++---
 package/skeleton/skeleton.mk             | 12 ++++++++++
 package/tar/tar.mk                       |  5 +++++
 package/xz/xz.mk                         |  5 +++++
 support/dependencies/check-host-lzip.mk  |  2 +-
 support/dependencies/check-host-tar.mk   |  2 +-
 support/dependencies/check-host-xzcat.mk |  2 +-
 support/dependencies/dependencies.mk     | 14 ++----------
 toolchain/toolchain/toolchain.mk         |  3 ---
 15 files changed, 85 insertions(+), 42 deletions(-)

-- 
2.14.3
