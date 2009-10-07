From: Michael Roth <mroth@nessie.de>
Date: Wed,  7 Oct 2009 11:20:25 +0200
Subject: [Buildroot] [PATCH 02/23] qt: new targets qt-uninstall and
	qt-confclean
In-Reply-To: <1254907246-5650-1-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
Message-ID: <1254907246-5650-3-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

'qt-uninstall' removes Qt from the staging area and target filesystem
while 'qt-confclean' removes the results from running configure in the
Qt build directory. Use this after changes to the Qt configuration were
made to re-configure, re-build and re-install Qt.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/qt/qt.mk |   29 ++++++++++++++++++++++++-----
 1 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 68b4e44..f4a63a4 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -373,6 +373,22 @@ ifeq ($(BR2_PACKAGE_QT_SCRIPTTOOLS),y)
 QT_LIBS+= qt-scripttools
 endif
 
+QT_UNSTAGE_FILES := $(QT_TARGET_DIR)/.staged		\
+	$(STAGING_DIR)/usr/lib/fonts			\
+	$(STAGING_DIR)/usr/plugins			\
+	$(STAGING_DIR)/usr/translations			\
+	$(STAGING_DIR)/usr/mkspecs			\
+	$(STAGING_DIR)/usr/include/Qt*			\
+	$(STAGING_DIR)/usr/lib/libQt*			\
+	$(STAGING_DIR)/usr/lib/libphonon.*		\
+	$(STAGING_DIR)/usr/lib/pkgconfig/Qt*.pc
+
+QT_UNINSTALL_FILES := $(QT_TARGET_DIR)/.installed	\
+	$(TARGET_DIR)/usr/lib/fonts			\
+	$(TARGET_DIR)/usr/plugins			\
+	$(TARGET_DIR)/usr/lib/libQt*			\
+	$(TARGET_DIR)/usr/lib/libphonon.*
+
 QT_QMAKE_CONF:=$(QT_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QT_EMB_PLATFORM)-g++/qmake.conf
 
 QT_QMAKE_AR:=$(TARGET_AR) cqs
@@ -551,13 +567,16 @@ endif
 
 qt: $(QT_DEP_LIBS) $(TARGET_DIR)/usr/lib/libQtCore.so.4
 
+qt-uninstall:
+	-rm -rf $(QT_UNSTAGE_FILES) $(QT_UNINSTALL_FILES)
+
 qt-clean:
 	-$(MAKE) -C $(QT_TARGET_DIR) clean
-	-rm -rf $(TARGET_DIR)/usr/lib/fonts
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	-rm $(TARGET_DIR)/usr/lib/libQt*.so.*
-	-rm $(TARGET_DIR)/usr/lib/libphonon.so.*
-endif
+	-rm -f $(QT_TARGET_DIR)/.compiled
+
+qt-confclean:
+	-$(MAKE) -C $(QT_TARGET_DIR) confclean
+	-rm -f $(QT_TARGET_DIR)/.configured
 
 qt-dirclean:
 	rm -rf $(QT_TARGET_DIR)
-- 
1.6.3.3
