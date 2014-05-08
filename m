From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  8 May 2014 16:06:50 +0300
Subject: [Buildroot] [PATCH v3] protobuf: fix build for some unsupported
	architectures
Message-ID: <7785bef8562b61c25931c80386ab9a60fe80459f.1399554410.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patches for making use of generic gcc atomic operations for unknown
architectures. Patches taken from
http://code.google.com/p/protobuf/issues/detail?id=488 .

Disable build for architectures that are not supported.

Fixes:
http://autobuild.buildroot.net/results/7e5/7e5791225334096206887de8a38fd947e1f8e9a2/
http://autobuild.buildroot.net/results/cf1/cf147b9188d6787a6a1a6072bf9bc6f7ddf5e5ae/

Cc: Phil Eichinger <phil.eichinger@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v3:
	Propagate dependencies.

v2:
	List supported architectures as dependencies, as this list is much shorter
	than the list of unsupported archs.
---
 package/ola/Config.in                              |   5 +
 package/protobuf/Config.in                         |   4 +
 ...generic-GCC-support-for-atomic-operations.patch | 214 +++++++++++++++++++++
 ...-02-Add-generic-gcc-header-to-Makefile.am.patch |  31 +++
 package/protobuf/protobuf.mk                       |   2 +
 5 files changed, 256 insertions(+)
 create mode 100644 package/protobuf/protobuf-01-Add-generic-GCC-support-for-atomic-operations.patch
 create mode 100644 package/protobuf/protobuf-02-Add-generic-gcc-header-to-Makefile.am.patch

diff --git a/package/ola/Config.in b/package/ola/Config.in
index eb24a3a07cb1..c0fdedf465e3 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -1,5 +1,7 @@
 comment "ola needs a toolchain w/ C++, threads, largefile, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_x86_64 || BR2_i386 || BR2_arm || BR2_aarch64 || \
+		BR2_mipsel || BR2_powerpc
 
 config BR2_PACKAGE_OLA
 	bool "ola (open lighting architecture)"
@@ -10,6 +12,9 @@ config BR2_PACKAGE_OLA
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# protobuf
+	depends on BR2_x86_64 || BR2_i386 || BR2_arm || BR2_aarch64 || \
+		BR2_mipsel || BR2_powerpc
 	help
 	  Open Lighting Architecture provides applications
 	  with a mechanism to send and receive DMX512 & RDM
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index a4f542e0fce1..98e0d398e949 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_PROTOBUF
 	bool "protobuf"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_x86_64 || BR2_i386 || BR2_arm || BR2_aarch64 || \
+	    BR2_mipsel || BR2_powerpc
 	help
 	  Protocol buffers are Google's language-neutral, platform-neutral,
 	  extensible mechanism for serializing structured data.
@@ -9,4 +11,6 @@ config BR2_PACKAGE_PROTOBUF
 	  http://code.google.com/p/protobuf/
 
 comment "protobuf needs a toolchain w/ C++, threads"
