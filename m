From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  4 Feb 2012 15:48:47 +0100
Subject: [Buildroot] [PATCH 6/7] lttng-libust: add patch to fix build issue
	when C++ support is not available
In-Reply-To: <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
References: <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4e02eaff56aa9f76dc3e0ff87ba906b84f9c8ee8.1328366921.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...2-dont-build-cxx-tests-when-not-available.patch |   50 ++++++++++++++++++++
 package/lttng-libust/lttng-libust.mk               |    2 +
 2 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 package/lttng-libust/lttng-libust-1.9.2-dont-build-cxx-tests-when-not-available.patch

diff --git a/package/lttng-libust/lttng-libust-1.9.2-dont-build-cxx-tests-when-not-available.patch b/package/lttng-libust/lttng-libust-1.9.2-dont-build-cxx-tests-when-not-available.patch
new file mode 100644
index 0000000..b1b94b0
--- /dev/null
+++ b/package/lttng-libust/lttng-libust-1.9.2-dont-build-cxx-tests-when-not-available.patch
@@ -0,0 +1,50 @@
+Do not build C++ example if a C++ compiler isn't available
+
+By default lttng-ust builds a hello.cxx C++ example that demonstrates
+the usage of the userspace tracing library in a C++
+program. Unfortunately, when no C++ support isa available, the build
+of lttng-ust fails just because of this example code. So we make the
+compilation of this code conditional on whether a working C++ compiler
+was found.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: lttng-ust-1.9.2/configure.ac
+===================================================================
+--- lttng-ust-1.9.2.orig/configure.ac	2012-02-04 14:49:45.387325814 +0100
++++ lttng-ust-1.9.2/configure.ac	2012-02-04 14:50:08.156920117 +0100
+@@ -38,6 +38,18 @@
+ AC_PROG_MAKE_SET
+ LT_INIT
+ 
++# rw_PROG_CXX_WORKS
++# Check whether the C++ compiler works.
++AC_CACHE_CHECK([whether the C++ compiler works],
++               [rw_cv_prog_cxx_works],
++               [AC_LANG_PUSH([C++])
++                AC_LINK_IFELSE([AC_LANG_PROGRAM([], [])],
++                               [rw_cv_prog_cxx_works=yes],
++                               [rw_cv_prog_cxx_works=no])
++                AC_LANG_POP([C++])])
++
++AM_CONDITIONAL([CXX_WORKS], [test "x$rw_cv_prog_cxx_works" = "xyes"])
++
+ ## Checks for libraries.
+ AC_CHECK_LIB([dl], [dlopen])
+ AC_CHECK_LIB([pthread], [pthread_create])
+Index: lttng-ust-1.9.2/tests/Makefile.am
+===================================================================
+--- lttng-ust-1.9.2.orig/tests/Makefile.am	2012-02-04 14:49:49.157258640 +0100
++++ lttng-ust-1.9.2/tests/Makefile.am	2012-02-04 14:50:15.096796474 +0100
+@@ -1,6 +1,10 @@
+-SUBDIRS = . hello fork ust-basic-tracing ust-multi-test demo hello.cxx
++SUBDIRS = . hello fork ust-basic-tracing ust-multi-test demo
+ #SUBDIRS = . hello2 basic basic_long simple_include snprintf test-nevents test-libustinstr-malloc dlopen same_line_marker trace_event register_test tracepoint libustctl_function_tests exit-fast
+ 
++if CXX_WORKS
++SUBDIRS += hello.cxx
++endif
++
+ dist_noinst_SCRIPTS = test_loop runtests trace_matches
+ 
+ noinst_LIBRARIES = libtap.a
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index ebe14ca..f54999e 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,4 +5,6 @@ LTTNG_LIBUST_SOURCE  = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.gz
 LTTNG_LIBUST_INSTALL_STAGING = YES
 LTTNG_LIBUST_DEPENDENCIES    = liburcu util-linux
 
+LTTNG_LIBUST_AUTORECONF = YES
+
 $(eval $(call AUTOTARGETS))
-- 
1.7.4.1
