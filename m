From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Mon, 15 Sep 2014 14:26:41 +0200
Subject: [Buildroot] [PATCH v2 1/2] libffi: make thread support optional
Message-ID: <1410784002-8659-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Fixes:

  http://autobuild.buildroot.org/results/7ee57d01917ea72d1811469e482513dda2ceb1ea/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
v2:
   - Fix boolean expression in patch
   - Renumber patch
   - Add my Signed-off

 ...bffi-006-Make-thread-support-conditionnal.patch | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 package/libffi/libffi-006-Make-thread-support-conditionnal.patch

diff --git a/package/libffi/libffi-006-Make-thread-support-conditionnal.patch b/package/libffi/libffi-006-Make-thread-support-conditionnal.patch
new file mode 100644
index 0000000..72e7e5d
--- /dev/null
+++ b/package/libffi/libffi-006-Make-thread-support-conditionnal.patch
@@ -0,0 +1,74 @@
+From a7f6342120060564a829704cceb843e53e0b34a9 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 17 Nov 2012 18:44:16 +0100
+Subject: [PATCH 3/3] Make thread support conditionnal
+
+When libffi is linked against a C library that does not have thread
+support, it is not necessary to use a mutex to protect global
+variables, since the application calling libffi cannot be
+multi-threaded.
+
+Therefore, make the libffi thread support conditionnal: when we're
+building against uClibc with no thread support, don't use the
+pthread_mutex.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
+---
+ src/closures.c |   12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/closures.c b/src/closures.c
+index 1b37827..3d151f6 100644
+--- a/src/closures.c
++++ b/src/closures.c
+@@ -70,7 +70,10 @@
+ 
+ # elif FFI_MMAP_EXEC_WRIT /* !FFI_EXEC_TRAMPOLINE_TABLE */
+ 
++#if !defined(__UCLIBC__) || !defined(__HAS_NO_THREADS__)
+ #define USE_LOCKS 1
++#endif
++
+ #define USE_DL_PREFIX 1
+ #ifdef __GNUC__
+ #ifndef USE_BUILTIN_FFS
+@@ -116,7 +119,10 @@
+ #include <mntent.h>
+ #endif /* HAVE_MNTENT */
+ #include <sys/param.h>
++
++#if !defined(__UCLIBC__) || !defined(__HAS_NO_THREADS__)
+ #include <pthread.h>
++#endif
+ 
+ /* We don't want sys/mman.h to be included after we redefine mmap and
+    dlmunmap.  */
+@@ -214,8 +220,10 @@ static int dlmunmap(void *, size_t);
+ 
+ #if !(defined(X86_WIN32) || defined(X86_WIN64) || defined(__OS2__)) || defined (__CYGWIN__) || defined(__INTERIX)
+ 
++#if !defined(__UCLIBC__) || !defined(__HAS_NO_THREADS__)
+ /* A mutex used to synchronize access to *exec* variables in this file.  */
+ static pthread_mutex_t open_temp_exec_file_mutex = PTHREAD_MUTEX_INITIALIZER;
++#endif
+ 
+ /* A file descriptor of a temporary file from which we'll map
+    executable pages.  */
+@@ -473,9 +481,13 @@ dlmmap (void *start, size_t length, int prot,
+ 
+   if (execsize == 0 || execfd == -1)
+     {
++#if !defined(__UCLIBC__) || !defined(__HAS_NO_THREADS__)
+       pthread_mutex_lock (&open_temp_exec_file_mutex);
++#endif
+       ptr = dlmmap_locked (start, length, prot, flags, offset);
++#if !defined(__UCLIBC__) || !defined(__HAS_NO_THREADS__)
+       pthread_mutex_unlock (&open_temp_exec_file_mutex);
++#endif
+ 
+       return ptr;
+     }
+-- 
+1.7.9.5
+
-- 
1.9.1
