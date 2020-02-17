From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:33 +0100
Subject: [Buildroot] [PATCH v6 11/28] package/qt5webchannel: Convert to
 qmake infra
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200217212350.29750-12-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The install of the javascript is custom and thus needs to be kept.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/qt5webchannel/qt5webchannel.mk | 39 ++--------------------
 1 file changed, 2 insertions(+), 37 deletions(-)

diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index 22523036e7..112d5218ba 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -25,18 +25,6 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
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
 ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 define QT5WEBCHANNEL_INSTALL_TARGET_JAVASCRIPT
 	$(INSTALL) -m 0644 -D $(@D)/examples/webchannel/shared/qwebchannel.js \
@@ -49,29 +37,6 @@ define QT5WEBCHANNEL_INSTALL_TARGET_JAVASCRIPT
 endef
 endif
 
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
+QT5WEBCHANNEL_POST_INSTALL_TARGET_HOOKS += QT5WEBCHANNEL_INSTALL_TARGET_JAVASCRIPT
 
-$(eval $(generic-package))
+$(eval $(qmake-package))
-- 
2.25.0
