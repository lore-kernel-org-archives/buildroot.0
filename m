From: Andreas Naumann <anaumann@ultratronik.de>
Date: Thu, 14 Mar 2019 10:40:23 +0100
Subject: [Buildroot] [PATCH v2 12/13] qt5: Prepare qmake for per-package
 infrastructure
In-Reply-To: <20190314094024.1961-1-anaumann@ultratronik.de>
References: <20190314094024.1961-1-anaumann@ultratronik.de>
Message-ID: <20190314094024.1961-13-anaumann@ultratronik.de>
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
in place, a modified copy is created in the package's build folder. This avoids
headaches when finally merging the per-package host folders.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/python-sip/python-sip.mk                       | 1 +
 package/qt5/qt5.mk                                     | 9 ++++++++-
 package/qt5/qt53d/qt53d.mk                             | 1 +
 package/qt5/qt5canvas3d/qt5canvas3d.mk                 | 1 +
 package/qt5/qt5charts/qt5charts.mk                     | 1 +
 package/qt5/qt5connectivity/qt5connectivity.mk         | 1 +
 package/qt5/qt5declarative/qt5declarative.mk           | 1 +
 package/qt5/qt5enginio/qt5enginio.mk                   | 1 +
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk | 1 +
 package/qt5/qt5imageformats/qt5imageformats.mk         | 1 +
 package/qt5/qt5location/qt5location.mk                 | 1 +
 package/qt5/qt5multimedia/qt5multimedia.mk             | 1 +
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk       | 1 +
 package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk     | 1 +
 package/qt5/qt5script/qt5script.mk                     | 1 +
 package/qt5/qt5scxml/qt5scxml.mk                       | 1 +
 package/qt5/qt5sensors/qt5sensors.mk                   | 1 +
 package/qt5/qt5serialbus/qt5serialbus.mk               | 1 +
 package/qt5/qt5serialport/qt5serialport.mk             | 1 +
 package/qt5/qt5svg/qt5svg.mk                           | 1 +
 package/qt5/qt5tools/qt5tools.mk                       | 1 +
 package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk   | 1 +
 package/qt5/qt5wayland/qt5wayland.mk                   | 1 +
 package/qt5/qt5webchannel/qt5webchannel.mk             | 1 +
 package/qt5/qt5webengine/qt5webengine.mk               | 1 +
 package/qt5/qt5webkit-examples/qt5webkit-examples.mk   | 1 +
 package/qt5/qt5webkit/qt5webkit.mk                     | 1 +
 package/qt5/qt5websockets/qt5websockets.mk             | 1 +
 package/qt5/qt5x11extras/qt5x11extras.mk               | 1 +
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk           | 1 +
 package/qt5cinex/qt5cinex.mk                           | 1 +
 package/qwt/qwt.mk                                     | 1 +
 32 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 3e4f2545e7..98c3c736d4 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -38,6 +38,7 @@ define HOST_PYTHON_SIP_INSTALL_CMDS
 endef
 
 define PYTHON_SIP_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/bin/python configure.py \
 			--bindir $(TARGET_DIR)/usr/bin \
diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
index 772551cae4..15ca188c8c 100644
--- a/package/qt5/qt5.mk
+++ b/package/qt5/qt5.mk
@@ -25,5 +25,12 @@ define QT5_INSTALL_TARGET
 		| rsync -arv --files-from=- $(STAGING_DIR)/usr $(TARGET_DIR)/usr
 endef
 
+# The file "qt.conf" can be used to override the hard-coded paths that are
+# compiled into the Qt library. We need it to make "qmake" relocatable
+define QT5_QTCONF_FIXUP
+        sed -e "s|@@HOST_DIR@@|$(HOST_DIR)|" -e "s|@@STAGING_DIR@@|$(STAGING_DIR)|" \
+                $(QT5BASE_PKGDIR)/qt.conf.in > $(@D)/qt.conf
+endef
+
 # Variable for other Qt applications to use
-QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
+QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++ -qtconf $(@D)/qt.conf
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 53bf3d8e43..83dce14e56 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -18,6 +18,7 @@ QT53D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0
 QT53D_LICENSE_FILES = LICENSE.GPL LICENSE.GPLv3 LICENSE.LGPLv3
 
 define QT53D_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.mk b/package/qt5/qt5canvas3d/qt5canvas3d.mk
index 3ea9afb928..cc84661e55 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.mk
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.mk
@@ -19,6 +19,7 @@ QT5CANVAS3D_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3
 endif
 
 define QT5CANVAS3D_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5/qt5charts/qt5charts.mk b/package/qt5/qt5charts/qt5charts.mk
