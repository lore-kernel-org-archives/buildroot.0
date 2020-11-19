From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Thu, 19 Nov 2020 23:01:40 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/qt5/qt5coap: new package
Message-ID: <20201119220142.1054287-1-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Qt CoAP module implements the client side of CoAP defined by RFC
7252.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
Changelog
v1 -> v2:
 fixed hash file (suggested by Peter)
 
 DEVELOPERS                       |  1 +
 package/qt5/Config.in            |  1 +
 package/qt5/qt5coap/Config.in    | 11 +++++++++++
 package/qt5/qt5coap/qt5coap.hash |  6 ++++++
 package/qt5/qt5coap/qt5coap.mk   | 19 +++++++++++++++++++
 5 files changed, 38 insertions(+)
 create mode 100644 package/qt5/qt5coap/Config.in
 create mode 100644 package/qt5/qt5coap/qt5coap.hash
 create mode 100644 package/qt5/qt5coap/qt5coap.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9ab1e125f4..3f5fa20ebc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -169,6 +169,7 @@ F:	package/python-pillow/
 F:	package/python-pydal/
 F:	package/python-spidev/
 F:	package/python-web2py/
+F:	package/qt5/qt5coap/
 F:	package/sam-ba/
 F:	package/sshguard/
 F:	package/sunwait/
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index fc0e68e8b7..9431f4980d 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -40,6 +40,7 @@ if BR2_PACKAGE_QT5
 source "package/qt5/qt53d/Config.in"
 source "package/qt5/qt5base/Config.in"
 source "package/qt5/qt5charts/Config.in"
+source "package/qt5/qt5coap/Config.in"
 source "package/qt5/qt5connectivity/Config.in"
 source "package/qt5/qt5declarative/Config.in"
 source "package/qt5/qt5enginio/Config.in"
diff --git a/package/qt5/qt5coap/Config.in b/package/qt5/qt5coap/Config.in
new file mode 100644
index 0000000000..b5bed342a9
--- /dev/null
+++ b/package/qt5/qt5coap/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_QT5COAP
+	bool "qt5coap"
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  CoAP is a protocol for IoT devices, and machine to machine
+	  communication. The Qt CoAP module implements the client side
+	  of CoAP defined by RFC 7252.
+
+	  https://doc.qt.io/QtCoAP/qtcoap-index.html
diff --git a/package/qt5/qt5coap/qt5coap.hash b/package/qt5/qt5coap/qt5coap.hash
new file mode 100644
index 0000000000..3f3390ebd4
--- /dev/null
+++ b/package/qt5/qt5coap/qt5coap.hash
@@ -0,0 +1,6 @@
+# Hash locally calculated
+sha256  f2addd89e94fb3945fc6ee6db795b0736cd3396760b31e04c01cd02558c53e07  qt5coap-5.15.1.tar.gz
+
+# Hashes for license files:
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
+sha256  f827ad079686ba92cc94811e35492d0e8966f704008b6da9eeda0b659fb58a8d LICENSE.FDL
diff --git a/package/qt5/qt5coap/qt5coap.mk b/package/qt5/qt5coap/qt5coap.mk
new file mode 100644
index 0000000000..210cebf13a
--- /dev/null
+++ b/package/qt5/qt5coap/qt5coap.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# qt5coap
+#
+################################################################################
+
+QT5COAP_VERSION = $(QT5_VERSION)
+QT5COAP_SITE = $(call github,qt,qtcoap,v$(QT5_VERSION))
+QT5COAP_INSTALL_STAGING = YES
+QT5COAP_LICENSE = GPL-3.0, GFDL-1.3
+QT5COAP_LICENSE_FILES = LICENSE.GPL3 LICENSE.FDL
+QT5COAP_DEPENDENCIES = host-perl
+
+define QT5COAP_FIX_INCLUDE
+	cd $(@D); $(HOST_DIR)/bin/syncqt.pl -module QtCoap -version $(QT5_VERSION)
+endef
+QT5COAP_PRE_CONFIGURE_HOOKS = QT5COAP_FIX_INCLUDE
+
+$(eval $(qmake-package))
-- 
2.25.1
