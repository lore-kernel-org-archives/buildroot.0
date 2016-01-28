From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 28 Jan 2016 11:08:35 -0200
Subject: [Buildroot] [PATCH 1/1] protobuf: apply patch to compile for PowerPC
Message-ID: <1453986515-9505-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Henrique Marks <henrique.marks@datacom.ind.br>

Signed-off-by: Henrique Marks <henrique.marks@datacom.ind.br>
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/protobuf/0001-PowerPC-Support.patch | 54 +++++++++++++++++++++++++++++
 package/protobuf/Config.in                  |  5 ++-
 2 files changed, 56 insertions(+), 3 deletions(-)
 create mode 100644 package/protobuf/0001-PowerPC-Support.patch

diff --git a/package/protobuf/0001-PowerPC-Support.patch b/package/protobuf/0001-PowerPC-Support.patch
new file mode 100644
index 0000000..aee3717
--- /dev/null
+++ b/package/protobuf/0001-PowerPC-Support.patch
@@ -0,0 +1,54 @@
+From d56c6b19b18dc459c1ea6b720ef015afe72757ea Mon Sep 17 00:00:00 2001
+From: Henrique Marks <henrique.marks@datacom.ind.br>
+Date: Fri, 28 Aug 2015 18:55:49 -0300
+Subject: [PATCH 1/1] Syntax Error Patch
+
+Signed-off-by: Henrique Marks <henrique.marks@datacom.ind.br>
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
+1.9.1
+
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 9ee7e7d..3899ac1 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -3,8 +3,7 @@ config BR2_PACKAGE_PROTOBUF
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	# See src/google/protobuf/stubs/platform_macros.h for supported archs.
-	# PowerPC doesn't actually work.
-	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
+	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64 || BR2_powerpc
 	# host-protobuf only builds on certain architectures
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
@@ -17,5 +16,5 @@ config BR2_PACKAGE_PROTOBUF
 comment "protobuf needs a toolchain w/ C++, threads, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| BR2_STATIC_LIBS
-	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
+	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64 || BR2_powerpc
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-- 
2.5.0
