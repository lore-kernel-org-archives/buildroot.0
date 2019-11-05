From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  5 Nov 2019 17:46:39 +0100
Subject: [Buildroot] [PATCH next v8 0/6] Top-level parallel build support
Message-ID: <20191105164646.23820-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Top-level parallel build support

Hello,

Here is an eighth iteration of the per-package SDK and target
directory implementation, offering top-level parallel build
capability.

If you're interested in testing it, you can find the patch series at:

  https://github.com/tpetazzoni/buildroot/commits/ppsh-v8

This is really only the core changes. It is sufficient for a number of
configuration, but we know some specific packages are broken with
per-package directories (for example: Qt5). As we cannot fix all
problems at once, we would like to first merge the core support, which
will help get broader testing for the feature, and hopefully
contributions to solve the remaining package-specific issues.

What is this all about ?
========================

See the cover letter of v3 for details:
http://lists.busybox.net/pipermail/buildroot/2017-December/208384.html

Changes v7 -> v8
================

 - Drop the following patches, which have been merged upstream:

   support/scripts/check-host-rpath:  document existing functions
   Makefile: move definition of TARGET_DIR  inside .config condition

 - Fix the commit log of "core: implement per-package SDK and target"
   to make it clear that not just the dependencies listed in
   <pkg>_DEPENDENCIES, but also their recursive dependencies. This
   follows a comment and suggestion from Yann.

 - Don't split the line in the main Makefile creating all the main
   directories, as the split can be confusing. Suggested by Yann.

 - In support/scripts/check-host-rpath, add a comment explaining why
   the check using ${perpackagedir} works fine even when PPD is not
   used. Suggested by Yann.

 - In support/scripts/check-host-rpath and support/scripts/fix-rpath,
   improve the regexp in the ${perpackagedir} check to not allow a
   path like per-package//host/lib, but only allow
   per-package/some-non-empty-thing/host/lib. Suggested by Yann.

 - Added Acked-by from Yann on:

   Makefile: allow top-level parallel  build with BR2_PER_PACKAGE_DIRECTORIES=y

 - In package/pkg-generic.mk, modify the regexp used in
   fixup-libtool-files to not allow a path like per-package//host/lib,
   but only allow per-package/some-non-empty-thing/host/lib. Suggested
   by Yann.

 - Improve the Buildroot manual details about the feature, from
   suggestions made by Yann.

Changes v6 -> v7
================

 - Make host-finalize a PHONY target, as suggested by Yann
   E. Morin. Change done in "core: implement per-package SDK and
   target"

 - Adjust <pkg>-dirclean so that it also removes the per-package
   directory for <pkg>. Change done in "core: implement per-package
   SDK and target"

 - Completely rework the comment that explains the .NOTPARALLEL
   statement. Indeed, the existing explanation no longer made
   sense. The new comment explains why .NOTPARALLEL is added when
   !BR2_PER_PACKAGE_DIRECTORIES. Suggested by Yann E. Morin. Change
   done in "Makefile: allow top-level parallel build with
   BR2_PER_PACKAGE_DIRECTORIES=y".

 - Move the libtool .la files fixup logic into a separate function,
   just because it is a bit nicer. Change done in
   "package/pkg-generic: make libtool .la files compatible with
   per-package directories".

 - Added Acked-by from Yann E. Morin on patch "package/pkg-kconfig:
   handle KCONFIG_DEPENDENCIES with per-package directories".

 - Fix "package/pkg-kconfig: handle KCONFIG_DEPENDENCIES with
   per-package directories" to use the proper per-package-directory
   macro instead of prepare-per-package-folder. This was missed during
   the rename of the macro that happened in the v6 of this series.

 - Drop the following patches that have been merged in master since v6
   was posted:

   Makefile: evaluate CCACHE and HOST{CC,CXX} at time of use
   support/scripts/check-host-rpath: split condition on two statements
   Makefile: rework main directory creation logic
   Makefile: move .NOTPARALLEL statement after including .config file
   Makefile: define TARGET_DIR_WARNING_FILE relative to TARGET_DIR
   package/pkg-generic: adjust config scripts tweaks for per-package directories

 - Add a preparatory patch that moves the definition of TARGET_DIR
   inside the BR2_HAVE_DOT_CONFIG condition, next to the existing
   HOST_DIR definition. This allows the HOST_DIR and TARGET_DIR
   definition to be next to each other when introducing the
   per-package directory support. Suggested by Arnout.

 - Add a preparatory patch that documents the functions in
   check-host-rpath.

 - Add more comments in check-host-rpath to explain how it works in
   relation with per-package directory support. Suggested by Arnout.

 - Modify the fix-rpath script to rewrite RPATH referencing
   per-package host directories so that they point to the global host
   directory. This is needed for the patchelf --make-rpath-relative
   logic to work, and rewrite all RPATHs as relative RPATHs. Reported
   by Andreas Naumann.

 - Add documentation in the Buildroot manual about top-level parallel
   build support.

