From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Mar 2020 23:17:11 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5base: convert to qmake
 infrastructure
Message-ID: <20200309221528.3253E9034D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=469829d9c55b7f5461e29f3f6436417836504410
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Convert build, staging and target install to the qmake infra commands.
This removes a lot of conditional code because we solely rely on all install
rules being properly generated according to the configured options.

Of course we keep the configure command/logic as is, because qmake does not
yet exist.

Handling of the custom qt.conf is now done in the post staging hook.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/qt5base.mk | 66 ++----------------------------------------
 1 file changed, 2 insertions(+), 64 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index c392c06627..97315496b9 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -240,29 +240,6 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-journald
 endif
 
-# Build the list of libraries to be installed on the target
-QT5BASE_INSTALL_LIBS_y                                 += Qt5Core
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XCB)        += Qt5XcbQpa
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_NETWORK)    += Qt5Network
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_CONCURRENT) += Qt5Concurrent
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_SQL)        += Qt5Sql
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_TEST)       += Qt5Test
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XML)        += Qt5Xml
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_OPENGL_LIB) += Qt5OpenGL
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFSDeviceIntegration
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFsKmsSupport
-endif
-ifeq ($(BR2_PACKAGE_GCNANO_BINARIES),y)
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFsKmsSupport
-endif
-
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_GUI)          += Qt5Gui
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_WIDGETS)      += Qt5Widgets
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_PRINTSUPPORT) += Qt5PrintSupport
-
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_DBUS) += Qt5DBus
-
 ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
 # use vivante backend
 QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_viv
@@ -327,10 +304,6 @@ define QT5BASE_CONFIGURE_CMDS
 	)
 endef
 
-define QT5BASE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
 # The file "qt.conf" can be used to override the hard-coded paths that are
 # compiled into the Qt library. We need it to make "qmake" relocatable.
 define QT5BASE_INSTALL_QT_CONF
@@ -338,41 +311,6 @@ define QT5BASE_INSTALL_QT_CONF
 		$(QT5BASE_PKGDIR)/qt.conf.in > $(HOST_DIR)/bin/qt.conf
 endef
 
-define QT5BASE_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-	$(QT5BASE_INSTALL_QT_CONF)
-endef
-
-define QT5BASE_INSTALL_TARGET_LIBS
-	for lib in $(QT5BASE_INSTALL_LIBS_y); do \
-		cp -dpf $(STAGING_DIR)/usr/lib/lib$${lib}.so.* $(TARGET_DIR)/usr/lib || exit 1 ; \
-	done
-endef
-
-define QT5BASE_INSTALL_TARGET_PLUGINS
-	if [ -d $(STAGING_DIR)/usr/lib/qt/plugins/ ] ; then \
-		mkdir -p $(TARGET_DIR)/usr/lib/qt/plugins ; \
-		cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins ; \
-	fi
-endef
-
-define QT5BASE_INSTALL_TARGET_EXAMPLES
-	if [ -d $(STAGING_DIR)/usr/lib/qt/examples/ ] ; then \
-		mkdir -p $(TARGET_DIR)/usr/lib/qt/examples ; \
-		cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/* $(TARGET_DIR)/usr/lib/qt/examples ; \
-	fi
-endef
-
-ifeq ($(BR2_STATIC_LIBS),y)
-define QT5BASE_INSTALL_TARGET_CMDS
-	$(QT5BASE_INSTALL_TARGET_EXAMPLES)
-endef
-else
-define QT5BASE_INSTALL_TARGET_CMDS
-	$(QT5BASE_INSTALL_TARGET_LIBS)
-	$(QT5BASE_INSTALL_TARGET_PLUGINS)
-	$(QT5BASE_INSTALL_TARGET_EXAMPLES)
-endef
-endif
+QT5BASE_POST_INSTALL_STAGING_HOOKS += QT5BASE_INSTALL_QT_CONF
 
-$(eval $(generic-package))
+$(eval $(qmake-package))
