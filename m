From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu, 14 Mar 2019 10:40:15 +0100
Subject: [Buildroot] [PATCH v2 04/13] qt5: Remove *.la/*.prl fixup script
In-Reply-To: <20190314094024.1961-1-anaumann@ultratronik.de>
References: <20190314094024.1961-1-anaumann@ultratronik.de>
Message-ID: <20190314094024.1961-5-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After fixing Prefix in our custom qt.conf, Qt computes and embeds the correct
sysroot prefixed pathes in all *.la and *.prl files.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
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
index 5acbbf2ef3..772551cae4 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -17,21 +17,6 @@ QT5_SITE = https://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT
 
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
 define QT5_INSTALL_TARGET
 	cd $(STAGING_DIR)/usr; find . -cnewer $(@D)/.stamp_built \
 		! -name *.la ! -name *.prl \
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index eb8da66d11..f8d9916b70 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -27,7 +27,6 @@ endef
 
 define QT53D_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 74f6c8d7d3..73699b9cb7 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -333,7 +333,6 @@ endef
 
 define QT5BASE_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 	$(QT5BASE_INSTALL_QT_CONF)
 endef
 
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.mk b/package/qt5/qt5canvas3d/qt5canvas3d.mk
index 006d3d964e..05ea03d365 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.mk
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.mk
@@ -28,7 +28,6 @@ endef
 
 define QT5CANVAS3D_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 define QT5CANVAS3D_INSTALL_TARGET_CMDS
diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
index d11a301a86..0d8db66dc4 100644
--- a/package/qt5/qt5charts/qt5charts.mk
+++ b/package/qt5/qt5charts/qt5charts.mk
@@ -34,7 +34,6 @@ endef
 
 define QT5CHARTS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index e96014b64b..fb034d7b7c 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -36,7 +36,6 @@ endef
 
 define QT5CONNECTIVITY_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 define QT5CONNECTIVITY_INSTALL_TARGET_CMDS
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index ef18553d0b..c617fe9bed 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -28,7 +28,6 @@ endef
 
 define QT5DECLARATIVE_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 define QT5DECLARATIVE_INSTALL_TARGET_CMDS
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index b39d2eb097..1015044264 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -32,7 +32,6 @@ endef
 
 define QT5ENGINIO_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 define QT5ENGINIO_INSTALL_TARGET_CMDS
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index d4b4ffe41b..9b0813e9ad 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -32,7 +32,6 @@ endef
 
 define QT5LOCATION_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 define QT5LOCATION_INSTALL_TARGET_CMDS
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 9f7342adfb..7f2197e770 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -44,7 +44,6 @@ endef
 
 define QT5MULTIMEDIA_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index 9f70a87d41..9f2bd55324 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -37,7 +37,6 @@ endef
 
 define QT5SCRIPT_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 define QT5SCRIPT_INSTALL_TARGET_CMDS
diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
index ce3cd650a7..ad0d17502f 100644
--- a/package/qt5/qt5scxml/qt5scxml.mk
+++ b/package/qt5/qt5scxml/qt5scxml.mk
@@ -26,7 +26,6 @@ endef
 
 define QT5SCXML_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 define QT5SCXML_INSTALL_TARGET_CMDS
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index 2cd6e0d5fb..baabc053fc 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -32,7 +32,6 @@ endef
 
 define QT5SENSORS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 define QT5SENSORS_INSTALL_TARGET_CMDS
diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
index 2841172fb7..68b622dde1 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.mk
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -23,7 +23,6 @@ endef
 
 define QT5SERIALBUS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 define QT5SERIALBUS_INSTALL_TARGET_CMDS
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 9059443073..d0cf7f13a4 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -28,7 +28,6 @@ endef
 
 define QT5SERIALPORT_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 define QT5SERIALPORT_INSTALL_TARGET_CMDS
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index 800a9fbdd1..a51063a489 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -28,7 +28,6 @@ endef
 
 define QT5SVG_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 define QT5SVG_INSTALL_TARGET_CMDS
diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index c5365198ba..4ab73aa249 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -40,7 +40,6 @@ endef
 
 define QT5WAYLAND_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 define QT5WAYLAND_INSTALL_TARGET_CMDS
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index 8e62e9c6f0..b0103549bf 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -35,7 +35,6 @@ endef
 
 define QT5WEBCHANNEL_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index 09cb8c135f..4b95020c2b 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -73,7 +73,6 @@ endef
 
 define QT5WEBENGINE_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 define QT5WEBENGINE_INSTALL_TARGET_CMDS
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 739372af9e..367bcd9f42 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -54,7 +54,6 @@ endef
 
 define QT5WEBKIT_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 define QT5WEBKIT_INSTALL_TARGET_CMDS
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index 2b0e2bf284..d15c9f4353 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -35,7 +35,6 @@ endef
 
 define QT5WEBSOCKETS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 define QT5WEBSOCKETS_INSTALL_TARGET_CMDS
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index 55c8e741ab..075fbf2850 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -28,7 +28,6 @@ endef
 
 define QT5X11EXTRAS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 define QT5X11EXTRAS_INSTALL_TARGET_CMDS
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 98096a6157..16233cf1ac 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -31,7 +31,6 @@ endef
 
 define QT5XMLPATTERNS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
 define QT5XMLPATTERNS_INSTALL_TARGET_CMDS
-- 
2.21.0
