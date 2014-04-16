From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 19:12:43 +0200
Subject: [Buildroot] [git commit] mtd: fix build against recent uClibc 0.9.33
Message-ID: <20140416172410.BA6BC9C80D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f98721c2abb88fbdd128e14a0142a877b9bee3ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit fae7cc33a1 added a local rpmatch() implementation. However, the
rpmatch() implementation was backported to the 0.9.33 branch, thus breaking
the Buildroot default toolchain. Rename the local rpmatch() to avoid
collision.

Fixes:
http://autobuild.buildroot.net/results/51f/51fe39bd942e4d8d0045ac810708719b9459e21f/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../mtd/mtd-01-Fix-rpmatch-call-under-uClibc.patch |   61 ++++++++++++++++++++
 ...common.h-fix-build-against-current-uClibc.patch |   45 --------------
 2 files changed, 61 insertions(+), 45 deletions(-)

diff --git a/package/mtd/mtd-01-Fix-rpmatch-call-under-uClibc.patch b/package/mtd/mtd-01-Fix-rpmatch-call-under-uClibc.patch
new file mode 100644
index 0000000..910a501
--- /dev/null
+++ b/package/mtd/mtd-01-Fix-rpmatch-call-under-uClibc.patch
@@ -0,0 +1,61 @@
+From aebb2831c13ffc6f1df79e638b99e78c52aed4ce Mon Sep 17 00:00:00 2001
+Message-Id: <aebb2831c13ffc6f1df79e638b99e78c52aed4ce.1397593673.git.baruch@tkos.co.il>
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sun, 13 Apr 2014 15:26:46 +0300
+Subject: [PATCH] Fix rpmatch() call under uClibc
+
+Combine the following two patches. The first is upstream (commit 50c9e11f7e),
+the second has been posted upstream at
+http://patchwork.ozlabs.org/patch/339365/.
+
+include/common.h: fix build against current uClibc
+
+Commit dbe0fd17f2 (mtd-utils: new prompt() helper for talking to the user)
+introduced a rpmatch() call. However, uClibc versions older than (not yet
+released) 0.9.34 don't have rpmatch() implementation. Add one.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
+Acked-by: Mike Frysinger <vapier@gentoo.org>
+
+include/common.h: fix build against recent 0.9.33 uClibc
+
+An implementation of rpmatch() was backported to the 0.9.33 branch of uClibc.
+So the uClibc version check introduced in commit 50c9e11f7e (include/common.h:
+fix build against current uClibc) is not enough. Rename the local rpmatch()
+implementation to avoid collision.
+
+Cc: Mike Frysinger <vapier@gentoo.org>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ include/common.h | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/include/common.h b/include/common.h
+index 4ffccea17213..838dc757bdf1 100644
+--- a/include/common.h
++++ b/include/common.h
+@@ -102,6 +102,20 @@ extern "C" {
+ 	fprintf(stderr, "%s: warning!: " fmt "\n", PROGRAM_NAME, ##__VA_ARGS__); \
+ } while(0)
+ 
++#if defined(__UCLIBC__)
++/* uClibc versions before 0.9.34 don't have rpmatch() */
++#if __UCLIBC_MAJOR__ == 0 && \
++		(__UCLIBC_MINOR__ < 9 || \
++		(__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ < 34))
++#define rpmatch __rpmatch
++static inline int __rpmatch(const char *resp)
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
diff --git a/package/mtd/mtd-01-include-common.h-fix-build-against-current-uClibc.patch b/package/mtd/mtd-01-include-common.h-fix-build-against-current-uClibc.patch
deleted file mode 100644
index 4f2d724..0000000
--- a/package/mtd/mtd-01-include-common.h-fix-build-against-current-uClibc.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 98c2959992086acd792ef9850c90cc9da8a2a063 Mon Sep 17 00:00:00 2001
-Message-Id: <98c2959992086acd792ef9850c90cc9da8a2a063.1397391118.git.baruch@tkos.co.il>
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Sun, 13 Apr 2014 14:58:47 +0300
-Subject: [PATCH] include/common.h: fix build against current uClibc
-
-Commit dbe0fd17f2 (mtd-utils: new prompt() helper for talking to the user)
-introduced a rpmatch() call. However, uClibc versions older than (not yet
-released) 0.9.34 don't have rpmatch() implementation. Add one.
-
-Patch status: sent upstream, http://patchwork.ozlabs.org/patch/338748/
-
-Cc: Mike Frysinger <vapier@gentoo.org>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- include/common.h | 13 +++++++++++++
- 1 file changed, 13 insertions(+)
-
-diff --git a/include/common.h b/include/common.h
-index 4ffccea17213..3b1366e927c4 100644
---- a/include/common.h
-+++ b/include/common.h
-@@ -102,6 +102,19 @@ extern "C" {
- 	fprintf(stderr, "%s: warning!: " fmt "\n", PROGRAM_NAME, ##__VA_ARGS__); \
- } while(0)
- 
-+#if defined(__UCLIBC__)
-+/* uClibc versions before 0.9.34 don't have rpmatch() */
-+#if __UCLIBC_MAJOR__ == 0 && \
-+		(__UCLIBC_MINOR__ < 9 || \
-+		(__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ < 34))
-+static inline int rpmatch(const char *resp)
-+{
-+    return (resp[0] == 'y' || resp[0] == 'Y') ? 1 :
-+	(resp[0] == 'n' || resp[0] == 'N') ? 0 : -1;
-+}
-+#endif
-+#endif
-+
- /**
-  * prompt the user for confirmation
-  */
--- 
-1.9.1
-
