From: aduskett at gmail.com <aduskett@gmail.com>
Date: Thu,  5 Dec 2019 13:01:55 -0800
Subject: [Buildroot] [PATCH v3 1/1] package/grpc: bump to version 1.25.0
Message-ID: <20191205210155.2705242-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Other changes:
  - Remove upstream patch 0004-Fix-gettid-naming-conflict.patch
  - Remove upstream patch 0005-Rename-gettid-functions.patch
  - Add a check for BR2_TOOLCHAIN_GCC_AT_LEAST_5 in grpc.mk. If the selected
    toolchain is not at least version 5 or higher, set the GRPC_CFLAGS and
    GRPC_CXXFLAGS optimizations to -O0. This check prevents the following error:
      error: failure memory model cannot be stronger than success memory
      model for '__atomic_compare_exchange'

Tested with test-pkg, all tests passed:
            br-arm-full [1/6]: OK
 br-arm-cortex-a9-glibc [2/6]: OK
  br-arm-cortex-m4-full [3/6]: SKIPPED
         br-x86-64-musl [4/6]: OK
     br-arm-full-static [5/6]: SKIPP

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
  - Fix the hceck for BR2_TOOLCHAIN_GCC_AT_LEAST_5. It should have read ifneq
    not ifeq.

Changes v2 -> v3:
  - Move the comment explaining why CFLAGS and CXX flags are being set to -O0
    if BR2_TOOLCHAIN_GCC_AT_LEAST_5 is not selected to the appropriate place.
    (Yann)
    
  - Remove the # protobuf from depends on BR2_INSTALL_LIBSTDCPP as grpc now
    requires C++ on it's own. (Yann)

 .../0001-target-build-using-host-plugin.patch |  4 +-
 ...the-availability-of-pthread_setname_.patch |  8 +-
 .../0004-Fix-gettid-naming-conflict.patch     | 36 --------
 .../grpc/0005-Rename-gettid-functions.patch   | 83 -------------------
 package/grpc/Config.in                        |  2 +-
 package/grpc/grpc.hash                        |  2 +-
 package/grpc/grpc.mk                          | 10 ++-
 7 files changed, 17 insertions(+), 128 deletions(-)
 delete mode 100644 package/grpc/0004-Fix-gettid-naming-conflict.patch
 delete mode 100644 package/grpc/0005-Rename-gettid-functions.patch

