From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 21 Jul 2020 14:45:22 -0700
Subject: [Buildroot] [PATCH v2 2/2] package/grpc: bump version to 1.30.2
In-Reply-To: <20200721214522.3719304-1-aduskett@gmail.com>
References: <20200721214522.3719304-1-aduskett@gmail.com>
Message-ID: <20200721214522.3719304-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Other changes:
  - Add a dependency on libabseil-cpp
  - Update the patches to apply properly.
  - Add a dependency for BR2_TOOLCHAIN_USES_GLIBC.
    libabseil-cpp uses execinfo.h for stacktracing, which uclibc and musl do
    not provide by default. As such, a dependency on BR2_TOOLCHAIN_USES_GLIBC
    as been added to the grpc package and to the grpc option for collectd.

Tested with the following distributions:
  - Debian 9
  - CentOS 7
  - Fedora 32

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
  - Add a dependency on BR2_TOOLCHAIN_USES_GLIBC

 package/collectd/Config.in                       |  6 ++++--
 .../0001-target-build-using-host-plugin.patch    | 16 ++++++++--------
 ...ct-the-availability-of-pthread_setname_.patch | 16 ++++++++--------
 package/grpc/Config.in                           |  7 +++++--
 package/grpc/grpc.hash                           |  4 ++--
 package/grpc/grpc.mk                             | 11 +++++++----
 6 files changed, 34 insertions(+), 26 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 188be3c0fb..bff0694684 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -566,6 +566,7 @@ config BR2_PACKAGE_COLLECTD_GRAPHITE
 config BR2_PACKAGE_COLLECTD_GRPC
 	bool "grpc"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC # grpc
+	depends on BR2_TOOLCHAIN_USES_GLIBC # libabseil-cpp -> execinfo.h
 	depends on BR2_INSTALL_LIBSTDCPP # grpc -> protobuf
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # grpc -> protobuf
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # grpc -> protobuf
@@ -573,8 +574,9 @@ config BR2_PACKAGE_COLLECTD_GRPC
 	help
 	  Send/receive values using the gRPC protocol.
 
