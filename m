From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 15 Feb 2021 19:55:41 +0100
Subject: [Buildroot] [PATCH 2020.02.x] package/fakeroot: add upstream
 patches to fix glibc 2.33 compatibility
Message-ID: <20210215185541.111347-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Glibc 2.33 removed `_STAT_VER`. On host systems, which updated to glibc
2.33, building host-fakeroot breaks:

```
In file included from communicate.h:20,
             from libfakeroot.c:60:
libfakeroot.c: In function ?chown?:
libfakeroot.c:99:40: error: ?_STAT_VER? undeclared (first use in this function)
99 | #define INT_NEXT_STAT(a,b) NEXT_STAT64(_STAT_VER,a,b)
```

The issue has been discussed on some system package threads, e.g.:
https://bugs.archlinux.org/task/69572
https://bugzilla.redhat.com/show_bug.cgi?id=1889862#c13

A patch set was prepared by Ilya Lipnitskiy which included two other
patches not related to the glibc 2.33 compatibility and prepared as
merge request for upstream:
https://www.mail-archive.com/openwrt-devel at lists.openwrt.org/msg57280.html

Upstream accepted the merge request:
https://salsa.debian.org/clint/fakeroot/-/merge_requests/10

Note, that this patch series only contains the necessay patches for glibc
2.33 compatibility.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...fine-_STAT_VER-if-not-already-define.patch | 45 +++++++++++
 ...d-wrappers-for-new-glibc-2.33-symbol.patch | 80 +++++++++++++++++++
 ....ac-fix-__xmknod-at-pointer-argument.patch | 66 +++++++++++++++
 package/fakeroot/fakeroot.mk                  |  1 +
 4 files changed, 192 insertions(+)
 create mode 100644 package/fakeroot/0005-libfakeroot.c-define-_STAT_VER-if-not-already-define.patch
 create mode 100644 package/fakeroot/0006-libfakeroot.c-add-wrappers-for-new-glibc-2.33-symbol.patch
 create mode 100644 package/fakeroot/0007-configure.ac-fix-__xmknod-at-pointer-argument.patch

