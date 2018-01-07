From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 23:16:27 +0100
Subject: [Buildroot] [git commit] opentracing-cpp: new package
Message-ID: <20180107224039.2AF7D80567@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc1be64377f1479aea46169010b71ab4d83ab1ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jan Heylen <jan.heylen@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                         |  3 +
 package/Config.in                                  |  1 +
 ...shared-static-target-a-configurable-optio.patch | 74 ++++++++++++++++++++++
 package/opentracing-cpp/Config.in                  | 15 +++++
 package/opentracing-cpp/opentracing-cpp.hash       |  3 +
 package/opentracing-cpp/opentracing-cpp.mk         | 25 ++++++++
 6 files changed, 121 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2a5d5a9..18271c2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -811,6 +811,9 @@ F:	package/pangomm/
 F:	package/rpm/
 F:	package/yad/
 
+N:	Jan Heylen <jan.heylen@nokia.com>
+F:	package/opentracing-cpp/
+
 N:	Jan Kraval <jan.kraval@gmail.com>
 F:	board/orangepi/orangepi-lite
 F:	configs/orangepi_lite_defconfig
diff --git a/package/Config.in b/package/Config.in
index 729d660..907c1c5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1293,6 +1293,7 @@ menu "Logging"
 	source "package/log4cplus/Config.in"
 	source "package/log4cpp/Config.in"
 	source "package/log4cxx/Config.in"
+	source "package/opentracing-cpp/Config.in"
 	source "package/zlog/Config.in"
 endmenu
 
