From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 12:13:19 +0200
Subject: [Buildroot] [git commit] python-pyqt: fix PyQt_qreal_double
	enabling/disabling
Message-ID: <20150426101342.2C61F81770@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c90e587c3589a19fe208f872fc1007a1b608058c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fix :
http://autobuild.buildroot.net/results/6a2/6a28855c11b321ce8ceaf0acdd5395738af931fd/
http://autobuild.buildroot.net/results/91a/91a3641d1e4126475bbca0d3c779582832f6db91/
http://autobuild.buildroot.net/results/b10/b10fa70c199fc2de405068fea1eac80c29577747/
http://autobuild.buildroot.net/results/b53/b5334ac80afb58a19bd40b7c0b18378d75bc8fc7/
http://autobuild.buildroot.net/results/01f/01fa1319e467c3c2410fd462dc40c18b82dc8246/
http://autobuild.buildroot.net/results/2e6/2e6cae93ab860175c405e440bc7e24334b5b14e8/

According to configure-ng.py, PyQt_qreal_double must be disabled on
ARM target and when QT_NO_FPU is set.

[Thomas: refactor code using a hidden Config.in boolean.]

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyqt/Config.in      |   10 ++++++++++
 package/python-pyqt/python-pyqt.mk |    8 +++++++-
 2 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/package/python-pyqt/Config.in b/package/python-pyqt/Config.in
index d4544fa..a50cb74 100644
--- a/package/python-pyqt/Config.in
+++ b/package/python-pyqt/Config.in
@@ -13,3 +13,13 @@ config BR2_PACKAGE_PYTHON_PYQT
 	  PyQt4 for Qt Embedded 4 bindings.
 
 	  http://www.riverbankcomputing.com/software/pyqt/
+
+if BR2_PACKAGE_PYTHON_PYQT
+
+config BR2_PACKAGE_PYTHON_PYQT_ARCH_USES_QREAL_FLOAT
+	bool
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_sh4 || BR2_sh4eb || BR2_sh4a || BR2_sh4aeb
+	default y if (BR2_mipsel || BR2_mips) && BR2_PACKAGE_QT_EMBEDDED
+
+endif
diff --git a/package/python-pyqt/python-pyqt.mk b/package/python-pyqt/python-pyqt.mk
index 2363f7d..2445567 100644
--- a/package/python-pyqt/python-pyqt.mk
+++ b/package/python-pyqt/python-pyqt.mk
@@ -33,13 +33,19 @@ endif
 # Turn off features that aren't available in QWS and current qt
 # configuration.
 PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES = \
-	PyQt_Accessibility PyQt_SessionManager PyQt_qreal_double \
+	PyQt_Accessibility PyQt_SessionManager \
 	PyQt_Shortcut PyQt_RawFont
 
 ifeq ($(BR2_PACKAGE_QT_OPENSSL),)
 PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES += PyQt_OpenSSL
 endif
 
+# PyQt_qreal_double must be disabled on a number of architectures that
+# use float for qreal.
+ifeq ($(BR2_PACKAGE_PYTHON_PYQT_ARCH_USES_QREAL_FLOAT),y)
+PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES += PyQt_qreal_double
+endif
+
 define PYTHON_PYQT_QTDETAIL
 	echo $(1) >> $(2)/qtdetail.out
 endef
