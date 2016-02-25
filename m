From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 23:15:25 +0100
Subject: [Buildroot] [git commit branch/next] package/util-linux: remove
	patch for uClibc support
Message-ID: <20160225221529.C3AC8817BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbababe0cf8daaaf798644c3d27c4d37b4e694c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch is not needed anymore since the uClibc support has been removed from
Buildroot. This patch was needed for uClibc <= 0.9.33 support.

The only remaining supported external toolchain using uClibc 0.9.33 is the
2014R1 bfin toolchain. But all features that needs mkostemp() require fork() [1].
So, we can safely remove the patch.

[1] http://lists.busybox.net/pipermail/buildroot/2016-February/153414.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...fine-mkostemp-for-older-version-of-uClibc.patch | 50 ----------------------
 1 file changed, 50 deletions(-)

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
