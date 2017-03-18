From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 15:04:06 +0100
Subject: [Buildroot] [git commit] qt5declarative: build and install examples
Message-ID: <20170318140411.586F48229D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c997282bd55dab162a45a372ed203f97707fae7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch builds and installs Qt examples for declarative module.

It proceeds the same way as others Qt5 modules. Samples are installed
under /usr/lib/qt/examples/qml directory (/usr/lib/qt/examples/quick for
quick).

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5declarative/qt5declarative.mk | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index fb546bd..d5b298c 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -28,14 +28,11 @@ define QT5DECLARATIVE_CONFIGURE_CMDS
 endef
 
 define QT5DECLARATIVE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		sub-src-all sub-tools-all
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define QT5DECLARATIVE_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		sub-src-install_subtargets \
-		sub-tools-install_subtargets
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
@@ -45,6 +42,9 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
 define QT5DECLARATIVE_INSTALL_TARGET_QUICK_LIBS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Quick*.so.* $(TARGET_DIR)/usr/lib
 endef
+define QT5DECLARATIVE_INSTALL_TARGET_QUICK_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/quick/ $(TARGET_DIR)/usr/lib/qt/examples/
+endef
 endif
 
 define QT5DECLARATIVE_INSTALL_TARGET_LIBS
@@ -55,9 +55,17 @@ endef
 
 endif
 
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5DECLARATIVE_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/qml* $(TARGET_DIR)/usr/lib/qt/examples/
+	$(QT5DECLARATIVE_INSTALL_TARGET_QUICK_EXAMPLES)
+endef
+endif
+
 define QT5DECLARATIVE_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/bin/qml* $(TARGET_DIR)/usr/bin
 	cp -dpfr $(STAGING_DIR)/usr/qml $(TARGET_DIR)/usr
+	$(QT5DECLARATIVE_INSTALL_TARGET_EXAMPLES)
 	$(QT5DECLARATIVE_INSTALL_TARGET_LIBS)
 endef
 
