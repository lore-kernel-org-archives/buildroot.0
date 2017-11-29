From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 21:37:08 +0100
Subject: [Buildroot] [git commit] uclibc: update to 1.0.27
Message-ID: <20171201205340.199DD80AC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c26b1bf1a4a055006110b9f38f9082c01c0db1ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All patches are upstream.
C-sky support added. Lot of or1k NPTL bugfixes.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/0001-fix-issues-with-gdb-8.0.patch  |  72 ---------------
 ...handle-R_MICROBLAZE_NONE-for-ld.so-bootst.patch |  42 ---------
 ...03-convert-accept4-to-use-cancel.h-macros.patch | 102 ---------------------
 package/uclibc/uclibc.hash                         |   2 +-
 package/uclibc/uclibc.mk                           |   2 +-
 5 files changed, 2 insertions(+), 218 deletions(-)

diff --git a/package/uclibc/0001-fix-issues-with-gdb-8.0.patch b/package/uclibc/0001-fix-issues-with-gdb-8.0.patch
deleted file mode 100644
index 20567e6..0000000
--- a/package/uclibc/0001-fix-issues-with-gdb-8.0.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 111f01d432d542a153c1cad83def3a6ab57df7af Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@uclibc-ng.org>
-Date: Sat, 5 Aug 2017 11:28:07 +0200
-Subject: [PATCH] fix issues with gdb 8.0
-
-GDB 8.0 is compiled and linked with g++, but the
-linking of static targets (f.e. coldfire) fails,
-without declaring the functions in thread_db.h
-extern C.
-
-The compilation of gdb errors out with:
-thread-db.o: In function `thread_db_init()':
-thread-db.c:(.text+0x5b6): undefined reference to `td_ta_new(ps_prochandle*, td_thragent**)'
-thread-db.c:(.text+0x61e): undefined reference to `td_thr_get_info(td_thrhandle const*, td_thrinfo*)'
-thread-db.c:(.text+0x632): undefined reference to `td_symbol_list()'
-..
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
----
- libpthread/linuxthreads_db/thread_db.h | 7 +++++++
- libpthread/nptl_db/thread_db.h         | 7 +++++++
- 2 files changed, 14 insertions(+)
-
-diff --git a/libpthread/linuxthreads_db/thread_db.h b/libpthread/linuxthreads_db/thread_db.h
-index 13c30af..ec79f60 100644
---- a/libpthread/linuxthreads_db/thread_db.h
-+++ b/libpthread/linuxthreads_db/thread_db.h
-@@ -27,6 +27,9 @@
- #include <sys/types.h>
- #include <sys/procfs.h>
- 
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- 
- /* Error codes of the library.  */
- typedef enum
-@@ -455,4 +458,8 @@ extern td_err_e td_thr_dbsuspend (const td_thrhandle_t *__th);
- /* Resume execution of thread TH.  */
- extern td_err_e td_thr_dbresume (const td_thrhandle_t *__th);
- 
-+#ifdef __cplusplus
-+}
-+#endif
-+
- #endif	/* thread_db.h */
-diff --git a/libpthread/nptl_db/thread_db.h b/libpthread/nptl_db/thread_db.h
-index 27ea69a..993842f 100644
---- a/libpthread/nptl_db/thread_db.h
-+++ b/libpthread/nptl_db/thread_db.h
-@@ -27,6 +27,9 @@
- #include <sys/types.h>
- #include <sys/procfs.h>
- 
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
- 
- /* Error codes of the library.  */
- typedef enum
-@@ -455,4 +458,8 @@ extern td_err_e td_thr_dbsuspend (const td_thrhandle_t *__th);
- /* Resume execution of thread TH.  */
- extern td_err_e td_thr_dbresume (const td_thrhandle_t *__th);
- 
-+#ifdef __cplusplus
-+}
-+#endif
-+
- #endif	/* thread_db.h */
--- 
-2.1.4
-
diff --git a/package/uclibc/0002-microblaze-handle-R_MICROBLAZE_NONE-for-ld.so-bootst.patch b/package/uclibc/0002-microblaze-handle-R_MICROBLAZE_NONE-for-ld.so-bootst.patch
deleted file mode 100644
index 9886efd..0000000
--- a/package/uclibc/0002-microblaze-handle-R_MICROBLAZE_NONE-for-ld.so-bootst.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 9db18d93811153fc9a70c9844fadc6fdf7cbbb64 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@uclibc-ng.org>
-Date: Sun, 6 Aug 2017 21:15:50 +0200
-Subject: [PATCH] microblaze: handle R_MICROBLAZE_NONE for ld.so bootstrap
-
-Latest binutils 2.29 release emits a R_MICROBLAZE_NONE
-relocation, which breaks shared library loader bootstrap
-relocation.
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
----
- ldso/ldso/microblaze/dl-startup.h | 7 ++-----
- 1 file changed, 2 insertions(+), 5 deletions(-)
-
-diff --git a/ldso/ldso/microblaze/dl-startup.h b/ldso/ldso/microblaze/dl-startup.h
-index 720c53a..16d5762 100644
---- a/ldso/ldso/microblaze/dl-startup.h
-+++ b/ldso/ldso/microblaze/dl-startup.h
-@@ -82,18 +82,15 @@ static __always_inline
- void PERFORM_BOOTSTRAP_RELOC(ELF_RELOC *rpnt, unsigned long *reloc_addr,
- 	unsigned long symbol_addr, unsigned long load_addr, attribute_unused Elf32_Sym *symtab)
- {
--
- 	switch (ELF_R_TYPE(rpnt->r_info))
- 	{
- 		case R_MICROBLAZE_REL:
--
- 			*reloc_addr = load_addr + rpnt->r_addend;
- 			break;
--
-+		case R_MICROBLAZE_NONE:
-+			break;
- 		default:
- 			_dl_exit(1);
- 			break;
--
- 	}
--
- }
--- 
-2.1.4
-
diff --git a/package/uclibc/0003-convert-accept4-to-use-cancel.h-macros.patch b/package/uclibc/0003-convert-accept4-to-use-cancel.h-macros.patch
deleted file mode 100644
index 178dcde..0000000
--- a/package/uclibc/0003-convert-accept4-to-use-cancel.h-macros.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From c7e82668bd23fbdd02ebe1e83ff2bb6877812423 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@uclibc-ng.org>
-Date: Thu, 2 Nov 2017 02:40:43 +0100
-Subject: [PATCH] convert accept4() to use cancel.h macros
-
-Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
----
- include/sys/socket.h                  |  1 +
- libc/inet/socketcalls.c               | 37 +++++++++--------------------------
- libpthread/linuxthreads/wrapsyscall.c |  7 +++++++
- 3 files changed, 17 insertions(+), 28 deletions(-)
-
-diff --git a/include/sys/socket.h b/include/sys/socket.h
-index 63dc4b953..83e1fcaa2 100644
---- a/include/sys/socket.h
-+++ b/include/sys/socket.h
-@@ -269,6 +269,7 @@ libc_hidden_proto(accept)
-    __THROW.  */
- extern int accept4 (int __fd, __SOCKADDR_ARG __addr,
- 		    socklen_t *__restrict __addr_len, int __flags);
-+libc_hidden_proto(accept4)
- #endif
- 
- /* Shut down all or part of the connection open on socket FD.
-diff --git a/libc/inet/socketcalls.c b/libc/inet/socketcalls.c
-index e33d69344..1b92609d0 100644
---- a/libc/inet/socketcalls.c
-+++ b/libc/inet/socketcalls.c
-@@ -76,43 +76,24 @@ lt_libc_hidden(accept)
- #endif
- 
- #ifdef L_accept4
--#ifdef __NR_accept4
--# define __NR___sys_accept4  __NR_accept4
--static _syscall4(int, __sys_accept4, int, fd, struct sockaddr *, addr, socklen_t *, addrlen, int, flags)
--int accept4(int fd, struct sockaddr *addr, socklen_t * addrlen, int flags)
--{
--	if (SINGLE_THREAD_P)
--		return __sys_accept4(fd, addr, addrlen, flags);
--#ifdef __UCLIBC_HAS_THREADS_NATIVE__
--	else {
--		int oldtype = LIBC_CANCEL_ASYNC ();
--		int result = __sys_accept4(fd, addr, addrlen, flags);
--		LIBC_CANCEL_RESET (oldtype);
--		return result;
--	}
--#endif
--}
--#elif defined(__NR_socketcall)
--int accept4(int fd, struct sockaddr *addr, socklen_t *addrlen, int flags)
-+static int __NC(accept4)(int fd, struct sockaddr *addr, socklen_t *addrlen, int flags)
- {
-+# ifdef __NR_accept4
-+	return INLINE_SYSCALL(accept4, 4, fd, addr, addrlen, flags);
-+# elif defined(__NR_socketcall)
- 	unsigned long args[4];
- 
- 	args[0] = fd;
- 	args[1] = (unsigned long) addr;
- 	args[2] = (unsigned long) addrlen;
- 	args[3] = flags;
--	if (SINGLE_THREAD_P)
--		return __socketcall(SYS_ACCEPT4, args);
--#ifdef __UCLIBC_HAS_THREADS_NATIVE__
--	else {
--		int oldtype = LIBC_CANCEL_ASYNC ();
--		int result = __socketcall(SYS_ACCEPT4, args);
--		LIBC_CANCEL_RESET (oldtype);
--		return result;
--	}
-+
-+	return __socketcall(SYS_ACCEPT4, args);
- #endif
- }
--#endif
-+CANCELLABLE_SYSCALL(int, accept4, (int fd, struct sockaddr *addr, socklen_t *addrlen, int flags),
-+		    (fd, addr, addrlen, flags))
-+lt_libc_hidden(accept4)
- #endif
- 
- #ifdef L_bind
-diff --git a/libpthread/linuxthreads/wrapsyscall.c b/libpthread/linuxthreads/wrapsyscall.c
-index ca046a442..2386bfdef 100644
---- a/libpthread/linuxthreads/wrapsyscall.c
-+++ b/libpthread/linuxthreads/wrapsyscall.c
-@@ -192,6 +192,13 @@ CANCELABLE_SYSCALL (int, accept, (int fd, __SOCKADDR_ARG addr,
- 				  socklen_t *addr_len),
- 		    (fd, addr, addr_len))
- 
-+#if defined __UCLIBC_LINUX_SPECIFIC__
-+/* accept4(2).  */
-+CANCELABLE_SYSCALL (int, accept4, (int fd, __SOCKADDR_ARG addr,
-+				  socklen_t *addr_len, int flags),
-+		    (fd, addr, addr_len, flags))
-+#endif
-+
- /* connect(2).  */
- CANCELABLE_SYSCALL (int, connect, (int fd, __CONST_SOCKADDR_ARG addr,
- 				     socklen_t len),
--- 
-2.11.0
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index fcba474..df25a7e 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,2 +1,2 @@
 # From https://uclibc-ng.org/
-sha256  d88470775192b01d278633953ccc9fecacd090e52f401d506a71add3e47d4694        uClibc-ng-1.0.26.tar.xz
+sha256  9452b0e92f76db19d8ff30b2d6d10a80e1ed01e4c504a36fef34cfc9de490b24        uClibc-ng-1.0.27.tar.xz
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index f235070..1741421 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.26
+UCLIBC_VERSION = 1.0.27
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
