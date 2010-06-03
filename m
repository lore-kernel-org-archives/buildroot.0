From: luca at lucaceresoli.net <luca@lucaceresoli.net>
Date: Thu,  3 Jun 2010 22:31:02 +0200
Subject: [Buildroot] [PATCH] qt: fix libQtMultimedia installation
Message-ID: <1275597062-8925-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Luca Ceresoli <luca@lucaceresoli.net>

With BR2_PACKAGE_QT_MULTIMEDIA=y, libQtMultimedia.so.* was not
copied to the target directory.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/qt/qt.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index aaf965e..e2ebbb2 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -387,6 +387,9 @@ endif
 ifeq ($(BR2_PACKAGE_QT_SQL_MODULE),y)
 QT_LIBS+= qt-sql
 endif
+ifeq ($(BR2_PACKAGE_QT_MULTIMEDIA),y)
+QT_LIBS+= qt-multimedia
+endif
 ifeq ($(BR2_PACKAGE_QT_PHONON),y)
 QT_LIBS+= qt-phonon
 endif
@@ -542,6 +545,11 @@ ifeq ($(BR2_PACKAGE_QT_SHARED),y)
 	cp -dpf $(STAGING_DIR)/usr/lib/libQtSql.so.* $(TARGET_DIR)/usr/lib/
 endif
 
+qt-multimedia: $(STAGING_DIR)/usr/lib/libQtCore.la
+ifeq ($(BR2_PACKAGE_QT_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQtMultimedia.so.* $(TARGET_DIR)/usr/lib/
+endif
+
 qt-phonon: $(STAGING_DIR)/usr/lib/libQtCore.la
 	$(call QT_INSTALL_PLUGINS,phonon_backend)
 ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-- 
1.5.4.3
