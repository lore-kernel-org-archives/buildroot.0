From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  4 Jan 2016 13:01:23 +0100
Subject: [Buildroot] [PATCH] fakeroot: fix build when libcap-dev is installed
Message-ID: <1451908883-4942-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On an Ubuntu host, and probably several other build hosts,
host-fakeroot fails building when libcap-dev is installed.

Error message:

  libfakeroot.c:1646:9: error: conflicting types for 'setxattr'
   ssize_t setxattr(const char *path, const char *name, void *value, size_t size, int flags)
           ^
  In file included from /usr/include/sys/capability.h:30:0,
                   from libfakeroot.c:131:
  /usr/include/x86_64-linux-gnu/sys/xattr.h:39:12: note: previous declaration of 'setxattr' was here
   extern int setxattr (const char *__path, const char *__name,
              ^

To reproduce the bug:

  make defconfig && make host-fakeroot

This is a fakeroot bug fixed in Debian since 1.20.1-1 [0]. Apply the
patch [1] to Buildroot as well.

Buildroot bug reported by aborniak [2] on Ubuntu 15.04 x86_64.
Verified on Ubuntu 14.04 x86_64.

[0] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=758406
[1] https://sources.debian.net/patches/patch/fakeroot/1.20.2-1/glibc-xattr-types/
[2] https://bugs.busybox.net/show_bug.cgi?id=8541

Reported-by: aborniak <aborniak@gmail.com>
Cc: aborniak <aborniak@gmail.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 .../fakeroot/0001-Fix-xattr-type-mismatch.patch    | 108 +++++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 package/fakeroot/0001-Fix-xattr-type-mismatch.patch

diff --git a/package/fakeroot/0001-Fix-xattr-type-mismatch.patch b/package/fakeroot/0001-Fix-xattr-type-mismatch.patch
new file mode 100644
index 0000000..01962e2
--- /dev/null
+++ b/package/fakeroot/0001-Fix-xattr-type-mismatch.patch
@@ -0,0 +1,108 @@
+Fix the type of xattr functions to match the glibc headers.
+
+--- a/libfakeroot.c
++++ b/libfakeroot.c
+@@ -1570,7 +1570,7 @@
+ #endif /* HAVE_CAPSET */
+ 
+ #if defined(HAVE_SETXATTR) || defined(HAVE_LSETXATTR) || defined(HAVE_FSETXATTR)
+-static size_t common_setxattr(INT_STRUCT_STAT *st, const char *name, void * value, size_t size, int flags)
++static int common_setxattr(INT_STRUCT_STAT *st, const char *name, const void * value, size_t size, int flags)
+ {
+   xattr_args xattr;
+   xattr.name = name;
+@@ -1625,7 +1625,7 @@
+ #endif /* defined(HAVE_LISTXATTR) || defined(HAVE_LLISTXATTR) || defined(HAVE_FLISTXATTR) */
+ 
+ #if defined(HAVE_REMOVEXATTR) || defined(HAVE_LREMOVEXATTR) || defined(HAVE_FREMOVEXATTR)
+-static size_t common_removexattr(INT_STRUCT_STAT *st, const char *name)
++static int common_removexattr(INT_STRUCT_STAT *st, const char *name)
+ {
+   xattr_args xattr;
+   xattr.name = name;
+@@ -1643,7 +1643,7 @@
+ #endif /* defined(HAVE_REMOVEXATTR) || defined(HAVE_LREMOVEXATTR) || defined(HAVE_FREMOVEXATTR) */
+ 
+ #ifdef HAVE_SETXATTR
+-ssize_t setxattr(const char *path, const char *name, void *value, size_t size, int flags)
++int setxattr(const char *path, const char *name, const void *value, size_t size, int flags)
+ {
+   INT_STRUCT_STAT st;
+   int r;
+@@ -1664,7 +1664,7 @@
+ #endif /* HAVE_SETXATTR */
+ 
+ #ifdef HAVE_LSETXATTR
+-ssize_t lsetxattr(const char *path, const char *name, void *value, size_t size, int flags)
++int lsetxattr(const char *path, const char *name, const void *value, size_t size, int flags)
+ {
+   INT_STRUCT_STAT st;
+   int r;
+@@ -1685,7 +1685,7 @@
+ #endif /* HAVE_LSETXATTR */
+ 
+ #ifdef HAVE_FSETXATTR
+-ssize_t fsetxattr(int fd, const char *name, void *value, size_t size, int flags)
++int fsetxattr(int fd, const char *name, const void *value, size_t size, int flags)
+ {
+   INT_STRUCT_STAT st;
+   int r;
+@@ -1832,7 +1832,7 @@
+ #endif /* HAVE_FLISTXATTR */
+ 
+ #ifdef HAVE_REMOVEXATTR
+-ssize_t removexattr(const char *path, const char *name)
++int removexattr(const char *path, const char *name)
+ {
+   INT_STRUCT_STAT st;
+   int r;
+@@ -1853,7 +1853,7 @@
+ #endif /* HAVE_REMOVEXATTR */
+ 
+ #ifdef HAVE_LREMOVEXATTR
+-ssize_t lremovexattr(const char *path, const char *name)
++int lremovexattr(const char *path, const char *name)
+ {
+   INT_STRUCT_STAT st;
+   int r;
+@@ -1874,7 +1874,7 @@
+ #endif /* HAVE_LREMOVEXATTR */
+ 
+ #ifdef HAVE_FREMOVEXATTR
+-ssize_t fremovexattr(int fd, const char *name)
++int fremovexattr(int fd, const char *name)
+ {
+   INT_STRUCT_STAT st;
+   int r;
+--- a/wrapfunc.inp
++++ b/wrapfunc.inp
+@@ -168,22 +168,22 @@
+ fgetxattr;ssize_t;(int fd, const char *name, void *value, size_t size);(fd, name, value, size)
+ #endif /* HAVE_FGETXATTR */
+ #ifdef HAVE_SETXATTR
+-setxattr;ssize_t;(const char *path, const char *name, void *value, size_t size, int flags);(path, name, value, size, flags)
++setxattr;int;(const char *path, const char *name, const void *value, size_t size, int flags);(path, name, value, size, flags)
+ #endif /* HAVE_SETXATTR */
+ #ifdef HAVE_LSETXATTR
+-lsetxattr;ssize_t;(const char *path, const char *name, void *value, size_t size, int flags);(path, name, value, size, flags)
++lsetxattr;int;(const char *path, const char *name, const void *value, size_t size, int flags);(path, name, value, size, flags)
+ #endif /* HAVE_LSETXATTR */
+ #ifdef HAVE_FSETXATTR
+-fsetxattr;ssize_t;(int fd, const char *name, void *value, size_t size, int flags);(fd, name, value, size, flags)
++fsetxattr;int;(int fd, const char *name, const void *value, size_t size, int flags);(fd, name, value, size, flags)
+ #endif /* HAVE_FSETXATTR */
+ #ifdef HAVE_REMOVEXATTR
+-removexattr;ssize_t;(const char *path, const char *name);(path, name)
++removexattr;int;(const char *path, const char *name);(path, name)
+ #endif /* HAVE_REMOVEXATTR */
+ #ifdef HAVE_LREMOVEXATTR
+-lremovexattr;ssize_t;(const char *path, const char *name);(path, name)
++lremovexattr;int;(const char *path, const char *name);(path, name)
+ #endif /* HAVE_LREMOVEXATTR */
+ #ifdef HAVE_FREMOVEXATTR
+-fremovexattr;ssize_t;(int fd, const char *name);(fd, name)
++fremovexattr;int;(int fd, const char *name);(fd, name)
+ #endif /* HAVE_FREMOVEXATTR */
+ 
+ #ifdef HAVE_FSTATAT
+
-- 
1.9.1
