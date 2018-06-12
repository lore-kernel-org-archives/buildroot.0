From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Tue, 12 Jun 2018 08:32:02 -0400
Subject: [Buildroot] [PATCH 5/9] qt5wayland: install examples to target
In-Reply-To: <20180612123206.31523-1-gael.portay@savoirfairelinux.com>
References: <20180612123206.31523-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180612123206.31523-6-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_PACKAGE_QT5BASE_EXAMPLES is set, the examples for this module
are installed in the staging directory but they are not shipped to the
target.

This commit copies the examples `wayland' from the staging directory to
the target.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/qt5/qt5wayland/qt5wayland.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index d018cccd6d..98e592f03d 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -51,11 +51,18 @@ endef
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5WAYLAND_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/wayland $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
 define QT5WAYLAND_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WaylandClient.so* $(TARGET_DIR)/usr/lib
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/wayland* $(TARGET_DIR)/usr/lib/qt/plugins
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/platforms/libqwayland* $(TARGET_DIR)/usr/lib/qt/plugins/platforms
 	$(QT5WAYLAND_INSTALL_COMPOSITOR)
+	$(QT5WAYLAND_INSTALL_TARGET_EXAMPLES)
 endef
 
 $(eval $(generic-package))
-- 
2.17.1