index cbb92e5f12..9907c4fc1a 100644
--- a/package/qt5/qt5charts/qt5charts.mk
+++ b/package/qt5/qt5charts/qt5charts.mk
@@ -25,6 +25,7 @@ QT5CHARTS_DEPENDENCIES += qt5declarative
 endif
 
 define QT5CHARTS_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5/qt5connectivity/qt5connectivity.mk b/package/qt5/qt5connectivity/qt5connectivity.mk
index 549f2e16fa..d18082903d 100644
--- a/package/qt5/qt5connectivity/qt5connectivity.mk
+++ b/package/qt5/qt5connectivity/qt5connectivity.mk
@@ -27,6 +27,7 @@ QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_BLUEZ5_UTILS),bluez5_utils)
 QT5CONNECTIVITY_DEPENDENCIES += $(if $(BR2_PACKAGE_NEARD),neard)
 
 define QT5CONNECTIVITY_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index 9099ff7cc7..c540fb46c5 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -19,6 +19,7 @@ QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt
 endif
 
 define QT5DECLARATIVE_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5/qt5enginio/qt5enginio.mk b/package/qt5/qt5enginio/qt5enginio.mk
index 968c47e283..7ca1e14650 100644
--- a/package/qt5/qt5enginio/qt5enginio.mk
+++ b/package/qt5/qt5enginio/qt5enginio.mk
@@ -23,6 +23,7 @@ QT5ENGINIO_DEPENDENCIES += qt5declarative
 endif
 
 define QT5ENGINIO_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
index 6fed650248..fcfc581b73 100644
--- a/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
+++ b/package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk
@@ -19,6 +19,7 @@ QT5GRAPHICALEFFECTS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21
 endif
 
 define QT5GRAPHICALEFFECTS_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5/qt5imageformats/qt5imageformats.mk b/package/qt5/qt5imageformats/qt5imageformats.mk
index 6ec9c8eaa1..655bd29c55 100644
--- a/package/qt5/qt5imageformats/qt5imageformats.mk
+++ b/package/qt5/qt5imageformats/qt5imageformats.mk
@@ -19,6 +19,7 @@ QT5IMAGEFORMATS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL
 endif
 
 define QT5IMAGEFORMATS_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5/qt5location/qt5location.mk b/package/qt5/qt5location/qt5location.mk
index 8911ca0b22..03a71202ad 100644
--- a/package/qt5/qt5location/qt5location.mk
+++ b/package/qt5/qt5location/qt5location.mk
@@ -23,6 +23,7 @@ QT5LOCATION_DEPENDENCIES += qt5declarative
 endif
 
 define QT5LOCATION_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 5d92fb9e62..46d6455b77 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -35,6 +35,7 @@ QT5MULTIMEDIA_DEPENDENCIES += alsa-lib
 endif
 
 define QT5MULTIMEDIA_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index 1c152636a9..e114e77678 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -19,6 +19,7 @@ QT5QUICKCONTROLS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICE
 endif
 
 define QT5QUICKCONTROLS_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
index b7e28330a3..c09fdb1aeb 100644
--- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
+++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.mk
@@ -14,6 +14,7 @@ QT5QUICKCONTROLS2_LICENSE = GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
 QT5QUICKCONTROLS2_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 
 define QT5QUICKCONTROLS2_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5/qt5script/qt5script.mk b/package/qt5/qt5script/qt5script.mk
index 698fa75a9f..58f24bdb7b 100644
--- a/package/qt5/qt5script/qt5script.mk
+++ b/package/qt5/qt5script/qt5script.mk
@@ -28,6 +28,7 @@ QT5SCRIPT_LICENSE_FILES += \
 	src/3rdparty/javascriptcore/JavaScriptCore/pcre/COPYING
 
 define QT5SCRIPT_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
index 6f8b85972e..eb2d8857d2 100644
--- a/package/qt5/qt5scxml/qt5scxml.mk
+++ b/package/qt5/qt5scxml/qt5scxml.mk
@@ -17,6 +17,7 @@ QT5SCXML_LICENSE := $(QT5SCXML_LICENSE), BSD-3-Clause (examples)
 endif
 
 define QT5SCXML_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5/qt5sensors/qt5sensors.mk b/package/qt5/qt5sensors/qt5sensors.mk
index 0dd499211d..1f5af1f78f 100644
--- a/package/qt5/qt5sensors/qt5sensors.mk
+++ b/package/qt5/qt5sensors/qt5sensors.mk
@@ -23,6 +23,7 @@ QT5SENSORS_DEPENDENCIES += qt5declarative
 endif
 
 define QT5SENSORS_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
