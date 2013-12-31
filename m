From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Dec 2013 12:38:33 +0100
Subject: [Buildroot] [git commit] iozone: add fix for missing
	pthread_setaffinity_np()
Message-ID: <20131231113845.324F09C2E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8bc28f5be004d9c3bc033b2bc394e5b92c942d38
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The iozone code uses the pthread_setaffinity_np() function, but with
uClibc this function is only available when the NPTL thread
implementation is used. Some architectures, such as AVR32 and ARC do
not support the NPTL thread implementation, and therefore lack the
pthread_setaffinity_np() function.

This commit adds a patch that provides an empty implementation of
pthread_setaffinity_np() when we're using uClibc, but not with the
NPTL thread implementation. The reasoning is that there is a very high
chance that the few architectures that do not implement NPTL are
non-SMP architectures, and therefore setting the affinity is not very
useful.

In addition to this, this commit:

 * Renames the existing patch to use a sequence number, in order to
   guarantee a proper ordering when applying patches.

 * Removes the Kconfig dependency on !uClibc 0.9.31, which was
   introduced to prevent AVR32 from failing due to the
   pthread_setaffinity_np(). This conditional is no longer necessary
   due to the new patch, and the conditional was anyway not completely
   working since it was not taking into account the case of external
   toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iozone/Config.in                           |    1 -
 ...ozone-targets.patch => iozone-01-targets.patch} |    0
 package/iozone/iozone-02-no-nptl-support.patch     |   37 ++++++++++++++++++++
 3 files changed, 37 insertions(+), 1 deletions(-)

diff --git a/package/iozone/Config.in b/package/iozone/Config.in
index 33e12ca..26d4daa 100644
--- a/package/iozone/Config.in
+++ b/package/iozone/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_IOZONE
 	bool "iozone"
 	depends on BR2_USE_MMU # fork()
-	depends on !BR2_UCLIBC_VERSION_0_9_31 # no pthread_setaffinity_np
 	help
 	  IOzone is a filesystem benchmark tool.
 	  The benchmark generates and measures a variety of file operations
diff --git a/package/iozone/iozone-targets.patch b/package/iozone/iozone-01-targets.patch
similarity index 100%
rename from package/iozone/iozone-targets.patch
rename to package/iozone/iozone-01-targets.patch
diff --git a/package/iozone/iozone-02-no-nptl-support.patch b/package/iozone/iozone-02-no-nptl-support.patch
new file mode 100644
index 0000000..493f52c
--- /dev/null
+++ b/package/iozone/iozone-02-no-nptl-support.patch
@@ -0,0 +1,37 @@
+Dummy pthread_setaffinity_np() when not available
+
+On uClibc configurations that do not use the NPTL thread
+implementation, pthread_setaffinity_np() is not available. This patch
+defines a dummy (empty) implementation of this function for such
+cases.
+
+The only few architectures that do not provide the NPTL thread
+implementation are very likely to be non-SMP architectures, and
+therefore, setting the affinity of the thread is not doing anything
+useful, so having an empty stub for pthread_setaffinity_np() is not a
+problem.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/src/current/iozone.c
+===================================================================
+--- a/src/current/iozone.c
++++ b/src/current/iozone.c
+@@ -306,6 +306,17 @@
+ #endif
+ #endif
+ 
++#if defined (__linux__)
++#include <features.h>
++#if defined (__UCLIBC__) && !defined (__UCLIBC_HAS_THREADS_NATIVE__)
++static int pthread_setaffinity_np(pthread_t thread, size_t cpusetsize,
++				  const cpu_set_t *cpuset)
++{
++	return 0;
++}
++#endif
++#endif
++
+ #if ((defined(solaris) && defined(__LP64__)) || defined(__s390x__))
+ /* If we are building for 64-bit Solaris, all functions that return pointers
+  * must be declared before they are used; otherwise the compiler will assume
