From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:34 -0000
Subject: [Buildroot] [git commit] package/restclient-cpp: new package
Message-ID: <20190903133617.720F88A5E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=014c47cfbf014e916efef688ac5f892e5082d188
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

restclient-cpp is a simple REST client library for C++

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/restclient-cpp/Config.in           | 13 +++++++++++++
 package/restclient-cpp/restclient-cpp.hash |  3 +++
 package/restclient-cpp/restclient-cpp.mk   | 18 ++++++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9ba058e2ee..040809f6a5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -946,6 +946,7 @@ F:	package/httping/
 F:	package/iozone/
 F:	package/leptonica/
 F:	package/ocrad/
+F:	package/restclient-cpp/
 F:	package/tesseract-ocr/
 F:	package/webp/
 F:	package/xapian/
diff --git a/package/Config.in b/package/Config.in
index 3f53c20bb3..c984dcea6f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1649,6 +1649,7 @@ menu "Networking"
 	source "package/qdecoder/Config.in"
 	source "package/qpid-proton/Config.in"
 	source "package/rabbitmq-c/Config.in"
+	source "package/restclient-cpp/Config.in"
 	source "package/rtmpdump/Config.in"
 	source "package/slirp/Config.in"
 	source "package/snmppp/Config.in"
diff --git a/package/restclient-cpp/Config.in b/package/restclient-cpp/Config.in
new file mode 100644
index 0000000000..9bf2240828
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
index 0000000000..428ec51f5f
--- /dev/null
+++ b/package/restclient-cpp/restclient-cpp.hash
@@ -0,0 +1,3 @@
+# Computed locally
+sha256 6ae98c65333214d13d765d8fde04ec696f88ce349a419df0fbfc4564bc779df3 restclient-cpp-0.5.1.tar.gz
+sha256 1c2f79e825a39eb61d8919044776627f4d079ff38975410a3bde340154fc94a4 LICENSE
diff --git a/package/restclient-cpp/restclient-cpp.mk b/package/restclient-cpp/restclient-cpp.mk
new file mode 100644
index 0000000000..9393333095
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
