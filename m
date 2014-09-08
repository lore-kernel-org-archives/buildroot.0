From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon,  8 Sep 2014 10:32:44 +0400
Subject: [Buildroot] [PATCH 2/2] zeromq: add dependency on atomic operations
In-Reply-To: <1410157964-8422-1-git-send-email-abrodkin@synopsys.com>
References: <1410157964-8422-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <1410157964-8422-3-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As it is seen from http://autobuild.buildroot.org/results/3bd/3bda860a269dd9a4e38533cc9350892c68102618
"zeromq" uses "___sync_add_and_fetch_2" & "___sync_fetch_and_add_2" in "libpgm"
so make it dependent on atomic operations.

Following packages select "zeromq", so adding dependency as well:
 * cppzmq
 * czmq
 * filemq
 * mongrel2
 * php-zmq
 * python-pyzmq
 * zmqpp
 * zyre

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Cc: Anton Kolesov <akolesov@synopsys.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Peter Korsgaard <peter@korsgaard.com>
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cppzmq/Config.in       | 1 +
 package/czmq/Config.in         | 1 +
 package/filemq/Config.in       | 1 +
 package/mongrel2/Config.in     | 1 +
 package/php-zmq/Config.in      | 1 +
 package/python-pyzmq/Config.in | 1 +
 package/zeromq/Config.in       | 1 +
 package/zmqpp/Config.in        | 1 +
 package/zyre/Config.in         | 1 +
 9 files changed, 9 insertions(+)

diff --git a/package/cppzmq/Config.in b/package/cppzmq/Config.in
index e17963e..9f32c51 100644
--- a/package/cppzmq/Config.in
+++ b/package/cppzmq/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_CPPZMQ
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
+	depends on BR2_ARCH_HAS_ATOMICS # zeromq
 	select BR2_PACKAGE_ZEROMQ
 	help
 	  C++ binding for zeromq (ZeroMQ, 0MQ, zmq).
diff --git a/package/czmq/Config.in b/package/czmq/Config.in
index fbdedd1..b005a0e 100644
--- a/package/czmq/Config.in
+++ b/package/czmq/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_CZMQ
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
+	depends on BR2_ARCH_HAS_ATOMICS # zeromq
 	help
 	  High-level C Binding for 0MQ
 
diff --git a/package/filemq/Config.in b/package/filemq/Config.in
index 1604846..0fea057 100644
--- a/package/filemq/Config.in
+++ b/package/filemq/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_FILEMQ
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
+	depends on BR2_ARCH_HAS_ATOMICS # zeromq
 	depends on BR2_USE_MMU # czmq
 	help
 	  FileMQ is a publish-subscribe file service based on 0MQ.
diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
index 680e0ce..21e0706 100644
--- a/package/mongrel2/Config.in
+++ b/package/mongrel2/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_MONGREL2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	depends on BR2_LARGEFILE # zeromq -> util-linux
 	depends on BR2_USE_WCHAR # zeromq -> util-linux
+	depends on BR2_ARCH_HAS_ATOMICS # zeromq
 	# {get,make,swap}context functions present in
 	# {e,}glibc and in uClibc's master branch. Source has arm workaround
 	depends on BR2_UCLIBC_VERSION_SNAPSHOT || \
diff --git a/package/php-zmq/Config.in b/package/php-zmq/Config.in
index f32b5a3..ff34082 100644
--- a/package/php-zmq/Config.in
+++ b/package/php-zmq/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_PHP_ZMQ
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_ARCH_HAS_ATOMICS # zeromq
 	select BR2_PACKAGE_ZEROMQ
 	help
 	  ZeroMQ messaging bindings for PHP
diff --git a/package/python-pyzmq/Config.in b/package/python-pyzmq/Config.in
index 0f868d0..b2a60c2 100644
--- a/package/python-pyzmq/Config.in
+++ b/package/python-pyzmq/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_PYZMQ
 	depends on BR2_USE_WCHAR # zeromq
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
+	depends on BR2_ARCH_HAS_ATOMICS # zeromq
 	select BR2_PACKAGE_ZEROMQ
 	help
 	  This package contains the python language binding for zeromq.
diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index 778a503..4178014 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_ZEROMQ
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_ARCH_HAS_ATOMICS
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
index 2ccaf7e..7740679 100644
--- a/package/zmqpp/Config.in
+++ b/package/zmqpp/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_ZMQPP
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
+	depends on BR2_ARCH_HAS_ATOMICS # zeromq
 	select BR2_PACKAGE_ZEROMQ
 	help
 	  C++ binding for zeromq (ZeroMQ, 0MQ, zmq).
diff --git a/package/zyre/Config.in b/package/zyre/Config.in
index 86fff35..2c32068 100644
--- a/package/zyre/Config.in
+++ b/package/zyre/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_ZYRE
 	depends on BR2_LARGEFILE # zeromq
 	depends on BR2_USE_WCHAR # zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
+	depends on BR2_ARCH_HAS_ATOMICS # zeromq
 	depends on BR2_USE_MMU # czmq
 	# uClibc toolchains provided by ADI don't have AI_ADDRCONFIG
 	# support, needed by czmq
-- 
1.9.3
