From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 Mar 2015 10:08:12 -0300
Subject: [Buildroot] [PATCH] eudev: bump to version 3.0
Message-ID: <1427461692-3280-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patches, disable autoreconf (no longer needed) and use
upstream hash.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...-fix-mkstemp-mkostemp-related-build-failu.patch | 66 ----------------------
 ...c-don-t-die-on-missing-linux-btrfs.h-fixe.patch | 41 --------------
 package/eudev/eudev.hash                           |  4 +-
 package/eudev/eudev.mk                             |  4 +-
 4 files changed, 3 insertions(+), 112 deletions(-)
 delete mode 100644 package/eudev/0002-shared-util-fix-mkstemp-mkostemp-related-build-failu.patch
 delete mode 100644 package/eudev/0003-configure.ac-don-t-die-on-missing-linux-btrfs.h-fixe.patch

diff --git a/package/eudev/0002-shared-util-fix-mkstemp-mkostemp-related-build-failu.patch b/package/eudev/0002-shared-util-fix-mkstemp-mkostemp-related-build-failu.patch
deleted file mode 100644
index 0a08303..0000000
--- a/package/eudev/0002-shared-util-fix-mkstemp-mkostemp-related-build-failu.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 1e352d9d44fa782e4b72fbbf3531e75682440856 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sat, 24 Jan 2015 10:00:37 +0100
-Subject: [PATCH] shared/util: fix mkstemp/mkostemp related build failure
-
-Fixes buildroot uclibc build failure ([1]):
-
-./.libs/libudev-core.a(util.o): In function `mkostemp_safe':
-util.c:(.text+0x2950): undefined reference to `mkostemp'
-
-[1] http://autobuild.buildroot.net/results/fa6/fa62883de4ada664521ffc47b611ecd2279c0014/build-end.log
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- src/shared/util.c | 4 +++-
- src/shared/util.h | 3 +++
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/src/shared/util.c b/src/shared/util.c
-index 3cad297..7423310 100644
---- a/src/shared/util.c
-+++ b/src/shared/util.c
-@@ -1322,6 +1322,7 @@ int getpeercred(int fd, struct ucred *ucred) {
-         return 0;
- }
- 
-+#if HAVE_DECL_MKOSTEMP
- /* This is much like like mkostemp() but is subject to umask(). */
- int mkostemp_safe(char *pattern, int flags) {
-         _cleanup_umask_ mode_t u;
-@@ -1337,7 +1338,7 @@ int mkostemp_safe(char *pattern, int flags) {
- 
-         return fd;
- }
--
-+#else
- /* This is much like like mkstemp() but is subject to umask(). */
- int mkstemp_safe(char *pattern) {
-         _cleanup_umask_ mode_t u;
-@@ -1353,6 +1354,7 @@ int mkstemp_safe(char *pattern) {
- 
-         return fd;
- }
-+#endif
- 
- char *tempfn_xxxxxx(const char *p) {
-         const char *fn;
-diff --git a/src/shared/util.h b/src/shared/util.h
-index 9550aa1..943d7d4 100644
---- a/src/shared/util.h
-+++ b/src/shared/util.h
-@@ -402,8 +402,11 @@ static inline void qsort_safe(void *base, size_t nmemb, size_t size,
- int proc_cmdline(char **ret);
- int getpeercred(int fd, struct ucred *ucred);
- 
-+#if HAVE_DECL_MKOSTEMP
- int mkostemp_safe(char *pattern, int flags);
-+#else
- int mkstemp_safe(char *pattern);
-+#endif
- 
- union file_handle_union {
-         struct file_handle handle;
--- 
-2.1.2
-
diff --git a/package/eudev/0003-configure.ac-don-t-die-on-missing-linux-btrfs.h-fixe.patch b/package/eudev/0003-configure.ac-don-t-die-on-missing-linux-btrfs.h-fixe.patch
deleted file mode 100644
index 305ec43..0000000
--- a/package/eudev/0003-configure.ac-don-t-die-on-missing-linux-btrfs.h-fixe.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 6740579367ddd2ce0b315863cdb92d34d1d693c7 Mon Sep 17 00:00:00 2001
-From: "Anthony G. Basile" <blueness@gentoo.org>
-Date: Sun, 16 Nov 2014 13:40:43 -0500
-Subject: [PATCH] configure.ac: don't die on missing linux/btrfs.h, fixes issue
- #100
-
-Signed-off-by: Anthony G. Basile <blueness@gentoo.org>
-
-Taken from upstream commit 6740579367d.
-
-Signed-off-by: Alexey Mednyy <swexru@gmail.com>
----
- configure.ac | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index a3747f9..dbca833 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -49,11 +49,17 @@ AC_CHECK_HEADERS(
- )
- 
- AC_CHECK_HEADERS(
--	[linux/btrfs.h mtd/mtd-user.h],
-+	[mtd/mtd-user.h],
- 	[],
- 	[AC_MSG_ERROR([*** KERNEL header not found])]
- )
- 
-+AC_CHECK_HEADERS(
-+	[linux/btrfs.h],
-+	[],
-+	[AC_MSG_WARN([*** KERNEL header not found])]
-+)
-+
- # Checks for typedefs, structures, and compiler characteristics.
- AC_TYPE_UID_T
- AC_C_INLINE
--- 
-1.9.1
-
diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index 6a85508..49f86ae 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	6aef101c5496a2dc45e669307d478dbccb0ee0462a285512edcda51ff12e0e6a  eudev-2.1.1.tar.gz
+# From http://dev.gentoo.org/~blueness/eudev/
+md5	a2706a1413723b6b82eecb7d6982763c	eudev-3.0.tar.gz
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index f5159a2..cfff94a 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 2.1.1
+EUDEV_VERSION = 3.0
 EUDEV_SOURCE = eudev-$(EUDEV_VERSION).tar.gz
 EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
 EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
 EUDEV_INSTALL_STAGING = YES
-# We're patching configure.ac
-EUDEV_AUTORECONF = YES
 
 # mq_getattr is in librt
 EUDEV_CONF_ENV += LIBS=-lrt
-- 
2.0.5
