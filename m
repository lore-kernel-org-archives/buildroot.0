From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 23:43:31 +0100
Subject: [Buildroot] [git commit] protobuf: fix detection of __atomic_*()
	built-ins
Message-ID: <20160320224336.0E0298180F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f80ca33904e86cf4dc517c3e8e7316d659a1271
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use the recently introduced BR2_TOOLCHAIN_HAS_ATOMIC boolean.

- Import an upstream patch to fix error handling when atomic operations
  are not detected. Without this patch the build fails due to a syntax
  error instead of showing the proper message.

- Add a patch to configure.ac to check if libatomic is needed and force
  linking to it (we will attempt to submit this upstream).

- Disable build for SPARC64 because it fails due to a missing definition
  of Atomic64.

On PowerPC, the __atomic_*() built-ins for 1-byte, 2-byte and 4-byte
types are available built-in. The corresponding built-ins for 8-byte
types, however, are implemented via libatomic, so requiring gcc >= 4.8.

In Buildroot, to simplify things, it was decided to require gcc 4.8 as
soon as the architectures has at least one __atomic_*() built-in variant
that requires libatomic.

Since protobuf most likely only uses the 1, 2 and 4-byte variants, it
*could* technically build with gcc 4.7. This is probably not a big deal,
and we can live with requiring gcc 4.8 on PowerPC to build protobuf. The
same restriction applies to SPARC.

The build for SPARC64 breaks even using the master branch of protobuf
due to undefined references to some NoBarrier_Atomic*() functions.

Signed-off-by: Henrique Marks <henrique.marks@datacom.ind.br>
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...GLE_PROTOBUF_ATOMICOPS_ERROR-syntax-error.patch | 61 ++++++++++++++++++++++
 ...configure.ac-check-if-libatomic-is-needed.patch | 34 ++++++++++++
 package/protobuf/Config.in                         | 21 +++++++-
 3 files changed, 115 insertions(+), 1 deletion(-)

