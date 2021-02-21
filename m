From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Feb 2021 23:55:38 +0100
Subject: [Buildroot] [git commit] package/fakeroot: fix glibc detection on
 patch for new wrappers
Message-ID: <20210221223358.12F01862BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e41b170b328cc086334948ff3b8038075e2c09ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit f45925a951318e9e53bead80b363e004301adc6f add the patch:

0003-libfakeroot.c-add-wrappers-for-new-glibc-2.33-symbol.patch

which allowed fakeroot to be compiled with GLIBC 2.33 or above.
However, this introduce a bug for building with a non-GLIBC based
toolchain as a GLIBC macro - __GLIBC_PREREQ - is used on the same line
as the detection of GLIBC.

Fix this by backporting the fix to this incorrect macro from upstream
commit:

https://salsa.debian.org/clint/fakeroot/-/commit/8090dffdad8fda86dccd47ce7a7db8840bdf7d7b

CC: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0005-fix-build-regression-on-macOS.patch       | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/package/fakeroot/0005-fix-build-regression-on-macOS.patch b/package/fakeroot/0005-fix-build-regression-on-macOS.patch
new file mode 100644
index 0000000000..d5589a79f5
--- /dev/null
+++ b/package/fakeroot/0005-fix-build-regression-on-macOS.patch
@@ -0,0 +1,63 @@
+From 3590b817df703a256f2c1de9a5f5469eaa1c86e9 Mon Sep 17 00:00:00 2001
+From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
+Date: Mon, 15 Feb 2021 11:07:56 -0800
+Subject: [PATCH] fix build regression on macOS
+
+Signed-off-by: Felix Fietkau <nbd@nbd.name>
+Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
+[Ryan: backported from 8090dffdad8fda86dccd47ce7a7db8840bdf7d7b]
+Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
+---
+ configure.ac  | 6 ++++++
+ libfakeroot.c | 4 +++-
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index d85566f..d635df1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -181,6 +181,9 @@ AC_MSG_CHECKING([for type of arg of __xmknod])
+        #include <fcntl.h>
+        #include <unistd.h>
+   ]], [[
++#ifndef __GLIBC__
++#error no extra *
++#endif
+        int __xmknod  ( int ver,
+                        const char *pathname ,
+                        mode_t  mode ,  dev_t *dev);
+@@ -207,6 +210,9 @@ AC_MSG_CHECKING([for type of arg of __xmknodat])
+        #include <fcntl.h>
+        #include <unistd.h>
+   ]], [[
++#ifndef __GLIBC__
++#error no extra *
++#endif
+        int __xmknodat  ( int ver,
+                          int dirfd,
+                          const char *pathname ,
+diff --git a/libfakeroot.c b/libfakeroot.c
+index d75c51f..ec4e577 100644
+--- a/libfakeroot.c
++++ b/libfakeroot.c
+@@ -1352,7 +1352,8 @@ int renameat(int olddir_fd, const char *oldpath,
+ #endif /* HAVE_FSTATAT */
+ 
+ 
+-#if defined(__GLIBC__) && __GLIBC_PREREQ(2,33)
++#if defined(__GLIBC__)
++#if __GLIBC_PREREQ(2,33)
+ /* Glibc 2.33 exports symbols for these functions in the shared lib */
+   int lstat(const char *file_name, struct stat *statbuf) {
+      return WRAP_LSTAT LSTAT_ARG(_STAT_VER, file_name, statbuf);
+@@ -1397,6 +1398,7 @@ int renameat(int olddir_fd, const char *oldpath,
+        return WRAP_MKNODAT MKNODAT_ARG(_STAT_VER, dir_fd, pathname, mode, &dev);
+     }
+   #endif
++#endif /* __GLIBC__ */
+ #endif /* GLIBC_PREREQ */
+ 
+ 
+-- 
+2.25.1
+