index 7e972e2b47..f3d86cc180 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.mk
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -14,6 +14,7 @@ QT5SERIALBUS_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0, GFDL-1.3 (docs)
 QT5SERIALBUS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
 
 define QT5SERIALBUS_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index b6cfbbefbf..e85b8cca86 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -19,6 +19,7 @@ QT5SERIALPORT_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_E
 endif
 
 define QT5SERIALPORT_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index e9250179dc..3829b33ce7 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -19,6 +19,7 @@ QT5SVG_LICENSE_FILES = LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EXCEPTION.txt LICENSE.
 endif
 
 define QT5SVG_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index 64b4620143..aa20353c82 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -49,6 +49,7 @@ QT5TOOLS_BUILD_DIRS_$(BR2_PACKAGE_QT5TOOLS_QTPLUGININFO) += qtplugininfo
 QT5TOOLS_INSTALL_TARGET_$(BR2_PACKAGE_QT5TOOLS_QTPLUGININFO) += qtplugininfo
 
 define QT5TOOLS_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
index 0970a90d4a..409308b74e 100644
--- a/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
+++ b/package/qt5/qt5virtualkeyboard/qt5virtualkeyboard.mk
@@ -55,6 +55,7 @@ QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+=arrow-key-navigation
 endif
 
 define QT5VIRTUALKEYBOARD_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE) $(QT5VIRTUALKEYBOARD_QMAKEFLAGS))
 endef
 
diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index 854b28c481..a79e649375 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -31,6 +31,7 @@ QT5WAYLAND_QMAKEFLAGS += CONFIG+=wayland-compositor
 endif
 
 define QT5WAYLAND_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE) $(QT5WAYLAND_QMAKEFLAGS))
 endef
 
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index 9abd9a20a5..4ca74db4ff 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -26,6 +26,7 @@ QT5WEBCHANNEL_DEPENDENCIES += qt5declarative
 endif
 
 define QT5WEBCHANNEL_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
index a50f3dae61..0aa4120bf2 100644
--- a/package/qt5/qt5webengine/qt5webengine.mk
+++ b/package/qt5/qt5webengine/qt5webengine.mk
@@ -64,6 +64,7 @@ QT5WEBENGINE_ENV += GN_PKG_CONFIG_HOST=$(@D)/host-bin/host-pkg-config
 endif
 
 define QT5WEBENGINE_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBENGINE_ENV) $(QT5_QMAKE) $(QT5WEBENGINE_QMAKEFLAGS))
 endef
 
diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
index 37e7f28657..146595a1dc 100644
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
@@ -27,6 +27,7 @@ QT5WEBKIT_EXAMPLES_DEPENDENCIES += qt5xmlpatterns
 endif
 
 define QT5WEBKIT_EXAMPLES_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 735aa9f0df..08f3d24496 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -45,6 +45,7 @@ endef
 QT5WEBKIT_PRE_CONFIGURE_HOOKS += QT5WEBKIT_PYTHON2_SYMLINK
 
 define QT5WEBKIT_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(QT5_QMAKE) WEBKIT_CONFIG+=use_system_leveldb)
 endef
 
diff --git a/package/qt5/qt5websockets/qt5websockets.mk b/package/qt5/qt5websockets/qt5websockets.mk
index d418d7c05c..7173742e25 100644
--- a/package/qt5/qt5websockets/qt5websockets.mk
+++ b/package/qt5/qt5websockets/qt5websockets.mk
@@ -26,6 +26,7 @@ QT5WEBSOCKETS_DEPENDENCIES += qt5declarative
 endif
 
 define QT5WEBSOCKETS_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5/qt5x11extras/qt5x11extras.mk b/package/qt5/qt5x11extras/qt5x11extras.mk
index 62ae68a29a..20b1f70816 100644
--- a/package/qt5/qt5x11extras/qt5x11extras.mk
+++ b/package/qt5/qt5x11extras/qt5x11extras.mk
@@ -19,6 +19,7 @@ QT5X11EXTRAS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv21 LGPL_EX
 endif
 
 define QT5X11EXTRAS_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 0677d8a72f..cecf3244ad 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -22,6 +22,7 @@ QT5XMLPATTERNS_LICENSE := $(QT5XMLPATTERNS_LICENSE), BSD-3-Clause (examples)
 endif
 
 define QT5XMLPATTERNS_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE))
 endef
 
diff --git a/package/qt5cinex/qt5cinex.mk b/package/qt5cinex/qt5cinex.mk
index ea8fbb7651..75b1b41665 100644
--- a/package/qt5cinex/qt5cinex.mk
+++ b/package/qt5cinex/qt5cinex.mk
@@ -18,6 +18,7 @@ QT5CINEX_LICENSE = CC-BY-3.0
 QT5CINEX_LICENSE_FILES = README
 
 define QT5CINEX_CONFIGURE_CMDS
+	$(QT5_QTCONF_FIXUP)
 	cd $(@D); $(TARGET_MAKE_ENV) $(QT5_QMAKE)
 endef
 
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
