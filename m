From: Steve deRosier <derosier@gmail.com>
Date: Sun,  1 May 2016 16:29:36 -0700
Subject: [Buildroot] [PATCH v2 1/1] flatcc: new package
Message-ID: <1462145376-1377-1-git-send-email-steve.derosier@lairdtech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This adds flatcc as a new package, pulling v0.3.3 from github. flatcc has
both a host tool - the compiler, and libraries for the target.

Signed-off-by: Steve deRosier <steve.derosier@lairdtech.com>

---
Changes v1 -> v2
  - Updated to v0.3.3 of flatcc
  - Added hash file
  - Added some build patches to flatcc in order to use v0.3.3
  - Added ability to handle static and shared libs at same time
  - Addressed other reviewer comments

Signed-off-by: Steve deRosier <steve.derosier@lairdtech.com>
---
 package/Config.in                                  |   1 +
 ...d-Specify-C-language-explicitly-for-CMake.patch |  30 ++++
 ...-cmake-to-build-both-static-and-shared-li.patch | 158 +++++++++++++++++++++
 package/flatcc/Config.in                           |   9 ++
 package/flatcc/flatcc.hash                         |   2 +
 package/flatcc/flatcc.mk                           |  63 ++++++++
 6 files changed, 263 insertions(+)
 create mode 100644 package/flatcc/0001-build-Specify-C-language-explicitly-for-CMake.patch
 create mode 100644 package/flatcc/0002-build-allow-cmake-to-build-both-static-and-shared-li.patch
 create mode 100644 package/flatcc/Config.in
 create mode 100644 package/flatcc/flatcc.hash
 create mode 100644 package/flatcc/flatcc.mk

diff --git a/package/Config.in b/package/Config.in
index 9d668bf..4f00446 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1208,6 +1208,7 @@ menu "Other"
 	source "package/ding-libs/Config.in"
 	source "package/eigen/Config.in"
 	source "package/elfutils/Config.in"
+	source "package/flatcc/Config.in"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
 	source "package/gflags/Config.in"
