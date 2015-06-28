From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 28 Jun 2015 21:42:38 +0200
Subject: [Buildroot] [RFC v4 04/16] packages/qt: read spec files from the
	per-package staging directory
In-Reply-To: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1435520570-20332-5-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to support the per-package staging feature, read spec files
from the subdirectory "mkspecs" that is in the per-package staging
directory.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/python-pyqt/python-pyqt.mk | 1 +
 package/python-sip/python-sip.mk   | 2 +-
 package/qt/qt.mk                   | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-pyqt/python-pyqt.mk b/package/python-pyqt/python-pyqt.mk
index fa298c4..0ee9352 100644
--- a/package/python-pyqt/python-pyqt.mk
+++ b/package/python-pyqt/python-pyqt.mk
@@ -73,6 +73,7 @@ PYTHON_PYQT_CONF_OPTS = \
 	--bindir $(TARGET_DIR)/usr/bin \
 	--destdir $(TARGET_DIR)/usr/lib/$(PYTHON_PYQT_PYTHON_DIR)/site-packages \
 	--qmake $(HOST_DIR)/usr/bin/qmake \
+	--spec $(STAGING_DIR)/usr/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++ \
 	--sysroot $(STAGING_DIR)/usr \
 	-w --confirm-license \
 	--no-designer-plugin \
diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 4651186..4ac6413 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -46,7 +46,7 @@ define PYTHON_SIP_CONFIGURE_CMDS
 			--sipdir $(TARGET_DIR)/usr/share/sip \
 			--sysroot $(STAGING_DIR)/usr \
 			--use-qmake && \
-		$(HOST_DIR)/usr/bin/qmake)
+		$(QT_QMAKE))
 endef
 
 define PYTHON_SIP_BUILD_CMDS
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index a4a55ec..0644fbe 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -457,7 +457,7 @@ endif
 # End of workaround.
 
 # Variable for other Qt applications to use
-QT_QMAKE = $(HOST_DIR)/usr/bin/qmake -spec qws/linux-$(QT_EMB_PLATFORM)-g++
+QT_QMAKE = $(HOST_DIR)/usr/bin/qmake -spec $(STAGING_DIR)/usr/mkspecs/qws/linux-$(QT_EMB_PLATFORM)-g++
 
 ################################################################################
 # QT_QMAKE_SET -- helper macro to set <variable> = <value> in
-- 
2.4.3
