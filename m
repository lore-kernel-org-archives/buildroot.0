From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Apr 2018 23:40:33 +0200
Subject: [Buildroot] [git commit] zeromq: needs NPTL
Message-ID: <20180419214048.333D5888A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e2a8d4111f57e79c1848c7a70c6501e2bdacd58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The recent zeromq version bump to 4.2.5 added a call to
pthread_condattr_setclock() which is only provided by the NPTL
implementation of pthreads. Add this dependency to zeromq and all
reverse dependencies recursively.

Fixes:
http://autobuild.buildroot.net/results/2d0/2d070074097270a1e6973bc19e2bded2a7023c49/
http://autobuild.buildroot.net/results/1ce/1ce6d6f0f6390f552954a09f7dc753e0baa86675/
http://autobuild.buildroot.net/results/97c/97c5b9f3bc2c94f8476e884b9a3163bbf2dad8d4/

Cc: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
index f1cd93c733..e09d87549c 100644
--- a/package/circus/Config.in
+++ b/package/circus/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_CIRCUS
 	bool "circus"
 	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	depends on BR2_INSTALL_LIBSTDCPP # pyzmq -> zeromq
-	depends on BR2_TOOLCHAIN_HAS_THREADS # pyzmq -> zeromq
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pyzmq -> zeromq
 	select BR2_PACKAGE_PYTHON_IOWAIT # runtime
 	select BR2_PACKAGE_PYTHON_PSUTIL # runtime
 	select BR2_PACKAGE_PYTHON_PYZMQ # runtime
@@ -14,6 +14,6 @@ config BR2_PACKAGE_CIRCUS
 
 	  https://circus.readthedocs.org/en/latest/
 
-comment "circus needs Python and a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+comment "circus needs Python and a toolchain w/ C++, NPTL"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!(BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3)
diff --git a/package/cppzmq/Config.in b/package/cppzmq/Config.in
index c984c15c96..d0ae0c22c2 100644
--- a/package/cppzmq/Config.in
+++ b/package/cppzmq/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_CPPZMQ
 	bool "cppzmq"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # zeromq
 	select BR2_PACKAGE_ZEROMQ
 	help
 	  C++ binding for zeromq (ZeroMQ, 0MQ, zmq).
 
 	  http://github.com/zeromq/cppzmq
 
-comment "cppzmq needs a toolchain w/ C++, threads"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
+comment "cppzmq needs a toolchain w/ C++, NPTL"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
diff --git a/package/czmq/Config.in b/package/czmq/Config.in
index 71389fce51..d4ca46c36c 100644
--- a/package/czmq/Config.in
+++ b/package/czmq/Config.in
@@ -2,13 +2,13 @@ config BR2_PACKAGE_CZMQ
 	bool "czmq"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
-	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # zeromq
 	select BR2_PACKAGE_ZEROMQ
 	help
 	  High-level C Binding for 0MQ
 
 	  http://czmq.zeromq.org/
 
-comment "czmq needs a toolchain w/ C++, threads"
+comment "czmq needs a toolchain w/ C++, NPTL"
 	depends on BR2_USE_MMU
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
diff --git a/package/filemq/Config.in b/package/filemq/Config.in
index b4720c1d4c..b015e2ead1 100644
--- a/package/filemq/Config.in
+++ b/package/filemq/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_FILEMQ
 	bool "filemq"
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
-	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # zeromq
 	depends on BR2_USE_MMU # czmq
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_CZMQ
@@ -11,6 +11,6 @@ config BR2_PACKAGE_FILEMQ
 
 	  http://github.com/zeromq/filemq
 
-comment "filemq needs a toolchain w/ C++, threads"
+comment "filemq needs a toolchain w/ C++, NPTL"
 	depends on BR2_USE_MMU
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
index a9b09b786c..09bc8bd0a2 100644
--- a/package/mongrel2/Config.in
+++ b/package/mongrel2/Config.in
@@ -7,15 +7,15 @@ config BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS
 	default y if BR2_TOOLCHAIN_USES_UCLIBC && \
 		(BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_sparc || BR2_x86_64)
 
-comment "mongrel2 needs a uClibc or glibc toolchain w/ C++, threads, dynamic library"
+comment "mongrel2 needs a uClibc or glibc toolchain w/ C++, NPTL, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
 		!BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS
 
 config BR2_PACKAGE_MONGREL2
 	bool "mongrel2"
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
-	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # zeromq
 	depends on !BR2_STATIC_LIBS # uses dlopen()
 	depends on BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS
 	select BR2_PACKAGE_SQLITE
diff --git a/package/php-zmq/Config.in b/package/php-zmq/Config.in
index 058f93d9a8..3f7406b262 100644
--- a/package/php-zmq/Config.in
+++ b/package/php-zmq/Config.in
@@ -1,11 +1,11 @@
-comment "php-zmq needs a toolchain w/ C++, threads"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
+comment "php-zmq needs a toolchain w/ C++, NPTL"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
 
 config BR2_PACKAGE_PHP_ZMQ
 	bool "php-zmq"
 	depends on BR2_PACKAGE_PHP
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # zeromq
 	select BR2_PACKAGE_ZEROMQ
 	help
 	  ZeroMQ messaging bindings for PHP
diff --git a/package/python-pyzmq/Config.in b/package/python-pyzmq/Config.in
index 8f33a635c8..2501912519 100644
--- a/package/python-pyzmq/Config.in
+++ b/package/python-pyzmq/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_PYTHON_PYZMQ
 	bool "python-pyzmq"
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
-	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # zeromq
 	select BR2_PACKAGE_ZEROMQ
 	help
 	  This package contains the python language binding for zeromq.
 
 	  http://zeromq.org/bindings:python
 
-comment "python-pyzmq needs a toolchain w/ C++, threads"
+comment "python-pyzmq needs a toolchain w/ C++, NPTL"
 	depends on BR2_PACKAGE_PYTHON
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index 69be9f002c..25e438ae07 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -1,10 +1,10 @@
-comment "zeromq needs a toolchain w/ C++, threads"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
+comment "zeromq needs a toolchain w/ C++, NPTL"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
 
 config BR2_PACKAGE_ZEROMQ
 	bool "zeromq"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
index 8dad80e451..b9d4dcfd64 100644
--- a/package/zmqpp/Config.in
+++ b/package/zmqpp/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_ZMQPP
 	# c++1x support
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # zeromq
 	select BR2_PACKAGE_ZEROMQ
 	help
 	  C++ binding for zeromq (ZeroMQ, 0MQ, zmq).
@@ -13,8 +13,8 @@ config BR2_PACKAGE_ZMQPP
 
 	  http://github.com/benjamg/zmqpp
 
-comment "zmqpp needs a toolchain w/ C++, threads, gcc >= 4.7"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+comment "zmqpp needs a toolchain w/ C++, NPTL, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 
 if BR2_PACKAGE_ZMQPP
diff --git a/package/zyre/Config.in b/package/zyre/Config.in
index 21a0884ec6..340e9775c5 100644
--- a/package/zyre/Config.in
+++ b/package/zyre/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_ZYRE
 	bool "zyre"
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
-	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # zeromq
 	depends on BR2_USE_MMU # czmq
 	select BR2_PACKAGE_CZMQ
 	select BR2_PACKAGE_ZEROMQ
@@ -11,6 +11,6 @@ config BR2_PACKAGE_ZYRE
 
 	  http://zyre.org
 
-comment "zyre needs a toolchain w/ C++, threads"
+comment "zyre needs a toolchain w/ C++, NPTL"
 	depends on BR2_USE_MMU
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
