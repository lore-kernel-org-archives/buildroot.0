From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Mar 2020 22:56:10 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5webkit: convert to qmake
 infrastructure
Message-ID: <20200311214335.D9722909F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0ffa54e19ee07502d9001d8cfac4578fe0c435b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The conversion is mostly straightforward. The jsc binary was not
installed by the qt5webkit build system, so we're keeping some custom
hook to install it.

It's worth mentioning that the package build system installs
QtWebProcess in /usr/libexec/ instead of /usr/bin.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5webkit/qt5webkit.mk | 31 ++++++++-----------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index c6441b5bdd..dd99661be0 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -9,7 +9,7 @@ QT5WEBKIT_SITE = https://download.qt.io/official_releases/qt/5.9/5.9.1/submodule
 QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
 QT5WEBKIT_DEPENDENCIES = \
 	host-bison host-flex host-gperf host-python host-ruby \
-	leveldb qt5base sqlite
+	leveldb sqlite
 QT5WEBKIT_INSTALL_STAGING = YES
 
 QT5WEBKIT_LICENSE_FILES = Source/WebCore/LICENSE-LGPL-2 Source/WebCore/LICENSE-LGPL-2.1
@@ -30,35 +30,20 @@ endif
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
