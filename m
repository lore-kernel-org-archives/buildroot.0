From: Karl Krach <mailinglists@blueSpirit.la>
Date: Fri, 09 Jul 2010 14:32:57 +0200
Subject: [Buildroot] libQt3Support.so missing in image on target
Message-ID: <l5aiux.md2l92@webmail.variomedia.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,

I would like to commit two patches. First, if you install qt3support the
libQt3Support.so is only installed to the STAGING_DIR but missing in the
TARGET_DIR - thus on the target.

Second, I run from time to time in the problem, that I remove the build
directory on reconfigure/recompile but not the libraries from the STATING_DIR
- this would be a tiny (but nice) feature.

Thanks a lot,

Karl



--- package/qt/qt.mk_original	2010-07-09 11:01:27.000000000 +0200
+++ package/qt/qt.mk_qt3support	2010-07-09 14:24:02.000000000 +0200
@@ -418,6 +418,9 @@
 ifeq ($(BR2_PACKAGE_QT_SCRIPTTOOLS),y)
 QT_LIBS+= qt-scripttools
 endif
+ifeq ($(BR2_PACKAGE_QT_QT3SUPPORT),y)
+QT_LIBS+= qt-qt3support
+endif
 
 QT_QMAKE_CONF:=$(QT_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QT_EMB_PLATFORM)-g++/qmake.conf
 
@@ -597,6 +600,10 @@
 	cp -dpf $(STAGING_DIR)/usr/lib/libQtScriptTools.so.* $(TARGET_DIR)/usr/lib/
 endif
 
+qt-qt3support: $(STAGING_DIR)/usr/lib/libQtCore.la
+ifeq ($(BR2_PACKAGE_QT_SHARED),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt3Support.so.* $(TARGET_DIR)/usr/lib/
+endif
 
 $(TARGET_DIR)/usr/lib/libQtCore.so.4: $(STAGING_DIR)/usr/lib/libQtCore.la
$(QT_LIBS)
 	# Strip all installed libs







--- package/qt/qt.mk_qt3support	2010-07-09 14:24:02.000000000 +0200
+++ package/qt/qt.mk_recompile	2010-07-09 14:26:09.000000000 +0200
@@ -520,6 +520,7 @@
 		-nomake demos \
 	)
 	touch $@
+	rm -rf $(STAGING_DIR)/usr/lib/libQt*
 
 $(QT_TARGET_DIR)/.compiled: $(QT_TARGET_DIR)/.configured
 	$(MAKE) -C $(QT_TARGET_DIR)
