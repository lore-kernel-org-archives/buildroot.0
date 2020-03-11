From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Mar 2020 22:52:54 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5webchannel: convert to
 qmake infrastructure
Message-ID: <20200311214017.07AA2909F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3256862ae6342dc3d71af1ad7669bd5d1d145fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The installation of the Javascript code is custom and thus needs to be
kept.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5webchannel/qt5webchannel.mk | 42 +++---------------------------
 1 file changed, 3 insertions(+), 39 deletions(-)

diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index 0f1b3bafbf..176c0fd7a3 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -7,7 +7,7 @@
 QT5WEBCHANNEL_VERSION = $(QT5_VERSION)
 QT5WEBCHANNEL_SITE = $(QT5_SITE)
 QT5WEBCHANNEL_SOURCE = qtwebchannel-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5WEBCHANNEL_VERSION).tar.xz
-QT5WEBCHANNEL_DEPENDENCIES = qt5base qt5websockets
+QT5WEBCHANNEL_DEPENDENCIES = qt5websockets
 QT5WEBCHANNEL_INSTALL_STAGING = YES
 QT5WEBCHANNEL_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
 QT5WEBCHANNEL_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
@@ -20,46 +20,10 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5WEBCHANNEL_DEPENDENCIES += qt5declarative
 endif
 
-define QT5WEBCHANNEL_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5WEBCHANNEL_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5WEBCHANNEL_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
 define QT5WEBCHANNEL_INSTALL_TARGET_JAVASCRIPT
 	$(INSTALL) -m 0644 -D $(@D)/examples/webchannel/shared/qwebchannel.js \
 		$(TARGET_DIR)/var/www/qwebchannel.js
 endef
+QT5WEBCHANNEL_POST_INSTALL_TARGET_HOOKS += QT5WEBCHANNEL_INSTALL_TARGET_JAVASCRIPT
 
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
-define QT5WEBCHANNEL_INSTALL_TARGET_QMLS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebChannel $(TARGET_DIR)/usr/qml/
-endef
-endif
-
-ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
-define QT5WEBCHANNEL_INSTALL_TARGET_EXAMPLES
-	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/webchannel $(TARGET_DIR)/usr/lib/qt/examples/
-endef
-endif
-
-ifneq ($(BR2_STATIC_LIBS),y)
-define QT5WEBCHANNEL_INSTALL_TARGET_LIBS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebChannel.so.* $(TARGET_DIR)/usr/lib
-endef
-endif
-
-define QT5WEBCHANNEL_INSTALL_TARGET_CMDS
-	$(QT5WEBCHANNEL_INSTALL_TARGET_LIBS)
-	$(QT5WEBCHANNEL_INSTALL_TARGET_QMLS)
-	$(QT5WEBCHANNEL_INSTALL_TARGET_JAVASCRIPT)
-	$(QT5WEBCHANNEL_INSTALL_TARGET_EXAMPLES)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