diff --git a/package/protobuf/0001-Fix-GOOGLE_PROTOBUF_ATOMICOPS_ERROR-syntax-error.patch b/package/protobuf/0001-Fix-GOOGLE_PROTOBUF_ATOMICOPS_ERROR-syntax-error.patch
new file mode 100644
index 0000000..c271ea4
--- /dev/null
+++ b/package/protobuf/0001-Fix-GOOGLE_PROTOBUF_ATOMICOPS_ERROR-syntax-error.patch
@@ -0,0 +1,61 @@
+From 50982f711de6ad58f6e0bef01a75d2b9cf35f5dc Mon Sep 17 00:00:00 2001
+From: George Redivo <george.redivo@datacom.ind.br>
+Date: Mon, 6 Jul 2015 16:56:41 -0300
+Subject: [PATCH 1/2] Fix GOOGLE_PROTOBUF_ATOMICOPS_ERROR syntax error
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+It's not possible to define "#error" inside a define.
+It causes 'error: stray ???#??? in program' compilation error.
+
+Now the define GOOGLE_PROTOBUF_ATOMICOPS_ERROR is the error message
+and it's used along the code together "#error".
+---
+ src/google/protobuf/stubs/atomicops.h | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/google/protobuf/stubs/atomicops.h b/src/google/protobuf/stubs/atomicops.h
+index b1336e3..a130b38 100644
+--- a/src/google/protobuf/stubs/atomicops.h
++++ b/src/google/protobuf/stubs/atomicops.h
+@@ -162,7 +162,7 @@ Atomic64 Release_Load(volatile const Atomic64* ptr);
+ 
+ // Include our platform specific implementation.
+ #define GOOGLE_PROTOBUF_ATOMICOPS_ERROR \
+-#error "Atomic operations are not supported on your platform"
++"Atomic operations are not supported on your platform"
+ 
+ // ThreadSanitizer, http://clang.llvm.org/docs/ThreadSanitizer.html.
+ #if defined(THREAD_SANITIZER)
+@@ -172,7 +172,7 @@ Atomic64 Release_Load(volatile const Atomic64* ptr);
+ #if defined(GOOGLE_PROTOBUF_ARCH_IA32) || defined(GOOGLE_PROTOBUF_ARCH_X64)
+ #include <google/protobuf/stubs/atomicops_internals_x86_msvc.h>
+ #else
+-GOOGLE_PROTOBUF_ATOMICOPS_ERROR
++#error GOOGLE_PROTOBUF_ATOMICOPS_ERROR
+ #endif
+ 
+ // Solaris
+@@ -203,15 +203,15 @@ GOOGLE_PROTOBUF_ATOMICOPS_ERROR
+ #if __has_extension(c_atomic)
+ #include <google/protobuf/stubs/atomicops_internals_generic_gcc.h>
+ #else
+-GOOGLE_PROTOBUF_ATOMICOPS_ERROR
++#error GOOGLE_PROTOBUF_ATOMICOPS_ERROR
+ #endif
+ #else
+-GOOGLE_PROTOBUF_ATOMICOPS_ERROR
++#error GOOGLE_PROTOBUF_ATOMICOPS_ERROR
+ #endif
+ 
+ // Unknown.
+ #else
+-GOOGLE_PROTOBUF_ATOMICOPS_ERROR
++#error GOOGLE_PROTOBUF_ATOMICOPS_ERROR
+ #endif
+ 
+ // On some platforms we need additional declarations to make AtomicWord
+-- 
+2.5.0
+
diff --git a/package/protobuf/0002-configure.ac-check-if-libatomic-is-needed.patch b/package/protobuf/0002-configure.ac-check-if-libatomic-is-needed.patch
new file mode 100644
index 0000000..a70a23e
--- /dev/null
+++ b/package/protobuf/0002-configure.ac-check-if-libatomic-is-needed.patch
@@ -0,0 +1,34 @@
+From f020fe05a20dfcd16cd7df833dcf3cdeef770538 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Thu, 11 Feb 2016 10:58:35 -0200
+Subject: [PATCH 2/2] configure.ac: check if libatomic is needed
+
+Compilation of protobuf for PowerPC and SPARC may fail due to missing
+references to __atomic_fetch_add_4 and __atomic_compare_exchange_4.
+
+The __atomic_*() intrinsics for all sizes are provided by libatomic when
+gcc is >= 4.8. This can be achieved by adding this to configure.ac:
+
+    AC_SEARCH_LIBS([__atomic_fetch_add_4], [atomic])
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index c07067c..88d4a0d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -139,6 +139,8 @@ AM_CONDITIONAL([USE_EXTERNAL_PROTOC], [test "$with_protoc" != "no"])
+ ACX_PTHREAD
+ AC_CXX_STL_HASH
+ 
++AC_SEARCH_LIBS([__atomic_load_4], [atomic])
++
+ case "$target_os" in
+   mingw* | cygwin* | win*)
+     ;;
+-- 
+2.5.0
+
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 3d4320b..3215a07 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -1,5 +1,22 @@
 # See src/google/protobuf/stubs/platform_macros.h for supported archs.
-# PowerPC doesn't actually work.
+#
+# On PowerPC, the __atomic_*() built-ins for 1-byte, 2-byte and 4-byte
+# types are available built-in. However, the __atomic_*() built-ins for
+# 8-byte types is implemented via libatomic, so only available since gcc
+# 4.8.
+#
+# In Buildroot, to simplify things, we've decided to simply require gcc
+# 4.8 as soon as the architectures has at least one __atomic_*() built-in
+# variant that requires libatomic.
+#
+# Since protobuf most likely only uses the 1, 2 and 4-byte variants, it
+# *could* technically build with gcc 4.7. This is probably not a big deal,
+# and we can live with requiring gcc 4.8 on PowerPC to build protobuf. 
+#
+# The SPARC64 build fails due to a missing definition of Atomic64. This
+# has been fixed on the master branch but the build still breaks due to
+# undefined references to internal NoBarrier_Atomic*() functions.
+#
 # host-protobuf only builds on certain architectures
 config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	bool
@@ -7,6 +24,8 @@ config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	default y if BR2_i386
 	default y if BR2_mipsel
 	default y if BR2_x86_64
+	default y if BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_sparc64 # missing definition of Atomic64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 
 config BR2_PACKAGE_PROTOBUF
