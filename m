From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 22:42:54 +0200
Subject: [Buildroot] [git commit] qt5serialbus: new package
Message-ID: <20160418204323.3C8668184F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a9a9d15e670b0ab93da06e036384514ac69b642
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Julien Corjon <corjon.j@ecagroup.com>
[Thomas: better handling for !shared case.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/Config.in                      |  1 +
 package/qt5/qt5serialbus/Config.in         | 11 +++++++
 package/qt5/qt5serialbus/qt5serialbus.hash |  2 ++
 package/qt5/qt5serialbus/qt5serialbus.mk   | 50 ++++++++++++++++++++++++++++++
 4 files changed, 64 insertions(+)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 04228c8..d99d551 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -42,6 +42,7 @@ source "package/qt5/qt5location/Config.in"
 source "package/qt5/qt5multimedia/Config.in"
 source "package/qt5/qt5quickcontrols/Config.in"
 source "package/qt5/qt5sensors/Config.in"
+source "package/qt5/qt5serialbus/Config.in"
 source "package/qt5/qt5serialport/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5tools/Config.in"
diff --git a/package/qt5/qt5serialbus/Config.in b/package/qt5/qt5serialbus/Config.in
new file mode 100644
index 0000000..504141c
--- /dev/null
+++ b/package/qt5/qt5serialbus/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_QT5SERIALBUS
+	bool "qt5serialbus"
+	select BR2_PACKAGE_QT5BASE
+	select BR2_PACKAGE_QT5SERIALPORT
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt5serialbus module.
+
+	  http://qt.io
diff --git a/package/qt5/qt5serialbus/qt5serialbus.hash b/package/qt5/qt5serialbus/qt5serialbus.hash
new file mode 100644
index 0000000..da46e76
--- /dev/null
+++ b/package/qt5/qt5serialbus/qt5serialbus.hash
@@ -0,0 +1,2 @@
+# Hash from: http://download.qt.io/official_releases/qt/5.6/5.6.0/submodules/qtserialbus-opensource-src-5.6.0.tar.xz.mirrorlist
+sha256 8cca530ee53f19672f57ffee6f2f28866d5c84b8cb3dbbd67c05d27893ac0b8e qtserialbus-opensource-src-5.6.0.tar.xz
diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
new file mode 100644
index 0000000..b188f5d
--- /dev/null
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -0,0 +1,50 @@
+################################################################################
+#
+# qt5serialbus
+#
+################################################################################
+
+QT5SERIALBUS_VERSION = $(QT5_VERSION)
+QT5SERIALBUS_SITE = $(QT5_SITE)
+QT5SERIALBUS_SOURCE = qtserialbus-opensource-src-$(QT5SERIALBUS_VERSION).tar.xz
+QT5SERIALBUS_DEPENDENCIES = qt5base qt5serialport
+QT5SERIALBUS_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
+QT5SERIALBUS_LICENSE = GPLv2 or GPLv3 or LGPLv3, GFDLv1.3 (docs)
+QT5SERIALBUS_LICENSE_FILES = LICENSE.GPLv2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
+else
+QT5SERIALBUS_LICENSE = Commercial license
+QT5SERIALBUS_REDISTRIBUTE = NO
+endif
+
+define QT5SERIALBUS_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
+endef
+
+define QT5SERIALBUS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define QT5SERIALBUS_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
+	$(QT5_LA_PRL_FILES_FIXUP)
+endef
+
+ifeq ($(BR2_STATIC_LIBS),)
+define QT5SERIALBUS_INSTALL_TARGET_LIBS
+	cp -dpf $(STAGING_DIR)/usr/lib/libQt5SerialBus.so.* \
+		$(TARGET_DIR)/usr/lib
+	mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins/canbus
+	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/canbus/*.so \
+		$(TARGET_DIR)/usr/lib/qt/plugins/canbus
+endef
+endif
+
+define QT5SERIALBUS_INSTALL_TARGET_CMDS
+	$(QT5SERIALBUS_INSTALL_TARGET_LIBS)
+	$(INSTALL) -m 0755 -D $(@D)/bin/canbusutil \
+		$(TARGET_DIR)/usr/bin/canbusutil
+endef
+
+$(eval $(generic-package))
