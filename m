From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 19:21:04 +0200
Subject: [Buildroot] [git commit] package/fakeroot: bump version to 1.25.3
Message-ID: <20201014170955.148978F3AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44c22e676a6b02e2b9ac5b03c7104ea2aa5ed2da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version adds wrappers for getgroups and statx, the latter is used
by coreutils 8.32.

Removed patches that are now in upstream.

Added a patch to fix failure when installing.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fakeroot/0001-hide-dlsym-error.patch       | 34 ----------
 package/fakeroot/0001-skip-doc-subdirs.patch       | 14 ++++
 ...communicate-check-return-status-of-msgrcv.patch | 46 -------------
 .../0003-Select-TCP-when-lack-of-SYSV-IPC.patch    | 77 ----------------------
 ...0004-Fix-forwarding-fchownat-fchmod-flags.patch | 28 --------
 package/fakeroot/fakeroot.hash                     |  8 +--
 package/fakeroot/fakeroot.mk                       |  8 +--
 7 files changed, 21 insertions(+), 194 deletions(-)

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
diff --git a/package/fakeroot/0002-communicate-check-return-status-of-msgrcv.patch b/package/fakeroot/0002-communicate-check-return-status-of-msgrcv.patch
deleted file mode 100644
index 4e81b49122..0000000000
--- a/package/fakeroot/0002-communicate-check-return-status-of-msgrcv.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From a853f21633693f9eefc4949660253a5328d2d2f3 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 13 Aug 2017 23:21:54 +0200
-Subject: [PATCH] communicate: check return status of msgrcv()
-
-msgrcv can return with -1 to indicate an error condition.
-One such error is to have been interrupted by a signal.
-
-Being interrupted by a signal is very rare in this code, except in a
-very special condition: a highly-parallel (1000 jobs!) mksquashfs on
-a filesystem with extended attributes, where we see errors like (those
-are mksquashfs errors):
-    llistxattr for titi/603/883 failed in read_attrs, because Unknown
-    error 1716527536
-
-See: https://bugs.busybox.net/show_bug.cgi?id=10141
-
-In this case, we just have to retry the call to msgrcv().
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- communicate.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/communicate.c b/communicate.c
-index 293f404..787bb63 100644
---- a/communicate.c
-+++ b/communicate.c
-@@ -553,10 +553,13 @@ void send_get_fakem(struct fake_msg *buf)
-       l=msgrcv(msg_get,
-                (struct my_msgbuf*)buf,
-                sizeof(*buf)-sizeof(buf->mtype),0,0);
--    while((buf->serial!=serial)||buf->pid!=pid);
-+    while(((l==-1)&&(errno==EINTR))||(buf->serial!=serial)||buf->pid!=pid);
- 
-     semaphore_down();
- 
-+    if(l==-1)
-+      buf->xattr.flags_rc=errno;
-+
-     /*
-     (nah, may be wrong, due to allignment)
- 
--- 
-2.11.0
-
diff --git a/package/fakeroot/0003-Select-TCP-when-lack-of-SYSV-IPC.patch b/package/fakeroot/0003-Select-TCP-when-lack-of-SYSV-IPC.patch
deleted file mode 100644
index 07b206b68e..0000000000
--- a/package/fakeroot/0003-Select-TCP-when-lack-of-SYSV-IPC.patch
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
index d1d959df6f..1a23d9e8d8 100644
--- a/package/fakeroot/fakeroot.hash
+++ b/package/fakeroot/fakeroot.hash
@@ -1,6 +1,4 @@
-# From http://snapshot.debian.org/package/fakeroot/1.20.2-1/
-sha1	367040df07043edb630942b21939e493f3fad888	fakeroot_1.20.2.orig.tar.bz2
-# Calculated based on the hash above
-sha256	7c0a164d19db3efa9e802e0fc7cdfeff70ec6d26cdbdc4338c9c2823c5ea230c	fakeroot_1.20.2.orig.tar.bz2
+# From http://deb.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.25.3-1.dsc
+sha256  8e903683357f7f5bcc31b879fd743391ad47691d4be33d24a76be3b6c21e956c  fakeroot_1.25.3.orig.tar.gz
 # License files, locally calculated
-sha256	fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7	COPYING
+sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/fakeroot/fakeroot.mk b/package/fakeroot/fakeroot.mk
index 1be99071bf..957f0a53b7 100644
--- a/package/fakeroot/fakeroot.mk
+++ b/package/fakeroot/fakeroot.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FAKEROOT_VERSION = 1.20.2
-FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.bz2
-FAKEROOT_SITE = http://snapshot.debian.org/archive/debian/20141005T221953Z/pool/main/f/fakeroot
+FAKEROOT_VERSION = 1.25.3
+FAKEROOT_SOURCE = fakeroot_$(FAKEROOT_VERSION).orig.tar.gz
+FAKEROOT_SITE = https://snapshot.debian.org/archive/debian/20201008T205817Z/pool/main/f/fakeroot
 
 HOST_FAKEROOT_DEPENDENCIES = host-acl
 # Force capabilities detection off
@@ -15,7 +15,7 @@ HOST_FAKEROOT_DEPENDENCIES = host-acl
 HOST_FAKEROOT_CONF_ENV = \
 	ac_cv_header_sys_capability_h=no \
 	ac_cv_func_capset=no
-# 0003-Select-TCP-when-lack-of-SYSV-IPC.patch touches configure.ac
+# upstream does not ship with configure script anymore
 HOST_FAKEROOT_AUTORECONF = YES
 FAKEROOT_LICENSE = GPL-3.0+
 FAKEROOT_LICENSE_FILES = COPYING
