From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun,  7 Apr 2013 08:33:01 +0100
Subject: [Buildroot]
	=?buildroot@busybox.net?q?=5BPATCH=5D=20zeromq=3A=20remove=20libuuid=20dependency?=
Message-ID: <1365319981-14439-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Since version 3.1.0, zeromq no longer depends on libuuid.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/cppzmq/Config.in |    9 +++------
 package/czmq/Config.in   |    6 ++----
 package/filemq/Config.in |   11 ++++-------
 package/filemq/filemq.mk |    2 +-
 package/zeromq/Config.in |    8 ++------
 package/zeromq/zeromq.mk |    1 -
 package/zmqpp/Config.in  |    9 +++------
 7 files changed, 15 insertions(+), 31 deletions(-)

diff --git a/package/cppzmq/Config.in b/package/cppzmq/Config.in
index ea632d1..c183c26 100644
--- a/package/cppzmq/Config.in
+++ b/package/cppzmq/Config.in
@@ -1,15 +1,12 @@
 config BR2_PACKAGE_CPPZMQ
 	bool "cppzmq"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_INET_IPV6 # zeromq
-	depends on BR2_LARGEFILE # util-linux
-	depends on BR2_USE_WCHAR # util-linux
 	select BR2_PACKAGE_ZEROMQ
 	help
 	  C++ binding for zeromq (ZeroMQ, 0MQ, zmq).
 
 	  http://github.com/zeromq/cppzmq
 
-comment "cppzmq requires a toolchain with C++, IPV6, LARGEFILE and WCHAR support"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
-		&& BR2_USE_WCHAR)
+comment "cppzmq requires a toolchain with C++ and IPV6 support"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6)
diff --git a/package/czmq/Config.in b/package/czmq/Config.in
index 9fd8e86..2dce422 100644
--- a/package/czmq/Config.in
+++ b/package/czmq/Config.in
@@ -3,12 +3,10 @@ config BR2_PACKAGE_CZMQ
 	select BR2_PACKAGE_ZEROMQ
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_INET_IPV6 # zeromq
-	depends on BR2_LARGEFILE # util-linux
-	depends on BR2_USE_WCHAR # util-linux
 	help
 	  High-level C Binding for 0MQ
 
 	  http://czmq.zeromq.org/
 
-comment "czmq requires a toolchain with C++, IPV6, LARGEFILE and WCHAR support"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE && BR2_USE_WCHAR)
+comment "czmq requires a toolchain with C++ and IPV6 support"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6)
diff --git a/package/filemq/Config.in b/package/filemq/Config.in
index b8eb8bd..9613e5a 100644
--- a/package/filemq/Config.in
+++ b/package/filemq/Config.in
@@ -2,15 +2,12 @@ config BR2_PACKAGE_FILEMQ
 	bool "filemq"
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_CZMQ
-	select BR2_PACKAGE_ZEROMQ
-	depends on BR2_INSTALL_LIBSTDCPP # zeromq
-	depends on BR2_INET_IPV6 # zeromq
-	depends on BR2_LARGEFILE # util-linux
-	depends on BR2_USE_WCHAR # util-linux
+	depends on BR2_INSTALL_LIBSTDCPP # czmq
+	depends on BR2_INET_IPV6 # czmq
 	help
 	  FileMQ is a publish-subscribe file service based on 0MQ.
 
 	  http://github.com/zeromq/filemq
 
-comment "filemq requires a toolchain with C++, IPv6, LARGEFILE and WCHAR support"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE && BR2_USE_WCHAR)
+comment "filemq requires a toolchain with C++ and IPv6 support"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6)
diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
index 0ea7a9d..6c760d4 100644
--- a/package/filemq/filemq.mk
+++ b/package/filemq/filemq.mk
@@ -9,7 +9,7 @@ FILEMQ_SITE = git://github.com/zeromq/filemq.git
 
 FILEMQ_AUTORECONF = YES
 FILEMQ_INSTALL_STAGING = YES
-FILEMQ_DEPENDENCIES = czmq openssl zeromq
+FILEMQ_DEPENDENCIES = czmq openssl
 FILEMQ_LICENSE = LGPLv3+ with exceptions
 FILEMQ_LICENSE_FILES = COPYING COPYING.LESSER
 
diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index f93ab5d..8d1c9b0 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -1,14 +1,10 @@
-comment "zeromq requires a toolchain with C++, IPV6, LARGEFILE and WCHAR support"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE && BR2_USE_WCHAR)
+comment "zeromq requires a toolchain with C++ and IPV6 support"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6)
 
 config BR2_PACKAGE_ZEROMQ
 	bool "zeromq"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_INET_IPV6
-	depends on BR2_LARGEFILE # util-linux
-	depends on BR2_USE_WCHAR # util-linux
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  ??MQ (ZeroMQ, 0MQ, zmq) looks like an embeddable networking
 	  library but acts like a concurrency framework. It gives you
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index ba585d9..3cd607b 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -7,7 +7,6 @@
 ZEROMQ_VERSION = 3.2.2
 ZEROMQ_SITE = http://download.zeromq.org/
 ZEROMQ_INSTALL_STAGING = YES
-ZEROMQ_DEPENDENCIES = util-linux
 ZEROMQ_LICENSE = LGPLv3+ with exceptions
 ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER
 
diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
index 7a12462..fbaf32b 100644
--- a/package/zmqpp/Config.in
+++ b/package/zmqpp/Config.in
@@ -1,10 +1,8 @@
 config BR2_PACKAGE_ZMQPP
 	bool "zmqpp"
 	depends on !BR2_avr32 # compiler needs c++0x support
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_INET_IPV6 # zeromq
-	depends on BR2_LARGEFILE # util-linux
-	depends on BR2_USE_WCHAR # util-linux
 	select BR2_PACKAGE_ZEROMQ
 	help
 	  C++ binding for zeromq (ZeroMQ, 0MQ, zmq).
@@ -14,9 +12,8 @@ config BR2_PACKAGE_ZMQPP
 
 	  http://github.com/benjamg/zmqpp
 
-comment "zmqpp requires a toolchain with C++, IPV6, LARGEFILE and WCHAR support"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
-		&& BR2_USE_WCHAR)
+comment "zmqpp requires a toolchain with C++ and IPV6 support"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6)
 
 config BR2_PACKAGE_ZMQPP_CLIENT
 	bool "zmqpp client"
-- 
1.7.10.4
