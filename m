From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 May 2020 13:44:46 +0200
Subject: [Buildroot] [git commit] package/python-pyqt5: fix QtLocation
 module dependency
Message-ID: <20200516112910.635B98E71D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d430ddcfd5e29f92136428a6de4edd19f1b6bac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The QT module location from qt5location depends on
QT quick from qt5declarative.

From qt5location-5.14.2/src/src.pro:

  qtHaveModule(quick) {
      SUBDIRS += positioningquick location
      ...
  }

Adjust pyqt5 QtLocation module dependency accordingly.

Fixes:

  - http://autobuild.buildroot.net/results/122bb0a37d968cd79dc043b48f90f1ba4135491f

  Reading .../build/python-pyqt5-5.7/QtLocation/QtLocation.pro
  Project ERROR: Unknown module(s) in QT: location

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pyqt5/python-pyqt5.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
index 260a93af9c..9b5e9089fc 100644
--- a/package/python-pyqt5/python-pyqt5.mk
+++ b/package/python-pyqt5/python-pyqt5.mk
@@ -65,7 +65,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT5LOCATION),y)
 PYTHON_PYQT5_DEPENDENCIES += qt5location
-PYTHON_PYQT5_MODULES += QtLocation QtPositioning
+PYTHON_PYQT5_MODULES += QtPositioning
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
+PYTHON_PYQT5_MODULES += QtLocation
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_QT5MULTIMEDIA),y)
