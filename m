From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed,  8 Nov 2017 19:21:02 +0100
Subject: [Buildroot] [PATCH v2 1/2] qt5 add qmake.conf.in for eglfs
Message-ID: <1510165263-7599-1-git-send-email-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

EGLFS_DEVICE_INTEGRATION = eglfs_* doesn't work correctly with previous patch
EGLFS_DEVICE_INTEGRATION = eglfs_viv/eglfs_* must be written before include(../common/linux_device_post.conf)

Starting from qmake.conf.in, 
generate qmake.conf substituting @EGLFS_DEVICE@ with eglfs_viv or eglfs_mali
according to Package selection

Changes v1 -> v2:

* Moved qmake.conf to qmake.conf.in
* Added @EGLFS_DEVICE@ placeholder into qmake.conf.in
* Modified QT5BASE_CONFIGURE_QMAKE_CONFIG to use sed

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/qt5/qt5base/{qmake.conf => qmake.conf.in} |  2 ++
 package/qt5/qt5base/qt5base.mk                    | 12 +++++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)
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
index b3f9c79..d58a58a 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -243,8 +243,13 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_DBUS) += Qt5DBus
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST)$(BR2_PACKAGE_IMX_GPU_VIV),yy)
 # use vivante backend
 define QT5BASE_CONFIGURE_QMAKE_CONFIG
-	echo "EGLFS_DEVICE_INTEGRATION = eglfs_viv" >> \
-		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
+	sed 's/@EGLFS_DEVICE@/eglfs_viv/g' $(QT5BASE_PKGDIR)/qmake.conf.in > \
+		$(QT5BASE_PKGDIR)/qmake.conf
+endef
+else
+define QT5BASE_CONFIGURE_QMAKE_CONFIG
+	sed '/@EGLFS_DEVICE@/,+1d' $(QT5BASE_PKGDIR)/qmake.conf.in > \
+		$(QT5BASE_PKGDIR)/qmake.conf
 endef
 endif
 
@@ -263,9 +268,10 @@ endef
 endif
 
 define QT5BASE_CONFIGURE_CMDS
+	$(QT5BASE_CONFIGURE_QMAKE_CONFIG)
 	$(INSTALL) -m 0644 -D $(QT5BASE_PKGDIR)/qmake.conf \
 		$(@D)/mkspecs/devices/linux-buildroot-g++/qmake.conf
-	$(QT5BASE_CONFIGURE_QMAKE_CONFIG)
+	$(RM) $(QT5BASE_PKGDIR)/qmake.conf
 	$(INSTALL) -m 0644 -D $(QT5BASE_PKGDIR)/qplatformdefs.h \
 		$(@D)/mkspecs/devices/linux-buildroot-g++/qplatformdefs.h
 	$(QT5BASE_CONFIGURE_CONFIG_FILE)
-- 
2.7.4
