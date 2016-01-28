From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Thu, 28 Jan 2016 09:45:25 +0100
Subject: [Buildroot] [PATCH v2] rabbitmq-c: link against zlib and libintl
Message-ID: <1453970725-12387-1-git-send-email-joris.lijssens@gmail.com>
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
 ...bintl-are-needed-when-the-rabbitmq-toolse.patch | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 package/rabbitmq-c/0001-Zlib-and-libintl-are-needed-when-the-rabbitmq-toolse.patch

diff --git a/package/rabbitmq-c/0001-Zlib-and-libintl-are-needed-when-the-rabbitmq-toolse.patch b/package/rabbitmq-c/0001-Zlib-and-libintl-are-needed-when-the-rabbitmq-toolse.patch
new file mode 100644
index 0000000..35facea
--- /dev/null
+++ b/package/rabbitmq-c/0001-Zlib-and-libintl-are-needed-when-the-rabbitmq-toolse.patch
@@ -0,0 +1,87 @@
+From 208bc5adb10c73add19abb70f204951d1ef1b8b8 Mon Sep 17 00:00:00 2001
+From: Joris Lijssens <joris.lijssens@gmail.com>
+Date: Thu, 28 Jan 2016 09:14:24 +0100
+Subject: [PATCH] Zlib and libintl are needed when the rabbitmq toolset is
+ staticaly linked
+
+Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
+---
+ CMakeLists.txt             | 11 +++++++++++
+ librabbitmq/CMakeLists.txt |  2 +-
+ tools/CMakeLists.txt       | 10 +++++-----
+ 3 files changed, 17 insertions(+), 6 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9b40a37..c9b1113 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -71,6 +71,7 @@ else()
+   endif()
+ endif()
+ 
++
+ # Detect if we need to link against a socket library:
+ cmake_push_check_state()
+ if (WIN32)
+@@ -263,6 +264,16 @@ option(BUILD_API_DOCS "Build Doxygen API docs" ${DOXYGEN_FOUND})
+ option(ENABLE_SSL_SUPPORT "Enable SSL support" ON)
+ option(ENABLE_THREAD_SAFETY "Enable thread safety when using OpenSSL" ${Threads_FOUND})
+ 
++
++# Zlib and libintl are needed for the static linking of tools
++if (BUILD_STATIC_LIBS)
++  set(ZLIB_LIBRARY "z")
++  set(INTL_LIBRARY "intl")
++else ()
++  set(ZLIB_LIBRARY "")
++  set(INTL_LIBRARY "")
++endif()
++  
+ set(SSL_ENGINE "OpenSSL" CACHE STRING "SSL Backend to use, valid options: OpenSSL, cyaSSL, GnuTLS, PolarSSL")
+ mark_as_advanced(SSL_ENGINE)
+ 
+diff --git a/librabbitmq/CMakeLists.txt b/librabbitmq/CMakeLists.txt
+index 3c86094..46594f3 100644
+--- a/librabbitmq/CMakeLists.txt
++++ b/librabbitmq/CMakeLists.txt
+@@ -87,7 +87,7 @@ if (ENABLE_SSL_SUPPORT)
+         amqp_hostcheck.h
+     )
+     include_directories(${OPENSSL_INCLUDE_DIR})
+-    set(AMQP_SSL_LIBS ${OPENSSL_LIBRARIES})
++    set(AMQP_SSL_LIBS ${OPENSSL_LIBRARIES} ${ZLIB_LIBRARY})
+     if (APPLE)
+       # Apple has deprecated OpenSSL in 10.7+. This disables that warning.
+       set_source_files_properties(${AMQP_SSL_SRCS}
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
-- 
1.8.3.1
