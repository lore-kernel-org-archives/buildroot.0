From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Apr 2014 21:44:06 +0200
Subject: [Buildroot] [git commit] mtd: fix build against uClibc
Message-ID: <20140413194905.6EF1E9C715@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fae7cc33a117d5408019b705d76ebb4549593f88
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a rpmatch() implementation when uClibc is missing one.

Fixes:
http://autobuild.buildroot.net/results/171/17187c3c9ba2b9df2bb6ac103e9a54706f07c28b/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...common.h-fix-build-against-current-uClibc.patch |   45 ++++++++++++++++++++
 1 files changed, 45 insertions(+), 0 deletions(-)

diff --git a/package/mtd/mtd-01-include-common.h-fix-build-against-current-uClibc.patch b/package/mtd/mtd-01-include-common.h-fix-build-against-current-uClibc.patch
new file mode 100644
index 0000000..4f2d724
--- /dev/null
+++ b/package/mtd/mtd-01-include-common.h-fix-build-against-current-uClibc.patch
@@ -0,0 +1,45 @@
+From 98c2959992086acd792ef9850c90cc9da8a2a063 Mon Sep 17 00:00:00 2001
+Message-Id: <98c2959992086acd792ef9850c90cc9da8a2a063.1397391118.git.baruch@tkos.co.il>
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sun, 13 Apr 2014 14:58:47 +0300
+Subject: [PATCH] include/common.h: fix build against current uClibc
+
+Commit dbe0fd17f2 (mtd-utils: new prompt() helper for talking to the user)
+introduced a rpmatch() call. However, uClibc versions older than (not yet
+released) 0.9.34 don't have rpmatch() implementation. Add one.
+
+Patch status: sent upstream, http://patchwork.ozlabs.org/patch/338748/
+
+Cc: Mike Frysinger <vapier@gentoo.org>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ include/common.h | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/include/common.h b/include/common.h
+index 4ffccea17213..3b1366e927c4 100644
+--- a/include/common.h
++++ b/include/common.h
+@@ -102,6 +102,19 @@ extern "C" {
+ 	fprintf(stderr, "%s: warning!: " fmt "\n", PROGRAM_NAME, ##__VA_ARGS__); \
+ } while(0)
+ 
++#if defined(__UCLIBC__)
++/* uClibc versions before 0.9.34 don't have rpmatch() */
++#if __UCLIBC_MAJOR__ == 0 && \
++		(__UCLIBC_MINOR__ < 9 || \
++		(__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ < 34))
++static inline int rpmatch(const char *resp)
++{
++    return (resp[0] == 'y' || resp[0] == 'Y') ? 1 :
++	(resp[0] == 'n' || resp[0] == 'N') ? 0 : -1;
++}
++#endif
++#endif
++
+ /**
+  * prompt the user for confirmation
+  */
+-- 
+1.9.1
+
