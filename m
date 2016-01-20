From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Wed, 20 Jan 2016 10:24:56 +0100
Subject: [Buildroot] [PATCH] rabbitmq-c: link against zlib and libintl
Message-ID: <1453281896-24831-1-git-send-email-joris.lijssens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building the amqp toolset and static linking is enabled, the
rabbitmq-c library needs to explicity link against zlib and libintl

Fixes:
http://autobuild.buildroot.net/results/2ef/2ef1ed958db8012224f9174334e9c58edace604a/

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
---
 ...t-zlib-and-libintl-needed-for-static-link.patch | 166 +++++++++++++++++++++
 package/rabbitmq-c/Config.in                       |   1 +
 package/rabbitmq-c/rabbitmq-c.mk                   |   1 +
 3 files changed, 168 insertions(+)
 create mode 100644 package/rabbitmq-c/0001-link-against-zlib-and-libintl-needed-for-static-link.patch

diff --git a/package/rabbitmq-c/0001-link-against-zlib-and-libintl-needed-for-static-link.patch b/package/rabbitmq-c/0001-link-against-zlib-and-libintl-needed-for-static-link.patch
new file mode 100644
index 0000000..5e18b18
--- /dev/null
+++ b/package/rabbitmq-c/0001-link-against-zlib-and-libintl-needed-for-static-link.patch
@@ -0,0 +1,166 @@
+From 2d62bfe5bdf8be119ee05edb89120b1c89bd7ea0 Mon Sep 17 00:00:00 2001
+From: Joris Lijssens <joris.lijssens@gmail.com>
+Date: Tue, 19 Jan 2016 15:15:07 +0100
+Subject: [PATCH] link against zlib and libintl needed for static linking
+
+Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
+---
+ CMakeLists.txt             |  2 ++
+ cmake/FindINTL.cmake       | 40 ++++++++++++++++++++++++++++++++++++++++
+ cmake/FindZLIB.cmake       | 40 ++++++++++++++++++++++++++++++++++++++++
+ librabbitmq/CMakeLists.txt |  2 +-
+ tools/CMakeLists.txt       | 10 +++++-----
+ 5 files changed, 88 insertions(+), 6 deletions(-)
+ create mode 100644 cmake/FindINTL.cmake
+ create mode 100644 cmake/FindZLIB.cmake
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9b40a37..388c5b3 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -243,6 +243,8 @@ if (REGENERATE_AMQP_FRAMING)
+ endif (REGENERATE_AMQP_FRAMING)
+ 
+ find_package(POPT)
++find_package(ZLIB)
++find_package(INTL)
+ find_package(XmlTo)
+ find_package(Doxygen)
+ 
+diff --git a/cmake/FindINTL.cmake b/cmake/FindINTL.cmake
+new file mode 100644
+index 0000000..5ddf052
+--- /dev/null
++++ b/cmake/FindINTL.cmake
+@@ -0,0 +1,40 @@
++# vim:set ts=2 sw=2 sts=2 et:
++# - Try to find the intl options processing library
++# The module will set the following variables
++#
++#  INTL_FOUND - System has intl support
++#  INTL_INCLUDE_DIR - The intl include directory
++#  INTL_LIBRARY - The libraries needed to use intl
++
++# use pkg-config to get the directories and then use these values
++# in the FIND_PATH() and FIND_LIBRARY() calls
++
++find_package(PkgConfig QUIET)
++if (PKG_CONFIG_FOUND)
++  pkg_search_module(PC_INTL QUIET intl)
++endif ()
++
++# Find the include directories
++FIND_PATH(INTL_INCLUDE_DIR
++    NAMES libintl.h
++    HINTS
++          ${PC_INTL_INCLUDEDIR}
++          ${PC_INTL_INCLUDE_DIRS}
++    DOC "Path containing the libintl.h include file"
++    )
++
++FIND_LIBRARY(INTL_LIBRARY
++    NAMES intl
++    HINTS
++          ${PC_INTL_LIBRARYDIR}
++          ${PC_INTL_LIBRARY_DIRS}
++    DOC "intl library path"
++    )
++
++include(FindPackageHandleStandardArgs)
++
++FIND_PACKAGE_HANDLE_STANDARD_ARGS(INTL
++  REQUIRED_VARS INTL_INCLUDE_DIR INTL_LIBRARY
++  VERSION_VAR PC_INTL_VERSION)
++
++MARK_AS_ADVANCED(INTL_INCLUDE_DIR INTL_LIBRARY)
+diff --git a/cmake/FindZLIB.cmake b/cmake/FindZLIB.cmake
+new file mode 100644
+index 0000000..82da95b
+--- /dev/null
++++ b/cmake/FindZLIB.cmake
+@@ -0,0 +1,40 @@
++# vim:set ts=2 sw=2 sts=2 et:
++# - Try to find the zlib options processing library
++# The module will set the following variables
++#
++#  ZLIB_FOUND - System has zlib
++#  ZLIB_INCLUDE_DIR - The zlib include directory
++#  ZLIB_LIBRARY - The libraries needed to use zlib
++
++# use pkg-config to get the directories and then use these values
++# in the FIND_PATH() and FIND_LIBRARY() calls
++
++find_package(PkgConfig QUIET)
++if (PKG_CONFIG_FOUND)
++  pkg_search_module(PC_ZLIB QUIET zlib)
++endif ()
++
++# Find the include directories
++FIND_PATH(ZLIB_INCLUDE_DIR
++    NAMES zlib.h
++    HINTS
++          ${PC_ZLIB_INCLUDEDIR}
++          ${PC_ZLIB_INCLUDE_DIRS}
++    DOC "Path containing the zlib.h include file"
++    )
++
++FIND_LIBRARY(ZLIB_LIBRARY
++    NAMES z
++    HINTS
++          ${PC_ZLIB_LIBRARYDIR}
++          ${PC_ZLIB_LIBRARY_DIRS}
++    DOC "zlib library path"
++    )
++
++include(FindPackageHandleStandardArgs)
++
++FIND_PACKAGE_HANDLE_STANDARD_ARGS(ZLIB
++  REQUIRED_VARS ZLIB_INCLUDE_DIR ZLIB_LIBRARY
++  VERSION_VAR PC_ZLIB_VERSION)
++
++MARK_AS_ADVANCED(ZLIB_INCLUDE_DIR ZLIB_LIBRARY)
+diff --git a/librabbitmq/CMakeLists.txt b/librabbitmq/CMakeLists.txt
+index 3c86094..67e0d9d 100644
+--- a/librabbitmq/CMakeLists.txt
++++ b/librabbitmq/CMakeLists.txt
+@@ -138,7 +138,7 @@ add_definitions(-DAMQP_BUILD)
+ 
+ include(InstallMacros)
+ 
+-set(RMQ_LIBRARIES ${AMQP_SSL_LIBS} ${SOCKET_LIBRARIES} ${LIBRT} ${CMAKE_THREAD_LIBS_INIT})
++set(RMQ_LIBRARIES ${AMQP_SSL_LIBS} ${ZLIB_LIBRARY} ${SOCKET_LIBRARIES} ${LIBRT} ${CMAKE_THREAD_LIBS_INIT})
+ 
+ if (BUILD_SHARED_LIBS)
+     add_library(rabbitmq SHARED ${RABBITMQ_SOURCES})
+diff --git a/tools/CMakeLists.txt b/tools/CMakeLists.txt
+index 52e3464..8658ea7 100644
+--- a/tools/CMakeLists.txt
++++ b/tools/CMakeLists.txt
+@@ -19,19 +19,19 @@ set(COMMON_SRCS
+     )
+ 
+ add_executable(amqp-publish publish.c ${COMMON_SRCS})
+-target_link_libraries(amqp-publish ${RMQ_LIBRARY_TARGET} ${POPT_LIBRARY})
++target_link_libraries(amqp-publish ${RMQ_LIBRARY_TARGET} ${POPT_LIBRARY} ${INTL_LIBRARY})
+ 
+ add_executable(amqp-get get.c ${COMMON_SRCS})
+-target_link_libraries(amqp-get ${RMQ_LIBRARY_TARGET} ${POPT_LIBRARY})
++target_link_libraries(amqp-get ${RMQ_LIBRARY_TARGET} ${POPT_LIBRARY} ${INTL_LIBRARY})
+ 
+ add_executable(amqp-consume consume.c ${PLATFORM_DIR}/process.c ${COMMON_SRCS})
+-target_link_libraries(amqp-consume ${RMQ_LIBRARY_TARGET} ${POPT_LIBRARY})
++target_link_libraries(amqp-consume ${RMQ_LIBRARY_TARGET} ${POPT_LIBRARY} ${INTL_LIBRARY})
+ 
+ add_executable(amqp-declare-queue declare_queue.c ${COMMON_SRCS})
+-target_link_libraries(amqp-declare-queue ${RMQ_LIBRARY_TARGET} ${POPT_LIBRARY})
++target_link_libraries(amqp-declare-queue ${RMQ_LIBRARY_TARGET} ${POPT_LIBRARY} ${INTL_LIBRARY})
+ 
+ add_executable(amqp-delete-queue delete_queue.c ${COMMON_SRCS})
+-target_link_libraries(amqp-delete-queue ${RMQ_LIBRARY_TARGET} ${POPT_LIBRARY})
++target_link_libraries(amqp-delete-queue ${RMQ_LIBRARY_TARGET} ${POPT_LIBRARY} ${INTL_LIBRARY})
+ 
+ if (BUILD_TOOLS_DOCS)
+   if (XMLTO_FOUND)
+-- 
+1.8.3.1
+
diff --git a/package/rabbitmq-c/Config.in b/package/rabbitmq-c/Config.in
index 0d08233..87bd3cb 100644
--- a/package/rabbitmq-c/Config.in
+++ b/package/rabbitmq-c/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_RABBITMQ_C
 	# too old uClibc, not providing posix_spawn functions
 	# http://autobuild.buildroot.net/results/a6c3e79c61c5a535970d03bf37b068349f766a7f/
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
+	select BR2_PACKAGE_ZLIB
 	help
 	  This is a C-language AMQP client library for use with v2.0+
 	  of the RabbitMQ broker.
diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
index 42e2548..f2f3fb5 100644
--- a/package/rabbitmq-c/rabbitmq-c.mk
+++ b/package/rabbitmq-c/rabbitmq-c.mk
@@ -9,6 +9,7 @@ RABBITMQ_C_SITE = https://github.com/alanxz/rabbitmq-c/releases/download/v$(RABB
 RABBITMQ_C_LICENSE = MIT
 RABBITMQ_C_LICENSE_FILES = LICENSE-MIT
 RABBITMQ_C_INSTALL_STAGING = YES
+RABBITMQ_C_DEPENDENCIES += zlib
 RABBITMQ_C_CONF_OPTS = \
 	-DBUILD_API_DOCS=OFF \
 	-DBUILD_TOOLS_DOCS=OFF
-- 
1.8.3.1
