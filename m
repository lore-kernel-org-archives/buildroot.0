From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 25 Sep 2013 10:05:35 +0200
Subject: [Buildroot] [PATCH v5 0/4] Fix for top-level parallel make part 1
Message-ID: <1380096339-4686-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
this is the first patch set for fixing top-level parallel make in buildroot,
the common problem scattered in buildroot's top-level makefile is that in the
rules it relies on the order of evaluation of the prerequisites,
to be able to use top-level parallel make instead of reling on the left to
right ordering of evaluation of the prerequisites we must add an explicit
rule to describe the dependencies.

With this patch set the package building seems to work fine with top-level
parallel make, example:

	make clean toolchain
	make BR2_JLEVEL= -j<n> <package name list>

Before to try that you have to remove the ".NOTPARALLEL" line in the top-level
Makefile.

The part that remain to fix for top-level parallel make is the toolchain
building and targets after building all the packages.

Best regards
Fabio Porcedda

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

Fabio Porcedda (4):
  package: add toolchain dependency to inner-generic-package
  pkg-generic: fix rules for top-level parallel make
  package/Makefile.in: don't force jobs when BR2_JLEVEL is empty
  pkg-generic: enable recursive make for $($(PKG)_BUILD_CMDS)

 Makefile                 |  2 +-
 package/Makefile.in      |  2 +-
 package/glibc/glibc.mk   |  3 ++-
 package/pkg-autotools.mk |  3 ++-
 package/pkg-generic.mk   | 46 +++++++++++++++++++++++++++-------------------
 package/uclibc/uclibc.mk |  3 ++-
 6 files changed, 35 insertions(+), 24 deletions(-)

-- 
1.8.4
