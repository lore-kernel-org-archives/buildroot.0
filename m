From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jan 2014 15:04:16 +0100
Subject: [Buildroot] [git commit] qt5base: add an option to build and
	install examples
Message-ID: <20140102140425.DA0DE9C361@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=467ea8c2ee1fbcd2be3eb638aabead8a5045ab35
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5base/Config.in  |    7 +++++++
 package/qt5/qt5base/qt5base.mk |   14 +++++++++++++-
 2 files changed, 20 insertions(+), 1 deletions(-)

diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index e932e24..3090d65 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -28,6 +28,13 @@ config BR2_PACKAGE_QT5BASE_LICENSE_APPROVED
 
 	  See also http://qt-project.org/doc/qt-5.0/qtdoc/licensing.html
 
+config BR2_PACKAGE_QT5BASE_EXAMPLES
+	bool "Compile and install examples (with code)"
+	select BR2_PACKAGE_QT5BASE_NETWORK
+	select BR2_PACKAGE_QT5BASE_XML
+	help
+	  If unsure, say N.
+
 config BR2_PACKAGE_QT5BASE_NETWORK
 	bool "network module"
 	help
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index e46bdeb..6928bb8 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -134,6 +134,8 @@ QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBGLIB2),libglib2)
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_ICU),-icu,-no-icu)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_ICU),icu)
 
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_EXAMPLES),-make,-nomake) examples
+
 # Build the list of libraries to be installed on the target
 QT5BASE_INSTALL_LIBS_y                                 += Qt5Core
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_NETWORK)    += Qt5Network
@@ -162,8 +164,9 @@ define QT5BASE_CONFIGURE_CMDS
 		-headerdir /usr/include/qt5 \
 		-sysroot $(STAGING_DIR) \
 		-plugindir /usr/lib/qt/plugins \
+		-examplesdir /usr/lib/qt/examples \
 		-no-rpath \
-		-nomake examples -nomake tests \
+		-nomake tests \
 		-device buildroot \
 		-device-option CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
 		-device-option BUILDROOT_COMPILER_CFLAGS="$(TARGET_CFLAGS)" \
@@ -203,15 +206,24 @@ define QT5BASE_INSTALL_TARGET_FONTS
 	fi
 endef
 
+define QT5BASE_INSTALL_TARGET_EXAMPLES
+	if [ -d $(STAGING_DIR)/usr/lib/qt/examples/ ] ; then \
+		mkdir -p $(TARGET_DIR)/usr/lib/qt/examples ; \
+		cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/* $(TARGET_DIR)/usr/lib/qt/examples ; \
+	fi
+endef
+
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
 define QT5BASE_INSTALL_TARGET_CMDS
 	$(QT5BASE_INSTALL_TARGET_FONTS)
+	$(QT5BASE_INSTALL_TARGET_EXAMPLES)
 endef
 else
 define QT5BASE_INSTALL_TARGET_CMDS
 	$(QT5BASE_INSTALL_TARGET_LIBS)
 	$(QT5BASE_INSTALL_TARGET_PLUGINS)
 	$(QT5BASE_INSTALL_TARGET_FONTS)
+	$(QT5BASE_INSTALL_TARGET_EXAMPLES)
 endef
 endif
 
