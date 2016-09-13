From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 13 Sep 2016 15:35:02 +0200
Subject: [Buildroot] [PATCH] package/libupnpp: add patch to fix build issue
Message-ID: <20160913133502.2586-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bumping libupnpp to version 0.15.0 introduced a build error for some
architectures:

```
./libupnpp/workqueue.h:308:29: error: field 'res' has incomplete type
         std::future<void *> res;
                             ^
./libupnpp/workqueue.h: In member function 'bool
WorkQueue<T>::start(int, void* (*)(void*), void*)':
./libupnpp/workqueue.h:81:25: error: invalid use of incomplete type
'class std::packaged_task<void*(void*)>'
             w.res = task.get_future();
```

The problem is that `std::future` is not available for all
architectures, e.g. it is missing for ARMv5 (soft-float). libstdc++
enables `std::future` only if `ATOMIC_INT_LOCK_FREE > 1`, which
according the the libstdc++ documentation means that operations on
atomic ints are guaranteed to be lock-free.

This check is not true for some target, e.g. the toolchain for the
ARMv5 target defines:

```
$ echo | /usr/bin/arm-linux-g++ -dM -E - | grep ATOMIC_INT_LOCK_FREE
#define __GCC_ATOMIC_INT_LOCK_FREE 1

```

We add a patch from upstream which detects if `std::future` is available
and opts-out the functionality for unsupported targets.

Fixes:
http://autobuild.buildroot.net/results/f8eb38ef79160e1f646dae0be19f27fae82a58bc
http://autobuild.buildroot.net/results/158e0ceeff009146b78a0d2bb278c76479bafc34
http://autobuild.buildroot.net/results/1760cf53c77e16bb2b5bc795bd0ce5eb65f258f2
http://autobuild.buildroot.net/results/5b73e52495aa1bbb2c704492237da784b9d74bc2
http://autobuild.buildroot.net/results/6d922a1bbace024fcf040beb49bbb119036865ef
http://autobuild.buildroot.net/results/bebb8983e7579ee4b4bcf18f037c7797ab86f8db
http://autobuild.buildroot.net/results/0f1a5832ced2a6ec2e18f9f14197446fda6af692
http://autobuild.buildroot.net/results/94a9cc349f23a47246b06619a019bcb917493415
http://autobuild.buildroot.net/results/19fba094098af5c1ce1e1371e5e88393c4a6ac9c
http://autobuild.buildroot.net/results/578935b5c04005d1f096059387d16911f953ec6f
http://autobuild.buildroot.net/results/2ad698f1665b7b886141672181cb76ec3c40a743

and more...

Note, that we enable autoreconf as the patch touches configure.ac.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/libupnpp/0001-Check-for-std-future.patch | 127 +++++++++++++++++++++++
 package/libupnpp/libupnpp.mk                     |   2 +
 2 files changed, 129 insertions(+)
 create mode 100644 package/libupnpp/0001-Check-for-std-future.patch

