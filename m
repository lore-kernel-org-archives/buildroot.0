From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 17:11:23 +0100
Subject: [Buildroot] [PATCH] package/grpc: fix build on non-NPTL systems
Message-ID: <20181231161123.12693-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uClibc-ng in non-NPTL configurations doesn't implement
pthread_setname_np(). Unfortunately grpc assumes that as soon as
__GLIBC__ is defined, pthread_setname_np() is available. It is
particularly sad, because grpc build system uses CMake, so it is
trivial to do such a check.

This commit adds a patch that does just this: check for the
availability of pthread_setname_np(), and use it only if
available. The patch has been submitted upstream.

Fixes:

  http://autobuild.buildroot.org/results/47991306abbcd80fb8e6baad0bd7490fa74f696c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...the-availability-of-pthread_setname_.patch | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch

diff --git a/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch b/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch
new file mode 100644
index 0000000000..766f758172
--- /dev/null
+++ b/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch
@@ -0,0 +1,52 @@
+From 0aeefca28104f86f14b511feee8d5711f2e8bcb5 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Mon, 31 Dec 2018 16:22:07 +0100
+Subject: [PATCH] Properly detect the availability of pthread_setname_np()
+
+This commit adds a CMake check for the availability of
+pthread_setname_np(), and only uses it on Linux when available.
+
+Indeed, some C libraries, such as uClibc, do not provide this
+non-POSIX function in all cases.
+
+Upstream: https://github.com/grpc/grpc/pull/17610
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ CMakeLists.txt                            | 6 ++++++
+ include/grpc/impl/codegen/port_platform.h | 2 ++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index fc76cf50da..8dd457fb1a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -94,6 +94,12 @@ endif()
+ 
+ set(CMAKE_POSITION_INDEPENDENT_CODE TRUE)
+ 
++include(CheckSymbolExists)
++check_symbol_exists(pthread_setname_np pthread.h HAVE_PTHREAD_SETNAME_NP)
++if (HAVE_PTHREAD_SETNAME_NP)
++  add_definitions(-DHAVE_PTHREAD_SETNAME_NP)
++endif ()
++
+ add_definitions(-DPB_FIELD_16BIT)
+ 
+ if (MSVC)
+diff --git a/include/grpc/impl/codegen/port_platform.h b/include/grpc/impl/codegen/port_platform.h
+index b2028a6305..dc89e6ed57 100644
+--- a/include/grpc/impl/codegen/port_platform.h
++++ b/include/grpc/impl/codegen/port_platform.h
+@@ -173,7 +173,9 @@
+ #endif /* _LP64 */
+ #ifdef __GLIBC__
+ #define GPR_POSIX_CRASH_HANDLER 1
++#if defined(HAVE_PTHREAD_SETNAME_NP)
+ #define GPR_LINUX_PTHREAD_NAME 1
++#endif /* HAVE_PTHREAD_SETNAME_NP */
+ #include <linux/version.h>
+ #else /* musl libc */
+ #define GPR_MUSL_LIBC_COMPAT 1
+-- 
+2.20.1
+
-- 
2.20.1
