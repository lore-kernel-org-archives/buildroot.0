From: Andreas Naumann <anaumann@ultratronik.de>
Date: Sat,  9 Mar 2019 15:10:22 +0100
Subject: [Buildroot] [PATCH 2/2] qt5: Prepare qmake for per-package
 infrastructure
In-Reply-To: <20190309141022.13140-1-anaumann@ultratronik.de>
References: <20190309141022.13140-1-anaumann@ultratronik.de>
Message-ID: <20190309141022.13140-3-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qmake configured packages will, by default, use the absolute HostPrefix/Sysroot
pathes set during configuration/building of qt5base for their install
destinations.
For the per-package host/staging infrastructure, this causes non-qt5base
packages to litter the qt5base folders. In addition, buildroots target-install
step subsequently fails because the respective files are missing from the proper
locations of the package itself.

Fortunately, qmake's built-in pathes can be overridden by either placing a
custom qt.conf next to the qmake binary or running qmake with the -qtconf
parameter.
The former variant is already used to facilitate SDK relocation. So for per-
package path manipulation we can reuse the existing qt.conf. But rather than
in place, a modified copy is created in the package's build folder. While this
makes it necessary to change all calls to qmake (for which a variable already
exists), it avoids headaches when finally merging the per-package host folders.

Finally, QT5_QMAKE was extended and is now used consistently, together with the
qt.conf fixup, in all respective packages.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/python-sip/python-sip.mk                       | 3 ++-
 package/qt5/qt5.mk                                     | 9 ++++++++-
 package/qt5/qt53d/qt53d.mk                             | 3 ++-
 package/qt5/qt5canvas3d/qt5canvas3d.mk                 | 3 ++-
 package/qt5/qt5charts/qt5charts.mk                     | 3 ++-
 package/qt5/qt5connectivity/qt5connectivity.mk         | 3 ++-
 package/qt5/qt5declarative/qt5declarative.mk           | 3 ++-
 package/qt5/qt5enginio/qt5enginio.mk                   | 3 ++-
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk | 3 ++-
 package/qt5/qt5imageformats/qt5imageformats.mk         | 3 ++-
 package/qt5/qt5location/qt5location.mk                 | 3 ++-
 package/qt5/qt5multimedia/qt5multimedia.mk             | 3 ++-
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk       | 3 ++-
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk     | 3 ++-
 package/qt5/qt5script/qt5script.mk                     | 3 ++-
 package/qt5/qt5scxml/qt5scxml.mk                       | 3 ++-
 package/qt5/qt5sensors/qt5sensors.mk                   | 3 ++-
 package/qt5/qt5serialbus/qt5serialbus.mk               | 3 ++-
 package/qt5/qt5serialport/qt5serialport.mk             | 3 ++-
 package/qt5/qt5svg/qt5svg.mk                           | 3 ++-
 package/qt5/qt5tools/qt5tools.mk                       | 3 ++-
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk   | 3 ++-
 package/qt5/qt5wayland/qt5wayland.mk                   | 3 ++-
 package/qt5/qt5webchannel/qt5webchannel.mk             | 3 ++-
 package/qt5/qt5webengine/qt5webengine.mk               | 3 ++-
 package/qt5/qt5webkit-examples/qt5webkit-examples.mk   | 3 ++-
 package/qt5/qt5webkit/qt5webkit.mk                     | 3 ++-
 package/qt5/qt5websockets/qt5websockets.mk             | 3 ++-
 package/qt5/qt5x11extras/qt5x11extras.mk               | 3 ++-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk           | 3 ++-
 package/qt5cinex/qt5cinex.mk                           | 3 ++-
 package/qwt/qwt.mk                                     | 1 +
 32 files changed, 69 insertions(+), 31 deletions(-)

diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 69019f5f19..98c3c736d4 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -38,6 +38,7 @@ define HOST_PYTHON_SIP_INSTALL_CMDS
 endef
 
 define PYTHON_SIP_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/bin/python configure.py \
 			--bindir $(TARGET_DIR)/usr/bin \
@@ -46,7 +47,7 @@ define PYTHON_SIP_CONFIGURE_CMDS
 			--sipdir $(TARGET_DIR)/usr/share/sip \
 			--sysroot $(STAGING_DIR)/usr \
 			--use-qmake && \
-		$(HOST_DIR)/bin/qmake)
+		$(QT5_QMAKE))
 endef
 
 define PYTHON_SIP_BUILD_CMDS
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index d8012a913d..e03660a8f9 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -32,5 +32,12 @@ define QT5_LA_PRL_FILES_FIXUP
 	done
 endef
 
+
+define QT5_QTCONF_FIXUP
+	sed -e "s#^HostPrefix.*#HostPrefix=$(HOST_DIR)#g" \
+	    -e "s#^Sysroot.*#Sysroot=$(STAGING_DIR)#g" $(HOST_DIR)/bin/qt.conf \
+	    > $(@D)/qt.conf
+endef
+
 # Variable for other Qt applications to use
-QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
+QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++ -qtconf $(@D)/qt.conf
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 48a931d60b..06db38ba82 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -18,7 +18,8 @@ QT53D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
 QT53D_LICENSE_FILES = LICENSE.GPL LICENSE.GPLv3 LICENSE.LGPLv3
 
 define QT53D_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT53D_BUILD_CMDS
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.mk b/package/qt5/qt5canvas3d/qt5canvas3d.mk
index ef5b373d02..1beec7b310 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.mk
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.mk
@@ -19,7 +19,8 @@ QT5CANVAS3D_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3
 endif
 
 define QT5CANVAS3D_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5CANVAS3D_BUILD_CMDS
diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
index 9e2e6de881..405a4357d1 100644
--- a/package/qt5/qt5charts/qt5charts.mk
+++ b/package/qt5/qt5charts/qt5charts.mk
@@ -25,7 +25,8 @@ QT5CHARTS_DEPENDENCIES += qt5declarative
 endif
 
 define QT5CHARTS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5CHARTS_BUILD_CMDS
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index 6de1536b78..eeca32bc70 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -27,7 +27,8 @@ QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_BLUEZ5_UTILS),bluez5_utils)
 QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_NEARD),neard)
 
 define QT5CONNECTIVITY_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5CONNECTIVITY_BUILD_CMDS
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 2fe72b3be6..20166d8eb6 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -19,7 +19,8 @@ QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt
 endif
 
 define QT5DECLARATIVE_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5DECLARATIVE_BUILD_CMDS
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index 38f309646f..89eb99879b 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -23,7 +23,8 @@ QT5ENGINIO_DEPENDENCIES += qt5declarative
 endif
 
 define QT5ENGINIO_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5ENGINIO_BUILD_CMDS
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index c5011a94f0..a2f0ba6b25 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -19,7 +19,8 @@ QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21
 endif
 
 define QT5GRAPHICALEFFECTS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5GRAPHICALEFFECTS_BUILD_CMDS
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index fa13ebedaf..3d8f33af21 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -19,7 +19,8 @@ QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL
 endif
 
 define QT5IMAGEFORMATS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5IMAGEFORMATS_BUILD_CMDS
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index da0aad7961..7998e72eda 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -23,7 +23,8 @@ QT5LOCATION_DEPENDENCIES += qt5declarative
 endif
 
 define QT5LOCATION_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5LOCATION_BUILD_CMDS
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 27a65ce1ca..10a210e7a6 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -35,7 +35,8 @@ QT5MULTIMEDIA_DEPENDENCIES += alsa-lib
 endif
 
 define QT5MULTIMEDIA_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5MULTIMEDIA_BUILD_CMDS
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index 3e0c5effb3..6add8d2be1 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -19,7 +19,8 @@ QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICE
 endif
 
 define QT5QUICKCONTROLS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5QUICKCONTROLS_BUILD_CMDS
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
index c2004c2ee7..a7dcf0a906 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
@@ -14,7 +14,8 @@ QT5QUICKCONTROLS2_LICENSE = GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
 QT5QUICKCONTROLS2_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 
 define QT5QUICKCONTROLS2_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5QUICKCONTROLS2_BUILD_CMDS
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index 4a292c95a5..65093f45a0 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -28,7 +28,8 @@ QT5SCRIPT_LICENSE_FILES += \
 	src/3rdparty/javascriptcore/JavaScriptCore/pcre/COPYING
 
 define QT5SCRIPT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5SCRIPT_BUILD_CMDS
diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
index de9ece597c..33522a5b01 100644
--- a/package/qt5/qt5scxml/qt5scxml.mk
+++ b/package/qt5/qt5scxml/qt5scxml.mk
@@ -17,7 +17,8 @@ QT5SCXML_LICENSE := $(QT5SCXML_LICENSE), BSD-3-Clause (examples)
 endif
 
 define QT5SCXML_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5SCXML_BUILD_CMDS
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index 2d5cf327a6..74681a6b97 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -23,7 +23,8 @@ QT5SENSORS_DEPENDENCIES += qt5declarative
 endif
 
 define QT5SENSORS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5SENSORS_BUILD_CMDS
diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
index 98c4466cb8..227c19e0b1 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.mk
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -14,7 +14,8 @@ QT5SERIALBUS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
 QT5SERIALBUS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 
 define QT5SERIALBUS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5SERIALBUS_BUILD_CMDS
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 2b0953586b..9d0a6882e6 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -19,7 +19,8 @@ QT5SERIALPORT_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_E
 endif
 
 define QT5SERIALPORT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5SERIALPORT_BUILD_CMDS
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index 48ff04bd75..af6df94830 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -19,7 +19,8 @@ QT5SVG_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.
 endif
 
 define QT5SVG_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5SVG_BUILD_CMDS
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index a972756d3a..aa20353c82 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -49,7 +49,8 @@ QT5TOOLS_BUILD_DIRS_$(BR2_PACKAGE_QT5TOOLS_QTPLUGININFO) += qtplugininfo
 QT5TOOLS_INSTALL_TARGET_$(BR2_PACKAGE_QT5TOOLS_QTPLUGININFO) += qtplugininfo
 
 define QT5TOOLS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5TOOLS_BUILD_CMDS
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index 8ce3169774..41d21a5ffd 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -64,7 +64,8 @@ endef
 endif
 
 define QT5VIRTUALKEYBOARD_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake $(QT5VIRTUALKEYBOARD_QMAKEFLAGS))
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE) $(QT5VIRTUALKEYBOARD_QMAKEFLAGS))
 endef
 
 define QT5VIRTUALKEYBOARD_BUILD_CMDS
diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index d6fb6e1888..9a5ee240f1 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -31,7 +31,8 @@ QT5WAYLAND_QMAKEFLAGS += CONFIG+=wayland-compositor
 endif
 
 define QT5WAYLAND_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake $(QT5WAYLAND_QMAKEFLAGS))
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE) $(QT5WAYLAND_QMAKEFLAGS))
 endef
 
 define QT5WAYLAND_BUILD_CMDS
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index f1c08532c0..91967acfbd 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -26,7 +26,8 @@ QT5WEBCHANNEL_DEPENDENCIES += qt5declarative
 endif
 
 define QT5WEBCHANNEL_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5WEBCHANNEL_BUILD_CMDS
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index a3cfcec26e..4d251d9eb7 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -64,7 +64,8 @@ QT5WEBENGINE_ENV += GN_PKG_CONFIG_HOST=$(@D)/host-bin/host-pkg-config
 endif
 
 define QT5WEBENGINE_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(HOST_DIR)/bin/qmake $(QT5WEBENGINE_QMAKEFLAGS))
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(QT5_QMAKE) $(QT5WEBENGINE_QMAKEFLAGS))
 endef
 
 define QT5WEBENGINE_BUILD_CMDS
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
index 94153fd652..61d27adf93 100644
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
@@ -27,7 +27,8 @@ QT5WEBKIT_EXAMPLES_DEPENDENCIES += qt5xmlpatterns
 endif
 
 define QT5WEBKIT_EXAMPLES_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5WEBKIT_EXAMPLES_BUILD_CMDS
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index a0a0998d12..9b1b11e68a 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -45,7 +45,8 @@ endef
 QT5WEBKIT_PRE_CONFIGURE_HOOKS += QT5WEBKIT_PYTHON2_SYMLINK
 
 define QT5WEBKIT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(HOST_DIR)/bin/qmake WEBKIT_CONFIG+=use_system_leveldb)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(QT5_QMAKE) WEBKIT_CONFIG+=use_system_leveldb)
 endef
 
 define QT5WEBKIT_BUILD_CMDS
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index c67db198db..87ce570fde 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -26,7 +26,8 @@ QT5WEBSOCKETS_DEPENDENCIES += qt5declarative
 endif
 
 define QT5WEBSOCKETS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5WEBSOCKETS_BUILD_CMDS
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index 9d54c11061..b7932ae152 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -19,7 +19,8 @@ QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EX
 endif
 
 define QT5X11EXTRAS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5X11EXTRAS_BUILD_CMDS
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 0a8b47ac53..ddc0911b75 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -22,7 +22,8 @@ QT5XMLPATTERNS_LICENSE := $(QT5XMLPATTERNS_LICENSE), BSD-3-Clause (examples)
 endif
 
 define QT5XMLPATTERNS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
+	$(QT5_QTCONF_FIXUP)
+	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
 define QT5XMLPATTERNS_BUILD_CMDS
diff --git a/package/qt5cinex/qt5cinex.mk b/package/qt5cinex/qt5cinex.mk
index 89c38ee3f5..75b1b41665 100644
--- a/package/qt5cinex/qt5cinex.mk
+++ b/package/qt5cinex/qt5cinex.mk
@@ -18,7 +18,8 @@ QT5CINEX_LICENSE = CC-BY-3.0
 QT5CINEX_LICENSE_FILES = README
 
 define QT5CINEX_CONFIGURE_CMDS
-	cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake
+	$(QT5_QTCONF_FIXUP)
+	cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE)
 endef
 
 define QT5CINEX_BUILD_CMDS
diff --git a/package/qwt/qwt.mk b/package/qwt/qwt.mk
index f381ebbb7a..985de13d3d 100644
--- a/package/qwt/qwt.mk
+++ b/package/qwt/qwt.mk
@@ -43,6 +43,7 @@ endif
 
 define QWT_CONFIGURE_CMDS
 	$(SED) $(QWT_CONFIG) $(@D)/qwtconfig.pri
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
-- 
2.21.0
