From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 19 Feb 2016 23:28:09 +0100
Subject: [Buildroot] [PATCH] package/util-linux: remove patch for uClibc
	support
Message-ID: <1455920889-14777-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is not needed anymore since the uClibc support
has been removed from Buildroot.
This patch was needed for uClibc <= 0.9.33 support.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
Build tested with 2014R1 bfin toolchain.
The arc-1015.12 toolchain shouldn't trigger the build issue
since it's based on uClibc-snapshot (upstream HEAD)
---
 ...fine-mkostemp-for-older-version-of-uClibc.patch | 50 ----------------------
 1 file changed, 50 deletions(-)
 delete mode 100644 package/util-linux/0003-c.h-define-mkostemp-for-older-version-of-uClibc.patch

diff --git a/package/util-linux/0003-c.h-define-mkostemp-for-older-version-of-uClibc.patch b/package/util-linux/0003-c.h-define-mkostemp-for-older-version-of-uClibc.patch
deleted file mode 100644
index 0dfe7be..0000000
--- a/package/util-linux/0003-c.h-define-mkostemp-for-older-version-of-uClibc.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 42a84250fc78bae3e885ecd1379e713663fe6487 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Sun, 6 Apr 2014 12:12:41 +0200
-Subject: [PATCH 1/1] c.h: define mkostemp for older version of uClibc
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- configure.ac |  2 ++
- include/c.h  | 14 ++++++++++++++
- 2 files changed, 16 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 35a1f26..a9b8d34 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -321,6 +321,8 @@ AC_CHECK_FUNCS([ \
- ])
- AC_FUNC_FSEEKO
- 
-+AC_CHECK_FUNCS([mkostemp])
-+
- AC_CHECK_FUNCS([openat fstatat unlinkat], [have_openat=yes], [have_openat=no])
- AC_CHECK_FUNCS([ioperm iopl], [have_io=yes])
- 
-diff --git a/include/c.h b/include/c.h
-index 4a9bf3d..1b880ed 100644
---- a/include/c.h
-+++ b/include/c.h
-@@ -300,4 +300,18 @@ static inline int usleep(useconds_t usec)
- # define SEEK_HOLE	4
- #endif
- 
-+/*
-+ * mkostemp() may be missing with older version of uClibc
-+ */
-+#ifndef HAVE_MKOSTEMP
-+static inline int mkostemp(char *template, int flags)
-+{
-+	int fd;
-+	fd = mkstemp(template);
-+	if (flags & O_CLOEXEC && fd >= 0)
-+		fcntl(fd, F_SETFD, FD_CLOEXEC);
-+	return fd;
-+}
-+#endif
-+
- #endif /* UTIL_LINUX_C_H */
--- 
-1.9.0
-
-- 
2.5.0
