From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Wed,  9 Sep 2020 09:43:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/freeopcua : new package
Message-ID: <20200909074346.13037-1-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LGPL OPC-UA server and client library written in C++
and with a lot of code auto-generated from xml
specification using python.

More information is available at :
https://github.com/FreeOpcUa/freeopcua.

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
- This package has been checked :
$ ./utils/check-package package/freeopcua/*
52 lines processed
0 warnings generated
- License information has also been tested :
>>> freeopcua d24d7806a71739b869f6d2465316184b49e37875 Collecting legal info
COPYING: OK (sha256: da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768)

 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/freeopcua/Config.in      | 17 +++++++++++++++++
 package/freeopcua/freeopcua.hash |  3 +++
 package/freeopcua/freeopcua.mk   | 32 ++++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+)
 create mode 100644 package/freeopcua/Config.in
 create mode 100644 package/freeopcua/freeopcua.hash
 create mode 100644 package/freeopcua/freeopcua.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 93a86811ba..dc6760f408 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1424,6 +1424,7 @@ N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
 
 N:	Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
+F:	package/freeopcua/
 F:	package/python-aiofiles/
 F:	package/python-crayons/
 F:	package/python-cycler/
diff --git a/package/Config.in b/package/Config.in
index 02213310a8..14dab70a7f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1682,6 +1682,7 @@ menu "Networking"
 	source "package/filemq/Config.in"
 	source "package/flickcurl/Config.in"
 	source "package/fmlib/Config.in"
+	source "package/freeopcua/Config.in"
 	source "package/freeradius-client/Config.in"
 	source "package/gensio/Config.in"
 	source "package/geoip/Config.in"
diff --git a/package/freeopcua/Config.in b/package/freeopcua/Config.in
new file mode 100644
index 0000000000..f210efe1b5
--- /dev/null
+++ b/package/freeopcua/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_FREEOPCUA
+	bool "freeopcua"
+	depends on BR2_PACKAGE_BOOST
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	select BR2_PACKAGE_BOOST_PYTHON
+	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_BOOST_THREAD
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_MBEDTLS
+	help
+	  LGPL OPC-UA server and client library written in
+	  C++ and with a lot of code auto-generated from
+	  xml specification using python.
+
+	  https://github.com/FreeOpcUa/freeopcua
diff --git a/package/freeopcua/freeopcua.hash b/package/freeopcua/freeopcua.hash
new file mode 100644
index 0000000000..986af5df99
--- /dev/null
+++ b/package/freeopcua/freeopcua.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 cbb199396f7a977929ca374310266bbd84613d09fb53c8946270718babad1622  freeopcua-d24d7806a71739b869f6d2465316184b49e37875.tar.gz
+sha256 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/freeopcua/freeopcua.mk b/package/freeopcua/freeopcua.mk
new file mode 100644
index 0000000000..291cc2514a
--- /dev/null
+++ b/package/freeopcua/freeopcua.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# freeopcua
+#
+################################################################################
+
+FREEOPCUA_VERSION = d24d7806a71739b869f6d2465316184b49e37875
+FREEOPCUA_SITE = $(call github,FreeOpcUa,freeopcua,$(FREEOPCUA_VERSION))
+FREEOPCUA_LICENSE = LGPL-3.0
+FREEOPCUA_LICENSE_FILES = COPYING
+
+FREEOPCUA_DEPENDENCIES = boost mbedtls python3
+
+# Copy generated binaries and libraries to target
+# as this is not done by freeopcua buildsystem.
+define FREEOPCUA_INSTALL_BINARY_LIB
+	cp $(BUILD_DIR)/freeopcua-$(FREEOPCUA_VERSION)/bin/* \
+	$(TARGET_DIR)/usr/bin/
+
+	cp $(BUILD_DIR)/freeopcua-$(FREEOPCUA_VERSION)/lib/* \
+	$(TARGET_DIR)/usr/lib/
+endef
+FREEOPCUA_POST_INSTALL_TARGET_HOOKS += FREEOPCUA_INSTALL_BINARY_LIB
+
+# Freeopcua uses some narrowing like int8 to char
+# which results in compilation error.
+FREEOPCUA_CONF_OPTS = \
+	-DCMAKE_CXX_FLAGS="-Wno-narrowing" \
+	-DBUILD_EXAMPLE=OFF \
+	-DBUILD_TESTING=OFF
+
+$(eval $(cmake-package))
-- 
2.11.0
