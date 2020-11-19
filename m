From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Thu, 19 Nov 2020 11:21:50 +0100
Subject: [Buildroot] [PATCH 3/3] package/qt5/qt5knx: new package
In-Reply-To: <20201119102150.714800-1-angelo@amarulasolutions.com>
References: <20201119102150.714800-1-angelo@amarulasolutions.com>
Message-ID: <20201119102150.714800-3-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Qt KNX module implements the client side of a connection between a
client and a KNXnet/IP server.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 DEVELOPERS                     |  1 +
 package/qt5/Config.in          |  1 +
 package/qt5/qt5knx/Config.in   | 12 ++++++++++++
 package/qt5/qt5knx/qt5knx.hash |  6 ++++++
 package/qt5/qt5knx/qt5knx.mk   | 19 +++++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/qt5/qt5knx/Config.in
 create mode 100644 package/qt5/qt5knx/qt5knx.hash
 create mode 100644 package/qt5/qt5knx/qt5knx.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d45e584709..9fadedb4de 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -170,6 +170,7 @@ F:	package/python-pydal/
 F:	package/python-spidev/
 F:	package/python-web2py/
 F:	package/qt5/qt5coap/
+F:	package/qt5/qt5knx/
 F:	package/qt5/qt5mqtt/
 F:	package/sam-ba/
 F:	package/sshguard/
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index c15d27ba7c..6714c6271d 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -46,6 +46,7 @@ source "package/qt5/qt5declarative/Config.in"
 source "package/qt5/qt5enginio/Config.in"
 source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
+source "package/qt5/qt5knx/Config.in"
 source "package/qt5/qt5location/Config.in"
 source "package/qt5/qt5lottie/Config.in"
 source "package/qt5/qt5mqtt/Config.in"
diff --git a/package/qt5/qt5knx/Config.in b/package/qt5/qt5knx/Config.in
new file mode 100644
index 0000000000..991e93c8cb
--- /dev/null
+++ b/package/qt5/qt5knx/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_QT5KNX
+	bool "qt5knx"
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  The Qt KNX module implements the client side of a connection
+	  between a client and a KNXnet/IP server. This connection
+	  can be used to send messages to the KNX bus and to control
+	  the functionalities of the KNX devices.
+
+	  https://doc.qt.io/QtKNX/index.html
diff --git a/package/qt5/qt5knx/qt5knx.hash b/package/qt5/qt5knx/qt5knx.hash
new file mode 100644
index 0000000000..719d23bc81
--- /dev/null
+++ b/package/qt5/qt5knx/qt5knx.hash
@@ -0,0 +1,6 @@
+# Hash locally calculated
+sha256  8ee0df130fad39ef6b9a0bef390b648d3ad6539ffca33e22fb569e889d0bd043  qt5knx-5.15.1.tar.gz
+
+# Hashes for license files:
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
+sha256 f827ad079686ba92cc94811e35492d0e8966f704008b6da9eeda0b659fb58a8d LICENSE.FDL
diff --git a/package/qt5/qt5knx/qt5knx.mk b/package/qt5/qt5knx/qt5knx.mk
new file mode 100644
index 0000000000..57cfaa1175
--- /dev/null
+++ b/package/qt5/qt5knx/qt5knx.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# qt5knx
+#
+################################################################################
+
+QT5KNX_VERSION = $(QT5_VERSION)
+QT5KNX_SITE = $(call github,qt,qtknx,v$(QT5_VERSION))
+QT5KNX_INSTALL_STAGING = YES
+QT5KNX_LICENSE = GPL-3.0 with exception
+QT5KNX_LICENSE_FILES = LICENSE.GPL3 LICENSE.GPL3-EXCEPT
+QT5KNX_DEPENDENCIES = host-perl
+
+define QT5KNX_FIX_INCLUDE
+	cd $(@D); $(HOST_DIR)/bin/syncqt.pl -module QtKnx -version $(QT5_VERSION)
+endef
+QT5KNX_PRE_CONFIGURE_HOOKS = QT5KNX_FIX_INCLUDE
+
+$(eval $(qmake-package))
-- 
2.25.1
