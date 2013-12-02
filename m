From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Dec 2013 08:45:19 +0100
Subject: [Buildroot] [git commit] eglibc: bump to version 2.18 SVN R23787
Message-ID: <20131202102417.2FE019BE78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=beb225f46f3a194552fb549447c594b5838802f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../2.17-svnr22064/eglibc-0001-ptr_mangle.patch    |   35 --------------------
 package/glibc/glibc.mk                             |    2 +-
 2 files changed, 1 insertions(+), 36 deletions(-)

diff --git a/package/glibc/2.17-svnr22064/eglibc-0001-ptr_mangle.patch b/package/glibc/2.17-svnr22064/eglibc-0001-ptr_mangle.patch
deleted file mode 100644
index c9bf107..0000000
--- a/package/glibc/2.17-svnr22064/eglibc-0001-ptr_mangle.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Fix for CVE-2013-4788 from http://hmarco.org/bugs/CVE-2013-4788.html
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -rupN glibc-2.17/csu/libc-start.c glibc-2.17-mangle-fix/csu/libc-start.c
---- glibc-2.17/libc/csu/libc-start.c	2012-12-25 04:02:13.000000000 +0100
-+++ glibc-2.17-mangle-fix/libc/csu/libc-start.c	2013-07-10 00:13:48.000000000 +0200
-@@ -38,6 +38,12 @@ extern void __pthread_initialize_minimal
-    in thread local area.  */
- uintptr_t __stack_chk_guard attribute_relro;
- # endif
-+
-+# ifndef  THREAD_SET_POINTER_GUARD
-+uintptr_t __pointer_chk_guard_local
-+     attribute_relro attribute_hidden __attribute__ ((nocommon));
-+# endif
-+
- #endif
- 
- #ifdef HAVE_PTR_NTHREADS
-@@ -184,6 +190,14 @@ LIBC_START_MAIN (int (*main) (int, char
- # else
-   __stack_chk_guard = stack_chk_guard;
- # endif
-+    uintptr_t pointer_chk_guard = _dl_setup_pointer_guard (_dl_random,
-+                          stack_chk_guard);
-+# ifdef THREAD_SET_POINTER_GUARD
-+      THREAD_SET_POINTER_GUARD (pointer_chk_guard);
-+# else
-+      __pointer_chk_guard_local = pointer_chk_guard;
-+# endif
-+
- #endif
- 
-   /* Register the destructor of the dynamic linker if there is any.  */
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 2e7fe82..eb29143 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT_EGLIBC),y)
-GLIBC_VERSION = 2.17-svnr22064
+GLIBC_VERSION = 2.18-svnr23787
 GLIBC_SITE = http://downloads.yoctoproject.org/releases/eglibc/
 GLIBC_SOURCE = eglibc-$(GLIBC_VERSION).tar.bz2
 GLIBC_SRC_SUBDIR = libc
