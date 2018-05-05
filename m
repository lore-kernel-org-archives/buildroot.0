From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 5 May 2018 18:05:31 +0200
Subject: [Buildroot] [PATCH] Revert "zeromq: needs NPTL"
Message-ID: <20180505160530.GA1774@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 1e2a8d4111f57e79c1848c7a70c6501e2bdacd58.

Latest uClibc-ng release supports the missing functions even for
Linuxthreads. The toolchains must be rebuilded before commit.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/circus/Config.in       | 6 +++---
 package/cppzmq/Config.in       | 6 +++---
 package/czmq/Config.in         | 6 +++---
 package/filemq/Config.in       | 6 +++---
 package/mongrel2/Config.in     | 6 +++---
 package/php-zmq/Config.in      | 6 +++---
 package/python-pyzmq/Config.in | 6 +++---
 package/zeromq/Config.in       | 6 +++---
 package/zmqpp/Config.in        | 6 +++---
 package/zyre/Config.in         | 6 +++---
 10 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/package/circus/Config.in b/package/circus/Config.in
index e09d875..f1cd93c 100644
--- a/package/circus/Config.in
+++ b/package/circus/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_CIRCUS
 	bool "circus"
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	depends on BR2_INSTALL_LIBSTDCPP # pyzmq -> zeromq
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pyzmq -> zeromq
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pyzmq -> zeromq
 	select BR2_PACKAGE_PYTHON_IOWAIT # runtime
 	select BR2_PACKAGE_PYTHON_PSUTIL # runtime
 	select BR2_PACKAGE_PYTHON_PYZMQ # runtime
@@ -14,6 +14,6 @@ config BR2_PACKAGE_CIRCUS
 
 	  https://circus.readthedocs.org/en/latest/
 
-comment "circus needs Python and a toolchain w/ C++, NPTL"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+comment "circus needs Python and a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!(BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3)
diff --git a/package/cppzmq/Config.in b/package/cppzmq/Config.in
index d0ae0c2..c984c15 100644
--- a/package/cppzmq/Config.in
+++ b/package/cppzmq/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_CPPZMQ
 	bool "cppzmq"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # zeromq
+	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	select BR2_PACKAGE_ZEROMQ
 	help
 	  C++ binding for zeromq (ZeroMQ, 0MQ, zmq).
 
 	  http://github.com/zeromq/cppzmq
 
-comment "cppzmq needs a toolchain w/ C++, NPTL"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
+comment "cppzmq needs a toolchain w/ C++, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/czmq/Config.in b/package/czmq/Config.in
index d4ca46c..71389fc 100644
--- a/package/czmq/Config.in
+++ b/package/czmq/Config.in
@@ -2,13 +2,13 @@ config BR2_PACKAGE_CZMQ
 	bool "czmq"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # zeromq
+	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	select BR2_PACKAGE_ZEROMQ
 	help
 	  High-level C Binding for 0MQ
 
 	  http://czmq.zeromq.org/
 
-comment "czmq needs a toolchain w/ C++, NPTL"
+comment "czmq needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/filemq/Config.in b/package/filemq/Config.in
index b015e2e..b4720c1 100644
--- a/package/filemq/Config.in
+++ b/package/filemq/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_FILEMQ
 	bool "filemq"
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # zeromq
+	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	depends on BR2_USE_MMU # czmq
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_CZMQ
@@ -11,6 +11,6 @@ config BR2_PACKAGE_FILEMQ
 
 	  http://github.com/zeromq/filemq
 
-comment "filemq needs a toolchain w/ C++, NPTL"
+comment "filemq needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
index 09bc8bd..a9b09b7 100644
--- a/package/mongrel2/Config.in
+++ b/package/mongrel2/Config.in
@@ -7,15 +7,15 @@ config BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS
 	default y if BR2_TOOLCHAIN_USES_UCLIBC && \
 		(BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_sparc || BR2_x86_64)
 
-comment "mongrel2 needs a uClibc or glibc toolchain w/ C++, NPTL, dynamic library"
+comment "mongrel2 needs a uClibc or glibc toolchain w/ C++, threads, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
 		!BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS
 
 config BR2_PACKAGE_MONGREL2
 	bool "mongrel2"
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # zeromq
+	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	depends on !BR2_STATIC_LIBS # uses dlopen()
 	depends on BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS
 	select BR2_PACKAGE_SQLITE
diff --git a/package/php-zmq/Config.in b/package/php-zmq/Config.in
index 3f7406b..058f93d 100644
--- a/package/php-zmq/Config.in
+++ b/package/php-zmq/Config.in
@@ -1,11 +1,11 @@
-comment "php-zmq needs a toolchain w/ C++, NPTL"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
+comment "php-zmq needs a toolchain w/ C++, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
 
 config BR2_PACKAGE_PHP_ZMQ
 	bool "php-zmq"
 	depends on BR2_PACKAGE_PHP
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # zeromq
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ZEROMQ
 	help
 	  ZeroMQ messaging bindings for PHP
diff --git a/package/python-pyzmq/Config.in b/package/python-pyzmq/Config.in
index 2501912..8f33a63 100644
--- a/package/python-pyzmq/Config.in
+++ b/package/python-pyzmq/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_PYTHON_PYZMQ
 	bool "python-pyzmq"
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # zeromq
+	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	select BR2_PACKAGE_ZEROMQ
 	help
 	  This package contains the python language binding for zeromq.
 
 	  http://zeromq.org/bindings:python
 
-comment "python-pyzmq needs a toolchain w/ C++, NPTL"
+comment "python-pyzmq needs a toolchain w/ C++, threads"
 	depends on BR2_PACKAGE_PYTHON
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index 25e438a..69be9f0 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -1,10 +1,10 @@
-comment "zeromq needs a toolchain w/ C++, NPTL"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
+comment "zeromq needs a toolchain w/ C++, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
 
 config BR2_PACKAGE_ZEROMQ
 	bool "zeromq"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
index b9d4dcf..8dad80e 100644
--- a/package/zmqpp/Config.in
+++ b/package/zmqpp/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_ZMQPP
 	# c++1x support
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # zeromq
+	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	select BR2_PACKAGE_ZEROMQ
 	help
 	  C++ binding for zeromq (ZeroMQ, 0MQ, zmq).
@@ -13,8 +13,8 @@ config BR2_PACKAGE_ZMQPP
 
 	  http://github.com/benjamg/zmqpp
 
-comment "zmqpp needs a toolchain w/ C++, NPTL, gcc >= 4.7"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+comment "zmqpp needs a toolchain w/ C++, threads, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 
 if BR2_PACKAGE_ZMQPP
diff --git a/package/zyre/Config.in b/package/zyre/Config.in
index 340e977..21a0884 100644
--- a/package/zyre/Config.in
+++ b/package/zyre/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_ZYRE
 	bool "zyre"
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # zeromq
+	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	depends on BR2_USE_MMU # czmq
 	select BR2_PACKAGE_CZMQ
 	select BR2_PACKAGE_ZEROMQ
@@ -11,6 +11,6 @@ config BR2_PACKAGE_ZYRE
 
 	  http://zyre.org
 
-comment "zyre needs a toolchain w/ C++, NPTL"
+comment "zyre needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
-- 
2.1.4
