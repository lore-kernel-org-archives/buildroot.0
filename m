From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 19 Mar 2014 20:30:06 +0100
Subject: [Buildroot] [PATCH 1 of 4] qt5 packages: set correct PATH when
	running qmake
In-Reply-To: <patchbomb.1395257405@argentina>
References: <patchbomb.1395257405@argentina>
Message-ID: <bb907111e06d6d25c78f.1395257406@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The qmake step of qt5 packages may attempt to run pkg-config. If qmake is
executed in an environment where the buildroot host directory is not in
PATH, pkg-config from the build machine may be used (/usr/bin/pkg-config).
This causes qt5 package compilation to fail on machines that do not have
pkg-config installed.
Refer to mailing list thread [1] for a specific error case.

This patch prepends TARGET_MAKE_ENV (which sets PATH) to the qmake call.

Reported-by: Marco Trapanese <marcotrapanese@gmail.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

[1] http://lists.busybox.net/pipermail/buildroot/2014-March/092283.html

---
 package/qt5/qt5connectivity/qt5connectivity.mk         |  2 +-
 package/qt5/qt5declarative/qt5declarative.mk           |  2 +-
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk |  2 +-
 package/qt5/qt5imageformats/qt5imageformats.mk         |  2 +-
 package/qt5/qt5multimedia/qt5multimedia.mk             |  2 +-
 package/qt5/qt5quick1/qt5quick1.mk                     |  2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk       |  2 +-
 package/qt5/qt5script/qt5script.mk                     |  2 +-
 package/qt5/qt5sensors/qt5sensors.mk                   |  2 +-
 package/qt5/qt5serialport/qt5serialport.mk             |  2 +-
 package/qt5/qt5svg/qt5svg.mk                           |  2 +-
 package/qt5/qt5x11extras/qt5x11extras.mk               |  2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk           |  2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -23,7 +23,7 @@ QT5CONNECTIVITY_DEPENDENCIES += qt5decla
 endif
 
 define QT5CONNECTIVITY_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5CONNECTIVITY_BUILD_CMDS
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -19,7 +19,7 @@ QT5DECLARATIVE_REDISTRIBUTE = NO
 endif
 
 define QT5DECLARATIVE_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5DECLARATIVE_BUILD_CMDS
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -21,7 +21,7 @@ QT5GRAPHICALEFFECTS_REDISTRIBUTE = NO
 endif
 
 define QT5GRAPHICALEFFECTS_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5GRAPHICALEFFECTS_BUILD_CMDS
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -19,7 +19,7 @@ QT5IMAGEFORMATS_REDISTRIBUTE = NO
 endif
 
 define QT5IMAGEFORMATS_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5IMAGEFORMATS_BUILD_CMDS
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -25,7 +25,7 @@ QT5MULTIMEDIA_DEPENDENCIES += gst-plugin
 endif
 
 define QT5MULTIMEDIA_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5MULTIMEDIA_BUILD_CMDS
diff --git a/package/qt5/qt5quick1/qt5quick1.mk b/package/qt5/qt5quick1/qt5quick1.mk
--- a/package/qt5/qt5quick1/qt5quick1.mk
+++ b/package/qt5/qt5quick1/qt5quick1.mk
@@ -20,7 +20,7 @@ QT5QUICK1_REDISTRIBUTE = NO
 endif
 
 define QT5QUICK1_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5QUICK1_BUILD_CMDS
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -19,7 +19,7 @@ QT5QUICKCONTROLS_REDISTRIBUTE = NO
 endif
 
 define QT5QUICKCONTROLS_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5QUICKCONTROLS_BUILD_CMDS
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -19,7 +19,7 @@ QT5SCRIPT_REDISTRIBUTE = NO
 endif
 
 define QT5SCRIPT_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5SCRIPT_BUILD_CMDS
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -23,7 +23,7 @@ QT5SENSORS_DEPENDENCIES += qt5declarativ
 endif
 
 define QT5SENSORS_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5SENSORS_BUILD_CMDS
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -19,7 +19,7 @@ QT5SERIALPORT_REDISTRIBUTE = NO
 endif
 
 define QT5SERIALPORT_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5SERIALPORT_BUILD_CMDS
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -20,7 +20,7 @@ QT5SVG_REDISTRIBUTE = NO
 endif
 
 define QT5SVG_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5SVG_BUILD_CMDS
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -19,7 +19,7 @@ QT5X11EXTRAS_REDISTRIBUTE = NO
 endif
 
 define QT5X11EXTRAS_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5X11EXTRAS_BUILD_CMDS
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -19,7 +19,7 @@ QT5XMLPATTERNS_REDISTRIBUTE = NO
 endif
 
 define QT5XMLPATTERNS_CONFIGURE_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
 
 define QT5XMLPATTERNS_BUILD_CMDS