diff --git a/package/grpc/0001-target-build-using-host-plugin.patch b/package/grpc/0001-target-build-using-host-plugin.patch
index 5993987bc8..2da657762f 100644
--- a/package/grpc/0001-target-build-using-host-plugin.patch
+++ b/package/grpc/0001-target-build-using-host-plugin.patch
@@ -20,7 +20,7 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index fc76cf5..7a22b08 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -13108,6 +13108,18 @@ target_link_libraries(grpc_cli
+@@ -13420,6 +13420,18 @@ target_link_libraries(grpc_cli
  endif (gRPC_BUILD_TESTS)
  if (gRPC_BUILD_CODEGEN)
  
@@ -39,7 +39,7 @@ index fc76cf5..7a22b08 100644
  add_executable(grpc_cpp_plugin
    src/compiler/cpp_plugin.cc
  )
-@@ -13143,6 +13155,7 @@ if (gRPC_INSTALL)
+@@ -13457,6 +13469,7 @@ if (gRPC_INSTALL)
      ARCHIVE DESTINATION ${gRPC_INSTALL_LIBDIR}
    )
  endif()
diff --git a/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch b/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch
index 14807999b8..86586d850b 100644
--- a/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch
+++ b/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch
@@ -20,7 +20,7 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index 89e834b..c7bd2ad 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -94,6 +94,12 @@ endif()
+@@ -97,6 +97,12 @@ endif()
  
  set(CMAKE_POSITION_INDEPENDENT_CODE TRUE)
  
@@ -30,14 +30,14 @@ index 89e834b..c7bd2ad 100644
 +  add_definitions(-DHAVE_PTHREAD_SETNAME_NP)
 +endif ()
 +
- add_definitions(-DPB_FIELD_32BIT)
- 
  if (MSVC)
+   include(cmake/msvc_static_runtime.cmake)
+   add_definitions(-D_WIN32_WINNT=0x600 -D_SCL_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_WARNINGS -D_WINSOCK_DEPRECATED_NO_WARNINGS)
 diff --git a/include/grpc/impl/codegen/port_platform.h b/include/grpc/impl/codegen/port_platform.h
 index 031c0c3..a29a9dc 100644
 --- a/include/grpc/impl/codegen/port_platform.h
 +++ b/include/grpc/impl/codegen/port_platform.h
-@@ -173,7 +173,9 @@
+@@ -181,7 +181,9 @@
  #endif /* _LP64 */
  #ifdef __GLIBC__
  #define GPR_POSIX_CRASH_HANDLER 1
diff --git a/package/grpc/0004-Fix-gettid-naming-conflict.patch b/package/grpc/0004-Fix-gettid-naming-conflict.patch
deleted file mode 100644
index 05b9f2fd5b..0000000000
--- a/package/grpc/0004-Fix-gettid-naming-conflict.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From de6255941a5e1c2fb2d50e57f84e38c09f45023d Mon Sep 17 00:00:00 2001
-From: Juanli Shen <juanlishen@google.com>
-Date: Fri, 23 Aug 2019 08:46:09 -0700
-Subject: [PATCH] Fix gettid() naming conflict
-
-[Retrieved from:
-https://github.com/grpc/grpc/commit/de6255941a5e1c2fb2d50e57f84e38c09f45023d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/core/lib/gpr/log_linux.cc | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/core/lib/gpr/log_linux.cc b/src/core/lib/gpr/log_linux.cc
-index 561276f0c20..81026e5689b 100644
---- a/src/core/lib/gpr/log_linux.cc
-+++ b/src/core/lib/gpr/log_linux.cc
-@@ -40,7 +40,9 @@
- #include <time.h>
- #include <unistd.h>
- 
--static long gettid(void) { return syscall(__NR_gettid); }
-+// Not naming it as gettid() to avoid duplicate declarations when complied with
-+// GCC 9.1.
-+static long local_gettid(void) { return syscall(__NR_gettid); }
- 
- void gpr_log(const char* file, int line, gpr_log_severity severity,
-              const char* format, ...) {
-@@ -70,7 +72,7 @@ void gpr_default_log(gpr_log_func_args* args) {
-   gpr_timespec now = gpr_now(GPR_CLOCK_REALTIME);
-   struct tm tm;
-   static __thread long tid = 0;
--  if (tid == 0) tid = gettid();
-+  if (tid == 0) tid = local_gettid();
- 
-   timer = static_cast<time_t>(now.tv_sec);
-   final_slash = strrchr(args->file, '/');
diff --git a/package/grpc/0005-Rename-gettid-functions.patch b/package/grpc/0005-Rename-gettid-functions.patch
deleted file mode 100644
index 1de483572c..0000000000
--- a/package/grpc/0005-Rename-gettid-functions.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 57586a1ca7f17b1916aed3dea4ff8de872dbf853 Mon Sep 17 00:00:00 2001
-From: Benjamin Peterson <benjamin@dropbox.com>
-Date: Fri, 3 May 2019 08:11:00 -0700
-Subject: [PATCH] Rename gettid() functions.
-
-glibc 2.30 will declare its own gettid; see https://sourceware.org/git/?p=glibc.git;a=commit;h=1d0fc213824eaa2a8f8c4385daaa698ee8fb7c92. Rename the grpc versions to avoid naming conflicts.
-[Retrieved from:
-https://github.com/grpc/grpc/commit/57586a1ca7f17b1916aed3dea4ff8de872dbf853]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/core/lib/gpr/log_linux.cc          | 6 ++----
- src/core/lib/gpr/log_posix.cc          | 4 ++--
- src/core/lib/iomgr/ev_epollex_linux.cc | 4 ++--
- 3 files changed, 6 insertions(+), 8 deletions(-)
-
-diff --git a/src/core/lib/gpr/log_linux.cc b/src/core/lib/gpr/log_linux.cc
-index 81026e5689b..8b597b4cf2f 100644
---- a/src/core/lib/gpr/log_linux.cc
-+++ b/src/core/lib/gpr/log_linux.cc
-@@ -40,9 +40,7 @@
- #include <time.h>
- #include <unistd.h>
- 
--// Not naming it as gettid() to avoid duplicate declarations when complied with
--// GCC 9.1.
--static long local_gettid(void) { return syscall(__NR_gettid); }
-+static long sys_gettid(void) { return syscall(__NR_gettid); }
- 
- void gpr_log(const char* file, int line, gpr_log_severity severity,
-              const char* format, ...) {
-@@ -72,7 +70,7 @@ void gpr_default_log(gpr_log_func_args* args) {
-   gpr_timespec now = gpr_now(GPR_CLOCK_REALTIME);
-   struct tm tm;
-   static __thread long tid = 0;
--  if (tid == 0) tid = local_gettid();
-+  if (tid == 0) tid = sys_gettid();
- 
-   timer = static_cast<time_t>(now.tv_sec);
-   final_slash = strrchr(args->file, '/');
-diff --git a/src/core/lib/gpr/log_posix.cc b/src/core/lib/gpr/log_posix.cc
-index b6edc14ab6b..2f7c6ce3760 100644
---- a/src/core/lib/gpr/log_posix.cc
-+++ b/src/core/lib/gpr/log_posix.cc
-@@ -31,7 +31,7 @@
- #include <string.h>
- #include <time.h>
- 
--static intptr_t gettid(void) { return (intptr_t)pthread_self(); }
-+static intptr_t sys_gettid(void) { return (intptr_t)pthread_self(); }
- 
- void gpr_log(const char* file, int line, gpr_log_severity severity,
-              const char* format, ...) {
-@@ -86,7 +86,7 @@ void gpr_default_log(gpr_log_func_args* args) {
-   char* prefix;
-   gpr_asprintf(&prefix, "%s%s.%09d %7" PRIdPTR " %s:%d]",
-                gpr_log_severity_string(args->severity), time_buffer,
--               (int)(now.tv_nsec), gettid(), display_file, args->line);
-+               (int)(now.tv_nsec), sys_gettid(), display_file, args->line);
- 
-   fprintf(stderr, "%-70s %s\n", prefix, args->message);
-   gpr_free(prefix);
-diff --git a/src/core/lib/iomgr/ev_epollex_linux.cc b/src/core/lib/iomgr/ev_epollex_linux.cc
-index c2d80c08ddb..4a83cb6c215 100644
---- a/src/core/lib/iomgr/ev_epollex_linux.cc
-+++ b/src/core/lib/iomgr/ev_epollex_linux.cc
-@@ -1077,7 +1077,7 @@ static void end_worker(grpc_pollset* pollset, grpc_pollset_worker* worker,
- }
- 
- #ifndef NDEBUG
--static long gettid(void) { return syscall(__NR_gettid); }
-+static long sys_gettid(void) { return syscall(__NR_gettid); }
- #endif
- 
- /* pollset->mu lock must be held by the caller before calling this.
-@@ -1097,7 +1097,7 @@ static grpc_error* pollset_work(grpc_pollset* pollset,
- #define WORKER_PTR (&worker)
- #endif
- #ifndef NDEBUG
--  WORKER_PTR->originator = gettid();
-+  WORKER_PTR->originator = sys_gettid();
- #endif
-   if (GRPC_TRACE_FLAG_ENABLED(grpc_polling_trace)) {
-     gpr_log(GPR_INFO,
diff --git a/package/grpc/Config.in b/package/grpc/Config.in
index d47d840d65..43f446d8dc 100644
--- a/package/grpc/Config.in
+++ b/package/grpc/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_GRPC
 	bool "grpc"
-	depends on BR2_INSTALL_LIBSTDCPP # protobuf
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 58f32c6b54..5201f72106 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 f56ced18740895b943418fa29575a65cc2396ccfa3159fa40d318ef5f59471f9 grpc-1.23.0.tar.gz
+sha256 ffbe61269160ea745e487f79b0fd06b6edd3d50c6d9123f053b5634737cf2f69 grpc-1.25.0.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 569db12089..f73b987769 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.23.0
+GRPC_VERSION = 1.25.0
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0
 GRPC_LICENSE_FILES = LICENSE
@@ -48,6 +48,14 @@ GRPC_CFLAGS += -O0
 GRPC_CXXFLAGS += -O0
 endif
 
+# Toolchains older than gcc5 will fail to compile with -0s due to:
+# error: failure memory model cannot be stronger than success memory model for
+# '__atomic_compare_exchange'
+ifneq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),y)
+GRPC_CFLAGS += -O0
+GRPC_CXXFLAGS += -O0
+endif
+
 GRPC_CONF_OPTS += \
 	-DCMAKE_C_FLAGS="$(GRPC_CFLAGS)" \
 	-DCMAKE_CXX_FLAGS="$(GRPC_CXXFLAGS)"
-- 
2.23.0
