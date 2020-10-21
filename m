From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 21 Oct 2020 17:18:35 +0200
Subject: [Buildroot] [PATCH 1/4] package/libabseil-cpp: bump version to
 20200923.2
Message-ID: <20201021151839.31731-1-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* removed patch 0003 as it is now in upstream
* removed patch 0002 as the logic has been reworked
* adjusted patch 0001 offset

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 ...0001-force-position-independent-code.patch |  2 +-
 ...g-use-execinfo.h-only-when-available.patch | 63 ---------------
 .../0003-Fix-build-on-riscv32-675.patch       | 77 -------------------
 package/libabseil-cpp/libabseil-cpp.hash      |  2 +-
 package/libabseil-cpp/libabseil-cpp.mk        |  2 +-
 5 files changed, 3 insertions(+), 143 deletions(-)
 delete mode 100644 package/libabseil-cpp/0002-absl-debugging-use-execinfo.h-only-when-available.patch
 delete mode 100644 package/libabseil-cpp/0003-Fix-build-on-riscv32-675.patch

diff --git a/package/libabseil-cpp/0001-force-position-independent-code.patch b/package/libabseil-cpp/0001-force-position-independent-code.patch
index 997d75597e..6bf46bf0cb 100644
--- a/package/libabseil-cpp/0001-force-position-independent-code.patch
+++ b/package/libabseil-cpp/0001-force-position-independent-code.patch
@@ -24,7 +24,7 @@ diff --git a/CMake/AbseilHelpers.cmake b/CMake/AbseilHelpers.cmake
 index 86ff9eb..bdb7a89 100644
 --- a/CMake/AbseilHelpers.cmake
 +++ b/CMake/AbseilHelpers.cmake
-@@ -207,6 +207,8 @@ function(absl_cc_library)
+@@ -209,6 +209,8 @@ function(absl_cc_library)
      set_property(TARGET ${_NAME} PROPERTY CXX_STANDARD ${ABSL_CXX_STANDARD})
      set_property(TARGET ${_NAME} PROPERTY CXX_STANDARD_REQUIRED ON)
  
