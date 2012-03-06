From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Tue,  6 Mar 2012 19:14:49 -0200
Subject: [Buildroot] [PATCHv6 1/1] qt: Add option to build and install tools
	on the target
In-Reply-To: <1331068489-3545-1-git-send-email-ismael.luceno@gmail.com>
References: <1331068489-3545-1-git-send-email-ismael.luceno@gmail.com>
Message-ID: <1331068489-3545-2-git-send-email-ismael.luceno@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>
---
 package/qt/Config.in |   25 +++++++++++++++++++++++++
 package/qt/qt.mk     |   10 ++++++++++
 2 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 3a552d0..1c24d1f 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -16,6 +16,31 @@ config BR2_PACKAGE_QT_DEBUG
 	help
 	  If unsure, say N.
 
+menuconfig BR2_PACKAGE_QT_TOOLS
+	bool "Compile and install tools"
+	depends on BR2_PACKAGE_QT_SQL_MODULE && BR2_PACKAGE_QT_GUI_MODULE
+	# SQL module is needed to build, but only required at run-time by a
+	# few tools (assistant, designer, qmlviewer).
+
+if BR2_PACKAGE_QT_TOOLS
+
+config BR2_PACKAGE_QT_TOOLS_QTCONFIG
+	bool "qtconfig"
+	depends on BR2_PACKAGE_QT_GUI_X11
+
+config BR2_PACKAGE_QT_TOOLS_QMLVIEWER
+	bool "qmlviewer"
+	depends on BR2_PACKAGE_QT_DECLARATIVE
+
+config BR2_PACKAGE_QT_TOOLS_QMLPLUGINDUMP
+	bool "qmlplugindump"
+	depends on BR2_PACKAGE_QT_DECLARATIVE
+
+endif # BR2_PACKAGE_QT_TOOLS
+
+comment "Tools need the SQL and GUI modules"
+	depends on !BR2_PACKAGE_QT_SQL_MODULE || !BR2_PACKAGE_QT_GUI_MODULE
+
 config BR2_PACKAGE_QT_DEMOS
 	bool "Compile and install demos and examples (with code)"
 	help
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 776eb63..039f1ed 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -417,6 +417,12 @@ else
 QT_CONFIGURE_OPTS += -no-declarative
 endif
 
+ifeq ($(BR2_PACKAGE_QT_TOOLS),y)
+QT_CONFIGURE_OPTS += -make tools
+else
+QT_CONFIGURE_OPTS += -nomake tools
+endif
+
 # ccache and precompiled headers don't play well together
 ifeq ($(BR2_CCACHE),y)
 QT_CONFIGURE_OPTS += -no-pch
@@ -514,6 +520,9 @@ endef
 
 QT_INSTALL_LIBS    += QtCore
 QT_HOST_PROGRAMS   += moc rcc qmake lrelease
+QT_TARGET_PROGRAMS-$(BR2_PACKAGE_QT_TOOLS_QTCONFIG) += qtconfig
+QT_TARGET_PROGRAMS-$(BR2_PACKAGE_QT_TOOLS_QMLVIEWER) += qmlviewer
+QT_TARGET_PROGRAMS-$(BR2_PACKAGE_QT_TOOLS_QMLPLUGINDUMP) += qmlplugindump
 
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
 QT_INSTALL_LIBS    += QtGui
@@ -583,6 +592,7 @@ define QT_INSTALL_STAGING_CMDS
 	$(MAKE) -C $(@D) install
 	mkdir -p $(HOST_DIR)/usr/bin
 	mv $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_HOST_PROGRAMS)) $(HOST_DIR)/usr/bin
+	$(if $(QT_TARGET_PROGRAMS-y),mv $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_TARGET_PROGRAMS-y)) $(TARGET_DIR)/usr/bin)
 	rm -rf $(HOST_DIR)/usr/mkspecs
 	mv $(STAGING_DIR)/usr/mkspecs $(HOST_DIR)/usr
 	$(QT_INSTALL_QT_CONF)
-- 
1.7.9.1
