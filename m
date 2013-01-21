From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 21 Jan 2013 10:05:13 +0100
Subject: [Buildroot] [PATCH 1/2] lttng-tools: fix version bumping to 2.1.1"
Message-ID: <1358759114-11148-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* re-introduce lttng-tools-no-sync-file-range-in-uclibc.patch
  (merged upstream just after the 2.1.1 release)

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 .../lttng-tools-no-sync-file-range-in-uclibc.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 package/lttng-tools/lttng-tools-no-sync-file-range-in-uclibc.patch

diff --git a/package/lttng-tools/lttng-tools-no-sync-file-range-in-uclibc.patch b/package/lttng-tools/lttng-tools-no-sync-file-range-in-uclibc.patch
new file mode 100644
index 0000000..fcaaa3e
--- /dev/null
+++ b/package/lttng-tools/lttng-tools-no-sync-file-range-in-uclibc.patch
@@ -0,0 +1,51 @@
+Make sync_file_range() usage optional
+
+Under uClibc, sync_file_range() is not available under all
+architectures, so we fall back to fdatasync() in this case.
+
+Inspired by the patch done by Thomas Petazzoni for the
+2.0-pre25 version.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ configure.ac              |    2 +-
+ src/common/compat/fcntl.h |    5 +++++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5808c79..065b9cf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -150,7 +150,7 @@ AS_IF([test "x$lttng_ust_support" = "xyes"], [
+ 	)
+ ])
+ AM_CONDITIONAL([HAVE_LIBLTTNG_UST_CTL], [test "x$lttng_ust_ctl_found" = xyes])
+-AC_CHECK_FUNCS([sched_getcpu sysconf])
++AC_CHECK_FUNCS([sched_getcpu sysconf sync_file_range])
+ 
+ # check for dlopen
+ AC_CHECK_LIB([dl], [dlopen],
+@@ -394,4 +394,3 @@ AS_IF([test "x$consumerd_only" = "xno"],[
+ ])
+ 
+ AS_ECHO()
+-
+diff --git a/src/common/compat/compat-fcntl.c b/src/common/compat/compat-fcntl.c
+index 5a1c757..7ff63a3 100644
+--- a/src/common/compat/compat-fcntl.c
++++ b/src/common/compat/compat-fcntl.c
+@@ -23,7 +23,11 @@
+ int compat_sync_file_range(int fd, off64_t offset, off64_t nbytes,
+ 		unsigned int flags)
+ {
++#ifdef HAVE_SYNC_FILE_RANGE
+ 	return sync_file_range(fd, offset, nbytes, flags);
++#else
++	return fdatasync(fd);
++#endif
+ }
+ 
+ #endif /* __linux__ */
+-- 
+1.8.0.3
+
-- 
1.8.1.1
