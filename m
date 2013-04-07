From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  7 Apr 2013 09:00:33 -0300
Subject: [Buildroot] [PATCH] zeromq: needs threads
Message-ID: <1365336033-32686-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/11a1c085e3f5c490cbf3fec8f26169ade29f7363/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cppzmq/Config.in | 3 ++-
 package/czmq/Config.in   | 4 +++-
 package/filemq/Config.in | 6 ++++--
 package/zeromq/Config.in | 6 ++++--
 package/zmqpp/Config.in  | 5 +++--
 5 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/package/cppzmq/Config.in b/package/cppzmq/Config.in
index ea632d1..72f0238 100644
--- a/package/cppzmq/Config.in
+++ b/package/cppzmq/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_CPPZMQ
 	depends on BR2_INET_IPV6 # zeromq
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
+	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	select BR2_PACKAGE_ZEROMQ
 	help
 	  C++ binding for zeromq (ZeroMQ, 0MQ, zmq).
@@ -12,4 +13,4 @@ config BR2_PACKAGE_CPPZMQ
 
 comment "cppzmq requires a toolchain with C++, IPV6, LARGEFILE and WCHAR support"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
-		&& BR2_USE_WCHAR)
+		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/czmq/Config.in b/package/czmq/Config.in
index 9fd8e86..7e4205e 100644
--- a/package/czmq/Config.in
+++ b/package/czmq/Config.in
@@ -5,10 +5,12 @@ config BR2_PACKAGE_CZMQ
 	depends on BR2_INET_IPV6 # zeromq
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
+	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	help
 	  High-level C Binding for 0MQ
 
 	  http://czmq.zeromq.org/
 
 comment "czmq requires a toolchain with C++, IPV6, LARGEFILE and WCHAR support"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE && BR2_USE_WCHAR)
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
+		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/filemq/Config.in b/package/filemq/Config.in
index b8eb8bd..d25f03f 100644
--- a/package/filemq/Config.in
+++ b/package/filemq/Config.in
@@ -7,10 +7,12 @@ config BR2_PACKAGE_FILEMQ
 	depends on BR2_INET_IPV6 # zeromq
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
+	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	help
 	  FileMQ is a publish-subscribe file service based on 0MQ.
 
 	  http://github.com/zeromq/filemq
 
-comment "filemq requires a toolchain with C++, IPv6, LARGEFILE and WCHAR support"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE && BR2_USE_WCHAR)
+comment "filemq requires a toolchain with C++, IPv6, LARGEFILE, WCHAR & thread support"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
+		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index f93ab5d..35704c3 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -1,5 +1,6 @@
-comment "zeromq requires a toolchain with C++, IPV6, LARGEFILE and WCHAR support"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE && BR2_USE_WCHAR)
+comment "zeromq requires a toolchain with C++, IPV6, LARGEFILE, WCHAR & thread support"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
+		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
 
 config BR2_PACKAGE_ZEROMQ
 	bool "zeromq"
@@ -7,6 +8,7 @@ config BR2_PACKAGE_ZEROMQ
 	depends on BR2_INET_IPV6
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
index 7a12462..9afcca4 100644
--- a/package/zmqpp/Config.in
+++ b/package/zmqpp/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_ZMQPP
 	depends on BR2_INET_IPV6 # zeromq
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
+	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	select BR2_PACKAGE_ZEROMQ
 	help
 	  C++ binding for zeromq (ZeroMQ, 0MQ, zmq).
@@ -14,9 +15,9 @@ config BR2_PACKAGE_ZMQPP
 
 	  http://github.com/benjamg/zmqpp
 
-comment "zmqpp requires a toolchain with C++, IPV6, LARGEFILE and WCHAR support"
+comment "zmqpp requires a toolchain with C++, IPV6, LARGEFILE, WCHAR & thread support"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_INET_IPV6 && BR2_LARGEFILE \
-		&& BR2_USE_WCHAR)
+		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
 
 config BR2_PACKAGE_ZMQPP_CLIENT
 	bool "zmqpp client"
-- 
1.8.1.5
