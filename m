From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Mon,  6 Jan 2014 22:43:02 +0100
Subject: [Buildroot] [PATCH] qt4: allow separate build/installation of demos
	and examples
Message-ID: <1389044582-20123-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>

Signed-off-by: Jeremie Scheer <jeremie.scheer@armadeus.com>
Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 package/qt/Config.in |    8 +++++++-
 package/qt/qt.mk     |    9 +++++++--
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index dd2b6d9..926d54c 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -21,7 +21,13 @@ config BR2_PACKAGE_QT_DEBUG
 	  If unsure, say N.
 
 config BR2_PACKAGE_QT_DEMOS
-	bool "Compile and install demos and examples (with code)"
+	bool "Compile and install Qt demos (with code)"
+	select BR2_PACKAGE_QT_GUI_MODULE
+	help
+	  If unsure, say N.
+
+config BR2_PACKAGE_QT_EXAMPLES
+	bool "Compile and install Qt examples (with code)"
 	select BR2_PACKAGE_QT_GUI_MODULE
 	help
 	  If unsure, say N.
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 029d317..867b798 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -59,9 +59,14 @@ QT_CONFIGURE_OPTS += -no-qt3support
 endif
 
 ifeq ($(BR2_PACKAGE_QT_DEMOS),y)
-QT_CONFIGURE_OPTS += -examplesdir $(TARGET_DIR)/usr/share/qt/examples -demosdir $(TARGET_DIR)/usr/share/qt/demos
+QT_CONFIGURE_OPTS += -demosdir $(TARGET_DIR)/usr/share/qt/demos
 else
-QT_CONFIGURE_OPTS += -nomake examples -nomake demos
+QT_CONFIGURE_OPTS += -nomake demos
+endif
+ifeq ($(BR2_PACKAGE_QT_EXAMPLES),y)
+QT_CONFIGURE_OPTS += -examplesdir $(TARGET_DIR)/usr/share/qt/examples
+else
+QT_CONFIGURE_OPTS += -nomake examples
 endif
 
 # ensure glib is built first if enabled for Qt's glib support
-- 
1.7.5.4