diff --git a/package/libupnpp/0001-Check-for-std-future.patch b/package/libupnpp/0001-Check-for-std-future.patch
new file mode 100644
index 0000000..dc7ba56
--- /dev/null
+++ b/package/libupnpp/0001-Check-for-std-future.patch
@@ -0,0 +1,127 @@
+From 3bfcb171026c4fd5c7caf807f79184a81c8af5b2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Sun, 11 Sep 2016 21:09:22 +0200
+Subject: [PATCH] Check for std::future
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+std::future is not available for all architectures, e.g. it is missing
+for ARMv5 (soft-float).
+
+The problem is that libstdc++ only enables `std::future` if
+`ATOMIC_INT_LOCK_FREE > 1` which is not true for the ARMv5 target.
+
+As the future functionality is not used for much we just ifdef out the
+parts from `std::future`.
+
+Upstream-status: https://github.com/medoc92/libupnpp/issues/8
+
+This patch is squashed from two upstream commits:
+1/ d3e3cada667cca5b70693b351e5865231275dd82
+2/ 90407dcc206987c8e58d61c64db539489f0717d2
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ configure.ac         | 17 +++++++++++++++++
+ libupnpp/config.h.in |  3 +++
+ libupnpp/workqueue.h | 14 +++++++++++++-
+ 3 files changed, 33 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 877a773..9ff2058 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -47,6 +47,23 @@ AC_DEFINE([_FILE_OFFSET_BITS], [64], [File Offset size])
+ AC_CHECK_LIB([rt], [clock_gettime], [], [])
+ AC_CHECK_LIB([pthread], [pthread_create], [], [])
+ 
++# Check that std::future is available.
++AC_LANG_PUSH([C++])
++CXXFLAGS="-std=c++11 $CXXFLAGS"
++AC_MSG_CHECKING([whether std::future is available])
++AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <future>]],
++		[[std::future<int> f;]])],
++	[ AC_DEFINE([HAVE_STD_FUTURE], [1],
++		[Define to 1 if you have the `std::future`.])
++	  have_std_future=yes
++	],
++	[
++	  have_std_future=no
++	]
++)
++AC_MSG_RESULT([$have_std_future])
++AC_LANG_POP
++
+ # The 2 following checks for libthreadutil and libixml are normally
+ # unnecessary and even problematic. libupnpp does not use them directly,
+ # and they should be used automatically because libupnpp is linked with them.
+diff --git a/libupnpp/config.h.in b/libupnpp/config.h.in
+index 39fa410..4471855 100644
+--- a/libupnpp/config.h.in
++++ b/libupnpp/config.h.in
+@@ -36,6 +36,9 @@
+ /* Define to 1 if you have the <stdlib.h> header file. */
+ #undef HAVE_STDLIB_H
+ 
++/* Define to 1 if you have the `std::future`. */
++#undef HAVE_STD_FUTURE
++
+ /* Define to 1 if you have the <strings.h> header file. */
+ #undef HAVE_STRINGS_H
+ 
+diff --git a/libupnpp/workqueue.h b/libupnpp/workqueue.h
+index 52a6138..9c0ec02 100644
+--- a/libupnpp/workqueue.h
++++ b/libupnpp/workqueue.h
+@@ -18,7 +18,9 @@
+ #define _WORKQUEUE_H_INCLUDED_
+ 
+ #include <thread>
++#if HAVE_STD_FUTURE
+ #include <future>
++#endif
+ #include <string>
+ #include <queue>
+ #include <list>
+@@ -76,10 +78,14 @@ public:
+     bool start(int nworkers, void *(workproc)(void *), void *arg) {
+         std::unique_lock<std::mutex> lock(m_mutex);
+         for (int i = 0; i < nworkers; i++) {
+-            std::packaged_task<void *(void *)> task(workproc);
+             Worker w;
++#if HAVE_STD_FUTURE
++            std::packaged_task<void *(void *)> task(workproc);
+             w.res = task.get_future();
+             w.thr = std::thread(std::move(task), arg);
++#else
++            w.thr = std::thread(workproc, arg);
++#endif
+             m_worker_threads.push_back(std::move(w));
+         }
+         return true;
+@@ -189,7 +195,11 @@ public:
+         // Workers return (void*)1 if ok
+         void *statusall = (void*)1;
+         while (!m_worker_threads.empty()) {
++#if HAVE_STD_FUTURE
+             void *status = m_worker_threads.front().res.get();
++#else
++            void *status = (void*) 1;
++#endif
+             m_worker_threads.front().thr.join();
+             if (status == (void *)0) {
+                 statusall = status;
+@@ -305,7 +315,9 @@ private:
+ 
+     struct Worker {
+         std::thread         thr;
++#if HAVE_STD_FUTURE
+         std::future<void *> res;
++#endif
+     };
+     
+     // Configuration
+-- 
+2.9.3
+
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index 7d21a88..ab1ce8b 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -10,6 +10,8 @@ LIBUPNPP_LICENSE = GPLv2+
 LIBUPNPP_LICENSE_FILES = COPYING
 LIBUPNPP_INSTALL_STAGING = YES
 LIBUPNPP_DEPENDENCIES = expat libcurl libupnp
+# touching configure.ac in 0001-Check-for-std-future.patch
+LIBUPNPP_AUTORECONF = YES
 
 # configure script fails to link against the dependencies of libupnp
 # and libcurl causing detection to fail when statically linking
-- 
2.9.3
