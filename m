From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 13 Nov 2017 19:41:54 +0100
Subject: [Buildroot] [PATCH v3 1/2] qt5base: correct eglfs support in
 qmake.conf.in
Message-ID: <1510598515-29485-1-git-send-email-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5base: correct eglfs support in qmake.conf.in

Setting EGLFS_DEVICE_INTEGRATION at the end of qmake.conf like is done by commit
0c219ddb8a doesn't work correctly: it has to be set before the
include(../common/linux_device_post.conf)

Instead of appending to the file, change it into a qmake.conf.in template file
that contains an EGLFS_DEVICE_INTEGRATION assignment and update it with sed.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
Changes v1 -> v2:
* write directly to package target qmake.conf
* simplified eglfs backend choice
 package/qt5/qt5base/{qmake.conf => qmake.conf.in} |  2 ++
 package/qt5/qt5base/qt5base.mk                    | 22 +++++++++++++++++-----
 2 files changed, 19 insertions(+), 5 deletions(-)
 rename package/qt5/qt5base/{qmake.conf => qmake.conf.in} (95%)

diff --git a/package/qt5/qt5base/qmake.conf b/package/qt5/qt5base/qmake.conf.in
similarity index 95%
rename from package/qt5/qt5base/qmake.conf
rename to package/qt5/qt5base/qmake.conf.in
index 8b6debe..fb698b9 100644
--- a/package/qt5/qt5base/qmake.conf
+++ b/package/qt5/qt5base/qmake.conf.in
@@ -24,5 +24,7 @@ QMAKE_CFLAGS_ISYSTEM   =
 # Architecturespecific configuration
 include(arch.conf)
 
+EGLFS_DEVICE_INTEGRATION = @EGLFS_DEVICE@
+
 include(../common/linux_device_post.conf)
 load(qt_config)
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index b3f9c79..ef99131 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -240,10 +240,23 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_PRINTSUPPORT) += Qt5PrintSupport
 
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_DBUS) += Qt5DBus
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST)$(BR2_PACKAGE_IMX_GPU_VIV),yy)
-# use vivante backend
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
+QT5BASE_EGLFS_DEVICE = eglfs_viv
+else ifeq ($(BR2_PACKAGE_SUNXI_MALI),y)
+QT5BASE_EGLFS_DEVICE = eglfs_mali
+endif
+endif
+
+ifeq ($(QT5BASE_EGLFS_DEVICE),)
 define QT5BASE_CONFIGURE_QMAKE_CONFIG
-	echo "EGLFS_DEVICE_INTEGRATION = eglfs_viv" >> \
+	sed '/@EGLFS_DEVICE@/,+1d' $(QT5BASE_PKGDIR)/qmake.conf.in > \
+		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
+endef
+else
+define QT5BASE_CONFIGURE_QMAKE_CONFIG
+	sed 's/@EGLFS_DEVICE@/$(QT5BASE_EGLFS_DEVICE)/g' \
+		$(QT5BASE_PKGDIR)/qmake.conf.in > \
 		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
 endef
 endif
@@ -263,8 +276,7 @@ endef
 endif
 
 define QT5BASE_CONFIGURE_CMDS
-	$(INSTALL) -m 0644 -D $(QT5BASE_PKGDIR)/qmake.conf \
-		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
+	mkdir -p $(@D)/mkspecs/devices/linux-buildroot-g++/
 	$(QT5BASE_CONFIGURE_QMAKE_CONFIG)
 	$(INSTALL) -m 0644 -D $(QT5BASE_PKGDIR)/qplatformdefs.h \
 		$(@D)/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
-- 
2.7.4
