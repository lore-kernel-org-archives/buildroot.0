From: Michael Roth <mroth@nessie.de>
Date: Mon, 11 May 2009 20:04:03 +0200
Subject: [Buildroot] [PATCH] qtopia4: Add kconfig option to build linuxis
	mouse driver
Message-ID: <1242065043-1191-1-git-send-email-mroth@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

'linuxis' is a mouse driver for the Linux event interface
(/dev/input/eventX).

This driver can be built only as a plugin.

Signed-off-by: Michael Roth <mroth@nessie.de>
---
 package/qtopia4/Config.mouse.in |    3 +++
 package/qtopia4/qtopia4.mk      |    6 +++++-
 2 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/qtopia4/Config.mouse.in b/package/qtopia4/Config.mouse.in
index 7b39460..9788b10 100644
--- a/package/qtopia4/Config.mouse.in
+++ b/package/qtopia4/Config.mouse.in
@@ -9,6 +9,9 @@ config BR2_PACKAGE_QTOPIA4_MOUSE_BUS
 config BR2_PACKAGE_QTOPIA4_MOUSE_LINUXTP
 	bool "linuxtp"
 
+config BR2_PACKAGE_QTOPIA4_MOUSE_LINUXIS
+	bool "linuxis (plugin)"
+
 config BR2_PACKAGE_QTOPIA4_MOUSE_YOPY
 	bool "yopy"
 
diff --git a/package/qtopia4/qtopia4.mk b/package/qtopia4/qtopia4.mk
index a198a41..eb28ff0 100644
--- a/package/qtopia4/qtopia4.mk
+++ b/package/qtopia4/qtopia4.mk
@@ -151,6 +151,9 @@ QTOPIA4_CONFIGURE += -qt-mouse-linuxtp
 else
 QTOPIA4_CONFIGURE += -no-mouse-linuxtp
 endif
+ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_LINUXIS),y)
+QTOPIA4_CONFIGURE += -plugin-mouse-linuxis
+endif
 ifeq ($(BR2_PACKAGE_QTOPIA4_MOUSE_YOPY),y)
 QTOPIA4_CONFIGURE += -qt-mouse-yopy
 else
@@ -485,8 +488,9 @@ qtopia4-gui: $(STAGING_DIR)/usr/lib/libQtCore.la
 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/helvetica*.qpf $(TARGET_DIR)/usr/lib/fonts
 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/fixed*.qpf $(TARGET_DIR)/usr/lib/fonts
 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/micro*.qpf $(TARGET_DIR)/usr/lib/fonts
-	# Install image plugins if they are built
+	# Install image and/or mousedriver plugins if they are built
 	$(call QTOPIA4_INSTALL_PLUGINS,imageformats)
+	$(call QTOPIA4_INSTALL_PLUGINS,mousedrivers)
 ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
 	cp -dpf $(STAGING_DIR)/usr/lib/libQtGui.so.* $(TARGET_DIR)/usr/lib/
 endif
-- 
1.6.0.6
