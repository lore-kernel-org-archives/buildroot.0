From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 16:55:46 +0200
Subject: [Buildroot] [git commit] package/python-matplotlib: add QT5 support
Message-ID: <20200727145109.9D136842CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b6ec5644430f56c990b0a4892f67c64886ef350
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-matplotlib may be used in qt5 application. This patch add option to
enable qt5. Since this backend is automatically enabled when pyqt5 is detected,
list dependencies is simply an updated (no enable/disable options).

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-matplotlib/Config.in            | 12 ++++++++++++
 package/python-matplotlib/python-matplotlib.mk |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index e6ed8cda2f..cfa0bc30c3 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -23,6 +23,18 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB
 
 	  https://matplotlib.org/
 
+if BR2_PACKAGE_PYTHON_MATPLOTLIB
+
+config BR2_PACKAGE_PYTHON_MATPLOTLIB_QT
+	bool "qt display"
+	depends on BR2_PACKAGE_QT5 # python-pyqt5
+	select BR2_PACKAGE_PYTHON_PYQT5
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5BASE_FONTCONFIG
+	select BR2_PACKAGE_QT5BASE_WIDGETS
+
+endif
+
 comment "python-matplotlib needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 
diff --git a/package/python-matplotlib/python-matplotlib.mk b/package/python-matplotlib/python-matplotlib.mk
index 7082637d09..8d00ac8a07 100644
--- a/package/python-matplotlib/python-matplotlib.mk
+++ b/package/python-matplotlib/python-matplotlib.mk
@@ -13,4 +13,8 @@ PYTHON_MATPLOTLIB_DEPENDENCIES = host-pkgconf freetype host-python-numpy \
 	libpng python-cycler
 PYTHON_MATPLOTLIB_SETUP_TYPE = setuptools
 
+ifeq ($(BR2_PACKAGE_PYTHON_MATPLOTLIB_QT),y)
+PYTHON_MATPLOTLIB_DEPENDENCIES += python-pyqt5
+endif
+
 $(eval $(python-package))
