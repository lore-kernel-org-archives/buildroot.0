From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Sun, 26 Feb 2012 10:13:08 -0200
Subject: [Buildroot] [PATCH 3/3] qt: Add option to build and install tools
	on the target
In-Reply-To: <1330258388-28391-1-git-send-email-ismael.luceno@gmail.com>
References: <1330258388-28391-1-git-send-email-ismael.luceno@gmail.com>
Message-ID: <1330258388-28391-3-git-send-email-ismael.luceno@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/qt/Config.in |    9 +++++++++
 package/qt/qt.mk     |   14 +++++++++++++-
 2 files changed, 22 insertions(+), 1 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 3a552d0..6402bee 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -16,6 +16,15 @@ config BR2_PACKAGE_QT_DEBUG
 	help
 	  If unsure, say N.
 
+config BR2_PACKAGE_QT_TOOLS
+	bool "Compile and install tools"
+	depends on BR2_PACKAGE_QT_SQL_MODULE
+	help
+	  If unsure, say N.
+
+comment "Tools need SQL module"
+	depends on !BR2_PACKAGE_QT_SQL_MODULE
+
 config BR2_PACKAGE_QT_DEMOS
 	bool "Compile and install demos and examples (with code)"
 	help
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 4871538..5414947 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -412,6 +412,12 @@ else
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
@@ -509,6 +515,7 @@ endef
 
 QT_INSTALL_LIBS    += QtCore
 QT_HOST_PROGRAMS   += moc rcc qmake lrelease
+QT_TARGET_PROGRAMS += qmlviewer
 
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
 QT_INSTALL_LIBS    += QtGui
@@ -577,7 +584,12 @@ endef
 define QT_INSTALL_STAGING_CMDS
 	$(MAKE) -C $(@D) install
 	mkdir -p $(HOST_DIR)/usr/bin
-	mv $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_HOST_PROGRAMS)) $(HOST_DIR)/usr/bin
+	for i in $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_HOST_PROGRAMS)); do \
+		if [ -x "$$i" ]; then cp "$$i" $(HOST_DIR)/usr/bin; fi; \
+	done
+	for i in $(addprefix $(STAGING_DIR)/usr/bin/,$(QT_TARGET_PROGRAMS)); do \
+		if [ -x "$$i" ]; then cp "$$i" $(TARGET_DIR)/usr/bin; fi; \
+	done
 	rm -rf $(HOST_DIR)/usr/mkspecs
 	mv $(STAGING_DIR)/usr/mkspecs $(HOST_DIR)/usr
 	$(QT_INSTALL_QT_CONF)
-- 
1.7.9.1
