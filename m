From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 9 Aug 2017 23:07:41 +0200
Subject: [Buildroot] [git commit] uclibc: allow thread_db to be built with
	C++
Message-ID: <20170809210705.965A67FBEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c21fca53db7885ba05c6aca73350477ff15dcfd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gdb 7.12+ is compiled and linked with C++, therefore the thread_db
headers need to use extern "C", to be usable for C++ code.

Fixes:
 Issue when building gdbserver for m68k-coldfire:

thread-db.o: In function `thread_db_init()':
thread-db.c:(.text+0x5b6): undefined reference to `td_ta_new(ps_prochandle*, td_thragent**)'
thread-db.c:(.text+0x61e): undefined reference to `td_thr_get_info(td_thrhandle const*, td_thrinfo*)'
thread-db.c:(.text+0x632): undefined reference to `td_symbol_list()'
...

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/uclibc/0001-fix-issues-with-gdb-8.0.patch | 72 +++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/package/uclibc/0001-fix-issues-with-gdb-8.0.patch b/package/uclibc/0001-fix-issues-with-gdb-8.0.patch
new file mode 100644
index 0000000..20567e6
--- /dev/null
+++ b/package/uclibc/0001-fix-issues-with-gdb-8.0.patch
@@ -0,0 +1,72 @@
+From 111f01d432d542a153c1cad83def3a6ab57df7af Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@uclibc-ng.org>
+Date: Sat, 5 Aug 2017 11:28:07 +0200
+Subject: [PATCH] fix issues with gdb 8.0
+
+GDB 8.0 is compiled and linked with g++, but the
+linking of static targets (f.e. coldfire) fails,
+without declaring the functions in thread_db.h
+extern C.
+
+The compilation of gdb errors out with:
+thread-db.o: In function `thread_db_init()':
+thread-db.c:(.text+0x5b6): undefined reference to `td_ta_new(ps_prochandle*, td_thragent**)'
+thread-db.c:(.text+0x61e): undefined reference to `td_thr_get_info(td_thrhandle const*, td_thrinfo*)'
+thread-db.c:(.text+0x632): undefined reference to `td_symbol_list()'
+..
+
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+---
+ libpthread/linuxthreads_db/thread_db.h | 7 +++++++
+ libpthread/nptl_db/thread_db.h         | 7 +++++++
+ 2 files changed, 14 insertions(+)
+
+diff --git a/libpthread/linuxthreads_db/thread_db.h b/libpthread/linuxthreads_db/thread_db.h
+index 13c30af..ec79f60 100644
+--- a/libpthread/linuxthreads_db/thread_db.h
++++ b/libpthread/linuxthreads_db/thread_db.h
+@@ -27,6 +27,9 @@
+ #include <sys/types.h>
+ #include <sys/procfs.h>
+ 
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ /* Error codes of the library.  */
+ typedef enum
+@@ -455,4 +458,8 @@ extern td_err_e td_thr_dbsuspend (const td_thrhandle_t *__th);
+ /* Resume execution of thread TH.  */
+ extern td_err_e td_thr_dbresume (const td_thrhandle_t *__th);
+ 
++#ifdef __cplusplus
++}
++#endif
++
+ #endif	/* thread_db.h */
+diff --git a/libpthread/nptl_db/thread_db.h b/libpthread/nptl_db/thread_db.h
+index 27ea69a..993842f 100644
+--- a/libpthread/nptl_db/thread_db.h
++++ b/libpthread/nptl_db/thread_db.h
+@@ -27,6 +27,9 @@
+ #include <sys/types.h>
+ #include <sys/procfs.h>
+ 
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ /* Error codes of the library.  */
+ typedef enum
+@@ -455,4 +458,8 @@ extern td_err_e td_thr_dbsuspend (const td_thrhandle_t *__th);
+ /* Resume execution of thread TH.  */
+ extern td_err_e td_thr_dbresume (const td_thrhandle_t *__th);
+ 
++#ifdef __cplusplus
++}
++#endif
++
+ #endif	/* thread_db.h */
+-- 
+2.1.4
+
