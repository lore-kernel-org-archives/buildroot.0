From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Jul 2016 14:16:07 +0200
Subject: [Buildroot] [git commit] iozone: depends on toolchain with NPTL
	support
Message-ID: <20160731122011.D6684802C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ee967a71c564e4a6363ce1dd37552a61f9027ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The existent patch is not enough, as pthread_barrier_wait is used, which
isn't implemented in uClibc-ng Linuxthreads.
Remove the patch.

Fixes:

  http://autobuild.buildroot.net/results/e5bbb80c81f4f170cf48d375e016e87a296ff754/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iozone/0002-no-nptl-support.patch | 37 -------------------------------
 package/iozone/Config.in                  |  6 ++++-
 2 files changed, 5 insertions(+), 38 deletions(-)

diff --git a/package/iozone/0002-no-nptl-support.patch b/package/iozone/0002-no-nptl-support.patch
deleted file mode 100644
index 493f52c..0000000
--- a/package/iozone/0002-no-nptl-support.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Dummy pthread_setaffinity_np() when not available
-
-On uClibc configurations that do not use the NPTL thread
-implementation, pthread_setaffinity_np() is not available. This patch
-defines a dummy (empty) implementation of this function for such
-cases.
-
-The only few architectures that do not provide the NPTL thread
-implementation are very likely to be non-SMP architectures, and
-therefore, setting the affinity of the thread is not doing anything
-useful, so having an empty stub for pthread_setaffinity_np() is not a
-problem.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/src/current/iozone.c
-===================================================================
---- a/src/current/iozone.c
-+++ b/src/current/iozone.c
-@@ -306,6 +306,17 @@
- #endif
- #endif
- 
-+#if defined (__linux__)
-+#include <features.h>
-+#if defined (__UCLIBC__) && !defined (__UCLIBC_HAS_THREADS_NATIVE__)
-+static int pthread_setaffinity_np(pthread_t thread, size_t cpusetsize,
-+				  const cpu_set_t *cpuset)
-+{
-+	return 0;
-+}
-+#endif
-+#endif
-+
- #if ((defined(solaris) && defined(__LP64__)) || defined(__s390x__))
- /* If we are building for 64-bit Solaris, all functions that return pointers
-  * must be declared before they are used; otherwise the compiler will assume
diff --git a/package/iozone/Config.in b/package/iozone/Config.in
index 8cf50b1..fe49bd1 100644
--- a/package/iozone/Config.in
+++ b/package/iozone/Config.in
@@ -1,9 +1,13 @@
 config BR2_PACKAGE_IOZONE
 	bool "iozone"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	help
 	  IOzone is a filesystem benchmark tool.
 	  The benchmark generates and measures a variety of file operations
 
 	  http://www.iozone.org/
+
+comment "iozone needs a toolchain w/ NPTL"
+	depends on BR2_USE_MMU
+        depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
