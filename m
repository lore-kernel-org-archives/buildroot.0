From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Jan 2020 23:18:57 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/python-pyqt5:
 manage qt optional dependencies
Message-ID: <20200107223731.C348383AE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d430ad6c74f1088f6db894eff6b17a4f2dc2c696
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Explictly enable the needed pyqt5 modules depending on Qt5 options or
packages

QtQuick moodule can't be built without opengl support so enable only
when OpenGL is available

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=12121
 - http://autobuild.buildroot.org/results/cb69c5daa564aa9f3250faa395399cb00a445e85

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2320dec34c87d28ab7ab3f445e3f6e429023f01f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyqt5/python-pyqt5.mk | 108 ++++++++++++++++++++++++++++++++++-
 1 file changed, 107 insertions(+), 1 deletion(-)

diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
index 4955936ae3..b6d559cd5b 100644
--- a/package/python-pyqt5/python-pyqt5.mk
+++ b/package/python-pyqt5/python-pyqt5.mk
@@ -11,6 +11,14 @@ PYTHON_PYQT5_LICENSE = GPL-3.0
 PYTHON_PYQT5_LICENSE_FILES = LICENSE
 
 PYTHON_PYQT5_DEPENDENCIES = python-sip host-python-sip qt5base
+PYTHON_PYQT5_MODULES = \
+	QtCore \
+	$(if $(BR2_PACKAGE_QT5BASE_DBUS),QtDBus) \
+	$(if $(BR2_PACKAGE_QT5BASE_GUI),QtGui) \
+	$(if $(BR2_PACKAGE_QT5BASE_NETWORK),QtNetwork) \
+	$(if $(BR2_PACKAGE_QT5BASE_OPENGL_LIB),QtOpenGL) \
+	$(if $(BR2_PACKAGE_QT5BASE_PRINTSUPPORT),QtPrintSupport) \
+	$(if $(BR2_PACKAGE_QT5BASE_XML),QtXml)
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 PYTHON_PYQT5_PYTHON_DIR = python$(PYTHON_VERSION_MAJOR)
@@ -20,6 +28,103 @@ PYTHON_PYQT5_PYTHON_DIR = python$(PYTHON3_VERSION_MAJOR)
 PYTHON_PYQT5_RM_PORT_BASE = port_v2
 endif
 
+ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
+PYTHON_PYQT5_MODULES += QtWidgets
+
+# QtSql needs QtWidgets
+ifeq ($(BR2_PACKAGE_QT5BASE_SQL),y)
+PYTHON_PYQT5_MODULES += QtSql
+endif
+
+# QtTest needs QtWidgets
+ifeq ($(BR2_PACKAGE_QT5BASE_TEST),y)
+PYTHON_PYQT5_MODULES += QtTest
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_QT5CONNECTIVITY),y)
+PYTHON_PYQT5_DEPENDENCIES += qt5connectivity
+PYTHON_PYQT5_MODULES += QtBluetooth QtNfc
+endif
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+PYTHON_PYQT5_DEPENDENCIES += qt5declarative
+PYTHON_PYQT5_MODULES += QtQml
+
+# QtQuick module needs opengl
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5BASE_OPENGL_LIB),yy)
+PYTHON_PYQT5_MODULES += \
+	QtQuick \
+	$(if $(BR2_PACKAGE_QT5BASE_WIDGETS),QtQuickWidgets)
+endif
+endif
+
+ifeq ($(BR2_PACKAGE_QT5ENGINIO),y)
+PYTHON_PYQT5_DEPENDENCIES += qt5enginio
+PYTHON_PYQT5_MODULES += Enginio
+endif
+
+ifeq ($(BR2_PACKAGE_QT5LOCATION),y)
+PYTHON_PYQT5_DEPENDENCIES += qt5location
+PYTHON_PYQT5_MODULES += QtLocation QtPositioning
+endif
+
+ifeq ($(BR2_PACKAGE_QT5MULTIMEDIA),y)
+PYTHON_PYQT5_DEPENDENCIES += qt5multimedia
+PYTHON_PYQT5_MODULES += \
+	QtMultimedia \
+	$(if $(BR2_PACKAGE_QT5BASE_WIDGETS),QtMultimediaWidgets)
+endif
+
+ifeq ($(BR2_PACKAGE_QT5SENSORS),y)
+PYTHON_PYQT5_DEPENDENCIES += qt5sensors
+PYTHON_PYQT5_MODULES += QtSensors
+endif
+
+ifeq ($(BR2_PACKAGE_QT5SERIALPORT),y)
+PYTHON_PYQT5_DEPENDENCIES += qt5serialport
+PYTHON_PYQT5_MODULES += QtSerialPort
+endif
+
+ifeq ($(BR2_PACKAGE_QT5SVG),y)
+PYTHON_PYQT5_DEPENDENCIES += qt5svg
+PYTHON_PYQT5_MODULES += QtSvg
+endif
+
+ifeq ($(BR2_PACKAGE_QT5WEBCHANNEL),y)
+PYTHON_PYQT5_DEPENDENCIES += qt5webchannel
+PYTHON_PYQT5_MODULES += QtWebChannel
+endif
+
+ifeq ($(BR2_PACKAGE_QT5WEBENGINE),y)
+PYTHON_PYQT5_DEPENDENCIES += qt5webengine
+PYTHON_PYQT5_MODULES += \
+	QtWebEngineCore \
+	$(if $(BR2_PACKAGE_QT5BASE_WIDGETS),QtWebEngineWidgets)
+endif
+
+ifeq ($(BR2_PACKAGE_QT5WEBKIT),y)
+PYTHON_PYQT5_DEPENDENCIES += qt5webkit
+PYTHON_PYQT5_MODULES += \
+	QtWebKit \
+	$(if $(BR2_PACKAGE_QT5BASE_WIDGETS),QtWebKitWidgets)
+endif
+
+ifeq ($(BR2_PACKAGE_QT5WEBSOCKETS),y)
+PYTHON_PYQT5_DEPENDENCIES += qt5websockets
+PYTHON_PYQT5_MODULES += QtWebSockets
+endif
+
+ifeq ($(BR2_PACKAGE_QT5X11EXTRAS),y)
+PYTHON_PYQT5_DEPENDENCIES += qt5x11extras
+PYTHON_PYQT5_MODULES += QtX11Extras
+endif
+
+ifeq ($(BR2_PACKAGE_QT5XMLPATTERNS),y)
+PYTHON_PYQT5_DEPENDENCIES += qt5xmlpatterns
+PYTHON_PYQT5_MODULES += QtXmlPatterns
+endif
+
 PYTHON_PYQT5_QTDETAIL_LICENSE = Open Source
 
 PYTHON_PYQT5_QTDETAIL_TYPE = shared
@@ -52,7 +157,8 @@ PYTHON_PYQT5_CONF_OPTS = \
 	-w --confirm-license \
 	--no-designer-plugin \
 	--no-docstrings \
-	--no-sip-files
+	--no-sip-files \
+	$(foreach module,$(PYTHON_PYQT5_MODULES),--enable=$(module))
 
 define PYTHON_PYQT5_CONFIGURE_CMDS
 	$(call PYTHON_PYQT5_GENERATE_QTDETAIL,$(@D))
