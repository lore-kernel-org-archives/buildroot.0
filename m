From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Mar 2018 19:56:25 +0100
Subject: [Buildroot] [git commit] libcpprestsdk: bump to v2.10.2
Message-ID: <20180310191622.5AE987FA5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=768244aeb31b121de2d6747862b6039ea5a562c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstream patches as well.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-fix-xlocale-header-check.patch            | 55 ----------------------
 ...restsdk-fix-building-as-a-static-library.patch} |  0
 .../0002-include-sys-time-for-struct-timeval.patch | 28 -----------
 package/libcpprestsdk/0003-fix-strand.patch        | 28 -----------
 package/libcpprestsdk/libcpprestsdk.hash           |  2 +-
 package/libcpprestsdk/libcpprestsdk.mk             |  2 +-
 6 files changed, 2 insertions(+), 113 deletions(-)

diff --git a/package/libcpprestsdk/0001-fix-xlocale-header-check.patch b/package/libcpprestsdk/0001-fix-xlocale-header-check.patch
deleted file mode 100644
index ffed94a07f..0000000000
--- a/package/libcpprestsdk/0001-fix-xlocale-header-check.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From a826b7b656c165bc35746d9af3ec371387d2bca1 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Mon, 23 Oct 2017 08:11:21 -0400
-Subject: [PATCH] fix xlocale header check
-
-asyncrt_utils.h checks if __GLIBC__ is not defined before including
-xlocal.h.  This will cause a compilation failure on uclibc and musl.
-
-Add a proper check in CMakeLists.txt and check for HAVE_XLOCALE_H
-instead of __GLIBC__
-
-Upstream-Status: Accepted
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- Release/CMakeLists.txt                  | 3 +++
- Release/include/cpprest/asyncrt_utils.h | 2 +-
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/Release/CMakeLists.txt b/Release/CMakeLists.txt
-index d57aa3d..eefae75 100644
---- a/Release/CMakeLists.txt
-+++ b/Release/CMakeLists.txt
-@@ -42,6 +42,7 @@ include(cmake/cpprest_find_boost.cmake)
- include(cmake/cpprest_find_zlib.cmake)
- include(cmake/cpprest_find_openssl.cmake)
- include(cmake/cpprest_find_websocketpp.cmake)
-+include(CheckIncludeFiles)
- 
- find_package(Threads REQUIRED)
- if(THREADS_HAVE_PTHREAD_ARG)
-@@ -56,6 +57,8 @@ if(CPPREST_EXCLUDE_WEBSOCKETS)
-   set(CPPREST_WEBSOCKETS_IMPL none CACHE STRING "Internal use.")
- endif()
- 
-+CHECK_INCLUDE_FILES(xlocale.h HAVE_XLOCALE_H)
-+
- if(APPLE) # Note: also iOS
-   set(CPPREST_PPLX_IMPL apple CACHE STRING "Internal use.")
-   set(CPPREST_WEBSOCKETS_IMPL wspp CACHE STRING "Internal use.")
-diff --git a/Release/include/cpprest/asyncrt_utils.h b/Release/include/cpprest/asyncrt_utils.h
-index fac70a9..8faa2dc 100644
---- a/Release/include/cpprest/asyncrt_utils.h
-+++ b/Release/include/cpprest/asyncrt_utils.h
-@@ -29,7 +29,7 @@
- 
- #ifndef _WIN32
- #include <boost/algorithm/string.hpp>
--#if !defined(ANDROID) && !defined(__ANDROID__) && !defined(__GLIBC__) // CodePlex 269
-+#if !defined(ANDROID) && !defined(__ANDROID__) && defined(HAVE_XLOCALE_H) // CodePlex 269
- /* Systems using glibc: xlocale.h has been removed from glibc 2.26
-    The above include of locale.h is sufficient
-    Further details: https://sourceware.org/git/?p=glibc.git;a=commit;h=f0be25b6336db7492e47d2e8e72eb8af53b5506d */
--- 
-2.13.6
-
diff --git a/package/libcpprestsdk/0004-libcpprestsdk-fix-building-as-a-static-library.patch b/package/libcpprestsdk/0001-libcpprestsdk-fix-building-as-a-static-library.patch
similarity index 100%
rename from package/libcpprestsdk/0004-libcpprestsdk-fix-building-as-a-static-library.patch
rename to package/libcpprestsdk/0001-libcpprestsdk-fix-building-as-a-static-library.patch
diff --git a/package/libcpprestsdk/0002-include-sys-time-for-struct-timeval.patch b/package/libcpprestsdk/0002-include-sys-time-for-struct-timeval.patch
deleted file mode 100644
index 12f049bf7b..0000000000
--- a/package/libcpprestsdk/0002-include-sys-time-for-struct-timeval.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 25453f9c186cf441881b06bc5503d979acb0ab75 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@gmail.com>
-Date: Mon, 23 Oct 2017 09:38:11 -0400
-Subject: [PATCH] Include sys/time.h for struct timeval
-
-This is needed with musl.
-
-Upstream-Status: Accepted
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
----
- Release/include/cpprest/asyncrt_utils.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Release/include/cpprest/asyncrt_utils.h b/Release/include/cpprest/asyncrt_utils.h
-index 8faa2dc..aab87a5 100644
---- a/Release/include/cpprest/asyncrt_utils.h
-+++ b/Release/include/cpprest/asyncrt_utils.h
-@@ -28,6 +28,7 @@
- #endif
- 
- #ifndef _WIN32
-+#include <sys/time.h>
- #include <boost/algorithm/string.hpp>
- #if !defined(ANDROID) && !defined(__ANDROID__) && defined(HAVE_XLOCALE_H) // CodePlex 269
- /* Systems using glibc: xlocale.h has been removed from glibc 2.26
--- 
-2.13.6
-
diff --git a/package/libcpprestsdk/0003-fix-strand.patch b/package/libcpprestsdk/0003-fix-strand.patch
deleted file mode 100644
index f5710b38b9..0000000000
--- a/package/libcpprestsdk/0003-fix-strand.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From e75d642726c4c78c368e74660ef4bc5503f3ec12 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@codeblue.com>
-Date: Sun, 14 Jan 2018 14:44:02 -0500
-Subject: [PATCH] fix strand
-
-From upstream, fixes compiling against boost 1.66 strand.
-
-Commit IDs 6b2e0480018530b616f61d5cdc786c92ba148bb7
-
-Signed-off-by: Adam Duskett <aduskett@codeblue.com>
----
- Release/include/pplx/threadpool.h                                  | 2 +-
- Release/libs/websocketpp/websocketpp/transport/asio/connection.hpp | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Release/libs/websocketpp/websocketpp/transport/asio/connection.hpp b/Release/libs/websocketpp/websocketpp/transport/asio/connection.hpp
-index 0be40f6b..395632c3 100644
---- a/Release/libs/websocketpp/websocketpp/transport/asio/connection.hpp
-+++ b/Release/libs/websocketpp/websocketpp/transport/asio/connection.hpp
-@@ -422,7 +422,7 @@ class connection : public config::socket_type::socket_con_type {
-         m_io_service = io_service;
- 
-         if (config::enable_multithreading) {
--            m_strand = lib::make_shared<boost::asio::strand>(
-+            m_strand = lib::make_shared<boost::asio::io_service::strand>(
-                 lib::ref(*io_service));
- 
-             m_async_read_handler = m_strand->wrap(lib::bind(
diff --git a/package/libcpprestsdk/libcpprestsdk.hash b/package/libcpprestsdk/libcpprestsdk.hash
index 0bddfc916e..20a9395329 100644
--- a/package/libcpprestsdk/libcpprestsdk.hash
+++ b/package/libcpprestsdk/libcpprestsdk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 f38bc48e6fca969de794dcd65889df6563855cee5ff99742dafc6b2869976e71	libcpprestsdk-v2.10.1.tar.gz
+sha256 fb0b611007732d8de9528bc37bd67468e7ef371672f89c88f225f73cdc4ffcf1	libcpprestsdk-v2.10.2.tar.gz
 sha256 5c191789f502ac87df83b57008d2fc3e47fbf31315381b5bc4309f6602d0fe97	license.txt
diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
index 4d30f07c39..20700ae2b2 100644
--- a/package/libcpprestsdk/libcpprestsdk.mk
+++ b/package/libcpprestsdk/libcpprestsdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCPPRESTSDK_VERSION = v2.10.1
+LIBCPPRESTSDK_VERSION = v2.10.2
 LIBCPPRESTSDK_SITE = $(call github,Microsoft,cpprestsdk,$(LIBCPPRESTSDK_VERSION))
 LIBCPPRESTSDK_LICENSE = MIT
 LIBCPPRESTSDK_LICENSE_FILES = license.txt
