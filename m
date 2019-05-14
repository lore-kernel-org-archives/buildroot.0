From: David Rosca <nowrep@gmail.com>
Date: Tue, 14 May 2019 09:18:29 +0200
Subject: [Buildroot] [PATCH v2] package/qt5wayland: install compositor QML
 files
In-Reply-To: <20190511150750.5985-1-nowrep@gmail.com>
References: <20190511150750.5985-1-nowrep@gmail.com>
Message-ID: <20190514071830.30037-1-nowrep@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes using QtWayland.Compositor QML import.

Signed-off-by: David Rosca <nowrep@gmail.com>

---
Changes v1 -> v2:
  - move under BR2_PACKAGE_QT5DECLARATIVE_QUICK condition
  - also handle stable Qt version (5.6)
---
 package/qt5/qt5wayland/qt5wayland.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index f96e4c2f8f..449640c881 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -52,6 +52,11 @@ define QT5WAYLAND_INSTALL_COMPOSITOR
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Compositor.so* $(TARGET_DIR)/usr/lib
 endef
 endif
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
+define QT5WAYLAND_INSTALL_COMPOSITOR_QMLS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtWayland $(TARGET_DIR)/usr/qml/
+endef
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
@@ -65,6 +70,7 @@ define QT5WAYLAND_INSTALL_TARGET_CMDS
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/wayland* $(TARGET_DIR)/usr/lib/qt/plugins
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/platforms/libqwayland* $(TARGET_DIR)/usr/lib/qt/plugins/platforms
 	$(QT5WAYLAND_INSTALL_COMPOSITOR)
+	$(QT5WAYLAND_INSTALL_COMPOSITOR_QMLS)
 	$(QT5WAYLAND_INSTALL_TARGET_EXAMPLES)
 endef
 
-- 
2.21.0
