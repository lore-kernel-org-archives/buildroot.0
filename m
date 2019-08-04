From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun,  4 Aug 2019 18:44:31 +0200
Subject: [Buildroot] [PATCH] package/restclient-cpp: new package
Message-ID: <1564937071-4979-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/restclient-cpp/Config.in           | 13 +++++++++++++
 package/restclient-cpp/restclient-cpp.hash |  3 +++
 package/restclient-cpp/restclient-cpp.mk   | 18 ++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/restclient-cpp/Config.in
 create mode 100644 package/restclient-cpp/restclient-cpp.hash
 create mode 100644 package/restclient-cpp/restclient-cpp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d43a9f2..9bd2c06 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -945,6 +945,7 @@ F:	package/httping/
 F:	package/iozone/
 F:	package/leptonica/
 F:	package/ocrad/
+F:	package/restclient-cpp/
 F:	package/tesseract-ocr/
 F:	package/webp/
 F:	package/xapian/
diff --git a/package/Config.in b/package/Config.in
index cb0f89a..6bf10d9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1647,6 +1647,7 @@ menu "Networking"
 	source "package/qdecoder/Config.in"
 	source "package/qpid-proton/Config.in"
 	source "package/rabbitmq-c/Config.in"
+	source "package/restclient-cpp/Config.in"
 	source "package/rtmpdump/Config.in"
 	source "package/slirp/Config.in"
 	source "package/snmppp/Config.in"
diff --git a/package/restclient-cpp/Config.in b/package/restclient-cpp/Config.in
new file mode 100644
index 0000000..9bf2240
--- /dev/null
+++ b/package/restclient-cpp/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_RESTCLIENT_CPP
+	bool "restclient-cpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	select BR2_PACKAGE_LIBCURL
+	help
+	  restclient-cpp is a C++ client library for
+	  making HTTP/REST requests
+
+	  http://code.mrtazz.com/restclient-cpp/
+
+comment "restclient-cpp needs a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/restclient-cpp/restclient-cpp.hash b/package/restclient-cpp/restclient-cpp.hash
new file mode 100644
index 0000000..5a69f1d
--- /dev/null
+++ b/package/restclient-cpp/restclient-cpp.hash
@@ -0,0 +1,3 @@
+# Computed locally
+sha256 6ae98c65333214d13d765d8fde04ec696f88ce349a419df0fbfc4564bc779df3 0.5.1.tar.gz
+sha256 1c2f79e825a39eb61d8919044776627f4d079ff38975410a3bde340154fc94a4 LICENSE
diff --git a/package/restclient-cpp/restclient-cpp.mk b/package/restclient-cpp/restclient-cpp.mk
new file mode 100644
index 0000000..7d5d73a
--- /dev/null
+++ b/package/restclient-cpp/restclient-cpp.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# restclient-cpp
+#
+################################################################################
+
+RESTCLIENT_CPP_VERSION = 0.5.1
+RESTCLIENT_CPP_SOURCE = $(RESTCLIENT_CPP_VERSION).tar.gz
+RESTCLIENT_CPP_SITE = https://github.com/mrtazz/restclient-cpp/archive
+RESTCLIENT_CPP_LICENSE = MIT
+RESTCLIENT_CPP_LICENSE_FILES = LICENSE
+RESTCLIENT_CPP_INSTALL_STAGING = YES
+
+RESTCLIENT_CPP_AUTORECONF = YES
+
+RESTCLIENT_CPP_DEPENDENCIES = libcurl
+
+$(eval $(autotools-package))
-- 
2.7.4
