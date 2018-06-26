From: Sven Neumann <neumann@teufel.de>
Date: Tue, 26 Jun 2018 11:53:23 +0200
Subject: [Buildroot] [PATCH] wampcc: new package
Message-ID: <20180626095323.14072-1-neumann@teufel.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <neumann@teufel.de>
---
 package/Config.in          |  1 +
 package/wampcc/Config.in   | 13 +++++++++++++
 package/wampcc/wampcc.hash |  2 ++
 package/wampcc/wampcc.mk   | 14 ++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/wampcc/Config.in
 create mode 100644 package/wampcc/wampcc.hash
 create mode 100644 package/wampcc/wampcc.mk

diff --git a/package/Config.in b/package/Config.in
index c5365547a4..d5612b5b61 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1487,6 +1487,7 @@ menu "Networking"
 	source "package/sofia-sip/Config.in"
 	source "package/thrift/Config.in"
 	source "package/usbredir/Config.in"
+	source "package/wampcc/Config.in"
 	source "package/zeromq/Config.in"
 	source "package/zmqpp/Config.in"
 	source "package/zyre/Config.in"
diff --git a/package/wampcc/Config.in b/package/wampcc/Config.in
new file mode 100644
index 0000000000..055f21a43d
--- /dev/null
+++ b/package/wampcc/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_WAMPCC
+	bool "wampcc"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBUV
+	select BR2_PACKAGE_JANSSON
+	select BR2_PACKAGE_OPENSSL
+	help
+	  wampcc is C++ library that implements the Web Application Messaging Protocol protocol.
+
+	  https://github.com/darrenjs/wampcc
+
+comment "wampcc needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/wampcc/wampcc.hash b/package/wampcc/wampcc.hash
new file mode 100644
index 0000000000..9c3af366e9
--- /dev/null
+++ b/package/wampcc/wampcc.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b3c3633b4c6a74d7ac8a676a7ea30fbfde7ae19aa1fc37de3b8aa3a553b674a2  wampcc-v1.6.tar.gz
diff --git a/package/wampcc/wampcc.mk b/package/wampcc/wampcc.mk
new file mode 100644
index 0000000000..d8e093f679
--- /dev/null
+++ b/package/wampcc/wampcc.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# wampcc
+#
+################################################################################
+
+WAMPCC_VERSION = v1.6
+WAMPCC_SITE = $(call github,darrenjs,wampcc,$(WAMPCC_VERSION))
+WAMPCC_DEPENDENCIES = host-pkgconf libuv jansson openssl
+WAMPCC_INSTALL_STAGING = YES
+WAMPCC_LICENSE = MIT
+WAMPCC_LICENSE_FILES = LICENSE
+
+$(eval $(cmake-package))
-- 
2.14.4