+	depends on BR2_x86_64 || BR2_i386 || BR2_arm || BR2_aarch64 || \
+	    BR2_mipsel || BR2_powerpc
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/protobuf/protobuf-01-Add-generic-GCC-support-for-atomic-operations.patch b/package/protobuf/protobuf-01-Add-generic-GCC-support-for-atomic-operations.patch
new file mode 100644
index 000000000000..2b0f9321f9f3
--- /dev/null
+++ b/package/protobuf/protobuf-01-Add-generic-GCC-support-for-atomic-operations.patch
@@ -0,0 +1,214 @@
+From d099ec11fc8c2eb97df2bf2fbb6996066eefca46 Mon Sep 17 00:00:00 2001
+From: Stanislav Ochotnicky <sochotnicky@redhat.com>
+Date: Thu, 2 May 2013 10:43:47 +0200
+Subject: [PATCH] Add generic GCC support for atomic operations
+
+This is useful for architectures where no specialized code has been
+written.
+
+Patch source: Issue #488
+(http://code.google.com/p/protobuf/issues/detail?id=488)
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ src/google/protobuf/stubs/atomicops.h              |   2 +-
+ .../stubs/atomicops_internals_generic_gcc.h        | 139 +++++++++++++++++++++
+ src/google/protobuf/stubs/platform_macros.h        |  14 ++-
+ 3 files changed, 153 insertions(+), 2 deletions(-)
+ create mode 100644 src/google/protobuf/stubs/atomicops_internals_generic_gcc.h
+
+diff --git a/src/google/protobuf/stubs/atomicops.h b/src/google/protobuf/stubs/atomicops.h
+index b8581fa..883b125 100644
+--- a/src/google/protobuf/stubs/atomicops.h
++++ b/src/google/protobuf/stubs/atomicops.h
+@@ -185,7 +185,7 @@ GOOGLE_PROTOBUF_ATOMICOPS_ERROR
+ #elif defined(__pnacl__)
+ #include <google/protobuf/stubs/atomicops_internals_pnacl.h>
+ #else
+-GOOGLE_PROTOBUF_ATOMICOPS_ERROR
++#include <google/protobuf/stubs/atomicops_internals_generic_gcc.h>
+ #endif
+ 
+ // Unknown.
+diff --git a/src/google/protobuf/stubs/atomicops_internals_generic_gcc.h b/src/google/protobuf/stubs/atomicops_internals_generic_gcc.h
+new file mode 100644
+index 0000000..3fc2a9b
+--- /dev/null
++++ b/src/google/protobuf/stubs/atomicops_internals_generic_gcc.h
+@@ -0,0 +1,139 @@
++// Protocol Buffers - Google's data interchange format
++// Copyright 2013 Red Hat Inc.  All rights reserved.
++// http://code.google.com/p/protobuf/
++//
++// Redistribution and use in source and binary forms, with or without
++// modification, are permitted provided that the following conditions are
++// met:
++//
++//     * Redistributions of source code must retain the above copyright
++// notice, this list of conditions and the following disclaimer.
++//     * Redistributions in binary form must reproduce the above
++// copyright notice, this list of conditions and the following disclaimer
++// in the documentation and/or other materials provided with the
++// distribution.
++//     * Neither the name of Red Hat Inc. nor the names of its
++// contributors may be used to endorse or promote products derived from
++// this software without specific prior written permission.
++//
++// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
++// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
++// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
++// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
++// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
++// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
++// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
++// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++
++// This file is an internal atomic implementation, use atomicops.h instead.
++
++#ifndef GOOGLE_PROTOBUF_ATOMICOPS_INTERNALS_GENERIC_GCC_H_
++#define GOOGLE_PROTOBUF_ATOMICOPS_INTERNALS_GENERIC_GCC_H_
++
++namespace google {
++namespace protobuf {
++namespace internal {
++
++inline Atomic32 NoBarrier_CompareAndSwap(volatile Atomic32* ptr,
++                                         Atomic32 old_value,
++                                         Atomic32 new_value) {
++  __atomic_compare_exchange_n(ptr, &old_value, new_value, true,
++                              __ATOMIC_RELAXED, __ATOMIC_RELAXED);
++  return old_value;
++}
++
++inline Atomic32 NoBarrier_AtomicExchange(volatile Atomic32* ptr,
++                                         Atomic32 new_value) {
++  return __atomic_exchange_n(ptr, new_value, __ATOMIC_RELAXED);
++}
++
++inline Atomic32 NoBarrier_AtomicIncrement(volatile Atomic32* ptr,
++                                          Atomic32 increment) {
++  return __atomic_add_fetch(ptr, increment, __ATOMIC_RELAXED);
++}
++
++inline Atomic32 Barrier_AtomicIncrement(volatile Atomic32* ptr,
++                                        Atomic32 increment) {
++  return __atomic_add_fetch(ptr, increment, __ATOMIC_SEQ_CST);
++}
++
++inline Atomic32 Acquire_CompareAndSwap(volatile Atomic32* ptr,
++                                       Atomic32 old_value,
++                                       Atomic32 new_value) {
++  __atomic_compare_exchange(ptr, &old_value, &new_value, true,
++                            __ATOMIC_ACQUIRE, __ATOMIC_ACQUIRE);
++  return old_value;
++}
++
++inline Atomic32 Release_CompareAndSwap(volatile Atomic32* ptr,
++                                       Atomic32 old_value,
++                                       Atomic32 new_value) {
++  __atomic_compare_exchange_n(ptr, &old_value, new_value, true,
++                            __ATOMIC_RELEASE, __ATOMIC_ACQUIRE);
++  return old_value;
++}
++
++inline void NoBarrier_Store(volatile Atomic32* ptr, Atomic32 value) {
++  __atomic_store_n(ptr, value, __ATOMIC_RELAXED);
++}
++
++inline void MemoryBarrier() {
++  __sync_synchronize();
++}
++
++inline void Acquire_Store(volatile Atomic32* ptr, Atomic32 value) {
++  __atomic_store_n(ptr, value, __ATOMIC_ACQUIRE);
++}
++
++inline void Release_Store(volatile Atomic32* ptr, Atomic32 value) {
++  __atomic_store_n(ptr, value, __ATOMIC_RELEASE);
++}
++
++inline Atomic32 NoBarrier_Load(volatile const Atomic32* ptr) {
++  return __atomic_load_n(ptr, __ATOMIC_RELAXED);
++}
++
++inline Atomic32 Acquire_Load(volatile const Atomic32* ptr) {
++  return __atomic_load_n(ptr, __ATOMIC_ACQUIRE);
++}
++
++inline Atomic32 Release_Load(volatile const Atomic32* ptr) {
++  return __atomic_load_n(ptr, __ATOMIC_RELEASE);
++}
++
++#ifdef __LP64__
++
++inline void Release_Store(volatile Atomic64* ptr, Atomic64 value) {
++  __atomic_store_n(ptr, value, __ATOMIC_RELEASE);
++}
++
++inline Atomic64 Acquire_Load(volatile const Atomic64* ptr) {
++  return __atomic_load_n(ptr, __ATOMIC_ACQUIRE);
++}
++
++inline Atomic64 Acquire_CompareAndSwap(volatile Atomic64* ptr,
++                                       Atomic64 old_value,
++                                       Atomic64 new_value) {
++  __atomic_compare_exchange_n(ptr, &old_value, new_value, true,
++                              __ATOMIC_ACQUIRE, __ATOMIC_ACQUIRE);
++  return old_value;
++}
++
++inline Atomic64 NoBarrier_CompareAndSwap(volatile Atomic64* ptr,
++                                         Atomic64 old_value,
++                                         Atomic64 new_value) {
++  __atomic_compare_exchange_n(ptr, &old_value, new_value, true,
++                            __ATOMIC_RELAXED, __ATOMIC_RELAXED);
++  return old_value;
++}
++
++#endif // defined(__LP64__)
++
++}  // namespace internal
++}  // namespace protobuf
++}  // namespace google
++
++#endif  // GOOGLE_PROTOBUF_ATOMICOPS_INTERNALS_GENERIC_GCC_H_
+diff --git a/src/google/protobuf/stubs/platform_macros.h b/src/google/protobuf/stubs/platform_macros.h
+index b1df60e..db691d8 100644
+--- a/src/google/protobuf/stubs/platform_macros.h
++++ b/src/google/protobuf/stubs/platform_macros.h
+@@ -43,6 +43,9 @@
+ #elif defined(_M_IX86) || defined(__i386__)
+ #define GOOGLE_PROTOBUF_ARCH_IA32 1
+ #define GOOGLE_PROTOBUF_ARCH_32_BIT 1
++#elif defined(__aarch64__)
++#define GOOGLE_PROTOBUF_ARCH_AARCH64 1
++#define GOOGLE_PROTOBUF_ARCH_64_BIT 1
+ #elif defined(__QNX__)
+ #define GOOGLE_PROTOBUF_ARCH_ARM_QNX 1
+ #define GOOGLE_PROTOBUF_ARCH_32_BIT 1
+@@ -54,9 +57,18 @@
+ #define GOOGLE_PROTOBUF_ARCH_32_BIT 1
+ #elif defined(__pnacl__)
+ #define GOOGLE_PROTOBUF_ARCH_32_BIT 1
+-#elif defined(__ppc__)
++#elif defined(__ppc64__) || defined(__PPC64__)
++#define GOOGLE_PROTOBUF_ARCH_PPC64 1
++#define GOOGLE_PROTOBUF_ARCH_64_BIT 1
++#elif defined(__ppc__) || defined(__PPC__)
+ #define GOOGLE_PROTOBUF_ARCH_PPC 1
+ #define GOOGLE_PROTOBUF_ARCH_32_BIT 1
++#elif defined(__s390x__)
++#define GOOGLE_PROTOBUF_ARCH_64_BIT 1
++#define GOOGLE_PROTOBUF_ARCH_S390X 1
++#elif defined(__s390__)
++#define GOOGLE_PROTOBUF_ARCH_32_BIT 1
++#define GOOGLE_PROTOBUF_ARCH_S390 1
+ #else
+ #error Host architecture was not detected as supported by protobuf
+ #endif
+-- 
+1.8.1.4
+
diff --git a/package/protobuf/protobuf-02-Add-generic-gcc-header-to-Makefile.am.patch b/package/protobuf/protobuf-02-Add-generic-gcc-header-to-Makefile.am.patch
new file mode 100644
index 000000000000..c53c98a36f57
--- /dev/null
+++ b/package/protobuf/protobuf-02-Add-generic-gcc-header-to-Makefile.am.patch
@@ -0,0 +1,31 @@
+From b53d00e42cdc4a4b57e31d58244cb46b3b05bd6a Mon Sep 17 00:00:00 2001
+From: Stanislav Ochotnicky <sochotnicky@redhat.com>
+Date: Thu, 16 May 2013 12:01:10 +0200
+Subject: [PATCH] Add generic gcc header to Makefile.am
+
+This way it will get included properly during installation and
+distribution generation
+
+Patch source: Issue #488
+(http://code.google.com/p/protobuf/issues/detail?id=488)
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+ src/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 4069603..2458ceb 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -42,6 +42,7 @@ nobase_include_HEADERS =                                        \
+   google/protobuf/stubs/atomicops_internals_arm_gcc.h           \
+   google/protobuf/stubs/atomicops_internals_arm_qnx.h           \
+   google/protobuf/stubs/atomicops_internals_atomicword_compat.h \
++  google/protobuf/stubs/atomicops_internals_generic_gcc.h       \
+   google/protobuf/stubs/atomicops_internals_macosx.h            \
+   google/protobuf/stubs/atomicops_internals_mips_gcc.h          \
+   google/protobuf/stubs/atomicops_internals_pnacl.h             \
+-- 
+1.8.1.4
+
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index ceb64dfa63fb..04da975a2452 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -12,6 +12,8 @@ PROTOBUF_LICENSE_FILES = COPYING.txt
 # N.B. Need to use host protoc during cross compilation.
 PROTOBUF_DEPENDENCIES = host-protobuf
 PROTOBUF_CONF_OPT = --with-protoc=$(HOST_DIR)/usr/bin/protoc
+# Patching Makefile.am
+PROTOBUF_AUTORECONF = YES
 
 PROTOBUF_INSTALL_STAGING = YES
 
-- 
2.0.0.rc0
