From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2013 14:45:49 +0100
Subject: [Buildroot] [git commit] eglibc: add security patch for
	CVE-2013-4788
Message-ID: <20131128141546.67AD59BE3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=769bb15ea3e1dc8ddba0b030cef1c521ee26dfec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2013-4788
http://hmarco.org/bugs/CVE-2013-4788.html

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../2.17-svnr22064/eglibc-0001-ptr_mangle.patch    |   35 ++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

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
