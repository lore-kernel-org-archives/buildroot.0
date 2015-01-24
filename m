From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 24 Jan 2015 10:09:29 +0100
Subject: [Buildroot] [PATCH v1] eudev: fix mkstemp/mkostemp related build
	failure
Message-ID: <1422090569-28932-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

./.libs/libudev-core.a(util.o): In function `mkostemp_safe':
util.c:(.text+0x2950): undefined reference to `mkostemp'

Do not only protect the call to the mkostemp wrapper mkostemp_safe
with HAVE_DECL_MKOSTEMP but although the wrapper himself.

[1] http://autobuild.buildroot.net/results/fa6/fa62883de4ada664521ffc47b611ecd2279c0014/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...-fix-mkstemp-mkostemp-related-build-failu.patch | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 package/eudev/0001-shared-util-fix-mkstemp-mkostemp-related-build-failu.patch

diff --git a/package/eudev/0001-shared-util-fix-mkstemp-mkostemp-related-build-failu.patch b/package/eudev/0001-shared-util-fix-mkstemp-mkostemp-related-build-failu.patch
new file mode 100644
index 0000000..0a08303
--- /dev/null
+++ b/package/eudev/0001-shared-util-fix-mkstemp-mkostemp-related-build-failu.patch
@@ -0,0 +1,66 @@
+From 1e352d9d44fa782e4b72fbbf3531e75682440856 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sat, 24 Jan 2015 10:00:37 +0100
+Subject: [PATCH] shared/util: fix mkstemp/mkostemp related build failure
+
+Fixes buildroot uclibc build failure ([1]):
+
+./.libs/libudev-core.a(util.o): In function `mkostemp_safe':
+util.c:(.text+0x2950): undefined reference to `mkostemp'
+
+[1] http://autobuild.buildroot.net/results/fa6/fa62883de4ada664521ffc47b611ecd2279c0014/build-end.log
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/shared/util.c | 4 +++-
+ src/shared/util.h | 3 +++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/shared/util.c b/src/shared/util.c
+index 3cad297..7423310 100644
+--- a/src/shared/util.c
++++ b/src/shared/util.c
+@@ -1322,6 +1322,7 @@ int getpeercred(int fd, struct ucred *ucred) {
+         return 0;
+ }
+ 
++#if HAVE_DECL_MKOSTEMP
+ /* This is much like like mkostemp() but is subject to umask(). */
+ int mkostemp_safe(char *pattern, int flags) {
+         _cleanup_umask_ mode_t u;
+@@ -1337,7 +1338,7 @@ int mkostemp_safe(char *pattern, int flags) {
+ 
+         return fd;
+ }
+-
++#else
+ /* This is much like like mkstemp() but is subject to umask(). */
+ int mkstemp_safe(char *pattern) {
+         _cleanup_umask_ mode_t u;
+@@ -1353,6 +1354,7 @@ int mkstemp_safe(char *pattern) {
+ 
+         return fd;
+ }
++#endif
+ 
+ char *tempfn_xxxxxx(const char *p) {
+         const char *fn;
+diff --git a/src/shared/util.h b/src/shared/util.h
+index 9550aa1..943d7d4 100644
+--- a/src/shared/util.h
++++ b/src/shared/util.h
+@@ -402,8 +402,11 @@ static inline void qsort_safe(void *base, size_t nmemb, size_t size,
+ int proc_cmdline(char **ret);
+ int getpeercred(int fd, struct ucred *ucred);
+ 
++#if HAVE_DECL_MKOSTEMP
+ int mkostemp_safe(char *pattern, int flags);
++#else
+ int mkstemp_safe(char *pattern);
++#endif
+ 
+ union file_handle_union {
+         struct file_handle handle;
+-- 
+2.1.2
+
-- 
2.1.2
