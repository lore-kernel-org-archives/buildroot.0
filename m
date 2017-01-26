From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu, 26 Jan 2017 15:04:17 +0100
Subject: [Buildroot] [PATCH v5 06/10] qt5quickcontrols: More deterministic
	target install
In-Reply-To: <1485439461-4797-1-git-send-email-anaumann@ultratronik.de>
References: <1485439461-4797-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <1485439461-4797-7-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Restrict target install to quickcontrols(1) qmls only.

Installing everything under qml/QtQuick includes e.g. quickcontrols2 if
existent in staging (but not selected). Another issue may arise e.g. for a
external package that creates more files than it installs itself under
qml/QtQuick. In that case, it would depend on the order of the packages how
much gets installed into target.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index b33ff15..c2946bc 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -31,7 +31,10 @@ define QT5QUICKCONTROLS_INSTALL_STAGING_CMDS
 endef
 
 define QT5QUICKCONTROLS_INSTALL_TARGET_CMDS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick $(TARGET_DIR)/usr/qml
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Controls $(TARGET_DIR)/usr/qml/QtQuick
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Dialogs $(TARGET_DIR)/usr/qml/QtQuick
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Extras $(TARGET_DIR)/usr/qml/QtQuick
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/PrivateWidgets $(TARGET_DIR)/usr/qml/QtQuick
 endef
 
 $(eval $(generic-package))
-- 
1.9.1
