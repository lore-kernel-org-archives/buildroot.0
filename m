From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 23 Jun 2020 14:41:54 -0700
Subject: [Buildroot] [PATCH 1/1] package/unclutter-xfixes: new package
Message-ID: <20200623214154.902918-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/unclutter-xfixes/Config.in            | 13 ++++++++++
 .../unclutter-xfixes/unclutter-xfixes.hash    |  3 +++
 package/unclutter-xfixes/unclutter-xfixes.mk  | 26 +++++++++++++++++++
 5 files changed, 44 insertions(+)
 create mode 100644 package/unclutter-xfixes/Config.in
 create mode 100644 package/unclutter-xfixes/unclutter-xfixes.hash
 create mode 100644 package/unclutter-xfixes/unclutter-xfixes.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9a94307082..e682d01b08 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1366,6 +1366,7 @@ F:	package/python-schedule/
 F:	package/python-sentry-sdk/
 F:	package/python-websockets/
 F:	package/python-xlib/
+F:	package/unclutter-xfixes/
 
 N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
diff --git a/package/Config.in b/package/Config.in
index b0a7da2f5c..e789daefb5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1455,6 +1455,7 @@ menu "Graphics"
 	source "package/poppler/Config.in"
 	source "package/powervr/Config.in"
 	source "package/tiff/Config.in"
+	source "package/unclutter-xfixes/Config.in"
 	source "package/waffle/Config.in"
 	source "package/wayland/Config.in"
 	source "package/wayland-protocols/Config.in"
diff --git a/package/unclutter-xfixes/Config.in b/package/unclutter-xfixes/Config.in
new file mode 100644
index 0000000000..2859cb1ec8
--- /dev/null
+++ b/package/unclutter-xfixes/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_UNCLUTTER_XFIXES
+	bool "unclutter-xfixes"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBEV
+	select BR2_PACKAGE_X11_LIBX11
+	select BR2_PACKAGE_X11_LIBXFIXES
+	select BR2_PACKAGE_X11_LIBXI
+	help
+	  Remove idle cursor image from screen.
+
+	  A rewrite of unclutter using the x11-xfixes extension.
+
+	  https://github.com/Airblader/unclutter-xfixes
diff --git a/package/unclutter-xfixes/unclutter-xfixes.hash b/package/unclutter-xfixes/unclutter-xfixes.hash
new file mode 100644
index 0000000000..920d2b6a60
--- /dev/null
+++ b/package/unclutter-xfixes/unclutter-xfixes.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256 35c75ad24be989dd6708db1d9ce9b2a2f814b80638c0633cdb075c6df090ed11  v1.5.tar.gz
+sha256 33e94693849b57fdb34987c95fd0076b4aa4b70fcd9a3152313d00b86a3f7bf7  LICENSE
diff --git a/package/unclutter-xfixes/unclutter-xfixes.mk b/package/unclutter-xfixes/unclutter-xfixes.mk
new file mode 100644
index 0000000000..05ef3e4d79
--- /dev/null
+++ b/package/unclutter-xfixes/unclutter-xfixes.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# unclutter-xfixes
+#
+################################################################################
+
+UNCLUTTER_XFIXES_VERSION = 1.5
+UNCLUTTER_XFIXES_SITE = https://github.com/Airblader/unclutter-xfixes/archive
+UNCLUTTER_XFIXES_SOURCE = v$(UNCLUTTER_XFIXES_VERSION).tar.gz
+UNCLUTTER_XFIXES_LICENSE = MIT
+UNCLUTTER_XFIXES_LICENSE_FILES = LICENSE
+UNCLUTTER_XFIXES_DEPENDENCIES = libev xlib_libX11 xlib_libXfixes xlib_libXi
+
+define UNCLUTTER_XFIXES_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) unclutter \
+		CFLAGS="$(TARGET_CFLAGS) -I$(@D)/include" \
+		LD=$(TARGET_CC) \
+		LDFLAGS="-lX11 -lXi -lXfixes -lev"
+endef
+
+# Skip installing man page and license
+define UNCLUTTER_XFIXES_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/unclutter $(TARGET_DIR)/usr/bin
+endef
+
+$(eval $(generic-package))
-- 
2.27.0
