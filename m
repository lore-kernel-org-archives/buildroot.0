From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 30 Dec 2012 23:17:44 +0100
Subject: [Buildroot] [PATCH 1/4] lttng-libust: bump to 2.1.0
In-Reply-To: <cover.1356905589.git.s.martin49@gmail.com>
References: <cover.1356905589.git.s.martin49@gmail.com>
Message-ID: <10d124683f25769b7919e9bbe394c8d850fe4b23.1356905589.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove lttng-libust-uclibc-sed_getcpu.patch because it got merged
upstream.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...t-dont-build-cxx-tests-when-not-available.patch | 13 +++++----
 .../lttng-libust-uclibc-sched_getcpu.patch         | 32 ----------------------
 package/lttng-libust/lttng-libust.mk               |  2 +-
 3 files changed, 8 insertions(+), 39 deletions(-)
 delete mode 100644 package/lttng-libust/lttng-libust-uclibc-sched_getcpu.patch

diff --git a/package/lttng-libust/lttng-libust-dont-build-cxx-tests-when-not-available.patch b/package/lttng-libust/lttng-libust-dont-build-cxx-tests-when-not-available.patch
index bcc5636..b7e8a8f 100644
--- a/package/lttng-libust/lttng-libust-dont-build-cxx-tests-when-not-available.patch
+++ b/package/lttng-libust/lttng-libust-dont-build-cxx-tests-when-not-available.patch
@@ -38,15 +38,16 @@ index 26227cb..56d84db 100644
 +AM_CONDITIONAL([CXX_WORKS], [test "x$rw_cv_prog_cxx_works" = "xyes"])
 +
  ## Checks for libraries.
- AC_CHECK_LIB([dl], [dlopen])
- AC_CHECK_LIB([pthread], [pthread_create])
+ AC_CHECK_LIB([dl], [dlopen],
+ [
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index e79ab7c..1a8b795 100644
+index 2b12422..7365ce4 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
-@@ -1,6 +1,10 @@
--SUBDIRS = . hello hello-static-lib fork ust-basic-tracing ust-multi-test demo hello.cxx
-+SUBDIRS = . hello hello-static-lib fork ust-basic-tracing ust-multi-test demo
+@@ -1,7 +1,11 @@
+ SUBDIRS = . hello hello-static-lib fork ust-basic-tracing ust-multi-test \
+-		demo hello.cxx daemon
++		demo daemon
  #SUBDIRS = . hello2 basic basic_long simple_include snprintf test-nevents test-libustinstr-malloc dlopen same_line_marker trace_event register_test tracepoint libustctl_function_tests exit-fast
  
 +if CXX_WORKS
diff --git a/package/lttng-libust/lttng-libust-uclibc-sched_getcpu.patch b/package/lttng-libust/lttng-libust-uclibc-sched_getcpu.patch
deleted file mode 100644
index 6536185..0000000
--- a/package/lttng-libust/lttng-libust-uclibc-sched_getcpu.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-[PATCH] fix build with modern uClibc
-
-uClibc has sched_getcpu since 0.9.33, so the compat workaround should only
-be used for older uClibc versions.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- liblttng-ust/compat.h |    5 +++++
- 1 file changed, 5 insertions(+)
-
-Index: lttng-ust-1.9.2/liblttng-ust/compat.h
-===================================================================
---- lttng-ust-1.9.2.orig/liblttng-ust/compat.h
-+++ lttng-ust-1.9.2/liblttng-ust/compat.h
-@@ -17,6 +17,10 @@
- #include <sys/syscall.h>
- 
- #ifdef __UCLIBC__
-+/* old uClibc versions didn't have sched_getcpu */
-+#if __UCLIBC_MAJOR__ == 0 && \
-+	(__UCLIBC_MINOR__ < 9 || \
-+	 (__UCLIBC_MINOR__ == 9 && __UCLIBC_SUBLEVEL__ <= 32))
- #define __getcpu(cpu, node, cache)	syscall(__NR_getcpu, cpu, node, cache)
- static inline
- int sched_getcpu(void)
-@@ -26,5 +30,6 @@
- 	s = __getcpu(&c, NULL, NULL);
- 	return (s == -1) ? s : c;
- }
-+#endif /* <= 0.9.32 */
- #endif	/* __UCLIBC__ */
- #endif /* _UST_COMPAT_H */
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index cd6c65d..e1f51b1 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 LTTNG_LIBUST_SITE    = http://lttng.org/files/lttng-ust/
-LTTNG_LIBUST_VERSION = 2.0.3
+LTTNG_LIBUST_VERSION = 2.1.0
 LTTNG_LIBUST_SOURCE  = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 
 LTTNG_LIBUST_INSTALL_STAGING = YES
-- 
1.8.0.3
