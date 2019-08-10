From: Gilles Talis <gilles.talis@gmail.com>
Date: Sat, 10 Aug 2019 07:23:53 +0200
Subject: [Buildroot] [PATCH v2] package/restclient-cpp: new package
Message-ID: <1565414633-17846-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

restclient-cpp is a simple REST client library for C++

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
Changes v1 -> v2:
- Added a description of package in commit message
- Switched to github helper macro to download package
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
index e8ba6cd..c18314a 100644
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
index 5f2191a..4eab109 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1648,6 +1648,7 @@ menu "Networking"
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
index 0000000..428ec51
--- /dev/null
+++ b/package/restclient-cpp/restclient-cpp.hash
@@ -0,0 +1,3 @@
+# Computed locally
+sha256 6ae98c65333214d13d765d8fde04ec696f88ce349a419df0fbfc4564bc779df3 restclient-cpp-0.5.1.tar.gz
+sha256 1c2f79e825a39eb61d8919044776627f4d079ff38975410a3bde340154fc94a4 LICENSE
diff --git a/package/restclient-cpp/restclient-cpp.mk b/package/restclient-cpp/restclient-cpp.mk
new file mode 100644
index 0000000..9393333
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
+RESTCLIENT_CPP_SITE =  $(call github,mrtazz,restclient-cpp,$(RESTCLIENT_CPP_VERSION))
+RESTCLIENT_CPP_LICENSE = MIT
+RESTCLIENT_CPP_LICENSE_FILES = LICENSE
+RESTCLIENT_CPP_INSTALL_STAGING = YES
+
+# Source from github, no configure script provided
+RESTCLIENT_CPP_AUTORECONF = YES
+
+RESTCLIENT_CPP_DEPENDENCIES = libcurl
+
+$(eval $(autotools-package))
-- 
2.7.4