Changes v5 -> v6
================

 - Add Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr> on patch
   "Makefile: move .NOTPARALLEL statement after including .config
   file"

 - Add Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr> on patch
   Makefile: define TARGET_DIR_WARNING_FILE relative to TARGET_DIR

 - Add Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr> on patch
   "package/pkg-generic: adjust config scripts tweaks for per-package
   folders"

 - Move the change that really allows top-level parallel build (by
   making .NOTPARALLEL conditional) into a separate commit, as
   suggested by Yann E. Morin.

 - Sort $(PACKAGES) in host-finalize and target-finalize when creating
   the global HOST_DIR and global TARGET_DIR. Suggested by Yann
   E. Morin.

 - Split too long line in the main Makefile listing all the top-level
   folders as targets. Suggested by Yann E. Morin.

 - Drop change in fs/common.mk adding ROOTFS_COMMON_DEPENDENCIES to
   PACKAGES, since a similar change has already been merged in
   master. Noticed by Yann E. Morin.

 - Use "directory/directories" instead of "folder/folders", as
   suggested by Arnout Vandecappelle.

 - Move prepare-per-package-folder (now named
   prepare-per-package-directory) to pkg-utils.mk. Suggested by both
   Yann E. Morin and Arnout Vandecappelle.

 - Add a comment above prepare-per-package-directory, as suggested by
   Yann E. Morin.

 - Update the commit log of "core: implement per-package SDK and
   target" to explain why we are modifying the check-host-rpath
   script. Suggested by Arnout Vandecappelle.

Changes v4 -> v5
================

 - Add patch "package/pkg-generic: adjust config scripts tweaks for
   per-package folders" that adjusts how pkg-generic.mk fixes *-config
   scripts, to use relative paths instead of absolute paths.

 - Add patch "package/pkg-generic: make libtool .la files compatible
   with per-package folders" that fixes libtool.la files for
   per-package folders.

 - Add patch "package/pkg-kconfig: handle KCONFIG_DEPENDENCIES with
   per-package folders" that properly handles KCONFIG_DEPENDENCIES in
   the pkg-kconfig infrastructure for per-package folders.

 - Added Acked-by from Yann E. Morin on the following patches:

   support/scripts/check-host-rpath: split condition on two statements
   Makefile: evaluate CCACHE and HOST{CC,CXX} at time of use

 - It is not included in this series, but since the v4 was sent, the
   case of the Luarocks and Meson based packages have been fixed, and
   I have sent separate series for these, because they can be merged
   separately. Many thanks to Fran?ois Perrad and Peter Seiderer for
   providing very useful insights on Luarocks and Meson.

Changes v3 -> v4
================

 - Dropped patches that have been merged upstream, mainly the "extract
   dependency" patches, but also a few other preparation patches.

 - Dropped the change of the RPATH handling. As discussed during
   previous Buildroot Developers meeting, it is not a big problem if
   during the build, the RPATH of a binary points to the library
   folder of another package per-package folder. Therefore, instead of
   fixing up RPATH at the end of each package installation, we keep
   what Buildroot does today: fix them at the very end of the build.

 - Made the support for per-package folders optional. Indeed, we
   realized there was no way to make sure it would be perfect from day
   1. Even if the principle works, there are lots of package-specific
   details to solve, and solving all of them before merging the base
   per-package folder support is not reasonable. So for now, an option
   BR2_PER_PACKAGE_FOLDERS is introduced, which defaults to off. When
   this option is enabled, the .NOTPARALLEL statement of the main
   Makefile goes away, which allows to do top-level parallel build.

 - Addition of a commit that reworks how the top-level directories are
   created.

 - Introduction of a prepare-per-package-folder function in
   pkg-generic.mk to encapsulate the logic to create the per-package
   folders from the dependencies of a package.

 - Rebased on top of the latest master.

Changes v2 -> v3
================

 - Dropped patches that have been merged upstream:
   pkgconf: use relative path to  STAGING_DIR instead of absolute path
   toolchain: post-pone evaluation of  TOOLCHAIN_EXTERNAL_BIN

 - For now, removed the most controversial/complicated patches
   (changing the rpath strategy, and switching to per-package
   host/target directories). The goal for now is to merge only the
   preparation patches.

Changes v1 -> v2
================

 - Solved the problem of all DEPENDENCIES_HOST_PREREQ targets:
   host-ccache, host-tar, host-lzip, host-xz, host-fakedate.

   To achieve this, introduced <pkg>_EXTRACT_DEPENDENCIES and used
   that to handle the dependencies on host-tar, host-lzip and host-xz.

   Used regular dependencies for host-ccache and host-fakedate.

   See below for more details.

Changes RFC -> v1
=================

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

Best regards,

Thomas

Thomas Petazzoni (6):
  core: implement per-package SDK and target
  Makefile: allow top-level parallel build with
    BR2_PER_PACKAGE_DIRECTORIES=y
  package/pkg-generic: make libtool .la files compatible with
    per-package directories
  package/pkg-kconfig: handle KCONFIG_DEPENDENCIES with per-package
    directories
  docs/manual: add details about top-level parallel build support
  docs/manual: document the effect of per-package directory on variables

 Config.in                               | 18 ++++++++++
 Makefile                                | 47 ++++++++++++-------------
 docs/manual/adding-packages-generic.txt |  9 ++++-
 docs/manual/common-usage.txt            | 47 +++++++++++++++++++++++++
 docs/manual/faq-troubleshooting.txt     |  3 ++
 docs/manual/quickstart.txt              |  8 ++---
 package/pkg-generic.mk                  | 24 ++++++++++++-
 package/pkg-kconfig.mk                  |  1 +
 package/pkg-utils.mk                    | 26 ++++++++++++++
 support/scripts/check-host-rpath        | 32 ++++++++++++++---
 support/scripts/fix-rpath               | 29 +++++++++++----
 11 files changed, 201 insertions(+), 43 deletions(-)

-- 
2.21.0
