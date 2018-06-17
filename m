From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 14:35:12 +0200
Subject: [Buildroot] [git commit] qt5svg: install examples to target
Message-ID: <20180617123958.920E6888A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7892aacc881cfc41226866f31294d6ac27c38ca2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_PACKAGE_QT5BASE_EXAMPLES is set, the examples for this module
are installed in the staging directory but they are not shipped to the
target.

This commit copies the examples `svg' from the staging directory to
the target.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5svg/qt5svg.mk | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5svg/qt5svg.mk b/package/qt5/qt5svg/qt5svg.mk
index 168c4c063f..48ff04bd75 100644
--- a/package/qt5/qt5svg/qt5svg.mk
+++ b/package/qt5/qt5svg/qt5svg.mk
@@ -37,12 +37,23 @@ define QT5SVG_INSTALL_ICONENGINES
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5SVG_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/svg $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
 ifeq ($(BR2_STATIC_LIBS),)
-define QT5SVG_INSTALL_TARGET_CMDS
+define QT5SVG_INSTALL_TARGET_LIBS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Svg*.so.* $(TARGET_DIR)/usr/lib
 	cp -dpf $(STAGING_DIR)/usr/lib/qt/plugins/imageformats/libqsvg.so $(TARGET_DIR)/usr/lib/qt/plugins/imageformats/
 	$(QT5SVG_INSTALL_ICONENGINES)
 endef
 endif
 
+define QT5SVG_INSTALL_TARGET_CMDS
+	$(QT5SVG_INSTALL_TARGET_LIBS)
+	$(QT5SVG_INSTALL_TARGET_EXAMPLES)
+endef
+
 $(eval $(generic-package))
