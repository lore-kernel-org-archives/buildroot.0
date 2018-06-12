From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Tue, 12 Jun 2018 08:32:03 -0400
Subject: [Buildroot] [PATCH 6/9] qt5svg: install examples to target
In-Reply-To: <20180612123206.31523-1-gael.portay@savoirfairelinux.com>
References: <20180612123206.31523-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180612123206.31523-7-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_PACKAGE_QT5BASE_EXAMPLES is set, the examples for this module
are installed in the staging directory but they are not shipped to the
target.

This commit copies the examples `svg' from the staging directory to
the target.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
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
-- 
2.17.1
