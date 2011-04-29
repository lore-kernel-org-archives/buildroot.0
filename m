From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 29 Apr 2011 11:15:44 +0200
Subject: [Buildroot] [git commit] uClibc: add linuxthreads/errno fix for
	0.9.31 / 0.9.32-rc3
Message-ID: <20110429093013.2ABE782B3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=06c1d1001e912800cae76b2db0a332da067fdf65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See uclibc #2089 for details.

This is still not included upstream, but lets include it anyway as
several people have been running into the issue.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../uClibc-0.9.31-linuxthreads-errno-fix.patch     |   98 ++++++++++++++++++++
 .../uClibc-0.9.32-rc3-linuxthreads-errno-fix.patch |   70 ++++++++++++++
 2 files changed, 168 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.31-linuxthreads-errno-fix.patch
 create mode 100644 toolchain/uClibc/uClibc-0.9.32-rc3-linuxthreads-errno-fix.patch

diff --git a/toolchain/uClibc/uClibc-0.9.31-linuxthreads-errno-fix.patch b/toolchain/uClibc/uClibc-0.9.31-linuxthreads-errno-fix.patch
new file mode 100644
index 0000000..c49821b
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.31-linuxthreads-errno-fix.patch
@@ -0,0 +1,98 @@
+From af8b2d71ce37b9d4d24ddbc755cdea68de02949a Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Mon, 5 Jul 2010 14:08:17 +0200
+Subject: [PATCH] don't make __errno_location / __h_errno_location hidden
+
+Closes #2089 (https://bugs.busybox.net/show_bug.cgi?id=2089)
+
+__errno_location / __h_errno_location access has to go through the PLT
+like malloc/free, so the linuxthread variants gets used instead when
+compiling with -pthread.
+
+Based on http://github.com/mat-c/uClibc/commit/328d392c54aa5dc2b8e7f398a419087de497de2b
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ include/netdb.h                               |    1 -
+ libc/misc/internals/__errno_location.c        |    3 ---
+ libc/misc/internals/__h_errno_location.c      |    1 -
+ libc/misc/internals/__uClibc_main.c           |    2 --
+ libc/sysdeps/linux/common/bits/errno.h        |    1 -
+ libc/sysdeps/linux/common/bits/uClibc_errno.h |    3 ---
+ 6 files changed, 0 insertions(+), 11 deletions(-)
+
+diff --git a/include/netdb.h b/include/netdb.h
+index 9d3807d..ac411ab 100644
+--- a/include/netdb.h
++++ b/include/netdb.h
+@@ -59,7 +59,6 @@ __BEGIN_DECLS
+ 
+ /* Function to get address of global `h_errno' variable.  */
+ extern int *__h_errno_location (void) __THROW __attribute__ ((__const__));
+-libc_hidden_proto(__h_errno_location)
+ 
+ /* Macros for accessing h_errno from inside libc.  */
+ #ifdef _LIBC
+diff --git a/libc/misc/internals/__errno_location.c b/libc/misc/internals/__errno_location.c
+index 487a9c2..0620860 100644
+--- a/libc/misc/internals/__errno_location.c
++++ b/libc/misc/internals/__errno_location.c
+@@ -11,6 +11,3 @@ int * weak_const_function __errno_location (void)
+ {
+     return &errno;
+ }
+-#ifdef IS_IN_libc /* not really need, only to keep in sync w/ libc_hidden_proto */
+-libc_hidden_weak(__errno_location)
+-#endif
+diff --git a/libc/misc/internals/__h_errno_location.c b/libc/misc/internals/__h_errno_location.c
+index 213d398..235df4e 100644
+--- a/libc/misc/internals/__h_errno_location.c
++++ b/libc/misc/internals/__h_errno_location.c
+@@ -10,4 +10,3 @@ int * weak_const_function __h_errno_location (void)
+ {
+     return &h_errno;
+ }
+-libc_hidden_weak(__h_errno_location)
+diff --git a/libc/misc/internals/__uClibc_main.c b/libc/misc/internals/__uClibc_main.c
+index 6e520fa..f4a9ebb 100644
+--- a/libc/misc/internals/__uClibc_main.c
++++ b/libc/misc/internals/__uClibc_main.c
+@@ -64,9 +64,7 @@ void internal_function _dl_aux_init (ElfW(auxv_t) *av);
+  * Prototypes.
+  */
+ extern int *weak_const_function __errno_location(void);
+-libc_hidden_proto(__errno_location)
+ extern int *weak_const_function __h_errno_location(void);
+-libc_hidden_proto(__h_errno_location)
+ 
+ extern void weak_function _stdio_init(void) attribute_hidden;
+ #ifdef __UCLIBC_HAS_LOCALE__
+diff --git a/libc/sysdeps/linux/common/bits/errno.h b/libc/sysdeps/linux/common/bits/errno.h
+index 0bf6354..de9688a 100644
+--- a/libc/sysdeps/linux/common/bits/errno.h
++++ b/libc/sysdeps/linux/common/bits/errno.h
+@@ -43,7 +43,6 @@
+ # ifndef __ASSEMBLER__
+ /* Function to get address of global `errno' variable.  */
+ extern int *__errno_location (void) __THROW __attribute__ ((__const__));
+-libc_hidden_proto(__errno_location)
+ 
+ #  ifdef __UCLIBC_HAS_THREADS__
+ /* When using threads, errno is a per-thread value.  */
+diff --git a/libc/sysdeps/linux/common/bits/uClibc_errno.h b/libc/sysdeps/linux/common/bits/uClibc_errno.h
+index 9c15618..79eb7e6 100644
+--- a/libc/sysdeps/linux/common/bits/uClibc_errno.h
++++ b/libc/sysdeps/linux/common/bits/uClibc_errno.h
+@@ -33,9 +33,6 @@ extern int *__errno_location (void) __THROW __attribute__ ((__const__))
+ ;
+ # if defined __UCLIBC_HAS_THREADS__
+ #  include <tls.h>
+-#  if defined USE___THREAD && USE___THREAD
+-libc_hidden_proto(__errno_location)
+-#  endif
+ # endif
+ 
+ #endif /* !__ASSEMBLER__ */
+-- 
+1.7.1
+
diff --git a/toolchain/uClibc/uClibc-0.9.32-rc3-linuxthreads-errno-fix.patch b/toolchain/uClibc/uClibc-0.9.32-rc3-linuxthreads-errno-fix.patch
new file mode 100644
index 0000000..7335173
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.32-rc3-linuxthreads-errno-fix.patch
@@ -0,0 +1,70 @@
+From af8b2d71ce37b9d4d24ddbc755cdea68de02949a Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Mon, 5 Jul 2010 14:08:17 +0200
+Subject: [PATCH] don't make __errno_location / __h_errno_location hidden
+
+Closes #2089 (https://bugs.busybox.net/show_bug.cgi?id=2089)
+
+__errno_location / __h_errno_location access has to go through the PLT
+like malloc/free, so the linuxthread variants gets used instead when
+compiling with -pthread.
+
+Based on http://github.com/mat-c/uClibc/commit/328d392c54aa5dc2b8e7f398a419087de497de2b
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ include/netdb.h                               |    1 -
+ libc/misc/internals/__errno_location.c        |    3 ---
+ libc/misc/internals/__h_errno_location.c      |    1 -
+ libc/sysdeps/linux/common/bits/errno.h        |    1 -
+ 6 files changed, 0 insertions(+), 11 deletions(-)
+
+diff --git a/include/netdb.h b/include/netdb.h
+index 9d3807d..ac411ab 100644
+--- a/include/netdb.h
++++ b/include/netdb.h
+@@ -59,7 +59,6 @@ __BEGIN_DECLS
+ 
+ /* Function to get address of global `h_errno' variable.  */
+ extern int *__h_errno_location (void) __THROW __attribute__ ((__const__));
+-libc_hidden_proto(__h_errno_location)
+ 
+ /* Macros for accessing h_errno from inside libc.  */
+ #ifdef _LIBC
+diff --git a/libc/misc/internals/__errno_location.c b/libc/misc/internals/__errno_location.c
+index 487a9c2..0620860 100644
+--- a/libc/misc/internals/__errno_location.c
++++ b/libc/misc/internals/__errno_location.c
+@@ -15,6 +15,3 @@ int * weak_const_function __errno_location (void)
+ {
+     return &errno;
+ }
+-#ifdef IS_IN_libc /* not really need, only to keep in sync w/ libc_hidden_proto */
+-libc_hidden_weak(__errno_location)
+-#endif
+diff --git a/libc/misc/internals/__h_errno_location.c b/libc/misc/internals/__h_errno_location.c
+index 213d398..235df4e 100644
+--- a/libc/misc/internals/__h_errno_location.c
++++ b/libc/misc/internals/__h_errno_location.c
+@@ -10,4 +10,3 @@ int * weak_const_function __h_errno_location (void)
+ {
+     return &h_errno;
+ }
+-libc_hidden_weak(__h_errno_location)
+diff --git a/libc/misc/internals/__uClibc_main.c b/libc/misc/internals/__uClibc_main.c
+index 6e520fa..f4a9ebb 100644
+--- a/libc/sysdeps/linux/common/bits/errno.h
++++ b/libc/sysdeps/linux/common/bits/errno.h
+@@ -43,7 +43,6 @@
+ # ifndef __ASSEMBLER__
+ /* Function to get address of global `errno' variable.  */
+ extern int *__errno_location (void) __THROW __attribute__ ((__const__));
+-libc_hidden_proto(__errno_location)
+ 
+ #  ifdef __UCLIBC_HAS_THREADS__
+ /* When using threads, errno is a per-thread value.  */
+diff --git a/libc/sysdeps/linux/common/bits/uClibc_errno.h b/libc/sysdeps/linux/common/bits/uClibc_errno.h
+index 9c15618..79eb7e6 100644
+-- 
+1.7.1
+
-- 
1.7.3.4
