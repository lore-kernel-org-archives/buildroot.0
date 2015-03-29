From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 19:33:14 +0200
Subject: [Buildroot] [PATCH 00/35] Package based 'source', 'legal-info',
	'source-check' and 'external-deps'
Message-ID: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

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

Thomas Petazzoni (35):
  linux: use the package infrastructure to download patches
  pkg-generic: fix the logic showing the "Downloading" message
  pkg-generic: take into account <pkg>_EXTRA_DOWNLOADS to display
    "Downloading" message
  pkg-generic: refactor the "Downloading" message logic
  pkg-generic: allow full URLs for <pkg>_EXTRA_DOWNLOADS
  docs/manual: update documentation about <pkg>_SOURCE, <pkg>_PATCH and
    <pkg>_EXTRA_DOWNLOADS
  perl: use <pkg>_EXTRA_DOWNLOADS
  packages: apply custom patches using *.patch instead of <pkg>-*.patch
  docs/manual: update documentation about applying patches
  pkg-generic: implement a <pkg>-external-deps target
  pkg-generic: implement <pkg>-all-{source,legal-info,external-deps}
    targets
  Makefile: remove dubious comment
  Makefile: directories are not PHONY targets
  pkg-generic: declare phony targets as such
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

 Makefile                                | 58 +++++----------------
 boot/at91bootstrap/at91bootstrap.mk     |  3 +-
 boot/at91bootstrap3/at91bootstrap3.mk   |  3 +-
 boot/barebox/barebox.mk                 |  5 +-
 boot/uboot/uboot.mk                     |  3 +-
 docs/manual/adding-packages-generic.txt | 32 +++++++-----
 docs/manual/customize-patches.txt       | 11 ++--
 fs/common.mk                            |  3 ++
 fs/initramfs/initramfs.mk               |  2 +
 fs/iso9660/iso9660.mk                   |  2 +
 linux/Config.in                         |  2 +-
 linux/linux.mk                          | 27 ++++------
 package/perl/perl.mk                    | 12 +----
 package/pkg-download.mk                 | 83 ++++++++----------------------
 package/pkg-generic.mk                  | 91 +++++++++++++++++++--------------
 package/pkg-kconfig.mk                  |  2 +
 system/system.mk                        |  2 +-
 17 files changed, 138 insertions(+), 203 deletions(-)

-- 
2.1.0
