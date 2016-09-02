From: Pieter De Gendt <pieter.degendt@gmail.com>
Date: Fri,  2 Sep 2016 15:42:56 +0200
Subject: [Buildroot] [PATCH 2/2] cpprestsdk: new package
In-Reply-To: <20160902134256.4515-1-pieter.degendt@gmail.com>
References: <20160902134256.4515-1-pieter.degendt@gmail.com>
Message-ID: <20160902134256.4515-2-pieter.degendt@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pieter De Gendt <pieter.degendt@gmail.com>
---
 package/Config.in                  |  1 +
 package/cpprestsdk/Config.in       | 27 +++++++++++++++++++++++++++
 package/cpprestsdk/cpprestsdk.hash |  1 +
 package/cpprestsdk/cpprestsdk.mk   | 25 +++++++++++++++++++++++++
 4 files changed, 54 insertions(+)
 create mode 100644 package/cpprestsdk/Config.in
 create mode 100644 package/cpprestsdk/cpprestsdk.hash
 create mode 100644 package/cpprestsdk/cpprestsdk.mk

diff --git a/package/Config.in b/package/Config.in
index 3fe55b4..f0f8401 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1156,6 +1156,7 @@ menu "Networking"
 	source "package/c-ares/Config.in"
 	source "package/canfestival/Config.in"
 	source "package/cgic/Config.in"
+    source "package/cpprestsdk/Config.in"
 	source "package/cppzmq/Config.in"
 	source "package/czmq/Config.in"
 	source "package/filemq/Config.in"
diff --git a/package/cpprestsdk/Config.in b/package/cpprestsdk/Config.in
new file mode 100644
index 0000000..7b95d31
--- /dev/null
+++ b/package/cpprestsdk/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_CPPRESTSDK
+        bool "cpprestsdk"
+        depends on BR2_INSTALL_LIBSTDCPP
+        depends on BR2_USE_WCHAR
+        depends on BR2_TOOLCHAIN_HAS_THREADS
+        select BR2_PACKAGE_BOOST
+        select BR2_PACKAGE_BOOST_CHRONO
+        select BR2_PACKAGE_BOOST_FILESYSTEM
+        select BR2_PACKAGE_BOOST_RANDOM
+        select BR2_PACKAGE_BOOST_REGEX
+        select BR2_PACKAGE_BOOST_SYSTEM
+        select BR2_PACKAGE_BOOST_THREAD
+        select BR2_PACKAGE_OPENSSL
+        select BR2_PACKAGE_PKGCONF
+        select BR2_PACKAGE_ZLIB
+        help
+          The C++ REST SDK is a Microsoft project for 
+          cloud-based client-server communication in 
+          native code using a modern asynchronous C++ API 
+          design. This project aims to help C++ developers 
+          connect to and interact with services.
+          
+          https://github.com/Microsoft/cpprestsdk
+
+comment "clogics needs a toolchain w/ C++, wchar, threads"
+        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+
diff --git a/package/cpprestsdk/cpprestsdk.hash b/package/cpprestsdk/cpprestsdk.hash
new file mode 100644
index 0000000..200f05a
--- /dev/null
+++ b/package/cpprestsdk/cpprestsdk.hash
@@ -0,0 +1 @@
+sha256  3d1c38aa7ef34b3d3e9a6e84d3866554fe48c3d9d9977896d18a7cfb80d5a4ea    cpprestsdk-v2.8.0.tar.gz
diff --git a/package/cpprestsdk/cpprestsdk.mk b/package/cpprestsdk/cpprestsdk.mk
new file mode 100644
index 0000000..d7509f8
--- /dev/null
+++ b/package/cpprestsdk/cpprestsdk.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+## cpprestsdk
+#
+#################################################################################
+
+CPPRESTSDK_VERSION = v2.8.0
+CPPRESTSDK_SITE = $(call github,Microsoft,cpprestsdk,$(CPPRESTSDK_VERSION))
+CPPRESTSDK_INSTALL_STAGING = YES
+
+CPPRESTSDK_DEPENDENCIES = boost openssl zlib
+
+ifeq ($(BR2_PACKAGE_WEBSOCKETPP),y)
+	CPPRESTSDK_DEPENDENCIES += websocketpp
+else
+	CPPRESTSDK_CONF_OPTS = -DCPPREST_EXCLUDE_WEBSOCKETS=ON
+endif
+
+
+CPPRESTSDK_SUBDIR = Release
+
+CPPRESTSDK_CONF_OPTS += -DBUILD_SAMPLES=OFF
+
+$(eval $(cmake-package))
+
-- 
2.9.3
