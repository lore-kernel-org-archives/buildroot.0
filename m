From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 10 Feb 2016 13:33:12 -0200
Subject: [Buildroot] [PATCH 1/1] protobuf: fix detection of __atomic_*()
	built-ins
In-Reply-To: <1453986515-9505-1-git-send-email-casantos@datacom.ind.br>
References: <1453986515-9505-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <1455118392-3965-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Use the recently introduced BR2_TOOLCHAIN_HAS_ATOMIC boolean.

- Import an upstream patch to fix error handling when atomic operations
  are not detected. Without this patch the build fails due to a syntax
  error instead of showing the proper message.

- Add a patch to configure.ac to check if libatomic is needed and force
  linking to it (this patch would unlikely be accepted upstream).

On PowerPC, the __atomic_*() built-ins for 1-byte, 2-byte and 4-byte
types are available built-in. However, the __atomic_*() built-ins for
8-byte types is implemented via libatomic, so only available since gcc
4.8.

In Buildroot, to simplify things, we've decided to simply require gcc 4.8
as soon as the architectures has at least one __atomic_*() built-in
variant that requires libatomic.

Since protobuf most likely only uses the 1, 2 and 4-byte variants, it
*could* technically build with gcc 4.7. This is probably not a big deal,
and we can live with requiring gcc 4.8 on PowerPC to build protobuf.

Signed-off-by: Henrique Marks <henrique.marks@datacom.ind.br>
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 ...GLE_PROTOBUF_ATOMICOPS_ERROR-syntax-error.patch | 61 ++++++++++++++++++++++
 ...configure.ac-check-if-libatomic-is-needed.patch | 34 ++++++++++++
 package/protobuf/Config.in                         | 20 +++++--
 3 files changed, 110 insertions(+), 5 deletions(-)
 create mode 100644 package/protobuf/0001-Fix-GOOGLE_PROTOBUF_ATOMICOPS_ERROR-syntax-error.patch
 create mode 100644 package/protobuf/0002-configure.ac-check-if-libatomic-is-needed.patch

diff --git a/package/protobuf/0001-Fix-GOOGLE_PROTOBUF_ATOMICOPS_ERROR-syntax-error.patch b/package/protobuf/0001-Fix-GOOGLE_PROTOBUF_ATOMICOPS_ERROR-syntax-error.patch
new file mode 100644
index 0000000..a46e459
--- /dev/null
+++ b/package/protobuf/0001-Fix-GOOGLE_PROTOBUF_ATOMICOPS_ERROR-syntax-error.patch
@@ -0,0 +1,61 @@
+From 7ad8690c5d8a875881ba00c3551595a2676538ef Mon Sep 17 00:00:00 2001
+From: George Redivo <george.redivo@datacom.ind.br>
+Date: Mon, 6 Jul 2015 16:56:41 -0300
+Subject: [PATCH] Fix GOOGLE_PROTOBUF_ATOMICOPS_ERROR syntax error
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+It's not possible to define "#error" inside a define.
+It causes 'error: stray ?#? in program' compilation error.
+
+Now the define GOOGLE_PROTOBUF_ATOMICOPS_ERROR is the error message
+and it's used along the code together "#error".
+---
+ src/google/protobuf/stubs/atomicops.h | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/google/protobuf/stubs/atomicops.h b/src/google/protobuf/stubs/atomicops.h
+index cd20caa..5fa31b0 100644
+--- a/src/google/protobuf/stubs/atomicops.h
++++ b/src/google/protobuf/stubs/atomicops.h
+@@ -173,7 +173,7 @@ Atomic64 Release_Load(volatile const Atomic64* ptr);
+ 
+ // Include our platform specific implementation.
+ #define GOOGLE_PROTOBUF_ATOMICOPS_ERROR \
+-#error "Atomic operations are not supported on your platform"
++"Atomic operations are not supported on your platform"
+ 
+ // ThreadSanitizer, http://clang.llvm.org/docs/ThreadSanitizer.html.
+ #if defined(THREAD_SANITIZER)
+@@ -183,7 +183,7 @@ Atomic64 Release_Load(volatile const Atomic64* ptr);
+ #if defined(GOOGLE_PROTOBUF_ARCH_IA32) || defined(GOOGLE_PROTOBUF_ARCH_X64)
+ #include <google/protobuf/stubs/atomicops_internals_x86_msvc.h>
+ #else
+-GOOGLE_PROTOBUF_ATOMICOPS_ERROR
++#error GOOGLE_PROTOBUF_ATOMICOPS_ERROR
+ #endif
+ 
+ // Solaris
+@@ -218,15 +218,15 @@ GOOGLE_PROTOBUF_ATOMICOPS_ERROR
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
index 0000000..237bc71
--- /dev/null
+++ b/package/protobuf/0002-configure.ac-check-if-libatomic-is-needed.patch
@@ -0,0 +1,34 @@
+From 0883fa19d59ece19eec30937c65fd10162ef57b0 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Wed, 10 Feb 2016 12:54:43 -0200
+Subject: [PATCH] configure.ac: check if libatomic is needed
+
+In Buildroot, to simplify things, we've decided to simply require gcc 4.8
+as soon as the architectures has at least one __atomic_*() built-in
+variant that requires libatomic.
+
+Since protobuf most likely only uses the 1, 2 and 4-byte variants, it
+*could* technically build with gcc 4.7. This is probably not a big deal,
+and we can live with requiring gcc 4.8 on PowerPC to build protobuf.
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
index 3d4320b..f4f428a 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -1,12 +1,22 @@
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
 # host-protobuf only builds on certain architectures
 config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	bool
-	default y if BR2_arm
-	default y if BR2_i386
-	default y if BR2_mipsel
-	default y if BR2_x86_64
+	default y if BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 
 config BR2_PACKAGE_PROTOBUF
-- 
2.5.0
