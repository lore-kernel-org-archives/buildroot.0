From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Mon, 13 Jul 2020 13:58:55 +0200
Subject: [Buildroot] [PATCH] package/python-matplotlib: add QT5 support
Message-ID: <20200713115855.2921059-1-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/python-matplotlib/Config.in            | 13 +++++++++++++
 package/python-matplotlib/python-matplotlib.mk |  4 ++++
 2 files changed, 17 insertions(+)

diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index e6ed8cda2f..e3eb465947 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -28,3 +28,16 @@ comment "python-matplotlib needs a toolchain w/ C++"
 
 comment "python-matplotlib needs glibc or musl"
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+
+if BR2_PACKAGE_PYTHON_MATPLOTLIB
+
+config BR2_PACKAGE_PYTHON_MATPLOTLIB_QT
+	bool "qt display"
+	depends on BR2_PACKAGE_QT5 # python-pyqt5
+	select BR2_PACKAGE_PYTHON_PYQT5
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_FONTCONFIG # runtime
+	select BR2_PACKAGE_QT5BASE_GUI # runtime
+	select BR2_PACKAGE_QT5BASE_WIDGETS # runtime
+
+endif
diff --git a/package/python-matplotlib/python-matplotlib.mk b/package/python-matplotlib/python-matplotlib.mk
index 7082637d09..19c68e7e27 100644
--- a/package/python-matplotlib/python-matplotlib.mk
+++ b/package/python-matplotlib/python-matplotlib.mk
@@ -13,4 +13,8 @@ PYTHON_MATPLOTLIB_DEPENDENCIES = host-pkgconf freetype host-python-numpy \
 	libpng python-cycler
 PYTHON_MATPLOTLIB_SETUP_TYPE = setuptools
 
+ifeq ($(BR2_PACKAGE_PYTHON_MATPLOTLIB_QT),y)
+PYTHON_MATPLOTLIB_DEPENDENCIES += qt5base python-pyqt5
+endif
+
 $(eval $(python-package))
-- 
2.20.1
