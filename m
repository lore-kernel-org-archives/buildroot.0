From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:58:48 +0200
Subject: [Buildroot] [git commit] protobuf: bump to version 3.0.0
Message-ID: <20161022140052.4BEB081914@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6428eacf70dd931c106215606d0e77bca09d497
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It also changes the python-protobuf.hash file to be a symbolic link to
../protobuf/protobuf.hash so that both hash files don't have to be
updated when protobuf is bumped.

In addition, the 0001-disable-unneeded-build-dependencies.patch patch
from package/python-protobuf/ is removed because it has been merged
upstream.

Signed-off-by: Jan Heylen <heyleke@gmail.com>
[Thomas: fix the build of python-protobuf.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...GLE_PROTOBUF_ATOMICOPS_ERROR-syntax-error.patch | 61 ----------------------
 ...onfigure.ac-check-if-libatomic-is-needed.patch} |  4 +-
 package/protobuf/protobuf.hash                     |  2 +-
 package/protobuf/protobuf.mk                       |  2 +-
 .../0001-disable-unneeded-build-dependencies.patch | 37 -------------
 package/python-protobuf/python-protobuf.hash       |  3 +-
 6 files changed, 5 insertions(+), 104 deletions(-)

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
-It causes 'error: stray ???#??? in program' compilation error.
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
diff --git a/package/python-protobuf/0001-disable-unneeded-build-dependencies.patch b/package/python-protobuf/0001-disable-unneeded-build-dependencies.patch
deleted file mode 100644
index 3f0eabd..0000000
--- a/package/python-protobuf/0001-disable-unneeded-build-dependencies.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 7e7db7225e227905acabfa2149152ece21c93e70 Mon Sep 17 00:00:00 2001
-From: Steven Noonan <steven@uplinklabs.net>
-Date: Sun, 8 Nov 2015 09:03:00 -0800
-Subject: [PATCH] python-protobuf: don't require google-apputils
-
-This dependency is totally superfluous for successfully building/running
-python-protobuf. It's only "required" at build time and is not staged into the
-install directory, but it isn't even really required for a successful build.
-
-Signed-off-by: Steven Noonan <steven@uplinklabs.net>
----
- python/setup.py | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/python/setup.py b/python/setup.py
-index 2450a77..db6f497 100755
---- a/python/setup.py
-+++ b/python/setup.py
-@@ -160,7 +160,6 @@ if __name__ == '__main__':
-         packages = [ 'google' ],
-         namespace_packages = [ 'google' ],
-         test_suite = 'setup.MakeTestSuite',
--        google_test_dir = "google/protobuf/internal",
-         # Must list modules explicitly so that we don't install tests.
-         py_modules = [
-           'google.protobuf.internal.api_implementation',
-@@ -189,7 +188,6 @@ if __name__ == '__main__':
-           'google.protobuf.text_format'],
-         cmdclass = { 'clean': clean, 'build_py': build_py },
-         install_requires = ['setuptools'],
--        setup_requires = ['google-apputils'],
-         ext_modules = ext_module_list,
-         url = 'https://developers.google.com/protocol-buffers/',
-         maintainer = maintainer_email,
--- 
-2.6.2
-
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
deleted file mode 100644
index ab4bf5b..0000000
--- a/package/python-protobuf/python-protobuf.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256  2667b7cda4a6bc8a09e5463adf3b5984e08d94e72338277affa8594d8b6e5cd1  protobuf-v2.6.1.tar.gz
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
new file mode 120000
index 0000000..57a40ce
--- /dev/null
+++ b/package/python-protobuf/python-protobuf.hash
@@ -0,0 +1 @@
+../protobuf/protobuf.hash
\ No newline at end of file
