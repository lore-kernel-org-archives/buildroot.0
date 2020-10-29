From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2020 15:13:49 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/python-pyqt5:
 QtSvg needs QtWidgets
Message-ID: <20201029142310.7020683F07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23982a10c23a0bb6dd21058a254fe22f710952d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Building QtSvg without QtWidgets results in the following build failure:

/tmp/instance-0/output-1/host/bin/powerpc64le-linux-g++ -c -pipe -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os --sysroot=/tmp/instance-0/output-1/host/powerpc64le-buildroot-linux-gnu/sysroot -fno-exceptions -Wall -Wextra -D_REENTRANT -fPIC -DSIP_PROTECTED_IS_PUBLIC -Dprotected=public -DQT_NO_DEBUG -DQT_PLUGIN -DQT_SVG_LIB -DQT_GUI_LIB -DQT_CORE_LIB -I. -I. -I../../../host/powerpc64le-buildroot-linux-gnu/sysroot/usr/include/python3.8 -I../../../host/powerpc64le-buildroot-linux-gnu/sysroot/usr/include/qt5 -I../../../host/powerpc64le-buildroot-linux-gnu/sysroot/usr/include/qt5/QtSvg -I../../../host/powerpc64le-buildroot-linux-gnu/sysroot/usr/include/qt5/QtGui -I../../../host/powerpc64le-buildroot-linux-gnu/sysroot/usr/include/qt5/QtCore -I. -I../../../host/mkspecs/devices/linux-buildroot-g++ -o sipQtSvgcmodule.o sipQtSvgcmodule.cpp
sip/QtWidgets/qwidget.sip:28:10: fatal error: qwidget.h: No such file or directory
compilation terminated.
sip/QtWidgets/qgraphicsitem.sip:26:10: fatal error: qgraphicsitem.h: No such file or directory
compilation terminated.

Fixes:
 - http://autobuild.buildroot.org/results/26f55a1fa9f6520ce449b98b40d98f984cec07b3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 19ee46b1dcb117398f1e6d773c5b8b434d73595a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyqt5/python-pyqt5.mk | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
index 9b5e9089fc..9285b6497c 100644
--- a/package/python-pyqt5/python-pyqt5.mk
+++ b/package/python-pyqt5/python-pyqt5.mk
@@ -39,6 +39,12 @@ endif
 ifeq ($(BR2_PACKAGE_QT5BASE_TEST),y)
 PYTHON_PYQT5_MODULES += QtTest
 endif
+
+# QtSvg needs QtWidgets
+ifeq ($(BR2_PACKAGE_QT5SVG),y)
+PYTHON_PYQT5_DEPENDENCIES += qt5svg
+PYTHON_PYQT5_MODULES += QtSvg
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_QT5CONNECTIVITY),y)
@@ -88,11 +94,6 @@ PYTHON_PYQT5_DEPENDENCIES += qt5serialport
 PYTHON_PYQT5_MODULES += QtSerialPort
 endif
 
-ifeq ($(BR2_PACKAGE_QT5SVG),y)
-PYTHON_PYQT5_DEPENDENCIES += qt5svg
-PYTHON_PYQT5_MODULES += QtSvg
-endif
-
 ifeq ($(BR2_PACKAGE_QT5WEBCHANNEL),y)
 PYTHON_PYQT5_DEPENDENCIES += qt5webchannel
 PYTHON_PYQT5_MODULES += QtWebChannel
