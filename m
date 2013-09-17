From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 17 Sep 2013 09:59:10 +0200
Subject: [Buildroot] [PATCH v4 0/3] Fix for top-level parallel make part 1
Message-ID: <1379404753-3471-1-git-send-email-fabio.porcedda@gmail.com>
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
	make BR2_JLEVEL= -j<n> <package-name list> 

Before to try that you have to remove the ".NOTPARALLEL" line in the top-level Makefile.

The part that remain to fix for top-level parallel make is the toolchain
building and targets after building all the packages, also i'm preparing patch to add + prefix to every line that call a sub-make.

Best regards
Fabio Porcedda

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

Fabio Porcedda (3):
  package: add toolchain dependency to inner-generic-package
  pkg-generic: fix rules for top-level parallel make
  package/Makefile.in: add a way to don't force jobs in sub-make

 Makefile                 |  2 +-
 package/Makefile.in      |  2 +-
 package/pkg-autotools.mk |  3 ++-
 package/pkg-generic.mk   | 51 ++++++++++++++++++++++++------------------------
 package/uclibc/uclibc.mk |  3 ++-
 5 files changed, 32 insertions(+), 29 deletions(-)

-- 
1.8.4