diff --git a/package/libabseil-cpp/0002-absl-debugging-use-execinfo.h-only-when-available.patch b/package/libabseil-cpp/0002-absl-debugging-use-execinfo.h-only-when-available.patch
deleted file mode 100644
index dd40d4138f..0000000000
--- a/package/libabseil-cpp/0002-absl-debugging-use-execinfo.h-only-when-available.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 445907a8a98e5d14f9c0042aa6849bdad4b0af5b Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Thu, 23 Jul 2020 22:28:55 +0200
-Subject: [PATCH] absl/debugging: use <execinfo.h> only when available
-
-Instead of relying on __GLIBC__ or other unreliable detection
-mechanism, simply detect if <execinfo.h> is available before using the
-stacktrace_generic-inl.inc implementation.
-
-Upstream: https://github.com/abseil/abseil-cpp/pull/746
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- absl/debugging/CMakeLists.txt               | 7 +++++++
- absl/debugging/internal/stacktrace_config.h | 6 +++---
- 2 files changed, 10 insertions(+), 3 deletions(-)
-
-diff --git a/absl/debugging/CMakeLists.txt b/absl/debugging/CMakeLists.txt
-index 7733615..285c5a8 100644
---- a/absl/debugging/CMakeLists.txt
-+++ b/absl/debugging/CMakeLists.txt
-@@ -14,6 +14,13 @@
- # limitations under the License.
- #
- 
-+include(CheckIncludeFileCXX)
-+
-+check_include_file_cxx(execinfo.h HAVE_EXECINFO_H)
-+if(HAVE_EXECINFO_H)
-+    add_definitions(-DHAVE_EXECINFO_H)
-+endif()
-+
- absl_cc_library(
-   NAME
-     stacktrace
-diff --git a/absl/debugging/internal/stacktrace_config.h b/absl/debugging/internal/stacktrace_config.h
-index d4e8480..2e17ca3 100644
---- a/absl/debugging/internal/stacktrace_config.h
-+++ b/absl/debugging/internal/stacktrace_config.h
-@@ -40,7 +40,7 @@
- # elif defined(__aarch64__)
- #define ABSL_STACKTRACE_INL_HEADER \
-     "absl/debugging/internal/stacktrace_aarch64-inl.inc"
--# elif defined(__arm__)
-+# elif defined(__arm__) && defined(HAVE_EXECINFO_H)
- // Note: When using glibc this may require -funwind-tables to function properly.
- #define ABSL_STACKTRACE_INL_HEADER \
-   "absl/debugging/internal/stacktrace_generic-inl.inc"
-@@ -49,10 +49,10 @@
-    "absl/debugging/internal/stacktrace_unimplemented-inl.inc"
- # endif
- #else  // defined(NO_FRAME_POINTER)
--# if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)
-+# if (defined(__i386__) || defined(__x86_64__) || defined(__aarch64__)) && defined(HAVE_EXECINFO_H)
- #define ABSL_STACKTRACE_INL_HEADER \
-     "absl/debugging/internal/stacktrace_generic-inl.inc"
--# elif defined(__ppc__) || defined(__PPC__)
-+# elif (defined(__ppc__) || defined(__PPC__)) && defined(HAVE_EXECINFO_H)
- #define ABSL_STACKTRACE_INL_HEADER \
-     "absl/debugging/internal/stacktrace_generic-inl.inc"
- # else
--- 
-2.26.2
-
diff --git a/package/libabseil-cpp/0003-Fix-build-on-riscv32-675.patch b/package/libabseil-cpp/0003-Fix-build-on-riscv32-675.patch
deleted file mode 100644
index 0077c5fe9b..0000000000
--- a/package/libabseil-cpp/0003-Fix-build-on-riscv32-675.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 3f347c46272886a099852a4cd303ecf37a054de8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 18 May 2020 10:23:50 -0700
-Subject: [PATCH] Fix build on riscv32 (#675)
-
-[Backport from upstream commit 3f347c46272886a099852a4cd303ecf37a054de8]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- absl/base/internal/direct_mmap.h        | 5 +++++
- absl/base/internal/spinlock_linux.inc   | 8 ++++++++
- absl/synchronization/internal/waiter.cc | 8 ++++++++
- 3 files changed, 21 insertions(+)
-
-diff --git a/absl/base/internal/direct_mmap.h b/absl/base/internal/direct_mmap.h
-index 5618867..16accf0 100644
---- a/absl/base/internal/direct_mmap.h
-+++ b/absl/base/internal/direct_mmap.h
-@@ -61,6 +61,10 @@ extern "C" void* __mmap2(void*, size_t, int, int, int, size_t);
- #endif
- #endif  // __BIONIC__
- 
-+#if defined(__NR_mmap2) && !defined(SYS_mmap2)
-+#define SYS_mmap2 __NR_mmap2
-+#endif
-+
- namespace absl {
- ABSL_NAMESPACE_BEGIN
- namespace base_internal {
-@@ -72,6 +76,7 @@ inline void* DirectMmap(void* start, size_t length, int prot, int flags, int fd,
- #if defined(__i386__) || defined(__ARM_ARCH_3__) || defined(__ARM_EABI__) || \
-     (defined(__mips__) && _MIPS_SIM == _MIPS_SIM_ABI32) ||                   \
-     (defined(__PPC__) && !defined(__PPC64__)) ||                             \
-+    (defined(__riscv) && __riscv_xlen == 32) ||                              \
-     (defined(__s390__) && !defined(__s390x__))
-   // On these architectures, implement mmap with mmap2.
-   static int pagesize = 0;
-diff --git a/absl/base/internal/spinlock_linux.inc b/absl/base/internal/spinlock_linux.inc
-index 323edd6..e31c6ed 100644
---- a/absl/base/internal/spinlock_linux.inc
-+++ b/absl/base/internal/spinlock_linux.inc
-@@ -46,6 +46,14 @@ static_assert(sizeof(std::atomic<uint32_t>) == sizeof(int),
- #endif
- #endif
- 
-+#if defined(__NR_futex_time64) && !defined(SYS_futex_time64)
-+#define SYS_futex_time64 __NR_futex_time64
-+#endif
-+
-+#if defined(SYS_futex_time64) && !defined(SYS_futex)
-+#define SYS_futex SYS_futex_time64
-+#endif
-+
- extern "C" {
- 
- ABSL_ATTRIBUTE_WEAK void AbslInternalSpinLockDelay(
-diff --git a/absl/synchronization/internal/waiter.cc b/absl/synchronization/internal/waiter.cc
-index 2949f5a..b6150b9 100644
---- a/absl/synchronization/internal/waiter.cc
-+++ b/absl/synchronization/internal/waiter.cc
-@@ -86,6 +86,14 @@ static void MaybeBecomeIdle() {
- #endif
- #endif
- 
-+#if defined(__NR_futex_time64) && !defined(SYS_futex_time64)
-+#define SYS_futex_time64 __NR_futex_time64
-+#endif
-+
-+#if defined(SYS_futex_time64) && !defined(SYS_futex)
-+#define SYS_futex SYS_futex_time64
-+#endif
-+
- class Futex {
-  public:
-   static int WaitUntil(std::atomic<int32_t> *v, int32_t val,
--- 
-2.26.2
-
diff --git a/package/libabseil-cpp/libabseil-cpp.hash b/package/libabseil-cpp/libabseil-cpp.hash
index fef96833de..63c4b86d3e 100644
--- a/package/libabseil-cpp/libabseil-cpp.hash
+++ b/package/libabseil-cpp/libabseil-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f41868f7a938605c92936230081175d1eae87f6ea2c248f41077c8f88316f111  libabseil-cpp-20200225.2.tar.gz
+sha256  bf3f13b13a0095d926b25640e060f7e13881bd8a792705dd9e161f3c2b9aa976  libabseil-cpp-20200923.2.tar.gz
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE
diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
index 6ca33535eb..dfcf892f65 100644
--- a/package/libabseil-cpp/libabseil-cpp.mk
+++ b/package/libabseil-cpp/libabseil-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBABSEIL_CPP_VERSION = 20200225.2
+LIBABSEIL_CPP_VERSION = 20200923.2
 LIBABSEIL_CPP_SITE = $(call github,abseil,abseil-cpp,$(LIBABSEIL_CPP_VERSION))
 LIBABSEIL_CPP_LICENSE = Apache-2.0
 LIBABSEIL_CPP_LICENSE_FILES = LICENSE
-- 
2.25.1
