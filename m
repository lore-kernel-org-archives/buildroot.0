From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 14:35:15 +0200
Subject: [Buildroot] [git commit] qt5serialport: install examples to target
Message-ID: <20180617123958.A73A3888A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ce2eaaab97d33f0688f5a41f8961a8464813812
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_PACKAGE_QT5BASE_EXAMPLES is set, the examples for this module
are installed in the staging directory but they are not shipped to the
target.

This commit copies the examples `serialport' from the staging directory
to the target.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5serialport/qt5serialport.mk | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5serialport/qt5serialport.mk b/package/qt5/qt5serialport/qt5serialport.mk
index 1cddaf857e..2b0953586b 100644
--- a/package/qt5/qt5serialport/qt5serialport.mk
+++ b/package/qt5/qt5serialport/qt5serialport.mk
@@ -32,9 +32,20 @@ define QT5SERIALPORT_INSTALL_STAGING_CMDS
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
-define QT5SERIALPORT_INSTALL_TARGET_CMDS
+define QT5SERIALPORT_INSTALL_TARGET_LIBS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5SerialPort.so.* $(TARGET_DIR)/usr/lib
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5SERIALPORT_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/serialport $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
+define QT5SERIALPORT_INSTALL_TARGET_CMDS
+	$(QT5SERIALPORT_INSTALL_TARGET_LIBS)
+	$(QT5SERIALPORT_INSTALL_TARGET_EXAMPLES)
+endef
+
 $(eval $(generic-package))
