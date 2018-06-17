From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 14:35:14 +0200
Subject: [Buildroot] [git commit] qt5serialbus: install examples to target
Message-ID: <20180617123958.9DEA783BF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4188f95c415221832fcc6f75944c05903983e5c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_PACKAGE_QT5BASE_EXAMPLES is set, the examples for this module
are installed in the staging directory but they are not shipped to the
target.

This commit copies the examples `serialbus' from the staging directory
to the target.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5serialbus/qt5serialbus.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt5/qt5serialbus/qt5serialbus.mk b/package/qt5/qt5serialbus/qt5serialbus.mk
index c9a2139556..6de9f9b7d3 100644
--- a/package/qt5/qt5serialbus/qt5serialbus.mk
+++ b/package/qt5/qt5serialbus/qt5serialbus.mk
@@ -36,8 +36,15 @@ define QT5SERIALBUS_INSTALL_TARGET_LIBS
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5SERIALBUS_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/serialbus $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
 define QT5SERIALBUS_INSTALL_TARGET_CMDS
 	$(QT5SERIALBUS_INSTALL_TARGET_LIBS)
+	$(QT5SERIALBUS_INSTALL_TARGET_EXAMPLES)
 	$(INSTALL) -m 0755 -D $(@D)/bin/canbusutil \
 		$(TARGET_DIR)/usr/bin/canbusutil
 endef
