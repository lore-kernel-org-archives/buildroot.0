From: Jan Heylen <heyleke@gmail.com>
Date: Thu, 20 Oct 2016 19:13:29 +0200
Subject: [Buildroot] [PATCH 1/1] protobuf: bump to version 3.0.0
Message-ID: <1476983609-17269-1-git-send-email-heyleke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jan Heylen <heyleke@gmail.com>
---
 ...GLE_PROTOBUF_ATOMICOPS_ERROR-syntax-error.patch | 61 ----------------------
 ...onfigure.ac-check-if-libatomic-is-needed.patch} |  4 +-
 package/protobuf/protobuf.hash                     |  2 +-
 package/protobuf/protobuf.mk                       |  2 +-
 4 files changed, 4 insertions(+), 65 deletions(-)
 delete mode 100644 package/protobuf/0001-Fix-GOOGLE_PROTOBUF_ATOMICOPS_ERROR-syntax-error.patch
 rename package/protobuf/{0002-configure.ac-check-if-libatomic-is-needed.patch => 0001-configure.ac-check-if-libatomic-is-needed.patch} (85%)

diff --git a/package/protobuf/0001-Fix-GOOGLE_PROTOBUF_ATOMICOPS_ERROR-syntax-error.patch b/package/protobuf/0001-Fix-GOOGLE_PROTOBUF_ATOMICOPS_ERROR-syntax-error.patch
deleted file mode 100644
index c271ea4..0000000
--- a/package/protobuf/0001-Fix-GOOGLE_PROTOBUF_ATOMICOPS_ERROR-syntax-error.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 50982f711de6ad58f6e0bef01a75d2b9cf35f5dc Mon Sep 17 00:00:00 2001
-From: George Redivo <george.redivo@datacom.ind.br>
-Date: Mon, 6 Jul 2015 16:56:41 -0300
-Subject: [PATCH 1/2] Fix GOOGLE_PROTOBUF_ATOMICOPS_ERROR syntax error
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-It's not possible to define "#error" inside a define.
-It causes 'error: stray ?#? in program' compilation error.
-
-Now the define GOOGLE_PROTOBUF_ATOMICOPS_ERROR is the error message
-and it's used along the code together "#error".
----
- src/google/protobuf/stubs/atomicops.h | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/google/protobuf/stubs/atomicops.h b/src/google/protobuf/stubs/atomicops.h
-index b1336e3..a130b38 100644
---- a/src/google/protobuf/stubs/atomicops.h
-+++ b/src/google/protobuf/stubs/atomicops.h
-@@ -162,7 +162,7 @@ Atomic64 Release_Load(volatile const Atomic64* ptr);
- 
- // Include our platform specific implementation.
- #define GOOGLE_PROTOBUF_ATOMICOPS_ERROR \
--#error "Atomic operations are not supported on your platform"
-+"Atomic operations are not supported on your platform"
- 
- // ThreadSanitizer, http://clang.llvm.org/docs/ThreadSanitizer.html.
- #if defined(THREAD_SANITIZER)
-@@ -172,7 +172,7 @@ Atomic64 Release_Load(volatile const Atomic64* ptr);
- #if defined(GOOGLE_PROTOBUF_ARCH_IA32) || defined(GOOGLE_PROTOBUF_ARCH_X64)
- #include <google/protobuf/stubs/atomicops_internals_x86_msvc.h>
- #else
--GOOGLE_PROTOBUF_ATOMICOPS_ERROR
-+#error GOOGLE_PROTOBUF_ATOMICOPS_ERROR
- #endif
- 
- // Solaris
-@@ -203,15 +203,15 @@ GOOGLE_PROTOBUF_ATOMICOPS_ERROR
- #if __has_extension(c_atomic)
- #include <google/protobuf/stubs/atomicops_internals_generic_gcc.h>
- #else
--GOOGLE_PROTOBUF_ATOMICOPS_ERROR
-+#error GOOGLE_PROTOBUF_ATOMICOPS_ERROR
- #endif
- #else
--GOOGLE_PROTOBUF_ATOMICOPS_ERROR
-+#error GOOGLE_PROTOBUF_ATOMICOPS_ERROR
- #endif
- 
- // Unknown.
- #else
--GOOGLE_PROTOBUF_ATOMICOPS_ERROR
-+#error GOOGLE_PROTOBUF_ATOMICOPS_ERROR
- #endif
- 
- // On some platforms we need additional declarations to make AtomicWord
--- 
-2.5.0
-
diff --git a/package/protobuf/0002-configure.ac-check-if-libatomic-is-needed.patch b/package/protobuf/0001-configure.ac-check-if-libatomic-is-needed.patch
similarity index 85%
rename from package/protobuf/0002-configure.ac-check-if-libatomic-is-needed.patch
rename to package/protobuf/0001-configure.ac-check-if-libatomic-is-needed.patch
index a70a23e..fffdf49 100644
--- a/package/protobuf/0002-configure.ac-check-if-libatomic-is-needed.patch
+++ b/package/protobuf/0001-configure.ac-check-if-libatomic-is-needed.patch
@@ -20,8 +20,8 @@ diff --git a/configure.ac b/configure.ac
 index c07067c..88d4a0d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -139,6 +139,8 @@ AM_CONDITIONAL([USE_EXTERNAL_PROTOC], [test "$with_protoc" != "no"])
- ACX_PTHREAD
+@@ -160,6 +160,8 @@ AM_CONDITIONAL([HAVE_PTHREAD], [test "x$acx_pthread_ok" = "xyes"])
+ # We still keep this for improving pbconfig.h for unsupported platforms.
  AC_CXX_STL_HASH
  
 +AC_SEARCH_LIBS([__atomic_load_4], [atomic])
diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 78285b7..b681650 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 2667b7cda4a6bc8a09e5463adf3b5984e08d94e72338277affa8594d8b6e5cd1 protobuf-v2.6.1.tar.gz
+sha256 f5b3563f118f1d3d6e001705fa7082e8fc3bda50038ac3dff787650795734146 protobuf-v3.0.0.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index 3eeadfc..b4a1947 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOBUF_VERSION = v2.6.1
+PROTOBUF_VERSION = v3.0.0
 PROTOBUF_SITE = $(call github,google,protobuf,$(PROTOBUF_VERSION))
 PROTOBUF_LICENSE = BSD-3c
 PROTOBUF_LICENSE_FILES = LICENSE
-- 
2.7.4
