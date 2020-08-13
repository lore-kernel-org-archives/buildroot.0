From: Michael Nosthoff <buildroot@heine.tech>
Date: Thu, 13 Aug 2020 16:45:49 +0200
Subject: [Buildroot] [PATCH 2/2] package/grpc: bump version to 1.31.0
In-Reply-To: <20200813144549.1262366-1-buildroot@heine.tech>
References: <20200813144549.1262366-1-buildroot@heine.tech>
Message-ID: <20200813144549.1262366-3-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Related changes:
 - add dependency on Google RE2 package
 - update patches to new offsets

Tested on Ubuntu 20.04

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 .../grpc/0001-target-build-using-host-plugin.patch   |  4 ++--
 ...detect-the-availability-of-pthread_setname_.patch |  7 +++----
 package/grpc/Config.in                               |  3 ++-
 package/grpc/grpc.hash                               |  2 +-
 package/grpc/grpc.mk                                 | 12 +++++++-----
 5 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/package/grpc/0001-target-build-using-host-plugin.patch b/package/grpc/0001-target-build-using-host-plugin.patch
index ac2bf8cc38..5b3c6a6fae 100644
--- a/package/grpc/0001-target-build-using-host-plugin.patch
+++ b/package/grpc/0001-target-build-using-host-plugin.patch
@@ -20,7 +20,7 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index be695c2..45c2fcb 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -10844,6 +10844,18 @@ target_link_libraries(grpc_cli
+@@ -11043,6 +11043,18 @@ target_link_libraries(grpc_cli
  endif()
  if(gRPC_BUILD_CODEGEN AND gRPC_BUILD_GRPC_CPP_PLUGIN)
  
@@ -39,7 +39,7 @@ index be695c2..45c2fcb 100644
  add_executable(grpc_cpp_plugin
    src/compiler/cpp_plugin.cc
  )
-@@ -10877,6 +10889,7 @@ if(gRPC_INSTALL)
+@@ -11077,6 +11089,7 @@ if(gRPC_INSTALL)
      ARCHIVE DESTINATION ${gRPC_INSTALL_LIBDIR}
    )
  endif()
diff --git a/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch b/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch
index 4b7253f7aa..c8b1dc8e73 100644
--- a/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch
+++ b/package/grpc/0002-Properly-detect-the-availability-of-pthread_setname_.patch
@@ -20,7 +20,7 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index 45c2fcb..0b2be4f 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -177,6 +177,12 @@ if (NOT DEFINED CMAKE_POSITION_INDEPENDENT_CODE)
+@@ -180,6 +180,12 @@ if (NOT DEFINED CMAKE_POSITION_INDEPENDENT_CODE)
  endif()
  list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules")
  
@@ -37,7 +37,7 @@ diff --git a/include/grpc/impl/codegen/port_platform.h b/include/grpc/impl/codeg
 index 4f213ff..55ecd9d 100644
 --- a/include/grpc/impl/codegen/port_platform.h
 +++ b/include/grpc/impl/codegen/port_platform.h
-@@ -195,7 +195,9 @@
+@@ -163,7 +163,9 @@
  #endif /* _LP64 */
  #ifdef __GLIBC__
  #define GPR_POSIX_CRASH_HANDLER 1
@@ -48,5 +48,4 @@ index 4f213ff..55ecd9d 100644
  #else /* musl libc */
  #define GPR_MUSL_LIBC_COMPAT 1
 -- 
-2.26.2
-
+2.26.63
diff --git a/package/grpc/Config.in b/package/grpc/Config.in
index a2da3f4c53..2eb7c1de1c 100644
--- a/package/grpc/Config.in
+++ b/package/grpc/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_GRPC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf, re2
 	depends on !BR2_STATIC_LIBS # protobuf, libabseil-cpp
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
@@ -11,6 +11,7 @@ config BR2_PACKAGE_GRPC
 	select BR2_PACKAGE_LIBABSEIL_CPP
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_RE2
 	select BR2_PACKAGE_ZLIB
 	help
 	  A language-neutral, platform-neutral, open source, remote
diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
index f0586e4b18..20368068d9 100644
--- a/package/grpc/grpc.hash
+++ b/package/grpc/grpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ba74b97a2f1b4e22ec5fb69d639d849d2069fb58ea7d6579a31f800af6fe3b6c  grpc-1.30.2.tar.gz
+sha256  1236514199d3deb111a6dd7f6092f67617cd2b147f7eda7adbafccea95de7381  grpc-1.31.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
index 087deac0c6..208abd90c8 100644
--- a/package/grpc/grpc.mk
+++ b/package/grpc/grpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRPC_VERSION = 1.30.2
+GRPC_VERSION = 1.31.0
 GRPC_SITE = $(call github,grpc,grpc,v$(GRPC_VERSION))
 GRPC_LICENSE = Apache-2.0
 GRPC_LICENSE_FILES = LICENSE
@@ -12,10 +12,10 @@ GRPC_LICENSE_FILES = LICENSE
 GRPC_INSTALL_STAGING = YES
 
 # Need to use host grpc_cpp_plugin during cross compilation.
-GRPC_DEPENDENCIES = c-ares host-grpc openssl protobuf zlib libabseil-cpp
-HOST_GRPC_DEPENDENCIES = host-c-ares host-openssl host-protobuf host-zlib \
-	host-libabseil-cpp
-
+GRPC_DEPENDENCIES = c-ares host-grpc openssl protobuf re2 zlib libabseil-cpp
+HOST_GRPC_DEPENDENCIES = host-c-ares host-libabseil-cpp host-openssl host-protobuf \
+	host-re2 host-zlib
+	
 # gRPC_CARES_PROVIDER=package won't work because it requires c-ares to have
 # installed a cmake config file, but buildroot uses c-ares' autotools build,
 # which doesn't do this.  These CARES settings trick the gRPC cmake code into
@@ -24,6 +24,7 @@ GRPC_CONF_OPTS = \
 	-D_gRPC_CARES_LIBRARIES=cares \
 	-DgRPC_CARES_PROVIDER=none \
 	-DgRPC_PROTOBUF_PROVIDER=package \
+	-DgRPC_RE2_PROVIDER=package \
 	-DgRPC_SSL_PROVIDER=package \
 	-DgRPC_ZLIB_PROVIDER=package \
 	-DgRPC_ABSL_PROVIDER=package \
@@ -66,6 +67,7 @@ HOST_GRPC_CONF_OPTS = \
 	-D_gRPC_CARES_LIBRARIES=cares \
 	-DgRPC_CARES_PROVIDER=none \
 	-DgRPC_PROTOBUF_PROVIDER=package \
+	-DgRPC_RE2_PROVIDER=package \
 	-DgRPC_SSL_PROVIDER=package \
 	-DgRPC_ZLIB_PROVIDER=package \
 	-DgRPC_ABSL_PROVIDER=package
-- 
2.25.1