-comment "grpc needs a toolchain w/ C++, gcc >= 4.8"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
+comment "grpc needs a glibc toolchain w/ C++, gcc >= 4.8"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC || \
+		!BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
diff --git a/package/grpc/0001-target-build-using-host-plugin.patch b/package/grpc/0001-target-build-using-host-plugin.patch
index 2da657762f..ac2bf8cc38 100644
--- a/package/grpc/0001-target-build-using-host-plugin.patch
+++ b/package/grpc/0001-target-build-using-host-plugin.patch
@@ -17,12 +17,12 @@ Signed-off-by: Robert Rose <robertroyrose@gmail.com>
  1 file changed, 13 insertions(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index fc76cf5..7a22b08 100644
+index be695c2..45c2fcb 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -13420,6 +13420,18 @@ target_link_libraries(grpc_cli
- endif (gRPC_BUILD_TESTS)
- if (gRPC_BUILD_CODEGEN)
+@@ -10844,6 +10844,18 @@ target_link_libraries(grpc_cli
+ endif()
+ if(gRPC_BUILD_CODEGEN AND gRPC_BUILD_GRPC_CPP_PLUGIN)
  
 +if (gRPC_NATIVE_CPP_PLUGIN)
 +
@@ -39,14 +39,14 @@ index fc76cf5..7a22b08 100644
  add_executable(grpc_cpp_plugin
    src/compiler/cpp_plugin.cc
  )
-@@ -13457,6 +13469,7 @@ if (gRPC_INSTALL)
+@@ -10877,6 +10889,7 @@ if(gRPC_INSTALL)
      ARCHIVE DESTINATION ${gRPC_INSTALL_LIBDIR}
    )
  endif()
 +endif()
  
- endif (gRPC_BUILD_CODEGEN)
- if (gRPC_BUILD_CODEGEN)
+ endif()
+ if(gRPC_BUILD_CODEGEN AND gRPC_BUILD_GRPC_CSHARP_PLUGIN)
 -- 
-2.20.0.rc0.387.gc7a69e6b6c-goog
+2.26.2
 
diff --git a/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch b/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch
index 86586d850b..4b7253f7aa 100644
--- a/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch
+++ b/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch
@@ -17,12 +17,12 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  2 files changed, 8 insertions(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 89e834b..c7bd2ad 100644
+index 45c2fcb..0b2be4f 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -97,6 +97,12 @@ endif()
- 
- set(CMAKE_POSITION_INDEPENDENT_CODE TRUE)
+@@ -177,6 +177,12 @@ if (NOT DEFINED CMAKE_POSITION_INDEPENDENT_CODE)
+ endif()
+ list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules")
  
 +include(CheckSymbolExists)
 +check_symbol_exists(pthread_setname_np pthread.h HAVE_PTHREAD_SETNAME_NP)
@@ -30,14 +30,14 @@ index 89e834b..c7bd2ad 100644
 +  add_definitions(-DHAVE_PTHREAD_SETNAME_NP)
 +endif ()
 +
- if (MSVC)
+ if(MSVC)
    include(cmake/msvc_static_runtime.cmake)
    add_definitions(-D_WIN32_WINNT=0x600 -D_SCL_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_WARNINGS -D_WINSOCK_DEPRECATED_NO_WARNINGS)
 diff --git a/include/grpc/impl/codegen/port_platform.h b/include/grpc/impl/codegen/port_platform.h
-index 031c0c3..a29a9dc 100644
+index 4f213ff..55ecd9d 100644
 --- a/include/grpc/impl/codegen/port_platform.h
 +++ b/include/grpc/impl/codegen/port_platform.h
-@@ -181,7 +181,9 @@
+@@ -195,7 +195,9 @@
  #endif /* _LP64 */
  #ifdef __GLIBC__
  #define GPR_POSIX_CRASH_HANDLER 1
@@ -48,5 +48,5 @@ index 031c0c3..a29a9dc 100644
  #else /* musl libc */
  #define GPR_MUSL_LIBC_COMPAT 1
 -- 
-2.14.4
+2.26.2
 
diff --git a/package/grpc/Config.in b/package/grpc/Config.in
index 43f446d8dc..5d24d6745f 100644
--- a/package/grpc/Config.in
+++ b/package/grpc/Config.in
@@ -2,11 +2,13 @@ config BR2_PACKAGE_GRPC
 	bool "grpc"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
+	depends on BR2_TOOLCHAIN_USES_GLIBC # libabseil-cpp -> execinfo.h
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
 	depends on !BR2_STATIC_LIBS # protobuf
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	select BR2_PACKAGE_C_ARES
+	select BR2_PACKAGE_LIBABSEIL_CPP
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_ZLIB
@@ -16,8 +18,9 @@ config BR2_PACKAGE_GRPC
 
 	  http://github.com/grpc/grpc
 
-comment "grpc needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
+comment "grpc needs a glibc toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC || \
+		!BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index 5201f72106..f0586e4b18 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 ffbe61269160ea745e487f79b0fd06b6edd3d50c6d9123f053b5634737cf2f69 grpc-1.25.0.tar.gz
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 LICENSE
+sha256  ba74b97a2f1b4e22ec5fb69d639d849d2069fb58ea7d6579a31f800af6fe3b6c  grpc-1.30.2.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 39f6123792..087deac0c6 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.25.0
+GRPC_VERSION = 1.30.2
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0
 GRPC_LICENSE_FILES = LICENSE
@@ -12,8 +12,9 @@ GRPC_LICENSE_FILES = LICENSE
 GRPC_INSTALL_STAGING = YES
 
 # Need to use host grpc_cpp_plugin during cross compilation.
-GRPC_DEPENDENCIES = c-ares host-grpc openssl protobuf zlib
-HOST_GRPC_DEPENDENCIES = host-c-ares host-openssl host-protobuf host-zlib
+GRPC_DEPENDENCIES = c-ares host-grpc openssl protobuf zlib libabseil-cpp
+HOST_GRPC_DEPENDENCIES = host-c-ares host-openssl host-protobuf host-zlib \
+	host-libabseil-cpp
 
 # gRPC_CARES_PROVIDER=package won't work because it requires c-ares to have
 # installed a cmake config file, but buildroot uses c-ares' autotools build,
@@ -25,6 +26,7 @@ GRPC_CONF_OPTS = \
 	-DgRPC_PROTOBUF_PROVIDER=package \
 	-DgRPC_SSL_PROVIDER=package \
 	-DgRPC_ZLIB_PROVIDER=package \
+	-DgRPC_ABSL_PROVIDER=package \
 	-DgRPC_NATIVE_CPP_PLUGIN=$(HOST_DIR)/bin/grpc_cpp_plugin
 
 # grpc can use __atomic builtins, so we need to link with
@@ -65,7 +67,8 @@ HOST_GRPC_CONF_OPTS = \
 	-DgRPC_CARES_PROVIDER=none \
 	-DgRPC_PROTOBUF_PROVIDER=package \
 	-DgRPC_SSL_PROVIDER=package \
-	-DgRPC_ZLIB_PROVIDER=package
+	-DgRPC_ZLIB_PROVIDER=package \
+	-DgRPC_ABSL_PROVIDER=package
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.26.2
