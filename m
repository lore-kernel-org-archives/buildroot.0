From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Mar 2020 22:36:36 +0100
Subject: [Buildroot] [git commit] package/qt5/qt5tools: partially convert to
 qmake infra
Message-ID: <20200311213449.4B7CF909E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c1e9c60288e303672f643a516bc6b9f24bdbcc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use generic configure command but for now keep custom build and
install logic, as we only build some parts of qt5tools depending on
the selected sub-options.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5tools/qt5tools.mk | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/qt5/qt5tools/qt5tools.mk b/package/qt5/qt5tools/qt5tools.mk
index 401b57a211..0543afd8f7 100644
--- a/package/qt5/qt5tools/qt5tools.mk
+++ b/package/qt5/qt5tools/qt5tools.mk
@@ -8,7 +8,6 @@ QT5TOOLS_VERSION = $(QT5_VERSION)
 QT5TOOLS_SITE = $(QT5_SITE)
 QT5TOOLS_SOURCE = qttools-$(QT5_SOURCE_TARBALL_PREFIX)-$(QT5TOOLS_VERSION).tar.xz
 
-QT5TOOLS_DEPENDENCIES = qt5base
 QT5TOOLS_INSTALL_STAGING = YES
 
 # linguist tools compile conditionally on qtHaveModule(qmldevtools-private),
@@ -45,10 +44,6 @@ QT5TOOLS_INSTALL_TARGET_$(BR2_PACKAGE_QT5TOOLS_QTPATHS) += qtpaths
 QT5TOOLS_BUILD_DIRS_$(BR2_PACKAGE_QT5TOOLS_QTPLUGININFO) += qtplugininfo
 QT5TOOLS_INSTALL_TARGET_$(BR2_PACKAGE_QT5TOOLS_QTPLUGININFO) += qtplugininfo
 
-define QT5TOOLS_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake)
-endef
-
 define QT5TOOLS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) sub-src-qmake_all
 	$(foreach p,$(QT5TOOLS_BUILD_DIRS_y), \
@@ -66,4 +61,4 @@ define QT5TOOLS_INSTALL_TARGET_CMDS
 		$(INSTALL) -D -m0755 $(@D)/bin/$(p) $(TARGET_DIR)/usr/bin/$(p)$(sep))
 endef
 
-$(eval $(generic-package))
+$(eval $(qmake-package))