diff --git a/package/fakeroot/0005-libfakeroot.c-define-_STAT_VER-if-not-already-define.patch b/package/fakeroot/0005-libfakeroot.c-define-_STAT_VER-if-not-already-define.patch
new file mode 100644
index 0000000000..5acdd4e8dc
--- /dev/null
+++ b/package/fakeroot/0005-libfakeroot.c-define-_STAT_VER-if-not-already-define.patch
@@ -0,0 +1,45 @@
+From 03bc0ee07fb6e293d081ffd8af1654788b434f6a Mon Sep 17 00:00:00 2001
+From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
+Date: Thu, 11 Feb 2021 20:59:25 -0800
+Subject: [PATCH 1/3] libfakeroot.c: define _STAT_VER if not already defined
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+glibc 2.33 does does declare `_STAT_VER` anymore.
+
+Based on patch from Jan Pazdziora:
+https://lists.fedoraproject.org/archives/list/devel at lists.fedoraproject.org/message/SMQ3RYXEYTVZH6PLQMKNB3NM4XLPMNZO/
+
+Backported from: feda578ca3608b7fc9a28a3a91293611c0ef47b7
+
+Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ libfakeroot.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/libfakeroot.c b/libfakeroot.c
+index 3e80e38..14cdbc4 100644
+--- a/libfakeroot.c
++++ b/libfakeroot.c
+@@ -90,6 +90,16 @@
+ #define SEND_GET_XATTR64(a,b,c) send_get_xattr64(a,b)
+ #endif
+ 
++#ifndef _STAT_VER
++ #if defined (__aarch64__)
++  #define _STAT_VER 0
++ #elif defined (__x86_64__)
++  #define _STAT_VER 1
++ #else
++  #define _STAT_VER 3
++ #endif
++#endif
++
+ /*
+    These INT_* (which stands for internal) macros should always be used when
+    the fakeroot library owns the storage of the stat variable.
+-- 
+2.30.1
+
diff --git a/package/fakeroot/0006-libfakeroot.c-add-wrappers-for-new-glibc-2.33-symbol.patch b/package/fakeroot/0006-libfakeroot.c-add-wrappers-for-new-glibc-2.33-symbol.patch
new file mode 100644
index 0000000000..a77041bb75
--- /dev/null
+++ b/package/fakeroot/0006-libfakeroot.c-add-wrappers-for-new-glibc-2.33-symbol.patch
@@ -0,0 +1,80 @@
+From feda578ca3608b7fc9a28a3a91293611c0ef47b7 Mon Sep 17 00:00:00 2001
+From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
+Date: Thu, 11 Feb 2021 21:00:04 -0800
+Subject: [PATCH 2/3] libfakeroot.c: add wrappers for new glibc 2.33+ symbols
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This patch add wrappers for newly exported symbols in glibc 2.33.
+
+Backported from: feda578ca3608b7fc9a28a3a91293611c0ef47b7
+
+Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ libfakeroot.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 48 insertions(+)
+
+diff --git a/libfakeroot.c b/libfakeroot.c
+index 14cdbc4..d75c51f 100644
+--- a/libfakeroot.c
++++ b/libfakeroot.c
+@@ -1352,6 +1352,54 @@ int renameat(int olddir_fd, const char *oldpath,
+ #endif /* HAVE_FSTATAT */
+ 
+ 
++#if defined(__GLIBC__) && __GLIBC_PREREQ(2,33)
++/* Glibc 2.33 exports symbols for these functions in the shared lib */
++  int lstat(const char *file_name, struct stat *statbuf) {
++     return WRAP_LSTAT LSTAT_ARG(_STAT_VER, file_name, statbuf);
++  }
++  int stat(const char *file_name, struct stat *st) {
++     return WRAP_STAT STAT_ARG(_STAT_VER, file_name, st);
++  }
++  int fstat(int fd, struct stat *st) {
++     return WRAP_FSTAT FSTAT_ARG(_STAT_VER, fd, st);
++  }
++
++  #ifdef HAVE_FSTATAT
++    int fstatat(int dir_fd, const char *path, struct stat *st, int flags) {
++       return WRAP_FSTATAT FSTATAT_ARG(_STAT_VER, dir_fd, path, st, flags);
++    }
++  #endif
++
++  #ifdef STAT64_SUPPORT
++    int lstat64(const char *file_name, struct stat64 *st) {
++       return WRAP_LSTAT64 LSTAT64_ARG(_STAT_VER, file_name, st);
++    }
++    int stat64(const char *file_name, struct stat64 *st) {
++       return WRAP_STAT64 STAT64_ARG(_STAT_VER, file_name, st);
++    }
++    int fstat64(int fd, struct stat64 *st) {
++       return WRAP_FSTAT64 FSTAT64_ARG(_STAT_VER, fd, st);
++    }
++
++    #ifdef HAVE_FSTATAT
++      int fstatat64(int dir_fd, const char *path, struct stat64 *st, int flags) {
++	 return WRAP_FSTATAT64 FSTATAT64_ARG(_STAT_VER, dir_fd, path, st, flags);
++      }
++    #endif
++  #endif
++
++  int mknod(const char *pathname, mode_t mode, dev_t dev) {
++     return WRAP_MKNOD MKNOD_ARG(_STAT_VER, pathname, mode, &dev);
++  }
++
++  #if defined(HAVE_FSTATAT) && defined(HAVE_MKNODAT)
++    int mknodat(int dir_fd, const char *pathname, mode_t mode, dev_t dev) {
++       return WRAP_MKNODAT MKNODAT_ARG(_STAT_VER, dir_fd, pathname, mode, &dev);
++    }
++  #endif
++#endif /* GLIBC_PREREQ */
++
++
+ #ifdef FAKEROOT_FAKENET
+ pid_t fork(void)
+ {
+-- 
+2.30.1
+
diff --git a/package/fakeroot/0007-configure.ac-fix-__xmknod-at-pointer-argument.patch b/package/fakeroot/0007-configure.ac-fix-__xmknod-at-pointer-argument.patch
new file mode 100644
index 0000000000..186991bb5a
--- /dev/null
+++ b/package/fakeroot/0007-configure.ac-fix-__xmknod-at-pointer-argument.patch
@@ -0,0 +1,66 @@
+From 432dd46e662772020306a2ce8b1be38321697e69 Mon Sep 17 00:00:00 2001
+From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
+Date: Sat, 13 Feb 2021 19:32:08 -0800
+Subject: [PATCH 3/3] configure.ac: fix __xmknod{,at} pointer argument
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Switch default to assume * and not the absence of *.
+
+On glibc 2.33+, there is no definition for these functions in header
+files, so the compile test doesn't work. But, we can default to using
+the pointer (as is the case with newer glibc), and use the header file
+on older platforms to fail the test and use no pointer.
+
+Backported from: c3eebec293e35b997bb46c22fb5a4e114afb5e7f
+
+Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ configure.ac | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 73415d2..d85566f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -183,13 +183,13 @@ AC_MSG_CHECKING([for type of arg of __xmknod])
+   ]], [[
+        int __xmknod  ( int ver,
+                        const char *pathname ,
+-                       mode_t  mode ,  dev_t dev);
++                       mode_t  mode ,  dev_t *dev);
+   ]])],[
+-   AC_DEFINE(XMKNOD_FRTH_ARG,)
+-   AC_MSG_RESULT([no extra *])
+-  ],[
+    AC_DEFINE(XMKNOD_FRTH_ARG,[*])
+    AC_MSG_RESULT([needs *])
++  ],[
++   AC_DEFINE(XMKNOD_FRTH_ARG,)
++   AC_MSG_RESULT([no extra *])
+ 
+   ])
+ 
+@@ -210,13 +210,13 @@ AC_MSG_CHECKING([for type of arg of __xmknodat])
+        int __xmknodat  ( int ver,
+                          int dirfd,
+                          const char *pathname ,
+-                         mode_t  mode ,  dev_t dev);
++                         mode_t  mode ,  dev_t *dev);
+   ]])],[
+-   AC_DEFINE(XMKNODAT_FIFTH_ARG,)
+-   AC_MSG_RESULT([no extra *])
+-  ],[
+    AC_DEFINE(XMKNODAT_FIFTH_ARG,[*])
+    AC_MSG_RESULT([needs *])
++  ],[
++   AC_DEFINE(XMKNODAT_FIFTH_ARG,)
++   AC_MSG_RESULT([no extra *])
+ 
+   ])
+ 
+-- 
+2.30.1
+
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 1be99071bf..becb719abe 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -16,6 +16,7 @@ HOST_FAKEROOT_CONF_ENV = \
 	ac_cv_header_sys_capability_h=no \
 	ac_cv_func_capset=no
 # 0003-Select-TCP-when-lack-of-SYSV-IPC.patch touches configure.ac
+# 0007-configure.ac-fix-__xmknod-at-pointer-argument.patch touches configure.ac
 HOST_FAKEROOT_AUTORECONF = YES
 FAKEROOT_LICENSE = GPL-3.0+
 FAKEROOT_LICENSE_FILES = COPYING
-- 
2.30.1
