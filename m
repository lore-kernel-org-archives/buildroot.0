From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Mar 2020 22:56:52 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5webkit-examples: convert to
 qmake infrastructure
Message-ID: <20200311214417.DC319909FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6d7d95522398f6184f355128b660ba91f032192
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Straightforward conversion. Only conditional dependencies have to
remain.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../qt5/qt5webkit-examples/qt5webkit-examples.mk   | 25 ++--------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
index 6dab61d913..84bc291739 100644
--- a/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
+++ b/package/qt5/qt5webkit-examples/qt5webkit-examples.mk
@@ -7,7 +7,7 @@
 QT5WEBKIT_EXAMPLES_VERSION = 5.9.1
 QT5WEBKIT_EXAMPLES_SITE = https://download.qt.io/official_releases/qt/5.9/5.9.1/submodules
 QT5WEBKIT_EXAMPLES_SOURCE = qtwebkit-examples-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
-QT5WEBKIT_EXAMPLES_DEPENDENCIES = qt5base qt5webkit
+QT5WEBKIT_EXAMPLES_DEPENDENCIES = qt5webkit
 
 QT5WEBKIT_EXAMPLES_LICENSE_FILES = LICENSE.LGPLv21 LICENSE.LGPLv3 LICENSE.GPLv2 LICENSE.GPLv3
 
@@ -19,29 +19,8 @@ ifeq ($(BR2_PACKAGE_QT5XMLPATTERNS),y)
 QT5WEBKIT_EXAMPLES_DEPENDENCIES += qt5xmlpatterns
 endif
 
-define QT5WEBKIT_EXAMPLES_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
-define QT5WEBKIT_EXAMPLES_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define QT5WEBKIT_EXAMPLES_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
-endef
-
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5WEBKIT_EXAMPLES_DEPENDENCIES += qt5declarative
-define QT5WEBKIT_EXAMPLES_INSTALL_QML
-	cp -dpfr $(@D)/examples/webkitqml $(TARGET_DIR)/usr/lib/qt/examples
-endef
 endif
 
-define QT5WEBKIT_EXAMPLES_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/lib/qt/examples
-	cp -dpfr $(@D)/examples/webkitwidgets $(TARGET_DIR)/usr/lib/qt/examples
-	$(QT5WEBKIT_EXAMPLES_INSTALL_QML)
-endef
-
-$(eval $(generic-package))
+$(eval $(qmake-package))
