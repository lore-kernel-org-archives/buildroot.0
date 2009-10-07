From: Michael Roth <mroth@nessie.de>
Date: Wed,  7 Oct 2009 11:20:43 +0200
Subject: [Buildroot] [PATCH 20/23] qt: simplify and fix installing qt in the
	target
In-Reply-To: <1254907246-5650-1-git-send-email-mroth@nessie.de>
References: <1254907246-5650-1-git-send-email-mroth@nessie.de>
Message-ID: <1254907246-5650-21-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Get rid of unnecessary complex constructs to install Qt in the target
file system. This also fixes the installation procedure when Qt is
build static.

Additionally wipe out old Qt files from the staging area and target
file system before installing the new ones to prevent messiness.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/qt/qt.mk |  123 ++++++++++++++----------------------------------------
 1 files changed, 32 insertions(+), 91 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index d7b0fef..3784dea 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -313,37 +313,37 @@ endif
 
 BR2_PACKAGE_QT_EMB_PLATFORM:=$(call qstrip,$(BR2_PACKAGE_QT_EMB_PLATFORM))
 
-# Figure out what libs to install in the target
-QT_LIBS=#empty
+# Figure out what shared libs to install in the target
+QT_LIBS := libQtCore.so
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
-QT_LIBS+= qt-gui  
+QT_LIBS += libQtGui.so
 endif
 ifeq ($(BR2_PACKAGE_QT_SQL_MODULE),y)
-QT_LIBS+= qt-sql
+QT_LIBS += libQtSql.so
 endif
 ifeq ($(BR2_PACKAGE_QT_PHONON),y)
-QT_LIBS+= qt-phonon
+QT_LIBS += libphonon.so
 endif
 ifeq ($(BR2_PACKAGE_QT_SVG),y)
-QT_LIBS+= qt-svg
+QT_LIBS += libQtSvg.so
 endif
 ifeq ($(BR2_PACKAGE_QT_NETWORK),y)
-QT_LIBS+= qt-network
+QT_LIBS += libQtNetwork.so
 endif
 ifeq ($(BR2_PACKAGE_QT_WEBKIT),y)
-QT_LIBS+= qt-webkit
+QT_LIBS += libQtWebKit.so
 endif
 ifeq ($(BR2_PACKAGE_QT_XML),y)
-QT_LIBS+= qt-xml
+QT_LIBS += libQtXml.so
 endif
 ifeq ($(BR2_PACKAGE_QT_XMLPATTERNS),y)
-QT_LIBS+= qt-xmlpatterns
+QT_LIBS += libQtXmlPatterns.so
 endif
 ifeq ($(BR2_PACKAGE_QT_SCRIPT),y)
-QT_LIBS+= qt-script
+QT_LIBS += libQtScript.so
 endif
 ifeq ($(BR2_PACKAGE_QT_SCRIPTTOOLS),y)
-QT_LIBS+= qt-scripttools
+QT_LIBS += libQtScriptTools.so
 endif
 
 QT_UNSTAGE_FILES := $(QT_TARGET_DIR)/.staged		\
@@ -380,23 +380,6 @@ define QT_QMAKE_SET
 	@$(SED) '/include.*qws.conf/aQMAKE_$(1) = $(2)' $(QT_QMAKE_CONF)
 endef
 