diff --git a/package/flatcc/0001-build-Specify-C-language-explicitly-for-CMake.patch b/package/flatcc/0001-build-Specify-C-language-explicitly-for-CMake.patch
new file mode 100644
index 0000000..bccc0f7
--- /dev/null
+++ b/package/flatcc/0001-build-Specify-C-language-explicitly-for-CMake.patch
@@ -0,0 +1,30 @@
+From 82b75921413502374ad23d7a9d93b9e9021c0742 Mon Sep 17 00:00:00 2001
+From: Steve deRosier <steve.derosier@lairdtech.com>
+Date: Thu, 28 Apr 2016 15:58:52 -0700
+Subject: [PATCH 1/2] build: Specify C language explicitly for CMake
+
+If the build system doesn't have a C++ compiler installed, CMake will fail
+with a line like:
+Check for working CXX compiler: CMAKE_CXX_COMPILER_FULLPATH-NOTFOUND
+
+As flatcc is explicitly C-only, let's be sure we can use it without a C++
+compiler installed.
+
+Signed-off-by: Steve deRosier <steve.derosier@lairdtech.com>
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6157f96..b9f5bc3 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -4,7 +4,7 @@
+ #cmake_minimum_required (VERSION 2.8.11)
+ cmake_minimum_required (VERSION 2.8)
+ 
+-project (FlatCC)
++project (FlatCC C)
+ 
+ #
+ # NOTE: when changing build options, clean the build using:
+-- 
+1.9.1
+
diff --git a/package/flatcc/0002-build-allow-cmake-to-build-both-static-and-shared-li.patch b/package/flatcc/0002-build-allow-cmake-to-build-both-static-and-shared-li.patch
new file mode 100644
index 0000000..091631e
--- /dev/null
+++ b/package/flatcc/0002-build-allow-cmake-to-build-both-static-and-shared-li.patch
@@ -0,0 +1,158 @@
+From bad274137c7cd8bd356b65ae4e3fcbd60b072b5d Mon Sep 17 00:00:00 2001
+From: Steve deRosier <steve.derosier@lairdtech.com>
+Date: Fri, 29 Apr 2016 16:25:29 -0700
+Subject: [PATCH 2/2] build: allow cmake to build both static and shared
+ libraries
+
+By default, cmake can only build one of static or shared libraries, not
+both. Systems like Buildroot have the ability to configure the build to
+build both static and shared libraries, and the current behavior gets in
+the way of that. This patch makes it possible to do both on the same build.
+
+Signed-off-by: Steve deRosier <steve.derosier@lairdtech.com>
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b9f5bc3..da30854 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -12,6 +12,11 @@ project (FlatCC C)
+ #   scripts/cleanall.sh
+ #
+ 
++# Options to control if we build static or shared libraries. Needed because
++# cmake has us explicitly do both versions if we want both versions.
++option(FLATCC_WITH_STATIC "Build the static version of the library" ON)
++option(FLATCC_WITH_SHARED "Build the shared version of the library" ON)
++
+ # Disable if cross compiling or if experiencing build issues with certain
+ # custom CMake configurations - suspect dependency issue on flatcc tool
+ # in custom build steps used by tests and samples.
+@@ -66,6 +71,10 @@ option (FLATCC_ALLOW_WERROR "allow -Werror to be configured" ON)
+ # try using this option.
+ option (FLATCC_IGNORE_CONST_COND "silence const condition warnings" OFF)
+ 
++if (NOT (FLATCC_WITH_STATIC OR FLATCC_WITH_SHARED))
++	message(FATAL_ERROR "Makes no sense to compile with neither static nor shared libraries.")
++endif()
++
+ if (FLATCC_TEST)
+     enable_testing()
+ endif()
+@@ -99,9 +108,17 @@ set (dist_dir "${PROJECT_SOURCE_DIR}")
+ # set (dist_dir "${CMAKE_BINARY_DIR}")
+ 
+ # The targets we copy to bin and lib directories, i.e. not tests.
++if (FLATCC_WITH_STATIC)
++    set(static_libs flatcc flatccrt)
++endif()
++
++if (FLATCC_WITH_SHARED)
++    set(static_libs flatcc_shared flatccrt_shared)
++endif()
++
+ set(dist_targets
+-    flatcc
+-    flatccrt
++    ${static_libs}
++    ${shared_libs}
+     flatcc_cli
+ )
+ 
+diff --git a/src/cli/CMakeLists.txt b/src/cli/CMakeLists.txt
+index e4baf28..58df256 100644
+--- a/src/cli/CMakeLists.txt
++++ b/src/cli/CMakeLists.txt
+@@ -7,9 +7,15 @@ add_executable(flatcc_cli
+     flatcc_cli.c
+ )
+ 
+-target_link_libraries(flatcc_cli
+-    flatcc
+-)
++if (FLATCC_WITH_SHARED)
++    target_link_libraries(flatcc_cli
++        flatcc_shared
++    )
++elseif (FLATCC_WITH_STATIC)
++    target_link_libraries(flatcc_cli
++        flatcc
++    )
++endif()
+ 
+ # Rename because the libflatcc library and the flatcc executable would
+ # conflict if they had the same target name `flatcc`.
+diff --git a/src/compiler/CMakeLists.txt b/src/compiler/CMakeLists.txt
+index 9bf6b13..6b41289 100644
+--- a/src/compiler/CMakeLists.txt
++++ b/src/compiler/CMakeLists.txt
+@@ -34,5 +34,26 @@ if (FLATCC_REFLECTION)
+     set (SOURCES ${SOURCES} codegen_schema.c)
+ endif(FLATCC_REFLECTION)
+ 
+-add_library(flatcc ${SOURCES})
++if (FLATCC_WITH_STATIC)
++    add_library(flatcc STATIC ${SOURCES})
++    list(APPEND FLATCC_LIBRARIES flatcc)
+ 
++    if (WIN32)
++        # Windows uses the same .lib ending for static libraries and shared
++        # library linker files, so rename the static library.
++        set_target_properties(flatcc
++            PROPERTIES
++            OUTPUT_NAME flatcc_static)
++    endif()
++endif()
++
++if (FLATCC_WITH_SHARED)
++     add_library(flatcc_shared SHARED ${SOURCES})
++     list(APPEND FLATCC_LIBRARIES flatcc_shared)
++
++     # We want the shared lib to be named "libflatcc"
++     # not "libflatcc_shared".
++     set_target_properties(flatcc_shared
++         PROPERTIES
++         OUTPUT_NAME flatcc)
++endif()
+diff --git a/src/runtime/CMakeLists.txt b/src/runtime/CMakeLists.txt
+index 8fe6fef..652dd14 100644
+--- a/src/runtime/CMakeLists.txt
++++ b/src/runtime/CMakeLists.txt
+@@ -2,10 +2,34 @@ include_directories (
+     "${PROJECT_SOURCE_DIR}/include"
+ )
+ 
+-add_library(flatccrt
++set (FLATCCRT_SOURCES
+     builder.c
+     emitter.c
+     verifier.c
+     json_parser.c
+     json_printer.c
+ )
++
++if (FLATCC_WITH_STATIC)
++    add_library(flatccrt STATIC ${FLATCCRT_SOURCES})
++    list(APPEND FLATCC_LIBRARIES flatccrt)
++
++    if (WIN32)
++        # Windows uses the same .lib ending for static libraries and shared
++        # library linker files, so rename the static library.
++        set_target_properties(flatccrt
++            PROPERTIES
++            OUTPUT_NAME flatccrt_static)
++    endif()
++endif()
++
++if (FLATCC_WITH_SHARED)
++    add_library(flatccrt_shared SHARED ${FLATCCRT_SOURCES})
++    list(APPEND FLATCC_LIBRARIES flatccrt_shared)
++
++    # We want the shared lib to be named "libflatccrt"
++    # not "libflatccrt_shared".
++    set_target_properties(flatccrt_shared
++        PROPERTIES
++        OUTPUT_NAME flatccrt)
++endif()
+-- 
+1.9.1
+
diff --git a/package/flatcc/Config.in b/package/flatcc/Config.in
new file mode 100644
index 0000000..a3b9b01
--- /dev/null
+++ b/package/flatcc/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_FLATCC
+	bool "flatcc"
+	depends on BR2_ENDIAN = "LITTLE"
+	help
+	  flatcc is C language implementation of Google Flatbuffers. It
+	  consists of both a library for the target as well as a
+	  flatbuffer compiler tool for the host.
+
+	  https://github.com/dvidelabs/flatcc
diff --git a/package/flatcc/flatcc.hash b/package/flatcc/flatcc.hash
new file mode 100644
index 0000000..881e0ca
--- /dev/null
+++ b/package/flatcc/flatcc.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	14903f53536947295214f7c1537b6ff933565453a440e610f0b85c3fb3fe6642  flatcc-v0.3.3.tar.gz
diff --git a/package/flatcc/flatcc.mk b/package/flatcc/flatcc.mk
new file mode 100644
index 0000000..a7e9b7a
--- /dev/null
+++ b/package/flatcc/flatcc.mk
@@ -0,0 +1,63 @@
+################################################################################
+#
+# FLATCC
+#
+################################################################################
+FLATCC_VERSION = v0.3.3
+FLATCC_SITE =$(call github,dvidelabs,flatcc,$(FLATCC_VERSION))
+FLATCC_LICENSE = Apache-2.0
+FLATCC_LICENSE_FILES = LICENSE
+FLATCC_INSTALL_STAGING = YES
+FLATCC_DEPENDENCIES = host-flatcc
+
+FLATCC_CONF_OPTS += -DFLATCC_TEST=OFF
+HOST_FLATCC_CONF_OPTS += -DFLATCC_TEST=OFF
+
+define HOST_FLATCC_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/flatcc $(HOST_DIR)/usr/bin/flatcc
+endef
+
+# Need to force flatcc to do static or shared or both libraries
+ifeq ($(BR2_STATIC_LIBS),y)
+FLATCC_CONF_OPTS += -DFLATCC_WITH_SHARED=OFF -DFLATCC_WITH_STATIC=ON
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+FLATCC_CONF_OPTS += -DFLATCC_WITH_SHARED=ON -DFLATCC_WITH_STATIC=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+FLATCC_CONF_OPTS += -DFLATCC_WITH_SHARED=ON -DFLATCC_WITH_STATIC=OFF
+endif
+
+# flatcc's cmake build doesn't include install targets, so we need to manually
+# install the various components to their respective destinations. There's
+# several cases that need to be taken care of, so we do a little dance to do so.
+ifeq ($(BR2_SHARED_LIBS),)
+define FLATCC_INSTALL_STAGING_STATIC
+	$(INSTALL) -D -m 0755 $(@D)/lib/libflatcc.a $(STAGING_DIR)/usr/lib/libflatcc.a
+	$(INSTALL) -D -m 0755 $(@D)/lib/libflatccrt.a $(STAGING_DIR)/usr/lib/libflatccrt.a
+endef
+endif
+
+ifeq ($(BR2_STATIC_LIBS),)
+define FLATCC_INSTALL_STAGING_SHARED
+	$(INSTALL) -D -m 0755 $(@D)/lib/libflatcc.so $(STAGING_DIR)/usr/lib/libflatcc.so
+	$(INSTALL) -D -m 0755 $(@D)/lib/libflatccrt.so $(STAGING_DIR)/usr/lib/libflatccrt.so
+endef
+endif
+
+define FLATCC_INSTALL_STAGING_CMDS
+	cp -r $(@D)/include/flatcc $(STAGING_DIR)/usr/include/.
+	$(FLATCC_INSTALL_STAGING_STATIC)
+	$(FLATCC_INSTALL_STAGING_SHARED)
+endef
+
+# If we don't have the shared libs to install, don't run target install
+ifeq ($(FLATCC_INSTALL_STAGING_SHARED),)
+FLATCC_INSTALL_TARGET = NO
+endif
+
+define FLATCC_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/lib/libflatcc.so $(TARGET_DIR)/usr/lib/libflatcc.so
+	$(INSTALL) -D -m 0755 $(@D)/lib/libflatccrt.so $(TARGET_DIR)/usr/lib/libflatccrt.so
+endef
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
1.9.1