diff --git a/package/opentracing-cpp/0001-CMake-make-shared-static-target-a-configurable-optio.patch b/package/opentracing-cpp/0001-CMake-make-shared-static-target-a-configurable-optio.patch
new file mode 100644
index 0000000..90a945b
--- /dev/null
+++ b/package/opentracing-cpp/0001-CMake-make-shared-static-target-a-configurable-optio.patch
@@ -0,0 +1,74 @@
+From 9462847f23a25524fdc2112cbc8de3f2c02a1669 Mon Sep 17 00:00:00 2001
+From: Jan Heylen <jan.heylen@nokia.com>
+Date: Fri, 22 Dec 2017 22:04:29 +0100
+Subject: [PATCH] CMake: make shared/static target a configurable option
+
+Signed-off-by: Jan Heylen <jan.heylen@nokia.com>
+---
+ CMakeLists.txt | 40 ++++++++++++++++++++++++++++------------
+ 1 file changed, 28 insertions(+), 12 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index aadf2f9..d03bd00 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -70,18 +70,36 @@ endif()
+ include_directories(include)
+ include_directories(SYSTEM 3rd_party/include)
+ 
++option(BUILD_SHARED_LIBS "Build as a shared library" ON)
++option(BUILD_STATIC_LIBS "Build as a static library" ON)
++
++if (NOT BUILD_SHARED_LIBS AND NOT BUILD_STATIC_LIBS)
++    message(FATAL_ERROR "One or both of BUILD_SHARED_LIBS or BUILD_STATIC_LIBS must be set to ON to build")
++endif()
++
+ set(SRCS src/propagation.cpp src/noop.cpp src/tracer.cpp)
+-add_library(opentracing SHARED ${SRCS})
+-target_include_directories(opentracing INTERFACE "$<INSTALL_INTERFACE:include/>")
+-set_target_properties(opentracing PROPERTIES VERSION ${OPENTRACING_VERSION_STRING}
++
++if (BUILD_SHARED_LIBS)
++  add_library(opentracing SHARED ${SRCS})
++  target_include_directories(opentracing INTERFACE "$<INSTALL_INTERFACE:include/>")
++  set_target_properties(opentracing PROPERTIES VERSION ${OPENTRACING_VERSION_STRING}
+                                              SOVERSION ${OPENTRACING_VERSION_MAJOR})
+-add_library(opentracing-static STATIC ${SRCS})
+-set_target_properties(opentracing-static PROPERTIES OUTPUT_NAME opentracing)
+-target_include_directories(opentracing-static INTERFACE "$<INSTALL_INTERFACE:include/>")
+-if (CLANG_TIDY_EXE)
+-  set_target_properties(opentracing PROPERTIES
++  install(TARGETS opentracing EXPORT OpenTracingTargets
++          LIBRARY DESTINATION lib
++          ARCHIVE DESTINATION lib)
++  if (CLANG_TIDY_EXE)
++    set_target_properties(opentracing PROPERTIES
+                                     CXX_CLANG_TIDY "${DO_CLANG_TIDY}")
+-endif()
++  endif()
++endif(BUILD_SHARED_LIBS)
++
++if (BUILD_STATIC_LIBS)
++  add_library(opentracing-static STATIC ${SRCS})
++  set_target_properties(opentracing-static PROPERTIES OUTPUT_NAME opentracing)
++  target_include_directories(opentracing-static INTERFACE "$<INSTALL_INTERFACE:include/>")
++  install(TARGETS opentracing-static EXPORT OpenTracingTargets
++          ARCHIVE DESTINATION lib)
++endif(BUILD_STATIC_LIBS)
+ 
+ 
+ install(DIRECTORY 3rd_party/include/opentracing DESTINATION include
+@@ -89,9 +107,7 @@ install(DIRECTORY 3rd_party/include/opentracing DESTINATION include
+                            PATTERN "*.h")
+ install(DIRECTORY include/opentracing DESTINATION include
+             FILES_MATCHING PATTERN "*.h")
+-install(TARGETS opentracing opentracing-static EXPORT OpenTracingTargets
+-        LIBRARY DESTINATION lib
+-        ARCHIVE DESTINATION lib)
++
+ 
+ # ==============================================================================
+ # Package configuration setup
+-- 
+2.7.4
+
diff --git a/package/opentracing-cpp/Config.in b/package/opentracing-cpp/Config.in
new file mode 100644
index 0000000..4ee7b29
--- /dev/null
+++ b/package/opentracing-cpp/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_OPENTRACING_CPP
+	bool "opentracing-cpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
+	help
+	  OpenTracing API for C++
+
+	  http://opentracing.io
+
+comment "opentracing-cpp needs a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+comment "opentracing-cpp needs exception_ptr"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/opentracing-cpp/opentracing-cpp.hash b/package/opentracing-cpp/opentracing-cpp.hash
new file mode 100644
index 0000000..d25dbaf
--- /dev/null
+++ b/package/opentracing-cpp/opentracing-cpp.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 c77041cb2f147ac81b2b0702abfced5565a9cebc318d045c060a4c3e074009ee opentracing-cpp-v1.2.0.tar.gz
+sha256 b80bffcfee825a69645f7ca97ddba48714031ea5c845198d184714d5490798b6 COPYING
diff --git a/package/opentracing-cpp/opentracing-cpp.mk b/package/opentracing-cpp/opentracing-cpp.mk
new file mode 100644
index 0000000..4e296fc
--- /dev/null
+++ b/package/opentracing-cpp/opentracing-cpp.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# opentracing-cpp
+#
+################################################################################
+
+OPENTRACING_CPP_VERSION = v1.2.0
+OPENTRACING_CPP_SITE = $(call github,opentracing,opentracing-cpp,$(OPENTRACING_CPP_VERSION))
+OPENTRACING_CPP_LICENSE = MIT
+OPENTRACING_CPP_LICENSE_FILES = COPYING
+
+OPENTRACING_CPP_INSTALL_STAGING = YES
+
+# BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
+# although BUILD_STATIC_LIBS=ON is default, make it explicit,
+# cmake and static/shared libs is confusing enough already.
+ifeq ($(BR2_STATIC_LIBS),y)
+OPENTRACING_CPP_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+OPENTRACING_CPP_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+OPENTRACING_CPP_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
+endif
+
+$(eval $(cmake-package))
