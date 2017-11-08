From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed,  8 Nov 2017 12:30:34 +0100
Subject: [Buildroot] [PATCH 1/2] qt5 add qmake.conf.in for eglfs
Message-ID: <1510140635-80618-1-git-send-email-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

EGLFS_DEVICE_INTEGRATION = eglfs_* doesn't work correctly with previous patch
EGLFS_DEVICE_INTEGRATION = eglfs_viv/eglfs_* must be written before include(../common/linux_device_post.conf)

On first patch, I've moved qmake.conf to qmake.conf.in suggested by Arnout,
tagging EGLFS_DEVICE_INTEGRATION = @EGLFS_DEVICE at .
Then with sed I substitute @EGLFS_DEVICE@ if any eglfs_* are possible,
otherwise I delete that line and the subsequent too.

On second patch, I add support for sunxi-mali and upcoming sunxi-mali-mainline.
In this way they behave the same way of vivante.

Hope I've done everything correctly.
I've had to used sed without $(SED) because of its argument,
to redirect to qmake.conf instead of changing qmake.conf.in.

After copied to qt5base build directory,
I remove qmake.conf to avoid problem with git.

Thanks in advance for any response.

Kind regard to everyone

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
