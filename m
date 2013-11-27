From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Nov 2013 21:51:40 -0300
Subject: [Buildroot] [PATCH 1/2] eglibc: add security patch for CVE-2013-4788
Message-ID: <1385513501-23157-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2013-4788
http://hmarco.org/bugs/CVE-2013-4788.html

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../2.17-svnr22064/eglibc-0001-ptr_mangle.patch    | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/glibc/2.17-svnr22064/eglibc-0001-ptr_mangle.patch

diff --git a/package/glibc/2.17-svnr22064/eglibc-0001-ptr_mangle.patch b/package/glibc/2.17-svnr22064/eglibc-0001-ptr_mangle.patch
new file mode 100644
index 0000000..c9bf107
--- /dev/null
+++ b/package/glibc/2.17-svnr22064/eglibc-0001-ptr_mangle.patch
@@ -0,0 +1,35 @@
+Fix for CVE-2013-4788 from http://hmarco.org/bugs/CVE-2013-4788.html
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -rupN glibc-2.17/csu/libc-start.c glibc-2.17-mangle-fix/csu/libc-start.c
+--- glibc-2.17/libc/csu/libc-start.c	2012-12-25 04:02:13.000000000 +0100
++++ glibc-2.17-mangle-fix/libc/csu/libc-start.c	2013-07-10 00:13:48.000000000 +0200
+@@ -38,6 +38,12 @@ extern void __pthread_initialize_minimal
+    in thread local area.  */
+ uintptr_t __stack_chk_guard attribute_relro;
+ # endif
++
++# ifndef  THREAD_SET_POINTER_GUARD
++uintptr_t __pointer_chk_guard_local
++     attribute_relro attribute_hidden __attribute__ ((nocommon));
++# endif
++
+ #endif
+ 
+ #ifdef HAVE_PTR_NTHREADS
+@@ -184,6 +190,14 @@ LIBC_START_MAIN (int (*main) (int, char
+ # else
+   __stack_chk_guard = stack_chk_guard;
+ # endif
++    uintptr_t pointer_chk_guard = _dl_setup_pointer_guard (_dl_random,
++                          stack_chk_guard);
++# ifdef THREAD_SET_POINTER_GUARD
++      THREAD_SET_POINTER_GUARD (pointer_chk_guard);
++# else
++      __pointer_chk_guard_local = pointer_chk_guard;
++# endif
++
+ #endif
+ 
+   /* Register the destructor of the dynamic linker if there is any.  */
-- 
1.8.3.2
