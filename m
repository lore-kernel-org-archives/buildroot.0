From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 10 Dec 2017 19:16:06 +0100
Subject: [Buildroot] [PATCH] libressl: enable for noMMU
Message-ID: <20171210181606.GA27756@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need to use pthread_atfork for Linuxthreads.
Add a check if fork() is available, otherwise use vfork().

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/libressl/0003-uclibc-linuxthreads.patch | 12 ++++++
 package/libressl/0004-uclibc-fork.patch         | 52 +++++++++++++++++++++++++
 package/openssl/Config.in                       |  2 -
 3 files changed, 64 insertions(+), 2 deletions(-)
 create mode 100644 package/libressl/0003-uclibc-linuxthreads.patch
 create mode 100644 package/libressl/0004-uclibc-fork.patch

diff --git a/package/libressl/0003-uclibc-linuxthreads.patch b/package/libressl/0003-uclibc-linuxthreads.patch
new file mode 100644
index 0000000000..4ea702e5fa
--- /dev/null
+++ b/package/libressl/0003-uclibc-linuxthreads.patch
@@ -0,0 +1,12 @@
+diff -Nur libressl-2.6.3.orig/crypto/compat/arc4random_linux.h libressl-2.6.3/crypto/compat/arc4random_linux.h
+--- libressl-2.6.3.orig/crypto/compat/arc4random_linux.h	2017-11-06 00:15:17.000000000 +0100
++++ libressl-2.6.3/crypto/compat/arc4random_linux.h	2017-12-02 02:12:55.407388811 +0100
+@@ -32,7 +32,7 @@
+ #define _ARC4_LOCK()   pthread_mutex_lock(&arc4random_mtx)
+ #define _ARC4_UNLOCK() pthread_mutex_unlock(&arc4random_mtx)
+ 
+-#ifdef __GLIBC__
++#if defined __GLIBC__ && !defined __UCLIBC_HAS_LINUXTHREADS__
+ extern void *__dso_handle;
+ extern int __register_atfork(void (*)(void), void(*)(void), void (*)(void), void *);
+ #define _ARC4_ATFORK(f) __register_atfork(NULL, NULL, (f), __dso_handle)
diff --git a/package/libressl/0004-uclibc-fork.patch b/package/libressl/0004-uclibc-fork.patch
new file mode 100644
index 0000000000..ef654b29db
--- /dev/null
+++ b/package/libressl/0004-uclibc-fork.patch
@@ -0,0 +1,52 @@
+diff -Nur libressl-2.6.3.orig/apps/openssl/speed.c libressl-2.6.3/apps/openssl/speed.c
+--- libressl-2.6.3.orig/apps/openssl/speed.c	2017-03-07 06:43:54.000000000 +0100
++++ libressl-2.6.3/apps/openssl/speed.c	2017-12-06 19:39:39.284165670 +0100
+@@ -144,6 +144,12 @@
+ #include <openssl/whrlpool.h>
+ #endif
+ 
++#if WANT_FORK
++#define v_or_fork() fork()
++#else
++#define v_or_fork() vfork()
++#endif
++
+ #include "./testdsa.h"
+ #include "./testrsa.h"
+ 
+@@ -1995,7 +2001,7 @@
+ 		}
+ 		fflush(stdout);
+ 		fflush(stderr);
+-		if (fork()) {
++		if (v_or_fork()) {
+ 			close(fd[1]);
+ 			fds[n] = fd[0];
+ 		} else {
+diff -Nur libressl-2.6.3.orig/configure.ac libressl-2.6.3/configure.ac
+--- libressl-2.6.3.orig/configure.ac	2017-11-04 21:04:56.000000000 +0100
++++ libressl-2.6.3/configure.ac	2017-12-06 19:38:06.416277421 +0100
+@@ -48,6 +48,23 @@
+ # Check if funopen exists
+ AC_CHECK_FUNC([funopen])
+ 
++AC_ARG_ENABLE([fork],
++[  --disable-fork          disable use of fork],
++        use_fork=$enableval, use_fork=yes)
++test x"$use_fork" = x"no" && ac_cv_func_fork=no
++AC_CHECK_FUNCS([fork unsetenv])
++case $use_fork:$ac_cv_func_fork in
++no:*) use_fork=0 ;;
++*:yes) use_fork=1 ;;
++*) use_fork=0 ;;
++esac
++AC_DEFINE_UNQUOTED([WANT_FORK], [$use_fork], [We have fork(2) and want to use it])
++if test $use_fork = 1; then
++        echo "Enabling use of fork()"
++else
++        echo "Disabling use of fork() (NOMMU)!"
++fi
++
+ CHECK_LIBC_COMPAT
+ CHECK_SYSCALL_COMPAT
+ CHECK_CRYPTO_COMPAT
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index d84033141f..e33320afc5 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -48,8 +48,6 @@ endif
 config BR2_PACKAGE_LIBRESSL
 	bool "libressl"
 	depends on !BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
-	# uClibc on noMMU doesn't provide __register_atfork()
-	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
 	help
 	  LibreSSL is a version of the TLS/crypto stack forked from
 	  OpenSSL in 2014, with goals of modernizing the codebase,
-- 
2.11.0
