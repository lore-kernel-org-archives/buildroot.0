From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Tue, 12 Jun 2018 08:32:04 -0400
Subject: [Buildroot] [PATCH 7/9] qt5serialbus: install examples to target
In-Reply-To: <20180612123206.31523-1-gael.portay@savoirfairelinux.com>
References: <20180612123206.31523-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180612123206.31523-8-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_PACKAGE_QT5BASE_EXAMPLES is set, the examples for this module
are installed in the staging directory but they are not shipped to the
target.

This commit copies the examples `serialbus' from the staging directory
to the target.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
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
-- 
2.17.1
