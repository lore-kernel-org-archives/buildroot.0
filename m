From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  2 Jun 2019 22:07:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/qt5wayland: examples needs opengl
 with qt latest
Message-ID: <20190602200734.29324-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

WIth Qt latest, if opengl is not enabled, qt5wayland examples won't be
built:
make[3]: Entering directory `/home/dawncrow/buildroot-test/scripts/instance-0/output/build/qt5wayland-5.12.2/examples/wayland'
Some of the required modules (qtConfig(opengl)) are not available.
Skipped.
make[3]: Leaving directory `/home/dawncrow/buildroot-test/scripts/instance-0/output/build/qt5wayland-5.12.2/examples/wayland'

And build will fail on:
cp: cannot stat '/home/dawncrow/buildroot-test/scripts/instance-0/output/host/sparc64-buildroot-linux-gnu/sysroot/usr/lib/qt/examples/wayland': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/902322ca156c14044d4ce53ab2c77f30dd854c98

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qt5/qt5wayland/qt5wayland.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/qt5/qt5wayland/qt5wayland.mk b/package/qt5/qt5wayland/qt5wayland.mk
index 449640c881..0bda596f3b 100644
--- a/package/qt5/qt5wayland/qt5wayland.mk
+++ b/package/qt5/qt5wayland/qt5wayland.mk
@@ -60,10 +60,18 @@ endif
 endif
 
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
+ifeq ($(BR2_PACKAGE_QT5BASE_OPENGL),y)
 define QT5WAYLAND_INSTALL_TARGET_EXAMPLES
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/wayland $(TARGET_DIR)/usr/lib/qt/examples/
 endef
 endif
+else
+define QT5WAYLAND_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/wayland $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+endif
 
 define QT5WAYLAND_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WaylandClient.so* $(TARGET_DIR)/usr/lib
-- 
2.20.1
