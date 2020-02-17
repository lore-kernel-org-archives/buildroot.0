From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:26 +0100
Subject: [Buildroot] [PATCH v6 04/28] package/qt5base: Convert to qmake infra
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200217212350.29750-5-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Convert build, staging and target install to the qmake infra commands.
This removes a lot of conditional code because we solely rely on all install
rules being properly generated according to the configured options.

Of course we keep the configure command/logic as is, because qmake does not
yet exist.

Handling of the custom qt.conf is now done in the post staging hook.

Todo: Check if font install for 5.6 is still working.
Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/qt5base/qt5base.mk | 81 +---------------------------------
 1 file changed, 2 insertions(+), 79 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index c662921b8f..03f984ef8c 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -286,33 +286,6 @@ else
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
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFSDeviceIntegration
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFsKmsSupport
-endif
-ifeq ($(BR2_PACKAGE_GCNANO_BINARIES),y)
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglFsKmsSupport
-endif
-else
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5EglDeviceIntegration
-endif
-
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_GUI)          += Qt5Gui
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_WIDGETS)      += Qt5Widgets
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_PRINTSUPPORT) += Qt5PrintSupport
-
-QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_DBUS) += Qt5DBus
-
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
 # use vivante backend
@@ -379,10 +352,6 @@ define QT5BASE_CONFIGURE_CMDS
 	)
 endef
 
-define QT5BASE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
 # The file "qt.conf" can be used to override the hard-coded paths that are
 # compiled into the Qt library. We need it to make "qmake" relocatable.
 define QT5BASE_INSTALL_QT_CONF
@@ -390,52 +359,6 @@ define QT5BASE_INSTALL_QT_CONF
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
-ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
-define QT5BASE_INSTALL_TARGET_FONTS
-	if [ -d $(STAGING_DIR)/usr/lib/fonts/ ] ; then \
-		mkdir -p $(TARGET_DIR)/usr/lib/fonts ; \
-		cp -dpfr $(STAGING_DIR)/usr/lib/fonts/* $(TARGET_DIR)/usr/lib/fonts ; \
-	fi
-endef
-endif
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
-	$(QT5BASE_INSTALL_TARGET_FONTS)
-	$(QT5BASE_INSTALL_TARGET_EXAMPLES)
-endef
-else
-define QT5BASE_INSTALL_TARGET_CMDS
-	$(QT5BASE_INSTALL_TARGET_LIBS)
-	$(QT5BASE_INSTALL_TARGET_PLUGINS)
-	$(QT5BASE_INSTALL_TARGET_FONTS)
-	$(QT5BASE_INSTALL_TARGET_EXAMPLES)
-endef
-endif
+QT5BASE_POST_INSTALL_STAGING_HOOKS += QT5BASE_INSTALL_QT_CONF
 
-$(eval $(generic-package))
+$(eval $(qmake-package))
-- 
2.25.0
