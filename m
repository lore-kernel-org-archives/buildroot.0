From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 14:35:03 +0200
Subject: [Buildroot] [git commit] qt5canvas3d: install examples to target
Message-ID: <20180617123958.605D5888A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e21ee71a8eca328b9e54bfc1023c0ce487ba5ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_PACKAGE_QT5BASE_EXAMPLES is set, the examples for this module
are installed in the staging directory but they are not shipped to the
target.

This commit copies the examples `canvas3d' from the staging directory to
the target.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5canvas3d/qt5canvas3d.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt5/qt5canvas3d/qt5canvas3d.mk b/package/qt5/qt5canvas3d/qt5canvas3d.mk
index 13e233f237..3cdf59a157 100644
--- a/package/qt5/qt5canvas3d/qt5canvas3d.mk
+++ b/package/qt5/qt5canvas3d/qt5canvas3d.mk
@@ -26,8 +26,15 @@ define QT5CANVAS3D_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5CANVAS3D_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/canvas3d $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
 define QT5CANVAS3D_INSTALL_TARGET_CMDS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtCanvas3D $(TARGET_DIR)/usr/qml/
+	$(QT5CANVAS3D_INSTALL_TARGET_EXAMPLES)
 endef
 
 $(eval $(generic-package))
