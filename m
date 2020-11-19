From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Thu, 19 Nov 2020 11:21:49 +0100
Subject: [Buildroot] [PATCH 2/3] package/qt5/qt5mqtt: new package
In-Reply-To: <20201119102150.714800-1-angelo@amarulasolutions.com>
References: <20201119102150.714800-1-angelo@amarulasolutions.com>
Message-ID: <20201119102150.714800-2-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Qt MQTT module provides a standard compliant implementation of the
MQTT protocol specification.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 DEVELOPERS                       |  1 +
 package/qt5/Config.in            |  1 +
 package/qt5/qt5mqtt/Config.in    | 12 ++++++++++++
 package/qt5/qt5mqtt/qt5mqtt.hash |  6 ++++++
 package/qt5/qt5mqtt/qt5mqtt.mk   | 19 +++++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/qt5/qt5mqtt/Config.in
 create mode 100644 package/qt5/qt5mqtt/qt5mqtt.hash
 create mode 100644 package/qt5/qt5mqtt/qt5mqtt.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3f5fa20ebc..d45e584709 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -170,6 +170,7 @@ F:	package/python-pydal/
 F:	package/python-spidev/
 F:	package/python-web2py/
 F:	package/qt5/qt5coap/
+F:	package/qt5/qt5mqtt/
 F:	package/sam-ba/
 F:	package/sshguard/
 F:	package/sunwait/
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 9431f4980d..c15d27ba7c 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -48,6 +48,7 @@ source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
 source "package/qt5/qt5location/Config.in"
 source "package/qt5/qt5lottie/Config.in"
+source "package/qt5/qt5mqtt/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5quickcontrols2/Config.in"
diff --git a/package/qt5/qt5mqtt/Config.in b/package/qt5/qt5mqtt/Config.in
new file mode 100644
index 0000000000..509b18089d
--- /dev/null
+++ b/package/qt5/qt5mqtt/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_QT5MQTT
+	bool "qt5mqtt"
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  The Qt MQTT module provides a standard compliant implementation
+	  of the MQTT protocol specification. It enables applications to
+	  act as telemetry displays and devices to publish telemetry data.
+	  The supported versions are MQTT 3.1, MQTT 3.1.1, and MQTT 5.0.
+
+	  https://doc.qt.io/QtMQTT/index.html
diff --git a/package/qt5/qt5mqtt/qt5mqtt.hash b/package/qt5/qt5mqtt/qt5mqtt.hash
new file mode 100644
index 0000000000..aa788cdf80
--- /dev/null
+++ b/package/qt5/qt5mqtt/qt5mqtt.hash
@@ -0,0 +1,6 @@
+# Hash locally calculated
+sha256  603f81095ec837cb28b93189fd26dbbae32ecaedd80f6dd88c85050b51e18008  qt5mqtt-5.15.1.tar.gz
+
+# Hashes for license files:
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
+sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
diff --git a/package/qt5/qt5mqtt/qt5mqtt.mk b/package/qt5/qt5mqtt/qt5mqtt.mk
new file mode 100644
index 0000000000..2e0093df3a
--- /dev/null
+++ b/package/qt5/qt5mqtt/qt5mqtt.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# qt5mqtt
+#
+################################################################################
+
+QT5MQTT_VERSION = $(QT5_VERSION)
+QT5MQTT_SITE = $(call github,qt,qtmqtt,v$(QT5_VERSION))
+QT5MQTT_INSTALL_STAGING = YES
+QT5MQTT_LICENSE = GPL-3.0 with exception
+QT5MQTT_LICENSE_FILES = LICENSE.GPL3 LICENSE.GPL3-EXCEPT
+QT5MQTT_DEPENDENCIES = host-perl
+
+define QT5MQTT_FIX_INCLUDE
+	cd $(@D); $(HOST_DIR)/bin/syncqt.pl -module QtMqtt -version $(QT5_VERSION)
+endef
+QT5MQTT_PRE_CONFIGURE_HOOKS = QT5MQTT_FIX_INCLUDE
+
+$(eval $(qmake-package))
-- 
2.25.1
