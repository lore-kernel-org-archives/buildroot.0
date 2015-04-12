From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Apr 2015 18:37:44 +0200
Subject: [Buildroot] [PATCHv2 00/21] Package based 'source', 'legal-info',
	'source-check' and 'external-deps'
Message-ID: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is a new iteration of the "Package based 'source', 'legal-info',
'source-check' and 'external-deps'" series.

Changes since v1:
=================

 - Remove all the patches that have been applied to master, and rebase
   on top of the latest master, fixing the conflicts along the way.

 - Fix a bug in the implementation of $(1)-source-check: the code was
   using $(p) to reference the loop iterator, while it should have
   been using $$(p) instead.

 - Add missing phony targets in pkg-kconfig: $(1)-savedefconfig and
   $(1)-update-defconfig. Noticed by Yann E. Morin.

 - Mark rootfs-ext2-symlink as a phony target. Noticed by Yann
   E. Morin.

 - Add Reviewed-by from Yann on "Makefile: targets are now declared
   phony by the appropriate infrastructures" since the problem he
   pointed out in the review has been fixed in previous patches.

 - In patch "Makefile: rename TARGETS to PACKAGES", fix typo in commit
   log (should be *listed*), and also rename TARGETS to PACKAGES in
   package/matchbox/matchbox.mk as well as
   support/scripts/graph-depends, as mentionned by Yann E. Morin.

 - Added Acked-by from Yann on "fs: add rootfs dependencies to
   PACKAGES".

 - Extend the commit log of "Makefile: use <pkg>-all-legal-info to
   implement the legal-info target" to explain why the 'make
   legal-info' output before and after this patch may be different,
   and why it is actually more correct after the patch. Suggested by
   Yann.

 - Add Reviewed-by from Yann on patch "Makefile: simplify
   show-targets".

 - Added Tested-by and Reviewed-by from Yann on patch "Makefile: use
   the package infra based external-deps".

Original introduction of the series
===================================

(Note: this is the original introduction of the series, matching the
v1. Since some patches have been merged, the patch numbers below do
not match this current version of the series.)

The initial goal of this series was to change the way we recursively
go through host dependencies for the implementation of the 'source',
'external-deps', 'legal-info' and 'source-check' targets.

The implementation of such targets currently do not rely on the
package infrastructure, and the main Makefile tries to iterate through
the dependencies of all packages using the TARGETS, TARGETS_HOST_DEPS
and HOST_DEPS variable, but it does so with only a two-level
recursion, which does not guarantee that all dependencies will have
been taken into account. It is also not at all in the spirit of the
rest of the package infrastructure.

So our final goal is simply that all those targets are implemented
using per-package make targets that recursively go through their own
dependencies.

Along the way, a number of other related changes or cleanups have been
made, and we try to describe below the overall logic of the patch
series:

 - Currently, some packages do directly use the 'DOWNLOAD' macro to
   download files. This has the unfortunate effect that the package
   infrastructure is not aware that those files are being downloaded,
   which is bad.

   To fix this, patches 1 to 7 fixes the two problematic packages: the
   'linux' and 'perl' packages. In the case of the 'perl' package, an
   addition was needed to the package infrastructure: supporting full
   URLs in <pkg>_EXTRA_DOWNLOADS. Some related cleanups and
   improvements are done as part of these changes.

   Compared to the v1 of those patches: I've fixed the typos found by
   Baruch and Romain, added the Reviewed-by tags that were given,
   fixed the manual line-break issue reported by Arnout, and adjusted
   the order of the variables in perl.mk as suggested by Arnout.

 - As part of the review of the first version of this series (which
   only included patches 1 to 7), a comment was made that packages
   like Linux were only applying patches named linux-*.patch, while we
   have moved for all other packages to a convention that consists in
   applying *.patch. Therefore, patches 8 and 9 make the Linux,
   U-Boot, Barebox, AT91Bootstrap and AT91Bootstrap3 follow this
   convention, and fix the user manual accordingly.

 - Patches 10 and 11 start extending the package infrastructure by
   adding the <pkg>-external-deps, <pkg>-all-external-deps,
   <pkg>-all-source and <pkg>-all-legal-info targets.

 - Patch 12 is doing some silly cleanup of the main Makefile.

 - Patches 13 to 17 clarify and fix the way we declare the PHONY make
   targets, by making the package infrastructure responsible for doing
   that for package targets.

 - Patches 18 and 19 make some not very important cleanups (variable
   renaming, etc.)

 - Patch 20 switches the 'legal-info' target to fully use the package
   infrastructure, thanks to the <pkg>-all-legal-info target added
   previously.

 - Patch 21 simplifies show-targets a bit.

 - Patch 22, like patch 20, switches the global 'external-deps' target
   to fully use the package infrastructure, thanks to the
   <pkg>-all-external-deps target added previously.

 - Patch 23 cleans up the download infra by removing the support for
   the SHOW_EXTERNAL_DEPS DL_MODE, unneeded now that the package infra
   is in charge of the 'external-deps' feature.

 - Patches 24, 25, 26, 27, 28, 29 and 30 take care of the global
   'source-check' target, also moved to use the package infrastructure
   through newly introduced <pkg>-source-check and
   <pkg>-all-source-check targets.

 - Patch 31 does some indentation cleanup.

 - Patch 32 and 33 make some improvements to the package
   infrastructure in terms of downloading source, patches and extra
   downloads.

 - Patch 34 implements the global 'source' target using the package
   infrastructrure, thanks to <pkg>-source and <pkg>-all-source.

 - Patch 35 removes the now unneeded variables from the main Makefile,
   which was our original goal.

Thomas

Thomas Petazzoni (21):
  pkg-kconfig: declare phony targets as such
  fs: declare phony targets as such
  Makefile: targets are now declared phony by the appropriate
    infrastructures
  Makefile: rename TARGETS to PACKAGES
  fs: add rootfs dependencies to PACKAGES
  Makefile: use <pkg>-all-legal-info to implement the legal-info target
  Makefile: simplify show-targets
  Makefile: use the package infra based external-deps
  pkg-download: remove support for the SHOW_EXTERNAL_DEPS DL_MODE
  Makefile: move source-check outside of noconfig_targets
  pkg-download: extend DOWNLOAD_INNER, add a SOURCE_CHECK macro
  pkg-generic: implement source-check targets
  Makefile: implement a package based source-check target
  pkg-generic: remove the .stamp_rsync_sourced fake stamp file
  pkg-generic: don't use DL_MODE in .stamp_downloaded
  pkg-download: get rid of DL_MODE
  pkg-download: fix indentation for SOURCE_CHECK_* macros
  pkg-generic: propagate <pkg>_EXTRA_DOWNLOADS from target to host
    package
  pkg-generic: introduce a <pkg>_ALL_DOWNLOADS variable and factorize
    code
  Makefile: implement the 'source' target using the package
    infrastructure
  Makefile: remove unneeded variables

 Makefile                      | 53 +++++++--------------------
 fs/common.mk                  |  3 ++
 fs/ext2/ext2.mk               |  2 ++
 fs/initramfs/initramfs.mk     |  2 ++
 fs/iso9660/iso9660.mk         |  2 ++
 package/matchbox/matchbox.mk  |  2 +-
 package/pkg-download.mk       | 83 +++++++++++--------------------------------
 package/pkg-generic.mk        | 62 ++++++++++++++------------------
 package/pkg-kconfig.mk        |  6 ++++
 support/scripts/graph-depends |  2 +-
 system/system.mk              |  2 +-
 11 files changed, 79 insertions(+), 140 deletions(-)

-- 
2.1.0
