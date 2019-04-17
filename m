From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 17 Apr 2019 23:49:45 +0200
Subject: [Buildroot] [git commit] qt5: Remove *.la/*.prl fixup script
Message-ID: <20190417221135.7E4198ED1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=428e5276e4df0b4bbd75df38565298ad53ea4f8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After fixing Prefix in our custom qt.conf, Qt computes and embeds the
correct sysroot prefixed pathes in all *.la and *.prl files.
So remove fixup of
- *.la files because they are generically fixed anyway
- *.prl files because occurences of absolute /usr/lib were no longer
observed

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/qt5.mk                             | 15 ---------------
 package/qt5/qt53d/qt53d.mk                     |  1 -
 package/qt5/qt5base/qt5base.mk                 |  1 -
 package/qt5/qt5canvas3d/qt5canvas3d.mk         |  1 -
 package/qt5/qt5charts/qt5charts.mk             |  1 -
 package/qt5/qt5connectivity/qt5connectivity.mk |  1 -
 package/qt5/qt5declarative/qt5declarative.mk   |  1 -
 package/qt5/qt5enginio/qt5enginio.mk           |  1 -
 package/qt5/qt5location/qt5location.mk         |  1 -
 package/qt5/qt5multimedia/qt5multimedia.mk     |  1 -
 package/qt5/qt5script/qt5script.mk             |  1 -
 package/qt5/qt5scxml/qt5scxml.mk               |  1 -
 package/qt5/qt5sensors/qt5sensors.mk           |  1 -
 package/qt5/qt5serialbus/qt5serialbus.mk       |  1 -
 package/qt5/qt5serialport/qt5serialport.mk     |  1 -
 package/qt5/qt5svg/qt5svg.mk                   |  1 -
 package/qt5/qt5wayland/qt5wayland.mk           |  1 -
 package/qt5/qt5webchannel/qt5webchannel.mk     |  1 -
 package/qt5/qt5webengine/qt5webengine.mk       |  1 -
 package/qt5/qt5webkit/qt5webkit.mk             |  1 -
 package/qt5/qt5websockets/qt5websockets.mk     |  1 -
 package/qt5/qt5x11extras/qt5x11extras.mk       |  1 -
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk   |  1 -
 23 files changed, 37 deletions(-)

diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 6da898121d..4e738c75db 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -17,20 +17,5 @@ QT5_SITE = https://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT
 
 include $(sort $(wildcard package/qt5/*/*.mk))
 
-define QT5_LA_PRL_FILES_FIXUP
-	for i in $$(find $(STAGING_DIR)/usr/lib* -name "libQt5*.la"); do \
-		$(SED)  "s:$(BASE_DIR):@BASE_DIR@:g" \
-			-e "s:$(STAGING_DIR):@STAGING_DIR@:g" \
-			-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
-			-e "s:@STAGING_DIR@:$(STAGING_DIR):g" \
-			-e "s:@BASE_DIR@:$(BASE_DIR):g" \
-			$$i ; \
-		$(SED) "/^dependency_libs=/s%-L/usr/lib %%g" $$i ; \
-	done
-	for i in $$(find $(STAGING_DIR)/usr/lib* -name "libQt5*.prl"); do \
-		$(SED) "s%-L/usr/lib%%" $$i; \
-	done
-endef
-
 # Variable for other Qt applications to use
 QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 48a931d60b..7674b44558 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -27,7 +27,6 @@ endef
 
 define QT53D_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index fa0466dea8..0b45c50a66 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -356,7 +356,6 @@ endef
 
 define QT5BASE_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 	$(QT5BASE_INSTALL_QT_CONF)
 endef
 
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.mk b/package/qt5/qt5canvas3d/qt5canvas3d.mk
index ef5b373d02..b550ff00f2 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.mk
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.mk
@@ -28,7 +28,6 @@ endef
 
 define QT5CANVAS3D_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
index 9e2e6de881..e359747503 100644
--- a/package/qt5/qt5charts/qt5charts.mk
+++ b/package/qt5/qt5charts/qt5charts.mk
@@ -34,7 +34,6 @@ endef
 
 define QT5CHARTS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index 6de1536b78..24dbc2cba0 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -36,7 +36,6 @@ endef
 
 define QT5CONNECTIVITY_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 2fe72b3be6..6210611961 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -28,7 +28,6 @@ endef
 
 define QT5DECLARATIVE_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index 38f309646f..2a4cf72ec7 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -32,7 +32,6 @@ endef
 
 define QT5ENGINIO_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index da0aad7961..a69e8f41a6 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -32,7 +32,6 @@ endef
 
 define QT5LOCATION_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index d044b7b96c..7d332b0304 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -44,7 +44,6 @@ endef
 
 define QT5MULTIMEDIA_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index 4a292c95a5..a3b8cb7e34 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -37,7 +37,6 @@ endef
 
 define QT5SCRIPT_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
index de9ece597c..b54ef0e43a 100644
--- a/package/qt5/qt5scxml/qt5scxml.mk
+++ b/package/qt5/qt5scxml/qt5scxml.mk
@@ -26,7 +26,6 @@ endef
 
 define QT5SCXML_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index 2d5cf327a6..10498a4970 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -32,7 +32,6 @@ endef
 
 define QT5SENSORS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
index 98c4466cb8..be8bb8b23c 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.mk
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -23,7 +23,6 @@ endef
 
 define QT5SERIALBUS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 2b0953586b..5c2abd82da 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -28,7 +28,6 @@ endef
 
 define QT5SERIALPORT_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index 48ff04bd75..cb91844efd 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -28,7 +28,6 @@ endef
 
 define QT5SVG_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index d6fb6e1888..f96e4c2f8f 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -40,7 +40,6 @@ endef
 
 define QT5WAYLAND_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 ifeq ($(BR2_PACKAGE_QT5WAYLAND_COMPOSITOR),y)
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index f1c08532c0..d136041980 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -35,7 +35,6 @@ endef
 
 define QT5WEBCHANNEL_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index a3cfcec26e..1d5ee8d819 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -73,7 +73,6 @@ endef
 
 define QT5WEBENGINE_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 define QT5WEBENGINE_INSTALL_TARGET_QMLS
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index a0a0998d12..25c5495482 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -54,7 +54,6 @@ endef
 
 define QT5WEBKIT_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index c67db198db..d026a44ff1 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -35,7 +35,6 @@ endef
 
 define QT5WEBSOCKETS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index 9d54c11061..6acc9462c1 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -28,7 +28,6 @@ endef
 
 define QT5X11EXTRAS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 0a8b47ac53..8be708844b 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -31,7 +31,6 @@ endef
 
 define QT5XMLPATTERNS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
