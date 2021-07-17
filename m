From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 17 Jul 2021 17:11:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/kismet: bump to version 2021-06-R1
Message-ID: <20210717151159.1094518-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

- Drop patches (already in version)
- C++14 is mandatory since version 2021-05-R1 and
  https://github.com/kismetwireless/kismet/commit/35fefe38054f40014aae7ade9eb80c1c7f7c6c30

https://www.kismetwireless.net/release/kismet-2021-05-R1
https://www.kismetwireless.net/release/kismet-2021-06-R1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...to-read-database-values-as-long-long.patch | 28 --------
 ...sio-Use-eventfd-function-with-uClibc.patch | 66 -------------------
 package/kismet/Config.in                      | 18 ++---
 package/kismet/kismet.hash                    |  2 +-
 package/kismet/kismet.mk                      |  5 +-
 5 files changed, 11 insertions(+), 108 deletions(-)
 delete mode 100644 package/kismet/0001-Add-getter-to-read-database-values-as-long-long.patch
 delete mode 100644 package/kismet/0002-boost-asio-Use-eventfd-function-with-uClibc.patch

diff --git a/package/kismet/0001-Add-getter-to-read-database-values-as-long-long.patch b/package/kismet/0001-Add-getter-to-read-database-values-as-long-long.patch
deleted file mode 100644
index 564cba87bb..0000000000
--- a/package/kismet/0001-Add-getter-to-read-database-values-as-long-long.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 1d36faad18e34b43ac8ea3e7f6a44315f827a2db Mon Sep 17 00:00:00 2001
-From: George Hopkins <george-hopkins@null.net>
-Date: Mon, 4 Jan 2021 13:59:41 +0100
-Subject: [PATCH] Add getter to read database values as long long
-
-[Retrieved from:
-https://github.com/kismetwireless/kismet/commit/1d36faad18e34b43ac8ea3e7f6a44315f827a2db]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- sqlite3_cpp11.cc | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/sqlite3_cpp11.cc b/sqlite3_cpp11.cc
-index 7974bde8c..5c92dfa87 100644
---- a/sqlite3_cpp11.cc
-+++ b/sqlite3_cpp11.cc
-@@ -411,6 +411,11 @@ namespace kissqlite3 {
-         return (unsigned long) sqlite3_column_int64(stmt.get(), column);
-     }
- 
-+    template<>
-+    long long sqlite3_column_as(std::shared_ptr<sqlite3_stmt> stmt, unsigned int column) {
-+        return (long long) sqlite3_column_int64(stmt.get(), column);
-+    }
-+
-     template<>
-     unsigned long long sqlite3_column_as(std::shared_ptr<sqlite3_stmt> stmt, unsigned int column) {
-         return (unsigned long long) sqlite3_column_int64(stmt.get(), column);
diff --git a/package/kismet/0002-boost-asio-Use-eventfd-function-with-uClibc.patch b/package/kismet/0002-boost-asio-Use-eventfd-function-with-uClibc.patch
deleted file mode 100644
index eb5fb2ec21..0000000000
--- a/package/kismet/0002-boost-asio-Use-eventfd-function-with-uClibc.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 9330d34ced1d7d0e56d579bb55a9ed1286d324f0 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 4 Mar 2021 13:36:52 +0100
-Subject: [PATCH] boost/asio: Use eventfd() function with uClibc
-
-Fix build with uclibc thanks to
-https://github.com/boostorg/asio/commit/b2ee39aee0b186c5bcabb051b7a536ab1517616a
-
-Fixes:
- - http://autobuild.buildroot.org/results/1c2885d75219aabadbb66ab66fe0dc4b4346ff1e
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/kismetwireless/kismet/commit/9330d34ced1d7d0e56d579bb55a9ed1286d324f0]
----
- .../asio/detail/impl/eventfd_select_interrupter.ipp  | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/boost/asio/detail/impl/eventfd_select_interrupter.ipp b/boost/asio/detail/impl/eventfd_select_interrupter.ipp
-index 38d4b2a6..8bdb3c20 100644
---- a/boost/asio/detail/impl/eventfd_select_interrupter.ipp
-+++ b/boost/asio/detail/impl/eventfd_select_interrupter.ipp
-@@ -23,11 +23,11 @@
- #include <sys/stat.h>
- #include <sys/types.h>
- #include <fcntl.h>
--#if __GLIBC__ == 2 && __GLIBC_MINOR__ < 8
-+#if __GLIBC__ == 2 && __GLIBC_MINOR__ < 8 && !defined(__UCLIBC__)
- # include <asm/unistd.h>
--#else // __GLIBC__ == 2 && __GLIBC_MINOR__ < 8
-+#else // __GLIBC__ == 2 && __GLIBC_MINOR__ < 8 && !defined(__UCLIBC__)
- # include <sys/eventfd.h>
--#endif // __GLIBC__ == 2 && __GLIBC_MINOR__ < 8
-+#endif // __GLIBC__ == 2 && __GLIBC_MINOR__ < 8 && !defined(__UCLIBC__)
- #include <boost/asio/detail/cstdint.hpp>
- #include <boost/asio/detail/eventfd_select_interrupter.hpp>
- #include <boost/asio/detail/throw_error.hpp>
-@@ -46,14 +46,14 @@ eventfd_select_interrupter::eventfd_select_interrupter()
- 
- void eventfd_select_interrupter::open_descriptors()
- {
--#if __GLIBC__ == 2 && __GLIBC_MINOR__ < 8
-+#if __GLIBC__ == 2 && __GLIBC_MINOR__ < 8 && !defined(__UCLIBC__)
-   write_descriptor_ = read_descriptor_ = syscall(__NR_eventfd, 0);
-   if (read_descriptor_ != -1)
-   {
-     ::fcntl(read_descriptor_, F_SETFL, O_NONBLOCK);
-     ::fcntl(read_descriptor_, F_SETFD, FD_CLOEXEC);
-   }
--#else // __GLIBC__ == 2 && __GLIBC_MINOR__ < 8
-+#else // __GLIBC__ == 2 && __GLIBC_MINOR__ < 8 && !defined(__UCLIBC__)
- # if defined(EFD_CLOEXEC) && defined(EFD_NONBLOCK)
-   write_descriptor_ = read_descriptor_ =
-     ::eventfd(0, EFD_CLOEXEC | EFD_NONBLOCK);
-@@ -70,7 +70,7 @@ void eventfd_select_interrupter::open_descriptors()
-       ::fcntl(read_descriptor_, F_SETFD, FD_CLOEXEC);
-     }
-   }
--#endif // __GLIBC__ == 2 && __GLIBC_MINOR__ < 8
-+#endif // __GLIBC__ == 2 && __GLIBC_MINOR__ < 8 && !defined(__UCLIBC__)
- 
-   if (read_descriptor_ == -1)
-   {
--- 
-2.30.0
-
diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index d9f8ebe03d..961d5f230e 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -1,6 +1,8 @@
-comment "kismet needs a toolchain w/ threads, C++"
+comment "kismet needs a toolchain w/ threads, C++, gcc >= 5"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 
 config BR2_PACKAGE_KISMET
@@ -9,6 +11,7 @@ config BR2_PACKAGE_KISMET
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf-c
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_PROTOBUF_C
 	select BR2_PACKAGE_SQLITE
@@ -32,7 +35,6 @@ config BR2_PACKAGE_KISMET_PYTHON_TOOLS
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
 	depends on BR2_PACKAGE_PYTHON3
 	depends on !BR2_STATIC_LIBS # protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_PYTHON_NUMPY # runtime for RTLAMR and RTLADSB
@@ -48,8 +50,8 @@ comment "python tools needs python3"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 
-comment "python tools needs a glibc or musl toolchain w/ dynamic library, gcc >= 4.8"
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+comment "python tools needs a glibc or musl toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
@@ -60,15 +62,13 @@ config BR2_PACKAGE_KISMET_SERVER
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	select BR2_PACKAGE_PROTOBUF
 
-comment "server needs a toolchain w/ dynamic library, wchar, gcc >= 4.8"
+comment "server needs a toolchain w/ dynamic library, wchar"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 comment "server needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/kismet/kismet.hash b/package/kismet/kismet.hash
index 2b0baa1009..4c986a159b 100644
--- a/package/kismet/kismet.hash
+++ b/package/kismet/kismet.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  52a8eddd560688693552bcd8ff033f662a1a57b47650d6434c5e2c6d83e2bb33  kismet-2020-12-R3.tar.xz
+sha256  f85939c9d32fa72d777db35c68af84c379171b94380acad0db7924f95a81bdaa  kismet-2021-06-R1.tar.xz
 sha256  93c7f0d7e356b0abfb6f494ff3ea37f96abc84e9a5619b25d4e43f7553a55739  LICENSE
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 3a171af7b2..64f9501db8 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KISMET_VERSION = 2020-12-R3
+KISMET_VERSION = 2021-06-R1
 KISMET_SOURCE = kismet-$(KISMET_VERSION).tar.xz
 KISMET_SITE = http://www.kismetwireless.net/code
 KISMET_DEPENDENCIES = \
@@ -18,9 +18,6 @@ KISMET_DEPENDENCIES = \
 KISMET_LICENSE = GPL-2.0+
 KISMET_LICENSE_FILES = LICENSE
 KISMET_SELINUX_MODULES = kismet
-# Needed because tarball configure has not been rebuilt after
-# https://github.com/kismetwireless/kismet/commit/e70968bcbca86dd448d619c40cdeaae8b7dcee98
-KISMET_AUTORECONF = YES
 
 KISMET_CONF_OPTS = --disable-debuglibs
 
-- 
2.30.2
