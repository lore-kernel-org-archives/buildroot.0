From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Sat, 25 Apr 2015 12:41:16 +0200
Subject: [Buildroot] [PATCH v2 1/3] python-pyqt: fix PyQt_qreal_double
	enabling/disabling
Message-ID: <1429958478-29114-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

fix :
http://autobuild.buildroot.net/results/6a2/6a28855c11b321ce8ceaf0acdd5395738af931fd/
http://autobuild.buildroot.net/results/91a/91a3641d1e4126475bbca0d3c779582832f6db91/
http://autobuild.buildroot.net/results/b10/b10fa70c199fc2de405068fea1eac80c29577747/
http://autobuild.buildroot.net/results/b53/b5334ac80afb58a19bd40b7c0b18378d75bc8fc7/
http://autobuild.buildroot.net/results/01f/01fa1319e467c3c2410fd462dc40c18b82dc8246/
http://autobuild.buildroot.net/results/2e6/2e6cae93ab860175c405e440bc7e24334b5b14e8/

According to configure-ng.py, PyQt_qreal_double must be disabled on ARM target
and when QT_NO_FPU is set.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v1 -> v2:
 * disable PyQt_qreal_double for sh4, sh4a, sh4aeb and QWS & mips
---
 package/python-pyqt/python-pyqt.mk | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/python-pyqt/python-pyqt.mk b/package/python-pyqt/python-pyqt.mk
index 2363f7d..c151dfd 100644
--- a/package/python-pyqt/python-pyqt.mk
+++ b/package/python-pyqt/python-pyqt.mk
@@ -33,13 +33,24 @@ endif
 # Turn off features that aren't available in QWS and current qt
 # configuration.
 PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES = \
-	PyQt_Accessibility PyQt_SessionManager PyQt_qreal_double \
+	PyQt_Accessibility PyQt_SessionManager \
 	PyQt_Shortcut PyQt_RawFont
 
 ifeq ($(BR2_PACKAGE_QT_OPENSSL),)
 PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES += PyQt_OpenSSL
 endif
 
+# PyQt_qreal_double must be disabled on ARM or when QT_NO_FPU is set
+# QT_NO_FPU is set for ARM, SH4 and SH4A
+ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_sh4)$(BR2_sh4a)$(BR2_sh4aeb),y)
+PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES += PyQt_qreal_double
+endif
+
+# QT_NO_FPU is also set for QWS on misp
+ifeq ($(BR2_PACKAGE_QT_EMBEDDED)x$(BR2_mipsel)$(BR2_mips),yxy)
+PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES += PyQt_qreal_double
+endif
+
 define PYTHON_PYQT_QTDETAIL
 	echo $(1) >> $(2)/qtdetail.out
 endef
-- 
2.0.5
