From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 11 Oct 2016 21:50:06 +0200
Subject: [Buildroot] [PATCH] package/libupnpp: bump to version 0.15.1
Message-ID: <20161011195006.24817-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patches applied upstream. No need to set AUTORECONF anymore.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/libupnpp/0001-Check-for-std-future.patch | 127 -----------------------
 package/libupnpp/0002-Add-pkg-config-file.patch  |  63 -----------
 package/libupnpp/libupnpp.hash                   |   4 +-
 package/libupnpp/libupnpp.mk                     |   6 +-
 4 files changed, 3 insertions(+), 197 deletions(-)
 delete mode 100644 package/libupnpp/0001-Check-for-std-future.patch
 delete mode 100644 package/libupnpp/0002-Add-pkg-config-file.patch

diff --git a/package/libupnpp/0001-Check-for-std-future.patch b/package/libupnpp/0001-Check-for-std-future.patch
deleted file mode 100644
index 7319395..0000000
--- a/package/libupnpp/0001-Check-for-std-future.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-From 3bfcb171026c4fd5c7caf807f79184a81c8af5b2 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Sun, 11 Sep 2016 21:09:22 +0200
-Subject: [PATCH] Check for std::future
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-std::future is not available for all architectures, e.g. it is missing
-for ARMv5 (soft-float).
-
-The problem is that libstdc++ only enables `std::future` if
-`ATOMIC_INT_LOCK_FREE > 1` which is not true for the ARMv5 target.
-
-As the future functionality is not used for much we just ifdef out the
-parts from `std::future`.
-
-Upstream-status: https://github.com/medoc92/libupnpp/issues/8
-
-This patch is squashed from two upstream commits:
-1/ d3e3cada667cca5b70693b351e5865231275dd82
-2/ 90407dcc206987c8e58d61c64db539489f0717d2
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- configure.ac         | 17 +++++++++++++++++
- libupnpp/config.h.in |  3 +++
- libupnpp/workqueue.h | 14 +++++++++++++-
- 3 files changed, 33 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 877a773..9ff2058 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -47,6 +47,23 @@ AC_DEFINE([_FILE_OFFSET_BITS], [64], [File Offset size])
- AC_CHECK_LIB([rt], [clock_gettime], [], [])
- AC_CHECK_LIB([pthread], [pthread_create], [], [])
- 
-+# Check that std::future is available.
-+AC_LANG_PUSH([C++])
-+CXXFLAGS="-std=c++11 $CXXFLAGS"
-+AC_MSG_CHECKING([whether std::future is available])
-+AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[#include <future>]],
-+		[[std::future<int> f;]])],
-+	[ AC_DEFINE([HAVE_STD_FUTURE], [1],
-+		[Define to 1 if you have the `std::future`.])
-+	  have_std_future=yes
-+	],
-+	[
-+	  have_std_future=no
-+	]
-+)
-+AC_MSG_RESULT([$have_std_future])
-+AC_LANG_POP
-+
- # The 2 following checks for libthreadutil and libixml are normally
- # unnecessary and even problematic. libupnpp does not use them directly,
- # and they should be used automatically because libupnpp is linked with them.
-diff --git a/libupnpp/config.h.in b/libupnpp/config.h.in
-index 39fa410..4471855 100644
---- a/libupnpp/config.h.in
-+++ b/libupnpp/config.h.in
-@@ -36,6 +36,9 @@
- /* Define to 1 if you have the <stdlib.h> header file. */
- #undef HAVE_STDLIB_H
- 
-+/* Define to 1 if you have the `std::future`. */
-+#undef HAVE_STD_FUTURE
-+
- /* Define to 1 if you have the <strings.h> header file. */
- #undef HAVE_STRINGS_H
- 
-diff --git a/libupnpp/workqueue.h b/libupnpp/workqueue.h
-index 52a6138..9c0ec02 100644
---- a/libupnpp/workqueue.h
-+++ b/libupnpp/workqueue.h
-@@ -18,7 +18,9 @@
- #define _WORKQUEUE_H_INCLUDED_
- 
- #include <thread>
-+#if HAVE_STD_FUTURE
- #include <future>
-+#endif
- #include <string>
- #include <queue>
- #include <list>
-@@ -76,10 +78,14 @@ public:
-     bool start(int nworkers, void *(workproc)(void *), void *arg) {
-         std::unique_lock<std::mutex> lock(m_mutex);
-         for (int i = 0; i < nworkers; i++) {
--            std::packaged_task<void *(void *)> task(workproc);
-             Worker w;
-+#if HAVE_STD_FUTURE
-+            std::packaged_task<void *(void *)> task(workproc);
-             w.res = task.get_future();
-             w.thr = std::thread(std::move(task), arg);
-+#else
-+            w.thr = std::thread(workproc, arg);
-+#endif
-             m_worker_threads.push_back(std::move(w));
-         }
-         return true;
-@@ -189,7 +195,11 @@ public:
-         // Workers return (void*)1 if ok
-         void *statusall = (void*)1;
-         while (!m_worker_threads.empty()) {
-+#if HAVE_STD_FUTURE
-             void *status = m_worker_threads.front().res.get();
-+#else
-+            void *status = (void*) 1;
-+#endif
-             m_worker_threads.front().thr.join();
-             if (status == (void *)0) {
-                 statusall = status;
-@@ -305,7 +315,9 @@ private:
- 
-     struct Worker {
-         std::thread         thr;
-+#if HAVE_STD_FUTURE
-         std::future<void *> res;
-+#endif
-     };
-     
-     // Configuration
--- 
-2.9.3
-
diff --git a/package/libupnpp/0002-Add-pkg-config-file.patch b/package/libupnpp/0002-Add-pkg-config-file.patch
deleted file mode 100644
index 377b5e0..0000000
--- a/package/libupnpp/0002-Add-pkg-config-file.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 22ec8e3a2b54a4e1fd1340a592f49829d6cde735 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Sun, 11 Sep 2016 22:26:33 +0200
-Subject: [PATCH] Add pkg-config file
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Add a pkg-config file.
-
-Fetched from:
-https://github.com/medoc92/libupnpp/commit/9f03bb0e7b47e2843edea6f25ed9eabbfb6412df
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- Makefile.am    |  3 +++
- configure.ac   |  1 +
- libupnpp.pc.in | 12 ++++++++++++
- 3 files changed, 16 insertions(+)
- create mode 100644 libupnpp.pc.in
-
-diff --git a/Makefile.am b/Makefile.am
-index 2d20b9b..39559e9 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -112,3 +112,6 @@ nobase_include_HEADERS = \
- libupnpp_la_LDFLAGS = -version-info $(VERSION_INFO)
- 
- libupnpp_la_LIBADD = $(LIBUPNPP_LIBS)
-+
-+pkgconfigdir = $(libdir)/pkgconfig
-+pkgconfig_DATA = libupnpp.pc
-diff --git a/configure.ac b/configure.ac
-index 9ff2058..89525b3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -90,4 +90,5 @@ AC_SUBST(LIBUPNPP_LIBS)
- AC_SUBST(VERSION_INFO)
- 
- AC_CONFIG_FILES([Makefile])
-+AC_CONFIG_FILES([libupnpp.pc])
- AC_OUTPUT
-diff --git a/libupnpp.pc.in b/libupnpp.pc.in
-new file mode 100644
-index 0000000..90f4b2b
---- /dev/null
-+++ b/libupnpp.pc.in
-@@ -0,0 +1,12 @@
-+prefix=@prefix@
-+exec_prefix=@exec_prefix@
-+libdir=@libdir@
-+includedir=@includedir@
-+
-+Name: @PACKAGE_NAME@
-+Description: C++ wrapper for libupnp
-+Version: @PACKAGE_VERSION@
-+Requires: libcurl libupnp
-+Libs: -L${libdir} -lupnpp
-+Libs.private: -lexpat -lpthread -lrt
-+Cflags: -I${includedir}
--- 
-2.9.3
-
diff --git a/package/libupnpp/libupnpp.hash b/package/libupnpp/libupnpp.hash
index 4edc3b9..dde4c4f 100644
--- a/package/libupnpp/libupnpp.hash
+++ b/package/libupnpp/libupnpp.hash
@@ -1,2 +1,2 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.15.0.tar.gz.sha256
-sha256  5578389c1928a84cd8ec05c127321b44e2bfafaf3b02ebb8b1d10c10ae2b0aeb  libupnpp-0.15.0.tar.gz
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.15.1.tar.gz.sha256
+sha256  c558e6285d61485e656bc973511396665b68b1d5cfa34db5fa4e64e0f2026c3a  libupnpp-0.15.1.tar.gz
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index d712c21..0cb3eae 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -4,16 +4,12 @@
 #
 ################################################################################
 
-LIBUPNPP_VERSION = 0.15.0
+LIBUPNPP_VERSION = 0.15.1
 LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBUPNPP_LICENSE = GPLv2+
 LIBUPNPP_LICENSE_FILES = COPYING
 LIBUPNPP_INSTALL_STAGING = YES
 LIBUPNPP_DEPENDENCIES = expat libcurl libupnp
-# touching configure.ac in:
-#   0001-Check-for-std-future.patch
-#   0002-Add-pkg-config-file.patch
-LIBUPNPP_AUTORECONF = YES
 
 # configure script fails to link against the dependencies of libupnp
 # and libcurl causing detection to fail when statically linking
-- 
2.10.0
