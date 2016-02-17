From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2016 22:09:09 +0100
Subject: [Buildroot] [git commit] icu: fix build-time segfault by
	backporting upstream fix
Message-ID: <20160217211033.2086D80ACC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef557e0d28a59c251f693acc8d7452e66d7483fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The icu bug http://bugs.icu-project.org/trac/ticket/11959 also
hit me, but oddly enough only when running build build server via
Jenkins. This patch adds the upstream fix for the mentioned bug, so the
patch most likely can be removed at the next version bump.

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...llocating-memory-for-pkgDataFlags.-compil.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/icu/0006-fix-Error-allocating-memory-for-pkgDataFlags.-compil.patch b/package/icu/0006-fix-Error-allocating-memory-for-pkgDataFlags.-compil.patch
new file mode 100644
index 0000000..d53a761
--- /dev/null
+++ b/package/icu/0006-fix-Error-allocating-memory-for-pkgDataFlags.-compil.patch
@@ -0,0 +1,34 @@
+From 212016f27dd581fd7bef1a44a3342c59619a4ec8 Mon Sep 17 00:00:00 2001
+From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
+Date: Wed, 27 Jan 2016 17:24:25 +0100
+Subject: [PATCH] fix "Error allocating memory for pkgDataFlags." compilation
+ error
+
+ This is backport of the upstream icu commit 38081
+(http://bugs.icu-project.org/trac/changeset/38081/icu/trunk), which is
+a fix to upstream icu bug #11959
+(http://bugs.icu-project.org/trac/ticket/11959)
+
+Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
+---
+ source/tools/toolutil/flagparser.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/source/tools/toolutil/flagparser.c b/source/tools/toolutil/flagparser.c
+index 5543415..57256c3 100644
+--- a/source/tools/toolutil/flagparser.c
++++ b/source/tools/toolutil/flagparser.c
+@@ -96,8 +96,8 @@ parseFlagsFile_cleanup:
+     uprv_free(buffer);
+ 
+     T_FileStream_close(f);
+-    
+-    if (U_FAILURE(*status)) {
++
++    if (U_FAILURE(*status) && *status != U_BUFFER_OVERFLOW_ERROR) {
+         return -1;
+     }
+ 
+-- 
+1.9.1
+
