From: Romain Naour <romain.naour@openwide.fr>
Date: Sun,  6 Apr 2014 14:37:33 +0200
Subject: [Buildroot] [PATCH v2 1/2] util-linux: add a check for mkostemp()
Message-ID: <1396787854-29725-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mkostemp() is missing with older version of uClibc (uClibc <= 0.9.33).
So, we need to check if mkostemp() is available.
If not, we use a wrapper function based on mkstemp() to implement it.

Since util-linux v2.23, mkostemp() is called with O_CLOEXEC flag.
If we use a define to mkstemp() to implement mkostemp(), flags will be
discared.
mkstemp() will pass O_RDWR|O_CREAT|O_EXCL, but not O_CLOEXEC, which
means that the file descriptor will no longer be closed automatically
upon exec().

To avoid to discard the flags, we add a call to fcntl() to set O_CLOEXEC
flag just after mkstemp().

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v2: add a check for mkostemp() instead of using a define for uClibc case. (ThomasP)

 ...fine-mkostemp-for-older-version-of-uClibc.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/util-linux/util-linux-004-c.h-define-mkostemp-for-older-version-of-uClibc.patch

diff --git a/package/util-linux/util-linux-004-c.h-define-mkostemp-for-older-version-of-uClibc.patch b/package/util-linux/util-linux-004-c.h-define-mkostemp-for-older-version-of-uClibc.patch
new file mode 100644
index 0000000..0dfe7be
--- /dev/null
+++ b/package/util-linux/util-linux-004-c.h-define-mkostemp-for-older-version-of-uClibc.patch
@@ -0,0 +1,50 @@
+From 42a84250fc78bae3e885ecd1379e713663fe6487 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sun, 6 Apr 2014 12:12:41 +0200
+Subject: [PATCH 1/1] c.h: define mkostemp for older version of uClibc
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ configure.ac |  2 ++
+ include/c.h  | 14 ++++++++++++++
+ 2 files changed, 16 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 35a1f26..a9b8d34 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -321,6 +321,8 @@ AC_CHECK_FUNCS([ \
+ ])
+ AC_FUNC_FSEEKO
+ 
++AC_CHECK_FUNCS([mkostemp])
++
+ AC_CHECK_FUNCS([openat fstatat unlinkat], [have_openat=yes], [have_openat=no])
+ AC_CHECK_FUNCS([ioperm iopl], [have_io=yes])
+ 
+diff --git a/include/c.h b/include/c.h
+index 4a9bf3d..1b880ed 100644
+--- a/include/c.h
++++ b/include/c.h
+@@ -300,4 +300,18 @@ static inline int usleep(useconds_t usec)
+ # define SEEK_HOLE	4
+ #endif
+ 
++/*
++ * mkostemp() may be missing with older version of uClibc
++ */
++#ifndef HAVE_MKOSTEMP
++static inline int mkostemp(char *template, int flags)
++{
++	int fd;
++	fd = mkstemp(template);
++	if (flags & O_CLOEXEC && fd >= 0)
++		fcntl(fd, F_SETFD, FD_CLOEXEC);
++	return fd;
++}
++#endif
++
+ #endif /* UTIL_LINUX_C_H */
+-- 
+1.9.0
+
-- 
1.9.0
