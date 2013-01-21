From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 21 Jan 2013 10:05:14 +0100
Subject: [Buildroot] [PATCH 2/2] lttng-libust: fix version bumping to 2.1.1
In-Reply-To: <1358759114-11148-1-git-send-email-s.martin49@gmail.com>
References: <1358759114-11148-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1358759114-11148-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* remove lttng-libust-dont-build-cxx-tests-when-not-available.patch
  (included in the 2.1.1 release)

fix http://autobuild.buildroot.net/results/1fcbb7b53536522b26097c858a7a95eeece02277/build-end.log

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...t-dont-build-cxx-tests-when-not-available.patch | 62 ----------------------
 1 file changed, 62 deletions(-)
 delete mode 100644 package/lttng-libust/lttng-libust-dont-build-cxx-tests-when-not-available.patch

diff --git a/package/lttng-libust/lttng-libust-dont-build-cxx-tests-when-not-available.patch b/package/lttng-libust/lttng-libust-dont-build-cxx-tests-when-not-available.patch
deleted file mode 100644
index b7e8a8f..0000000
--- a/package/lttng-libust/lttng-libust-dont-build-cxx-tests-when-not-available.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 01dfa6e944d083db994f0a1165d3124bb6875437 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Tue, 8 May 2012 15:13:21 +0200
-Subject: [PATCH 1/1] don't build C++ example if a C++ compiler isn't
- available
-
-By default lttng-ust builds a hello.cxx C++ example that demonstrates
-the usage of the userspace tracing library in a C++ program.
-Unfortunately, when no C++ support is available, the build of lttng-ust
-fails just because of this example code. So we make the compilation of
-this code conditional on whether a working C++ compiler was found.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- configure.ac      |   12 ++++++++++++
- tests/Makefile.am |    6 +++++-
- 2 files changed, 17 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 26227cb..56d84db 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -45,6 +45,18 @@ AC_PROG_CXX
- AC_PROG_MAKE_SET
- LT_INIT
- 
-+# rw_PROG_CXX_WORKS
-+# Check whether the C++ compiler works.
-+AC_CACHE_CHECK([whether the C++ compiler works],
-+               [rw_cv_prog_cxx_works],
-+               [AC_LANG_PUSH([C++])
-+                AC_LINK_IFELSE([AC_LANG_PROGRAM([], [])],
-+                               [rw_cv_prog_cxx_works=yes],
-+                               [rw_cv_prog_cxx_works=no])
-+                AC_LANG_POP([C++])])
-+
-+AM_CONDITIONAL([CXX_WORKS], [test "x$rw_cv_prog_cxx_works" = "xyes"])
-+
- ## Checks for libraries.
- AC_CHECK_LIB([dl], [dlopen],
- [
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 2b12422..7365ce4 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -1,7 +1,11 @@
- SUBDIRS = . hello hello-static-lib fork ust-basic-tracing ust-multi-test \
--		demo hello.cxx daemon
-+		demo daemon
- #SUBDIRS = . hello2 basic basic_long simple_include snprintf test-nevents test-libustinstr-malloc dlopen same_line_marker trace_event register_test tracepoint libustctl_function_tests exit-fast
- 
-+if CXX_WORKS
-+SUBDIRS += hello.cxx
-+endif
-+
- dist_noinst_SCRIPTS = test_loop runtests trace_matches
- 
- noinst_LIBRARIES = libtap.a
---
-1.7.10.1
-
-- 
1.8.1.1
