From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 23:42:24 +0100
Subject: [Buildroot] [git commit] docs/manual: do not override BR2_EXTERNAL
Message-ID: <20151103224228.673DC80E31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1856bd0f5205824d7e666a6c0dd57a16c0b57a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we forcibly override BR2_EXTERNAL when building the manual,
so as to avoid referring to packages therein from the manual.

However, when generating the lists of packages, we limit ourselves to
scanning for packages in (Buildroot's) TOPDIR and never search in
BR2_EXTERNAL. So, we do not really need to override BR2_EXTERNAL when
generating the manual to achieve the same result.

Furthermore, we're only looking for packages that are defined in the
sub-menu "Target packages", and never anywhere else, and especially not
in the sub-menu "User-provided options".

Finally, we're soon to completely eliminate use of BR2_EXTERNAL in
Kconfig altogether, so that would no longer have any impact anyway.

So, just leave BR2_EXTERNAL alone when generating the manual.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/manual.mk |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index ad9bd90..caf080a 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -8,13 +8,10 @@ MANUAL_SOURCES = $(sort $(wildcard docs/manual/*.txt) $(wildcard docs/images/*))
 MANUAL_RESOURCES = $(TOPDIR)/docs/images
 
 # Our manual needs to generate lists
-# Packages included in BR2_EXTERNAL are not part of buildroot, so they
-# should not be included in the manual.
 define MANUAL_GEN_LISTS
 	$(Q)$(call MESSAGE,"Updating the manual lists...")
 	$(Q)$(COMMON_CONFIG_ENV) \
 		BR2_DEFCONFIG="" \
-		BR2_EXTERNAL=$(TOPDIR)/support/dummy-external \
 		TOPDIR=$(TOPDIR) \
 		O=$(@D) \
 		python -B $(TOPDIR)/support/scripts/gen-manual-lists.py