-################################################################################
-# QT_INSTALL_PLUGINS -- helper macro to install Qt plugins to target and 
-# strip them
-#
-# Argument 1 is the plugin folder
-# 
-# E.G. use like this to install plugins/sqldrivers:
-# $(call QT_INSTALL_PLUGINS,sqldrivers)
-# ################################################################################
-define QT_INSTALL_PLUGINS
-        if [ -d $(STAGING_DIR)/usr/plugins/$(1) ]; then \
-                mkdir -p $(TARGET_DIR)/usr/plugins; \
-                cp -dpfr $(STAGING_DIR)/usr/plugins/$(1) $(TARGET_DIR)/usr/plugins/; \
-                $(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/plugins/$(1)/*; \
-        fi
-endef
-
 $(DL_DIR)/$(QT_SOURCE):
 	$(call DOWNLOAD,$(QT_SITE),$(QT_SOURCE))
 
@@ -460,78 +443,34 @@ $(QT_TARGET_DIR)/.compiled: $(QT_TARGET_DIR)/.configured
 	$(MAKE) -C $(QT_TARGET_DIR)
 	touch $@
 
-$(STAGING_DIR)/usr/lib/libQtCore.la: $(QT_TARGET_DIR)/.compiled
+$(QT_TARGET_DIR)/.staged: $(QT_TARGET_DIR)/.compiled
+	-rm -rf $(QT_UNSTAGE_FILES)
 	$(MAKE) -C $(QT_TARGET_DIR) install
+	touch $@
 
-qt-gui: $(STAGING_DIR)/usr/lib/libQtCore.la
+$(QT_TARGET_DIR)/.installed: $(QT_TARGET_DIR)/.staged
+	-rm -rf $(QT_UNINSTALL_FILES)
+ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
 	mkdir -p $(TARGET_DIR)/usr/lib/fonts
 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/*.qpf $(TARGET_DIR)/usr/lib/fonts
 ifneq ($(BR2_PACKAGE_QT_NOFREETYPE),y)
 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/*.ttf $(TARGET_DIR)/usr/lib/fonts
 endif
-	# Install image plugins if they are built
-	$(call QT_INSTALL_PLUGINS,imageformats)
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtGui.so.* $(TARGET_DIR)/usr/lib/
-endif
-
-qt-sql: $(STAGING_DIR)/usr/lib/libQtCore.la
-	$(call QT_INSTALL_PLUGINS,sqldrivers)
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtSql.so.* $(TARGET_DIR)/usr/lib/
-endif
-
-qt-phonon: $(STAGING_DIR)/usr/lib/libQtCore.la
-	$(call QT_INSTALL_PLUGINS,phonon_backend)
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libphonon.so.* $(TARGET_DIR)/usr/lib/
-endif
-
-qt-svg: $(STAGING_DIR)/usr/lib/libQtCore.la
-	$(call QT_INSTALL_PLUGINS,iconengines)
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtSvg.so.* $(TARGET_DIR)/usr/lib/
-endif
-
-qt-network: $(STAGING_DIR)/usr/lib/libQtCore.la
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtNetwork.so.* $(TARGET_DIR)/usr/lib/
 endif
-
-qt-webkit: $(STAGING_DIR)/usr/lib/libQtCore.la
 ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtWebKit.so.* $(TARGET_DIR)/usr/lib/
-endif
-
-qt-xml: $(STAGING_DIR)/usr/lib/libQtCore.la
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtXml.so.* $(TARGET_DIR)/usr/lib/
-endif
-
-qt-xmlpatterns: $(STAGING_DIR)/usr/lib/libQtCore.la
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtXmlPatterns.so.* $(TARGET_DIR)/usr/lib/
-endif
-
-qt-script: $(STAGING_DIR)/usr/lib/libQtCore.la
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtScript.so.* $(TARGET_DIR)/usr/lib/
-endif
-
-qt-scripttools: $(STAGING_DIR)/usr/lib/libQtCore.la
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtScriptTools.so.* $(TARGET_DIR)/usr/lib/
-endif
-
-
-$(TARGET_DIR)/usr/lib/libQtCore.so.4: $(STAGING_DIR)/usr/lib/libQtCore.la $(QT_LIBS)
-	# Strip all installed libs
-ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-	cp -dpf $(STAGING_DIR)/usr/lib/libQtCore.so.* $(TARGET_DIR)/usr/lib/
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libQt*.so.*
-endif
+	for lib in $(QT_LIBS); do \
+		cp -dpf $(STAGING_DIR)/usr/lib/$${lib}* $(TARGET_DIR)/usr/lib/; \
+		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/$${lib}.$(QT_VERSION); \
+	done
+endif
+	if [ -d $(STAGING_DIR)/usr/plugins ]; then \
+		mkdir -p $(TARGET_DIR)/usr/plugins; \
+		cp -dpfr $(STAGING_DIR)/usr/plugins/* $(TARGET_DIR)/usr/plugins/; \
+		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/plugins/*/*; \
+	fi
+	touch $@
 
-qt: $(QT_DEP_LIBS) $(TARGET_DIR)/usr/lib/libQtCore.so.4
+qt-install: $(QT_DEP_LIBS) $(QT_TARGET_DIR)/.installed
 
 qt-uninstall:
 	-rm -rf $(QT_UNSTAGE_FILES) $(QT_UNINSTALL_FILES)
@@ -547,6 +486,8 @@ qt-confclean:
 qt-dirclean:
 	rm -rf $(QT_TARGET_DIR)
 
+qt: qt-install
+
 #############################################################
 #
 # Toplevel Makefile options
-- 
1.6.3.3
