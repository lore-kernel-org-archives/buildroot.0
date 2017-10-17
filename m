From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 17 Oct 2017 15:22:57 -0400
Subject: [Buildroot] [PATCH 1/1] libcpprestsdk: new package
Message-ID: <20171017192257.9215-1-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The C++ REST SDK is a Microsoft project for cloud-based client-server
communication in native code using a modern asynchronous C++ API design.
This project aims to help C++ developers connect to and interact with
services.

This package is licensed under the MIT package and depends on BOOST
and OpenSSL (although it is compatible with LibreSSL)

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/libcpprestsdk/Config.in          | 22 ++++++++++++++++++++++
 package/libcpprestsdk/libcpprestsdk.hash |  3 +++
 package/libcpprestsdk/libcpprestsdk.mk   | 20 ++++++++++++++++++++
 5 files changed, 47 insertions(+)
 create mode 100644 package/libcpprestsdk/Config.in
 create mode 100644 package/libcpprestsdk/libcpprestsdk.hash
 create mode 100644 package/libcpprestsdk/libcpprestsdk.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index f35d6f3688..fe2af50113 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -32,6 +32,7 @@ F:	package/gstreamer1/gst1-rtsp-server/
 N:	Adam Duskett <aduskett@gmail.com>
 F:	package/audit/
 F:	package/checkpolicy/
+F:	package/cpprestsdk/
 F:	package/gstreamer1/gst1-vaapi/
 F:	package/janus-gateway/
 F:	package/libressl/
diff --git a/package/Config.in b/package/Config.in
index aa0f2d7f8e..4b0dc4861d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1336,6 +1336,7 @@ menu "Networking"
 	source "package/libcgi/Config.in"
 	source "package/libcgicc/Config.in"
 	source "package/libcoap/Config.in"
+	source "package/libcpprestsdk/Config.in"
 	source "package/libcurl/Config.in"
 	source "package/libdnet/Config.in"
 	source "package/libeXosip2/Config.in"
diff --git a/package/libcpprestsdk/Config.in b/package/libcpprestsdk/Config.in
new file mode 100644
index 0000000000..d6acabea8a
--- /dev/null
+++ b/package/libcpprestsdk/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_LIBCPPRESTSDK
+	bool "libcpprestsdk"
+	depends on BR2_INSTALL_LIBSTDCPP # boost
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_RANDOM
+	select BR2_PACKAGE_BOOST_CHRONO
+	select BR2_PACKAGE_BOOST_THREAD
+	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBRESSL
+	help
+	  The C++ REST SDK is a Microsoft project for cloud-based
+	  client-server communication in native code using a modern
+	  asynchronous C++ API design. This project aims to help C++
+	  developers connect to and interact with services.
+
+	  https://github.com/Microsoft/cpprestsdk
+
+comment "cpprestsdk needs a toolchain w/ C++, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libcpprestsdk/libcpprestsdk.hash b/package/libcpprestsdk/libcpprestsdk.hash
new file mode 100644
index 0000000000..131ed3b51a
--- /dev/null
+++ b/package/libcpprestsdk/libcpprestsdk.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 bef46381a036625d12d575d69ce9f3dd78b4317e41d1196b928dff83cc5a9c05 libcpprestsdk-v2.9.0.tar.gz
+sha256 5c191789f502ac87df83b57008d2fc3e47fbf31315381b5bc4309f6602d0fe97	license.txt
diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
new file mode 100644
index 0000000000..9b9b594016
--- /dev/null
+++ b/package/libcpprestsdk/libcpprestsdk.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# libcpprestsdk
+#
+################################################################################
+
+LIBCPPRESTSDK_VERSION = v2.9.0
+LIBCPPRESTSDK_SITE = $(call github,Microsoft,cpprestsdk,$(LIBCPPRESTSDK_VERSION))
+LIBCPPRESTSDK_DEPENDENCIES = boost
+LIBCPPRESTSDK_LICENSE = MIT
+LIBCPPRESTSDK_LICENSE_FILES = license.txt
+LIBCPPRESTSDK_SUBDIR = Release
+
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+LIBCPPRESTSDK_DEPENDENCIES += libressl
+else
+LIBCPPRESTSDK_DEPENDENCIES += openssl
+endif
+
+$(eval $(cmake-package))
-- 
2.13.6
