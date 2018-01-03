From: Jan Heylen <heyleke@gmail.com>
Date: Wed,  3 Jan 2018 21:09:25 +0100
Subject: [Buildroot] [PATCH v4 2/2] opentracing-cpp: new package
In-Reply-To: <1515010165-25315-1-git-send-email-heyleke@gmail.com>
References: <1515010165-25315-1-git-send-email-heyleke@gmail.com>
Message-ID: <1515010165-25315-3-git-send-email-heyleke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Heylen <jan.heylen@nokia.com>

Signed-off-by: Jan Heylen <jan.heylen@nokia.com>
---
test-pkg passes

Changes v3 -> v4:
  - remove shared/static switch in mk file as that is handled in pkg-cmake.mk now

Changes v2 -> v3:
  - Fix another indendation typo
  - Add DEVELOPERS file change
  - Signoff opetracing-cpp patch
  - run test-pkg and include various dependencies (toolchain bug & m68k cf) 
  - add comments in Config.in on the dependencies

Changes v1 -> v2:
  - Fix indendation typo
  - Add licence hash
  - remove INTALL_TARGET=yes as that is default
---

 DEVELOPERS                                         |  3 +
 package/Config.in                                  |  1 +
 ...shared-static-target-a-configurable-optio.patch | 74 ++++++++++++++++++++++
 package/opentracing-cpp/Config.in                  | 16 +++++
 package/opentracing-cpp/opentracing-cpp.hash       |  3 +
 package/opentracing-cpp/opentracing-cpp.mk         | 14 ++++
 6 files changed, 111 insertions(+)
 create mode 100644 package/opentracing-cpp/0001-CMake-make-shared-static-target-a-configurable-optio.patch
 create mode 100644 package/opentracing-cpp/Config.in
 create mode 100644 package/opentracing-cpp/opentracing-cpp.hash
 create mode 100644 package/opentracing-cpp/opentracing-cpp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index fe989c0..f17fcdd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -790,6 +790,9 @@ F:	package/pangomm/
 F:	package/rpm/
 F:	package/yad/
 
+N:	Jan Heylen <jan.heylen@nokia.com>
+F:	package/opentracing-cpp/
+
 N:	Jan Kraval <jan.kraval@gmail.com>
 F:	board/orangepi/orangepi-lite
 F:	configs/orangepi_lite_defconfig
diff --git a/package/Config.in b/package/Config.in
index bd39a37..1150a3f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1288,6 +1288,7 @@ menu "Logging"
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
index 0000000..f13d21b
--- /dev/null
+++ b/package/opentracing-cpp/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_OPENTRACING_CPP
+	bool "opentracing-cpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
+	depends on !BR2_m68k_cf # exception_ptr
+	help
+	  OpenTracing API for C++
+
+	  http://opentracing.io
+
+comment "opentracing-cpp needs a toolchain w/ C++11"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
+comment "opentracing-cpp needs exception_ptr"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || BR2_m68k_cf
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
index 0000000..f1748ef
--- /dev/null
+++ b/package/opentracing-cpp/opentracing-cpp.mk
@@ -0,0 +1,14 @@
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
+$(eval $(cmake-package))
-- 
2.7.4
