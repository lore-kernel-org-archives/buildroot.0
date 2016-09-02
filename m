From: Pieter De Gendt <pieter.degendt@gmail.com>
Date: Fri,  2 Sep 2016 15:42:55 +0200
Subject: [Buildroot] [PATCH 1/2] websocketpp: new package
Message-ID: <20160902134256.4515-1-pieter.degendt@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pieter De Gendt <pieter.degendt@gmail.com>
---
 package/Config.in                                  |  1 +
 .../websocketpp/0001-Fix-cmake-cross-compile.patch | 42 ++++++++++++++++++++++
 package/websocketpp/Config.in                      | 14 ++++++++
 package/websocketpp/websocketpp.hash               |  1 +
 package/websocketpp/websocketpp.mk                 | 15 ++++++++
 5 files changed, 73 insertions(+)
 create mode 100644 package/websocketpp/0001-Fix-cmake-cross-compile.patch
 create mode 100644 package/websocketpp/Config.in
 create mode 100644 package/websocketpp/websocketpp.hash
 create mode 100644 package/websocketpp/websocketpp.mk

diff --git a/package/Config.in b/package/Config.in
index 1e51a45..3fe55b4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1242,6 +1242,7 @@ menu "Networking"
 	source "package/sofia-sip/Config.in"
 	source "package/thrift/Config.in"
 	source "package/usbredir/Config.in"
+	source "package/websocketpp/Config.in"
 	source "package/wvstreams/Config.in"
 	source "package/zeromq/Config.in"
 	source "package/zmqpp/Config.in"
diff --git a/package/websocketpp/0001-Fix-cmake-cross-compile.patch b/package/websocketpp/0001-Fix-cmake-cross-compile.patch
new file mode 100644
index 0000000..cbaa9e9
--- /dev/null
+++ b/package/websocketpp/0001-Fix-cmake-cross-compile.patch
@@ -0,0 +1,42 @@
+From 1be867f214cf86d48be13603511dafe75afe8d8e Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Fri, 2 Sep 2016 14:44:55 +0200
+Subject: [PATCH] cmake: install correct .cmake files
+
+Currently, we install a .cmake file (so that other packages can find us)
+that sets the include path to /usr/include.
+
+This does not work in cross-compilation, as it points to the build
+machine headers, so is not correct for cross-compilation, for two
+reasons:
+  - websocketpp might not be installed on the build machine,
+  - it might be installed as a different version.
+
+Thus, we need to let cmake find the correct include path.
+
+We do so by searching the include directory that contains a specific
+file of our own; we choose websocketpp/version.h as the file to look
+for.
+
+This then properly sets the include path, which is even often uneeded
+as it will be the standard search path (either /usr/include for native
+builds, or .../sysroot/usr/include for cross builds).
+
+Thanks to Samuel for hinting me at find_path(). :-)
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Cc: Samuel Martin <s.martin49@gmail.com>
+---
+ websocketpp-config.cmake.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/websocketpp-config.cmake.in b/websocketpp-config.cmake.in
+index 6afe569..4c4ed5f 100644
+--- a/websocketpp-config.cmake.in
++++ b/websocketpp-config.cmake.in
+@@ -4,4 +4,4 @@
+ #  WEBSOCKETPP_INCLUDE_DIR - include directories
+ 
+ set(WEBSOCKETPP_FOUND TRUE)
+-set(WEBSOCKETPP_INCLUDE_DIR "@INSTALL_INCLUDE_DIR@")
++find_path(WEBSOCKETPP_INCLUDE_DIR "websocketpp/version.hpp")
diff --git a/package/websocketpp/Config.in b/package/websocketpp/Config.in
new file mode 100644
index 0000000..97df9fd
--- /dev/null
+++ b/package/websocketpp/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_WEBSOCKETPP
+	bool "websocketpp"
+	select BR2_PACKAGE_ZLIB
+	depends on BR2_PACKAGE_BOOST
+	depends on BR2_PACKAGE_BOOST_SYSTEM
+	depends on BR2_PACKAGE_BOOST_RANDOM
+	help
+	  WebSocket++ is a header only C++ library that implements
+	  RFC6455 The WebSocket Protocol. It allows integrating
+	  WebSocket client and server functionality into C++ programs.
+	  It uses interchangeable network transport modules including
+	  one based on C++ iostreams and one based on Boost Asio.
+
+	  http://www.zaphoyd.com/websocketpp
diff --git a/package/websocketpp/websocketpp.hash b/package/websocketpp/websocketpp.hash
new file mode 100644
index 0000000..49496ca
--- /dev/null
+++ b/package/websocketpp/websocketpp.hash
@@ -0,0 +1 @@
+sha256  07b3364ad30cda022d91759d4b83ff902e1ebadb796969e58b59caa535a03923    websocketpp-0.7.0.tar.gz
diff --git a/package/websocketpp/websocketpp.mk b/package/websocketpp/websocketpp.mk
new file mode 100644
index 0000000..e4f729b
--- /dev/null
+++ b/package/websocketpp/websocketpp.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# websocketpp
+#
+################################################################################
+
+WEBSOCKETPP_VERSION = 0.7.0
+WEBSOCKETPP_SITE = $(call github,zaphoyd,websocketpp,$(WEBSOCKETPP_VERSION))
+WEBSOCKETPP_LICENSE = BSD
+WEBSOCKETPP_LICENSE_FILES = COPYING
+WEBSOCKETPP_DEPENDENCIES = zlib
+WEBSOCKETPP_INSTALL_STAGING = YES
+WEBSOCKETPP_DEPENDENCIES = host-pkgconf boost
+
+$(eval $(cmake-package))
-- 
2.9.3
