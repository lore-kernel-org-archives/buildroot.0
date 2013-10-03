From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu,  3 Oct 2013 14:10:39 +0200
Subject: [Buildroot] [PATCH v7 0/6] Fixes for top-level parallel make
Message-ID: <1380802245-16978-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
this is a patch set for fixing top-level parallel make in buildroot,
the common problem scattered in buildroot's top-level makefile is that
in the rules it relies on the order of evaluation of the
prerequisites, to be able to use top-level parallel make instead of
reling on the left to right ordering of evaluation of the
prerequisites we must add an explicit rule to describe the
dependencies.

With this patch set the top-level parallel make seems to work fine,
example:

	make clean
	make BR2_JLEVEL= -j$((`getconf _NPROCESSORS_ONLN` + 1))

On my quad core system the building time for
qemu_arm_versatile_defconfig is 13m versus 10m.

Best regards
Fabio Porcedda

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

Fabio Porcedda (6):
  package: add toolchain dependency to inner-generic-package
  pkg-generic: fix rules for top-level parallel make
  package/Makefile.in: don't force jobs when BR2_JLEVEL is empty
  pkg-generic: enable jobserver for recursive make
  Makefile: fix rules for top-level parallel make
  Makefile: enable top-level parallel make

 Makefile                               | 21 +++----------
 fs/common.mk                           |  4 +--
 package/Makefile.in                    |  2 +-
 package/glibc/glibc.mk                 |  3 +-
 package/linux-headers/linux-headers.mk |  1 +
 package/pkg-autotools.mk               |  3 +-
 package/pkg-generic.mk                 | 56 +++++++++++++++++++---------------
 package/uclibc/uclibc.mk               |  4 ++-
 8 files changed, 48 insertions(+), 46 deletions(-)

-- 
1.8.4
