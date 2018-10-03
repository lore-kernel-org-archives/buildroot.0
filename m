From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Oct 2018 19:54:09 +0200
Subject: [Buildroot] [PATCH 1/1] libbsd: remove usage of __register_atfork
Message-ID: <20181003175409.26025-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following error is raised by minizip:

[100%] Linking C executable minizip
/home/peko/autobuild/instance-0/output/host/m68k-buildroot-uclinux-uclibc/sysroot/usr/lib/libbsd.a(arc4random.o): In function `_rs_init.part.1':
arc4random.c:(.text+0xaa): undefined reference to `__register_atfork'
collect2: error: ld returned 1 exit status

As specified in openssl/Config.in, uClibc on noMMU doesn't provide
__register_atfork() so, as suggested by Arnout during review of minizip
patch (https://patchwork.ozlabs.org/patch/978000), remove usage of this
function from libbsd to always use pthread_atfork

Fixes:
 - http://autobuild.buildroot.org/results/df2dcbdceaa01a2ae37bf09140e4dbef0a5b9489

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...02-Remove-usage-of-__register_atfork.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/libbsd/0002-Remove-usage-of-__register_atfork.patch

diff --git a/package/libbsd/0002-Remove-usage-of-__register_atfork.patch b/package/libbsd/0002-Remove-usage-of-__register_atfork.patch
new file mode 100644
index 0000000000..366594bbe8
--- /dev/null
+++ b/package/libbsd/0002-Remove-usage-of-__register_atfork.patch
@@ -0,0 +1,39 @@
+From 1220b3b758030f1717558980d60ade9a33628383 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 3 Oct 2018 19:14:34 +0200
+Subject: [PATCH] Remove usage of __register_atfork
+
+Calling an internal function of glibc is never a good idea.
+This is especially true for __register_atfork which is not defined on
+uClibc with noMMU.
+So remove call to __register_atfork and so always use pthread_atfork
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/libbsd/libbsd/merge_requests/2]
+---
+ src/arc4random_linux.h | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/src/arc4random_linux.h b/src/arc4random_linux.h
+index 7a2ca1e..7287b07 100644
+--- a/src/arc4random_linux.h
++++ b/src/arc4random_linux.h
+@@ -31,14 +31,7 @@
+ static pthread_mutex_t arc4random_mtx = PTHREAD_MUTEX_INITIALIZER;
+ #define _ARC4_LOCK()   pthread_mutex_lock(&arc4random_mtx)
+ #define _ARC4_UNLOCK() pthread_mutex_unlock(&arc4random_mtx)
+-
+-#ifdef __GLIBC__
+-extern void *__dso_handle;
+-extern int __register_atfork(void (*)(void), void(*)(void), void (*)(void), void *);
+-#define _ARC4_ATFORK(f) __register_atfork(NULL, NULL, (f), __dso_handle)
+-#else
+ #define _ARC4_ATFORK(f) pthread_atfork(NULL, NULL, (f))
+-#endif
+ 
+ static inline void
+ _getentropy_fail(void)
+-- 
+2.17.1
+
-- 
2.17.1
