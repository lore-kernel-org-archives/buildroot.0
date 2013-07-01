From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 1 Jul 2013 11:42:58 +0200
Subject: [Buildroot] [git commit] lttng-tools: bump version to 2.2.0
Message-ID: <20130701094856.1B41499A82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed692e2dbbf8d4751d39a636dd1119e829bd0f99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove lttng-tools-no-sync-file-range-in-uclibc.patch because it got
merged upstream.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../lttng-tools-no-sync-file-range-in-uclibc.patch |   51 --------------------
 package/lttng-tools/lttng-tools.mk                 |    2 +-
 2 files changed, 1 insertions(+), 52 deletions(-)

diff --git a/package/lttng-tools/lttng-tools-no-sync-file-range-in-uclibc.patch b/package/lttng-tools/lttng-tools-no-sync-file-range-in-uclibc.patch
deleted file mode 100644
index fcaaa3e..0000000
--- a/package/lttng-tools/lttng-tools-no-sync-file-range-in-uclibc.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-Make sync_file_range() usage optional
-
-Under uClibc, sync_file_range() is not available under all
-architectures, so we fall back to fdatasync() in this case.
-
-Inspired by the patch done by Thomas Petazzoni for the
-2.0-pre25 version.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- configure.ac              |    2 +-
- src/common/compat/fcntl.h |    5 +++++
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5808c79..065b9cf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -150,7 +150,7 @@ AS_IF([test "x$lttng_ust_support" = "xyes"], [
- 	)
- ])
- AM_CONDITIONAL([HAVE_LIBLTTNG_UST_CTL], [test "x$lttng_ust_ctl_found" = xyes])
--AC_CHECK_FUNCS([sched_getcpu sysconf])
-+AC_CHECK_FUNCS([sched_getcpu sysconf sync_file_range])
- 
- # check for dlopen
- AC_CHECK_LIB([dl], [dlopen],
-@@ -394,4 +394,3 @@ AS_IF([test "x$consumerd_only" = "xno"],[
- ])
- 
- AS_ECHO()
--
-diff --git a/src/common/compat/compat-fcntl.c b/src/common/compat/compat-fcntl.c
-index 5a1c757..7ff63a3 100644
---- a/src/common/compat/compat-fcntl.c
-+++ b/src/common/compat/compat-fcntl.c
-@@ -23,7 +23,11 @@
- int compat_sync_file_range(int fd, off64_t offset, off64_t nbytes,
- 		unsigned int flags)
- {
-+#ifdef HAVE_SYNC_FILE_RANGE
- 	return sync_file_range(fd, offset, nbytes, flags);
-+#else
-+	return fdatasync(fd);
-+#endif
- }
- 
- #endif /* __linux__ */
--- 
-1.8.0.3
-
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 77bf7d6..992ecad 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.1.1
+LTTNG_TOOLS_VERSION = 2.2.0
 LTTNG_TOOLS_SITE    = http://lttng.org/files/lttng-tools/
 LTTNG_TOOLS_SOURCE  = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 
