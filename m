From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Mon, 20 Apr 2015 17:29:17 +0200
Subject: [Buildroot] [PATCH 1/3] python-pyqt: fix compile on x86
Message-ID: <1429543759-32207-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

fix :
http://autobuild.buildroot.net/results/e2a/e2ab7e2e61aaa5758a3a572ae25a047e802fdcc0/

According to configure-ng.py, PyQt_qreal_double must be disabled only for ARM
target.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/python-pyqt/python-pyqt.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/python-pyqt/python-pyqt.mk b/package/python-pyqt/python-pyqt.mk
index 2363f7d..808837e 100644
--- a/package/python-pyqt/python-pyqt.mk
+++ b/package/python-pyqt/python-pyqt.mk
@@ -33,13 +33,17 @@ endif
 # Turn off features that aren't available in QWS and current qt
 # configuration.
 PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES = \
-	PyQt_Accessibility PyQt_SessionManager PyQt_qreal_double \
+	PyQt_Accessibility PyQt_SessionManager \
 	PyQt_Shortcut PyQt_RawFont
 
 ifeq ($(BR2_PACKAGE_QT_OPENSSL),)
 PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES += PyQt_OpenSSL
 endif
 
+ifeq ($(BR2_arm)$(BR2_armeb),y)
+PYTHON_PYQT_QTDETAIL_DISABLE_FEATURES += PyQt_qreal_double
+endif
+
 define PYTHON_PYQT_QTDETAIL
 	echo $(1) >> $(2)/qtdetail.out
 endef
-- 
2.0.5
