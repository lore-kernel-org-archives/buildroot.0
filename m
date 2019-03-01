From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri,  1 Mar 2019 17:47:09 +0100
Subject: [Buildroot] [PATCH/next 5/9] package/optee-client: support
 BUILD_STATIC_LIBS
In-Reply-To: <e709b9364807ed93b5e1dc0edfe8a1dd50006b1b.1551458062.git.etienne.carriere@linaro.org>
References: <e709b9364807ed93b5e1dc0edfe8a1dd50006b1b.1551458062.git.etienne.carriere@linaro.org>
Message-ID: <eccff8f3e8576166038d8ad2e858e8578edef5e1.1551458062.git.etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch optee-client from release 3.4.0 to support building resources
with static linkage of executable binaries with the user libraries.

The optee-client patch is under review in the OP-TEE project [1] and
should be merged in the next OP-TEE release 3.5.0.

This change drops !BR2_STATIC_LIBS constraint on package optee-client.

[1] https://github.com/OP-TEE/optee_client/pull/147

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 .../0001-libteec-fix-build-warnings.patch          |  4 +-
 ...pport-BUILD_STATIC_LIBS-BUILD_SHARED_LIBS.patch | 51 ++++++++++++++++++++++
 package/optee-client/Config.in                     |  4 --
 3 files changed, 53 insertions(+), 6 deletions(-)
 create mode 100644 package/optee-client/0002-cmake-support-BUILD_STATIC_LIBS-BUILD_SHARED_LIBS.patch

diff --git a/package/optee-client/0001-libteec-fix-build-warnings.patch b/package/optee-client/0001-libteec-fix-build-warnings.patch
index 21f47ec..aec07b4 100644
--- a/package/optee-client/0001-libteec-fix-build-warnings.patch
+++ b/package/optee-client/0001-libteec-fix-build-warnings.patch
@@ -1,7 +1,7 @@
-From 657414ccd20b4fb2985efd83b0679964fec923c2 Mon Sep 17 00:00:00 2001
+From 2f5ab18b4886b31a33850ee51f33fb753e9c7b7f Mon Sep 17 00:00:00 2001
 From: Etienne Carriere <etienne.carriere@linaro.org>
 Date: Fri, 1 Mar 2019 09:36:46 +0100
-Subject: [PATCH] libteec: fix build warnings
+Subject: [PATCH 1/2] libteec: fix build warnings
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
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
index db0b7b7..0de136c 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_OPTEE_CLIENT
 	bool "optee-client"
-	depends on !BR2_STATIC_LIBS
 	help
 	  Enable the OP-TEE client package that brings non-secure
 	  client application resources for OP-TEE support. OP-TEE
@@ -12,6 +11,3 @@ config BR2_PACKAGE_OPTEE_CLIENT
 	  and invoked by the secure world.
 
 	  https://github.com/OP-TEE/optee_client
-
-comment "optee-client needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-- 
1.9.1
