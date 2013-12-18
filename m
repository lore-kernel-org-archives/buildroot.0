From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 18 Dec 2013 11:36:39 +0100
Subject: [Buildroot] [PATCH v10 0/8] Add support for top-level parallel make
Message-ID: <1387363007-19846-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
this is a patch set for adding support for top-level parallel make in
buildroot, the common problem scattered in buildroot's top-level
makefiles is that in the rules it relies on the order of evaluation of
the prerequisites, to be able to use top-level parallel make instead
of reling on the left to right ordering of evaluation of the
prerequisites we must add an explicit rule to describe the
dependencies.

With this patch set the top-level parallel make seems to works fine,
example:
	make clean
	make BR2_JLEVEL= -j$((`getconf _NPROCESSORS_ONLN` + 1))

Before to try it remeber to remove the ".NOTPARALLEL" line.

On my quad core system the building time for qemu_x86_defconfig
is 14m versus 11m and with ccache enabled 7m vs 5m.

I've tested the qemu_x86_defconfig, uclibc/eglibc/glibc,
ccache off/on, sstrip off/on.

I've finished to work on this patch set, Arnout has acked some patches so
i hope that this patch set is going to be merged soon.

Thank you for all reviews and in particular Arnout.

Best regards
Fabio Porcedda

v10:
 - Added Acked-by: Arnout Vandecappelle on the first two patches
 - Improved descption and text of the last patch
 - Rebased over master
v9:
 - Added Acked-by: Arnout Vandecappelle on some patches.
 - Changed the patches contents and descriptions following advices of Arnout
   - 1th patch: fixed to support ccache & sstrip
   - 2th patch: added pkg-cmake.mk
   - 2th patch: splitted ifeq
   - 3th patch: improved description
   - 3th patch: does not use %_BUILD_DEPENDENCIES anymore
   - 3th patch: added a comment about "|"
   - 4th patch: added a comment
   - 5th patch: added a comment
   - 6th patch: 
 - 2th patch: fixed a comment
 - 8th patch: now it change only the comment
v8:
 - rebased over master
 - added patche for for base dependency
 - added patche for for glibc package
 - added patche for for uclibc package
 - removed patch already merged
 - changed some descriptions
 - modified the patch for toolchain dependency to prevent circular dependency
v7:
 - add the latest patch
 - add to the first patch the <pkgname>_TOOLCHAIN variable
 - improve the fifth patch
v6:
 - added the fifth patch
 - updated the fourth patch adding the install targets
 - updated the second patch to remove TARGETS_ALL
v5:
 - added the fourth patch
 - fixed some typos
 - rewrited the second patch to use only $$($(2)_TARGET_*) in the rules
 - add support for top-level parallel make for the glibc package
v4:
 - rebased over master
 - add Acked-by: Thomas Petazzoni on the third patch
 - changed the orderd of the patches
v3:
 - add back the patch "package: add toolchain dependency to
    inner-generic-package" because now is working fine.
 - add Acked-by: Arnout Vandecappelle to the third patch.
 - reworked the second patch following Arnout suggestions.
v2:
 - remove patch "package: add toolchain dependency to inner-generic-package"
   because was not working fine against recent toolchain changes.

Fabio Porcedda (8):
  package: add base dependency to every package
  package: add toolchain dependency to every target package
  package: add support for top-level parallel make
  uclibc: add support for top-level parallel make
  glibc: add support for top-level parallel make
  Makefile: add support for top-level parallel make
  package: enable jobserver for recursive make
  Makefile: update comment about top-level parallel Makefile

 Makefile                                           | 34 ++++++-----
 fs/common.mk                                       |  4 +-
 package/glibc/glibc.mk                             | 12 +++-
 package/linux-headers/linux-headers.mk             |  3 +
 package/pkg-autotools.mk                           |  3 +-
 package/pkg-cmake.mk                               |  2 +-
 package/pkg-generic.mk                             | 67 ++++++++++++++--------
 package/uclibc/uclibc.mk                           | 12 +++-
 .../toolchain-buildroot/toolchain-buildroot.mk     |  2 +
 toolchain/toolchain-external/toolchain-external.mk |  2 +
 toolchain/toolchain/toolchain.mk                   |  5 +-
 11 files changed, 97 insertions(+), 49 deletions(-)

-- 
1.8.5
