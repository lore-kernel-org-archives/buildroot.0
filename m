From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:44 +0100
Subject: [Buildroot] [PATCH v6 22/28] package/python-pyqt5: Fix qmake usage
 for per-package build
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200217212350.29750-23-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since python-pyqt5 is not built by the qmake infra, we need to explicitly
integrate the qt.conf fixup needed for successful per-package build.

Note:
Calling qmake via the QT5_QMAKE variable can not be done because it includes
parameters which the python configure script does not accept.
However, at the moment these parameters are only important for modifiying the
per-package pkg-config pathes. This is assumed to be correctly done because
the correct per-package sysroot path is supplied to the python configure
script.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/python-pyqt5/python-pyqt5.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pyqt5/python-pyqt5.mk b/package/python-pyqt5/python-pyqt5.mk
index 260a93af9c..60828fce1a 100644
--- a/package/python-pyqt5/python-pyqt5.mk
+++ b/package/python-pyqt5/python-pyqt5.mk
@@ -161,6 +161,7 @@ PYTHON_PYQT5_CONF_OPTS = \
 
 define PYTHON_PYQT5_CONFIGURE_CMDS
 	$(call PYTHON_PYQT5_GENERATE_QTDETAIL,$(@D))
+	$(QT5_QT_CONF_FIXUP)
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) \
 		$(TARGET_CONFIGURE_OPTS) \
-- 
2.25.0
