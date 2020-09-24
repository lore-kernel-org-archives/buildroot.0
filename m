From: Norbert Lange <nolange79@gmail.com>
Date: Thu, 24 Sep 2020 11:23:15 +0200
Subject: [Buildroot] [PATCH] package/fakeroot: bump to 1.25.1
Message-ID: <20200924092315.205863-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version adds wrappers for getgroups and statx,
the latter is used by coreutils 8.32.

Removed patches that are now in upstream.

Added a patch to fix failure when installing.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/fakeroot/0001-hide-dlsym-error.patch  | 34 --------
 package/fakeroot/0001-skip-doc-subdirs.patch  | 14 ++++
 ...002-Select-TCP-when-lack-of-SYSV-IPC.patch | 77 -------------------
 ...Fix-forwarding-fchownat-fchmod-flags.patch | 28 -------
 package/fakeroot/fakeroot.hash                |  6 +-
 package/fakeroot/fakeroot.mk                  |  4 +-
 6 files changed, 19 insertions(+), 144 deletions(-)
 delete mode 100644 package/fakeroot/0001-hide-dlsym-error.patch
 create mode 100644 package/fakeroot/0001-skip-doc-subdirs.patch
 delete mode 100644 package/fakeroot/0002-Select-TCP-when-lack-of-SYSV-IPC.patch
 delete mode 100644 package/fakeroot/0004-Fix-forwarding-fchownat-fchmod-flags.patch

