From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 21 Feb 2013 15:18:02 +0100
Subject: [Buildroot] [git commit] Revert "uClibc: port linuxthreads errno
	patch to 0.9.33.2"
Message-ID: <20130221141807.8B4319AC15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f786dcf7a8bda85b0095d76477c863338896656
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 1d8c3e6caf6be14644ef8ef5ae2704105322442b

The forward port breaks compilation at least for SPARC NPTL toolchains:

LD libuClibc-0.9.33.2.so
libc/libc_so.a(pipe.os): In function `__GI_pipe':
(.text+0x38): undefined reference to `__GI___errno_location'
collect2: ld returned 1 exit status

Easily triggered by a "make qemu_sparc_ss10_defconfig && make".

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../uClibc-0.9.33.2-linuxthreads-errno-fix.patch   |   68 --------------------
 1 files changed, 0 insertions(+), 68 deletions(-)

diff --git a/toolchain/uClibc/uClibc-0.9.33.2-linuxthreads-errno-fix.patch b/toolchain/uClibc/uClibc-0.9.33.2-linuxthreads-errno-fix.patch
deleted file mode 100644
index c4d0d00..0000000
--- a/toolchain/uClibc/uClibc-0.9.33.2-linuxthreads-errno-fix.patch
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
