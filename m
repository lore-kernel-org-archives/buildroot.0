From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri,  8 Mar 2019 10:55:09 +0100
Subject: [Buildroot] [PATCH v2] package/optee-*: support BR2_STATIC_LIBS=y
Message-ID: <1552038909-21520-1-git-send-email-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch current optee-client 3.4.0 to support building resources
with static linkage of executable binaries with the user libraries.
The optee-client patch is under review in the OP-TEE project [1] and
should be merged in the next OP-TEE release 3.5.0.

This change drops !BR2_STATIC_LIBS constraint on package optee-client
and its dependent packages that are optee-benchmark, optee-examples,
and optee-test.

[1] https://github.com/OP-TEE/optee_client/pull/147

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v1 -> v2:
  - Rebase to fix merge conflicts.
  - Squash commit series for OP-TEE packages into a single change.

---
 package/optee-benchmark/Config.in                  |  5 +--
 ...pport-BUILD_STATIC_LIBS-BUILD_SHARED_LIBS.patch | 51 ++++++++++++++++++++++
 package/optee-client/Config.in                     |  5 +--
 package/optee-examples/Config.in                   |  5 +--
 package/optee-test/Config.in                       |  5 +--
 5 files changed, 59 insertions(+), 12 deletions(-)
 create mode 100644 package/optee-client/0002-cmake-support-BUILD_STATIC_LIBS-BUILD_SHARED_LIBS.patch

diff --git a/package/optee-benchmark/Config.in b/package/optee-benchmark/Config.in
index b9326e0..0bc4af4 100644
--- a/package/optee-benchmark/Config.in
+++ b/package/optee-benchmark/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_OPTEE_BENCHMARK
 	bool "optee-benchmark"
-	depends on !BR2_STATIC_LIBS # optee-client
 	depends on BR2_TOOLCHAIN_HAS_THREADS # optee-client
 	select BR2_PACKAGE_OPTEE_CLIENT
 	select BR2_PACKAGE_LIBYAML
@@ -12,5 +11,5 @@ config BR2_PACKAGE_OPTEE_BENCHMARK
 
 	  http://github.com/linaro-swg/optee_benchmark
 
-comment "optee-benchmark needs a toolchain w/ dynamic library and threads"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+comment "optee-benchmark needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/optee-client/0002-cmake-support-BUILD_STATIC_LIBS-BUILD_SHARED_LIBS.patch b/package/optee-client/0002-cmake-support-BUILD_STATIC_LIBS-BUILD_SHARED_LIBS.patch
new file mode 100644
index 0000000..f63f1a3
--- /dev/null
+++ b/package/optee-client/0002-cmake-support-BUILD_STATIC_LIBS-BUILD_SHARED_LIBS.patch
@@ -0,0 +1,51 @@
+From 857ed6a900e2f16035a88e73e47d79e9251f6544 Mon Sep 17 00:00:00 2001
+From: Etienne Carriere <etienne.carriere@linaro.org>
+Date: Fri, 1 Mar 2019 12:31:48 +0100
+Subject: [PATCH 2/2] cmake: support BUILD_STATIC_LIBS/BUILD_SHARED_LIBS
+
+CMake variables BUILD_STATIC_LIBS and BUILD_SHARED_LIBS
+set constraints on libraries and executable linkage.
+
+With this change OP-TEE client CMake script builds and installs the
+embedded files with the expected linkage configuration.
+
+Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
+---
+ libteec/CMakeLists.txt        | 5 +++--
+ tee-supplicant/CMakeLists.txt | 2 +-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/libteec/CMakeLists.txt b/libteec/CMakeLists.txt
+index 3ec8f66..e3495fb 100644
+--- a/libteec/CMakeLists.txt
++++ b/libteec/CMakeLists.txt
+@@ -33,7 +33,7 @@ endif()
+ ################################################################################
+ # Built library
+ ################################################################################
+-add_library (teec SHARED ${SRC})
++add_library (teec ${SRC})
+ 
+ set_target_properties (teec PROPERTIES
+ 	VERSION ${PROJECT_VERSION}
+@@ -71,4 +71,5 @@ target_link_libraries (teec
+ ################################################################################
+ # FIXME: This should in someway harmonize with CFG_TEE_CLIENT_LOAD_PATH
+ # FIXME: Should we change this to /usr/local/lib?
+-install (TARGETS teec DESTINATION ${CMAKE_INSTALL_LIBDIR})
++install (TARGETS teec LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
++                      ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}")
+diff --git a/tee-supplicant/CMakeLists.txt b/tee-supplicant/CMakeLists.txt
+index d2d3afd..e663be9 100644
+--- a/tee-supplicant/CMakeLists.txt
++++ b/tee-supplicant/CMakeLists.txt
+@@ -85,4 +85,4 @@ target_link_libraries (${PROJECT_NAME}
+ ################################################################################
+ # Install targets
+ ################################################################################
+-install (TARGETS ${PROJECT_NAME} DESTINATION ${CMAKE_INSTALL_SBINDIR})
++install (TARGETS ${PROJECT_NAME} RUNTIME DESTINATION ${CMAKE_INSTALL_SBINDIR})
+-- 
+1.9.1
+
diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
index 833a622..374ca29 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_OPTEE_CLIENT
 	bool "optee-client"
-	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Enable the OP-TEE client package that brings non-secure
@@ -14,5 +13,5 @@ config BR2_PACKAGE_OPTEE_CLIENT
 
 	  https://github.com/OP-TEE/optee_client
 
-comment "optee-client needs a toolchain w/ dynamic library and threads"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+comment "optee-client needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
\ No newline at end of file
diff --git a/package/optee-examples/Config.in b/package/optee-examples/Config.in
index 62d0bf4..33d7c36 100644
--- a/package/optee-examples/Config.in
+++ b/package/optee-examples/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_OPTEE_EXAMPLES
 	bool "optee-examples"
 	depends on BR2_TARGET_OPTEE_OS
-	depends on !BR2_STATIC_LIBS # optee-client
 	depends on BR2_TOOLCHAIN_HAS_THREADS # optee-client
 	select BR2_PACKAGE_OPTEE_CLIENT
 	select BR2_TARGET_OPTEE_OS_SDK
@@ -19,6 +18,6 @@ config BR2_PACKAGE_OPTEE_EXAMPLES
 
 	  https://github.com/linaro-swg/optee_examples
 
-comment "optee-examples needs a toolchain w/ dynamic library and threads"
+comment "optee-examples needs a toolchain w/ threads"
 	depends on BR2_TARGET_OPTEE_OS
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
\ No newline at end of file
diff --git a/package/optee-test/Config.in b/package/optee-test/Config.in
index 77c38c4..d3b41b3 100644
--- a/package/optee-test/Config.in
+++ b/package/optee-test/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_OPTEE_TEST
 	bool "optee-test"
 	depends on BR2_TARGET_OPTEE_OS
-	depends on !BR2_STATIC_LIBS # optee-client
 	depends on BR2_TOOLCHAIN_HAS_THREADS # optee-client
 	select BR2_PACKAGE_OPTEE_CLIENT
 	select BR2_TARGET_OPTEE_OS_SDK
@@ -23,6 +22,6 @@ config BR2_PACKAGE_OPTEE_TEST
 
 	  http://github.com/OP-TEE/optee_test
 
-comment "optee-test needs a toolchain w/ dynamic library and threads"
+comment "optee-test needs a toolchain w/ threads"
 	depends on BR2_TARGET_OPTEE_OS
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
\ No newline at end of file
-- 
1.9.1
