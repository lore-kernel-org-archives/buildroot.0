From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Mar 2019 21:13:21 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5base: add
 BR2_PACKAGE_QT5BASE_OPENSSL
Message-ID: <20190304201145.E02D08E89D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a946657b6e40924a746d1bd86eb023158abd1ab8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c110e48cecde6f543da18388322907b05b25e7d2 disabled openssl support
on QT 5.6, this has the side-effect of breaking the build of
python-pyqt5 because support of openssl is enabled on python-pyqt5 if
BR2_PACKAGE_OPENSSL is selected

To fix this issue, add a new BR2_PACKAGE_QT5BASE_OPENSSL option in
qt5base and use it in python-pyqt5

Fixes:
 - http://autobuild.buildroot.org/results/e92991308d47649cecc4084e41ab5711ec96831f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Peter: make _OPENSSL a blind option, add libressl logic for 5.6.x]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyqt5/python-pyqt5.mk | 2 +-
 package/qt5/qt5base/Config.in        | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
index cde026ef63..4955936ae3 100644
--- a/package/python-pyqt5/python-pyqt5.mk
+++ b/package/python-pyqt5/python-pyqt5.mk
@@ -25,9 +25,9 @@ PYTHON_PYQT5_QTDETAIL_LICENSE = Open Source
 PYTHON_PYQT5_QTDETAIL_TYPE = shared
 
 # Turn off features that aren't available in current qt configuration
-PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if $(BR2_PACKAGE_OPENSSL),,PyQt_SSL)
 PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if $(BR2_PACKAGE_QT5BASE_OPENGL),,PyQt_OpenGL)
 PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if $(BR2_PACKAGE_QT5BASE_OPENGL_DESKTOP),,PyQt_Desktop_OpenGL)
+PYTHON_PYQT5_QTDETAIL_DISABLE_FEATURES += $(if $(BR2_PACKAGE_QT5BASE_OPENSSL),,PyQt_SSL)
 
 define PYTHON_PYQT5_QTDETAIL
 	echo $(1) >> $(2)/qtdetail.out
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 1340ea48f0..696e689758 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -286,6 +286,12 @@ comment "icu support needs a toolchain w/ gcc >= 4.8, host gcc >= 4.8"
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
 		!BR2_HOST_GCC_AT_LEAST_4_8
 
+config BR2_PACKAGE_QT5BASE_OPENSSL
+	bool
+	# No OpenSSL 1.1.x support in Qt 5.6.x
+	default y if BR2_PACKAGE_QT5_VERSION_5_6 && BR2_PACKAGE_LIBRESSL
+	default y if BR2_PACKAGE_QT5_VERSION_LATEST && BR2_PACKAGE_OPENSSL
+
 config BR2_PACKAGE_QT5BASE_TSLIB
 	bool "Enable Tslib support"
 	select BR2_PACKAGE_TSLIB
