From: Alan Yaniger <alan@tkos.co.il>
Date: Wed, 30 Aug 2017 09:03:30 +0300
Subject: [Buildroot] [RFC PATCH] qt5tools: Install QDesignerExportWidget
	include
Message-ID: <1504073010-14243-1-git-send-email-alan@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To build a custom widget exposed to QtDesigner, the widget should 
include the file QtUiPlugin/QDesignerExportWidget. Without this patch,
the include file is not installed in ${STAGING_DIR}/usr/include/qt5. 

The file QDesignerExportWidget in the qt5tools tarball is just an 
include of the file qdesignerexportwidget.h, which itself includes the
file qdesignerexportwidget.h, identified by a relative path 
"../../src/designer/src/uiplugin/qdesignerexportwidget.h". That 
relative path will not work in the staging dir, so just copy 
qdesignerexportwidget.h into staging, and give it the name 
QtUiPlugin/QDesignerExportWidget.

If anyone has a better way to install this file, using the Qt build 
system instead of "cp", I would be happy to revise the patch.

Signed-off-by: Alan Yaniger <alan@tkos.co.il>
---
 package/qt5/qt5tools/qt5tools.mk | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index 3638b74..96a3c65 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -31,7 +31,7 @@ QT5TOOLS_BUILD_DIRS_$(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS) += \
 	linguist/lconvert linguist/lrelease linguist/lupdate
 ifeq ($(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS),y)
 # use install target to copy cmake module files
-define QT5TOOLS_INSTALL_STAGING_CMDS
+define QT5TOOLS_LINGUIST_TOOLS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/linguist install
 endef
 endif
@@ -58,6 +58,19 @@ define QT5TOOLS_BUILD_CMDS
 		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src/$(p)$(sep))
 endef
 
+ifeq ($(BR2_PACKAGE_QT5TOOLS_QTPLUGININFO),y)
+define QT5TOOLS_QTPLUGININFO_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m0644 \
+		$(@D)/src/designer/src/uiplugin/qdesignerexportwidget.h \
+		$(STAGING_DIR)/usr/include/qt5/QtUiPlugin/QDesignerExportWidget
+endef
+endif
+
+define QT5TOOLS_INSTALL_STAGING_CMDS
+	$(QT5TOOLS_LINGUIST_TOOLS_INSTALL_STAGING_CMDS)
+	$(QT5TOOLS_QTPLUGININFO_INSTALL_STAGING_CMDS)
+endef
+
 define QT5TOOLS_INSTALL_TARGET_CMDS
 	$(foreach p,$(QT5TOOLS_INSTALL_TARGET_y), \
 		$(INSTALL) -D -m0755 $(@D)/bin/$(p) $(TARGET_DIR)/usr/bin/$(p)$(sep))
-- 
2.7.4