diff --git a/package/fakeroot/0001-hide-dlsym-error.patch b/package/fakeroot/0001-hide-dlsym-error.patch
deleted file mode 100644
index 2c61fab248..0000000000
--- a/package/fakeroot/0001-hide-dlsym-error.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Description: Hide error from dlsym()
- dlsym(), starting in glibc 2.24 actually reports errors. In our case,
- we try to get ACL functions which are not in the glibc. This causes
- failures in test suites, so hide those messages for non-debugging
- purposes for now. It also makes the build logs annoying to read.
-Author: Julian Andres Klode <juliank@ubuntu.com>
-Origin: vendor
-Bug-Debian: https://bugs.debian.org/830912
-Forwarded: no
-Last-Update: 2016-08-12
-
-Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
-
---- a/libfakeroot.c
-+++ b/libfakeroot.c
-@@ -256,10 +256,16 @@ void load_library_symbols(void){
-  /* clear dlerror() just in case dlsym() legitimately returns NULL */
-     msg = dlerror();
-     *(next_wrap[i].doit)=dlsym(get_libc(), next_wrap[i].name);
-+
-     if ( (msg = dlerror()) != NULL){
--      fprintf (stderr, "dlsym(%s): %s\n", next_wrap[i].name, msg);
--/*    abort ();*/
-+#ifdef LIBFAKEROOT_DEBUGGING
-+      if (fakeroot_debug) {
-+        fprintf (stderr, "dlsym(%s): %s\n", next_wrap[i].name, msg);
-+/*      abort ();*/
-+      }
-+#endif
-     }
-+
-   }
- }
-
diff --git a/package/fakeroot/0001-skip-doc-subdirs.patch b/package/fakeroot/0001-skip-doc-subdirs.patch
new file mode 100644
index 0000000000..91663fb64d
--- /dev/null
+++ b/package/fakeroot/0001-skip-doc-subdirs.patch
@@ -0,0 +1,14 @@
+For some reason, version 1.25 and up is missing all localized doc,
+and thus fails on the install stage.
+
+Skip the directories.
+
+Signed-off-by: Norbert Lange <nolange79@gmail.com>
+--- fakeroot-1.25.1.org/doc/Makefile.am	2020-09-22 23:52:20.000000000 +0200
++++ fakeroot-1.25.1/doc/Makefile.am	2020-09-24 11:05:27.611298673 +0200
+@@ -1,5 +1,4 @@
+ AUTOMAKE_OPTIONS=foreign
+-SUBDIRS = de es fr nl pt sv
+
+ man_MANS = faked.1 fakeroot.1
+
diff --git a/package/fakeroot/0002-Select-TCP-when-lack-of-SYSV-IPC.patch b/package/fakeroot/0002-Select-TCP-when-lack-of-SYSV-IPC.patch
deleted file mode 100644
index 07b206b68e..0000000000
--- a/package/fakeroot/0002-Select-TCP-when-lack-of-SYSV-IPC.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 8e9a7a8c72a9fe407d296ec0ffeb56b2cd271959 Mon Sep 17 00:00:00 2001
-From: Matt Weber <matthew.weber@rockwellcollins.com>
-Date: Mon, 16 Sep 2019 22:00:29 -0500
-Subject: [PATCH] Select TCP when lack of SYSV IPC
-
-Update to add a configure test to build and install the TCP IPC version
-when detecting SYSV IPC MsgQ support isn't available.
-
-The issue was initially discovered on Windows Services for Linux
-(WSL1.0). WSL does have some SysV IPC, but no message Q's, which is
-required by fakeroot/faked by default.
-
-Fixes:
-https://github.com/Microsoft/WSL/issues/2465
-
-Additional bug reports:
-https://bugs.busybox.net/show_bug.cgi?id=11366
-
-Upstream:
-https://salsa.debian.org/clint/fakeroot/merge_requests/2
-
-Signed-off-by: Jean-Francois Doyon <jfdoyon@gmail.com>
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- configure.ac | 36 ++++++++++++++++++++++++++++++++++++
- 1 file changed, 36 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index a9189e6..1650f77 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -25,6 +25,42 @@ AC_CACHE_CHECK([which IPC method to use],
- 	       [ac_cv_use_ipc],
- 	       [ac_cv_use_ipc=sysv])
- 
-+if test $ac_cv_use_ipc = "sysv"; then
-+  AC_MSG_CHECKING([whether SysV IPC message queues are actually working on the host])
-+
-+  AC_LANG_PUSH(C)
-+  AC_TRY_RUN([
-+#include <stdlib.h>
-+#include <sys/types.h>
-+#include <sys/ipc.h>
-+#include <sys/msg.h>
-+#include <time.h>
-+#include <unistd.h>
-+
-+int main() {
-+
-+  srandom(time(NULL)+getpid()*33151);
-+  key_t msg_key = random();
-+  int msg_get = msgget(msg_key, IPC_CREAT|0600);
-+
-+  if (msg_get==-1) {
-+    return 1;
-+  } else {
-+    msgctl(msg_get, IPC_RMID, NULL);
-+    return 0;
-+  }
-+
-+}], [ac_cv_use_ipc=sysv], [ac_cv_use_ipc=tcp])
-+
-+  if test $ac_cv_use_ipc = "tcp"; then
-+    AC_MSG_RESULT([No, using TCP])
-+  else
-+    AC_MSG_RESULT([Yes])
-+  fi
-+
-+  AC_LANG_POP(C)
-+fi
-+
- AC_ARG_WITH([dbformat],
- 	    AS_HELP_STRING([--with-dbformat@<:@=DBFORMAT@:>@],
- 			   [database format to use: either inode (default) or path]),
--- 
-2.17.1
-
diff --git a/package/fakeroot/0004-Fix-forwarding-fchownat-fchmod-flags.patch b/package/fakeroot/0004-Fix-forwarding-fchownat-fchmod-flags.patch
deleted file mode 100644
index fc74543378..0000000000
--- a/package/fakeroot/0004-Fix-forwarding-fchownat-fchmod-flags.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Forward supported flags to fstatat, this fixes issues like
-using an empty path
-
-Upstream BR: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=959876
-
-Signed-off-by: Norbert Lange <nolange79@gmail.com>
-
-diff -burN fakeroot-1.20.2.org/libfakeroot.c fakeroot-1.20.2/libfakeroot.c
---- fakeroot-1.20.2.org/libfakeroot.c	2014-10-05 17:16:00.000000000 +0200
-+++ fakeroot-1.20.2/libfakeroot.c	2020-05-10 22:24:18.896625085 +0200
-@@ -880,7 +880,7 @@
-   /* If AT_SYMLINK_NOFOLLOW is set in the fchownat call it should
-      be when we stat it. */
-   INT_STRUCT_STAT st;
--  r=INT_NEXT_FSTATAT(dir_fd, path, &st, (flags & AT_SYMLINK_NOFOLLOW));
-+  r=INT_NEXT_FSTATAT(dir_fd, path, &st, (flags & (AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH | AT_NO_AUTOMOUNT)));
-
-   if(r)
-     return(r);
-@@ -1017,7 +1017,7 @@
-
-   /* If AT_SYMLINK_NOFOLLOW is set in the fchownat call it should
-      be when we stat it. */
--  r=INT_NEXT_FSTATAT(dir_fd, path, &st, flags & AT_SYMLINK_NOFOLLOW);
-+  r=INT_NEXT_FSTATAT(dir_fd, path, &st, flags & (AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH | AT_NO_AUTOMOUNT));
-
-   if(r)
-     return(r);
diff --git a/package/fakeroot/fakeroot.hash b/package/fakeroot/fakeroot.hash
index 633bda0cb9..e92523109a 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,4 +1,4 @@
-# From http://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.24-1.dsc
-sha256	2e045b3160370b8ab4d44d1f8d267e5d1d555f1bb522d650e7167b09477266ed	fakeroot_1.24.orig.tar.gz
+# From http://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.25.1-1.dsc
+sha256  95cd11cf057c1ae38905c1c6be29a1d1e402f15cde4707b5009cc9cb995256c5  fakeroot_1.25.1.orig.tar.gz
 # License files, locally calculated
-sha256	fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7	COPYING
+sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 39a6906182..ed96fea2ae 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 1.24
+FAKEROOT_VERSION = 1.25.1
 FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
 FAKEROOT_SITE = http://deb.debian.org/debian/pool/main/f/fakeroot
 
@@ -15,7 +15,7 @@ HOST_FAKEROOT_DEPENDENCIES = host-acl
 HOST_FAKEROOT_CONF_ENV = \
 	ac_cv_header_sys_capability_h=no \
 	ac_cv_func_capset=no
-# 0003-Select-TCP-when-lack-of-SYSV-IPC.patch touches configure.ac
+# upstream does not ship with configure script anymore
 HOST_FAKEROOT_AUTORECONF = YES
 FAKEROOT_LICENSE = GPL-3.0+
 FAKEROOT_LICENSE_FILES = COPYING
-- 
2.28.0
