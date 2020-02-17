From: Andreas Naumann <anaumann@ultratronik.de>
Date: Mon, 17 Feb 2020 22:23:34 +0100
Subject: [Buildroot] [PATCH v6 12/28] package/qt5webkit: Convert to qmake
 infra
In-Reply-To: <20200217212350.29750-1-anaumann@ultratronik.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
Message-ID: <20200217212350.29750-13-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mostly straightforward conversion.
The jsc binary was not installed automatically. Unsure of its significance
the custom install command is kept in a hook.

Note:
The generic install creates QtWebProcess in /usr/libexec/ instead of /usr/bin.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/qt5/qt5webkit/qt5webkit.mk | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 25c5495482..f20fa24b9c 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -37,35 +37,20 @@ endif
 # QtWebkit's build system uses python, but only supports python2. We work
 # around this by forcing python2 early in the PATH, via a python->python2
 # symlink.
-QT5WEBKIT_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
+QT5WEBKIT_CONF_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
+QT5WEBKIT_MAKE_ENV = PATH=$(@D)/host-bin:$(BR_PATH)
 define QT5WEBKIT_PYTHON2_SYMLINK
 	mkdir -p $(@D)/host-bin
 	ln -sf $(HOST_DIR)/bin/python2 $(@D)/host-bin/python
 endef
 QT5WEBKIT_PRE_CONFIGURE_HOOKS += QT5WEBKIT_PYTHON2_SYMLINK
 
-define QT5WEBKIT_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(HOST_DIR)/bin/qmake WEBKIT_CONFIG+=use_system_leveldb)
-endef
-
-define QT5WEBKIT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5WEBKIT_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(QT5WEBKIT_ENV) $(MAKE) -C $(@D) install
-endef
+QT5WEBKIT_CONF_OPTS = WEBKIT_CONFIG+=use_system_leveldb
 
-ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
-define QT5WEBKIT_INSTALL_TARGET_QMLS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebKit $(TARGET_DIR)/usr/qml/
-endef
-endif
-
-define QT5WEBKIT_INSTALL_TARGET_CMDS
-	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebKit*.so.* $(TARGET_DIR)/usr/lib
+define QT5WEBKIT_INSTALL_TARGET_EXTRAS
 	cp -dpf $(@D)/bin/* $(TARGET_DIR)/usr/bin/
-	$(QT5WEBKIT_INSTALL_TARGET_QMLS)
 endef
 
-$(eval $(generic-package))
+QT5WEBKIT_POST_INSTALL_TARGET_HOOKS += QT5WEBKIT_INSTALL_TARGET_EXTRAS
+
+$(eval $(qmake-package))
-- 
2.25.0
