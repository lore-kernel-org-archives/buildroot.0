From: Chris Zankel <chris@zankel.net>
Date: Fri, 09 Nov 2012 16:20:27 -0800
Subject: [Buildroot] [PATCH] uclibc-snapshot: remove obsolete patch and fix
	config
Message-ID: <509d9dcd.c78f440a.3fc1.018d@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uClibc has added a new configuration item (LDSO_SAFE_RUNPATH),
so add it to the uClibc-snapshot.config with the default value 'y'.
The linuxthreads-errno-fix.patch doesn't apply cleanly anymore, and
a similar patch for the 0.9.32.1 version wasn't carried over
to 0.9.32.2, so should be save to remove it also for 'snapshot'.

Signed-off-by: Chris Zankel <chris@zankel.net>

diff --git a/toolchain/uClibc/uClibc-snapshot.config b/toolchain/uClibc/uClibc-snapshot.config
index eb39df6..01fa998 100644
--- a/toolchain/uClibc/uClibc-snapshot.config
+++ b/toolchain/uClibc/uClibc-snapshot.config
@@ -83,6 +83,7 @@ HAVE_DOT_CONFIG=y
 DOPIC=y
 # ARCH_HAS_NO_SHARED is not set
 # ARCH_HAS_NO_LDSO is not set
+LDSO_SAFE_RUNPATH=y
 HAVE_SHARED=y
 # FORCE_SHAREABLE_TEXT_SEGMENTS is not set
 LDSO_LDD_SUPPORT=y
diff --git a/toolchain/uClibc/uClibc.snapshot.linuxthreads-errno-fix.patch b/toolchain/uClibc/uClibc.snapshot.linuxthreads-errno-fix.patch
deleted file mode 100644
index c4d0d00..0000000
--- a/toolchain/uClibc/uClibc.snapshot.linuxthreads-errno-fix.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From af8b2d71ce37b9d4d24ddbc755cdea68de02949a Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Mon, 5 Jul 2010 14:08:17 +0200
-Subject: [PATCH] don't make __errno_location / __h_errno_location hidden
-
-Closes #2089 (https://bugs.busybox.net/show_bug.cgi?id=2089)
-
-__errno_location / __h_errno_location access has to go through the PLT
-like malloc/free, so the linuxthread variants gets used instead when
-compiling with -pthread.
-
-Based on http://github.com/mat-c/uClibc/commit/328d392c54aa5dc2b8e7f398a419087de497de2b
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- include/netdb.h                               |    1 -
- libc/misc/internals/__errno_location.c        |    3 ---
- libc/misc/internals/__h_errno_location.c      |    1 -
- libc/sysdeps/linux/common/bits/errno.h        |    1 -
- 6 files changed, 0 insertions(+), 11 deletions(-)
-
-diff --git a/include/netdb.h b/include/netdb.h
-index 9d3807d..ac411ab 100644
---- a/include/netdb.h
-+++ b/include/netdb.h
-@@ -59,7 +59,6 @@ __BEGIN_DECLS
- 
- /* Function to get address of global `h_errno' variable.  */
- extern int *__h_errno_location (void) __THROW __attribute__ ((__const__));
--libc_hidden_proto(__h_errno_location)
- 
- /* Macros for accessing h_errno from inside libc.  */
- #ifdef _LIBC
-diff --git a/libc/misc/internals/__errno_location.c b/libc/misc/internals/__errno_location.c
-index 487a9c2..0620860 100644
---- a/libc/misc/internals/__errno_location.c
-+++ b/libc/misc/internals/__errno_location.c
-@@ -15,6 +15,3 @@ int * weak_const_function __errno_location (void)
- {
-     return &errno;
- }
--#ifdef IS_IN_libc /* not really need, only to keep in sync w/ libc_hidden_proto */
--libc_hidden_weak(__errno_location)
--#endif
-diff --git a/libc/misc/internals/__h_errno_location.c b/libc/misc/internals/__h_errno_location.c
-index 213d398..235df4e 100644
---- a/libc/misc/internals/__h_errno_location.c
-+++ b/libc/misc/internals/__h_errno_location.c
-@@ -10,4 +10,3 @@ int * weak_const_function __h_errno_location (void)
- {
-     return &h_errno;
- }
--libc_hidden_weak(__h_errno_location)
-diff --git a/libc/misc/internals/__uClibc_main.c b/libc/misc/internals/__uClibc_main.c
-index 6e520fa..f4a9ebb 100644
---- a/libc/sysdeps/linux/common/bits/errno.h
-+++ b/libc/sysdeps/linux/common/bits/errno.h
-@@ -43,7 +43,6 @@
- # ifndef __ASSEMBLER__
- /* Function to get address of global `errno' variable.  */
- extern int *__errno_location (void) __THROW __attribute__ ((__const__));
--libc_hidden_proto(__errno_location)
- 
- #  ifdef __UCLIBC_HAS_THREADS__
- /* When using threads, errno is a per-thread value.  */
--- 
-1.7.1
-
