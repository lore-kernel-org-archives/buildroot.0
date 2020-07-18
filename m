From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Jul 2020 23:27:32 +0200
Subject: [Buildroot] [git commit] package/unclutter-xfixes: new package
Message-ID: <20200719075129.8D1D586CB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97424d147f0a3af8f176dfa32a94685afeea9546
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
[Thomas:
 - Fix incorrect "select"
 - Simplify the build command, to allow the package Makefile to use
   pkg-config, so added host-pkgconf
 - Use a full destination path for the installation step
 - Use the Github macro]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/unclutter-xfixes/Config.in             | 13 +++++++++++++
 package/unclutter-xfixes/unclutter-xfixes.hash |  3 +++
 package/unclutter-xfixes/unclutter-xfixes.mk   | 22 ++++++++++++++++++++++
 5 files changed, 40 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f91314a13a..5bed3e7439 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1377,6 +1377,7 @@ F:	package/python-schedule/
 F:	package/python-sentry-sdk/
 F:	package/python-websockets/
 F:	package/python-xlib/
+F:	package/unclutter-xfixes/
 
 N:	Joshua Henderson <joshua.henderson@microchip.com>
 F:	package/qt5/qt5wayland/
diff --git a/package/Config.in b/package/Config.in
index aafaa312a1..22531d4fb5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1464,6 +1464,7 @@ menu "Graphics"
 	source "package/poppler/Config.in"
 	source "package/powervr/Config.in"
 	source "package/tiff/Config.in"
+	source "package/unclutter-xfixes/Config.in"
 	source "package/waffle/Config.in"
 	source "package/wayland/Config.in"
 	source "package/wayland-protocols/Config.in"
diff --git a/package/unclutter-xfixes/Config.in b/package/unclutter-xfixes/Config.in
new file mode 100644
index 0000000000..852a8cfda9
--- /dev/null
+++ b/package/unclutter-xfixes/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_UNCLUTTER_XFIXES
+	bool "unclutter-xfixes"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBEV
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXFIXES
+	select BR2_PACKAGE_XLIB_LIBXI
+	help
+	  Remove idle cursor image from screen.
+
+	  A rewrite of unclutter using the x11-xfixes extension.
+
+	  https://github.com/Airblader/unclutter-xfixes
diff --git a/package/unclutter-xfixes/unclutter-xfixes.hash b/package/unclutter-xfixes/unclutter-xfixes.hash
new file mode 100644
index 0000000000..785825da7a
--- /dev/null
+++ b/package/unclutter-xfixes/unclutter-xfixes.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256 35c75ad24be989dd6708db1d9ce9b2a2f814b80638c0633cdb075c6df090ed11  unclutter-xfixes-1.5.tar.gz
+sha256 33e94693849b57fdb34987c95fd0076b4aa4b70fcd9a3152313d00b86a3f7bf7  LICENSE
diff --git a/package/unclutter-xfixes/unclutter-xfixes.mk b/package/unclutter-xfixes/unclutter-xfixes.mk
new file mode 100644
index 0000000000..713a84bca6
--- /dev/null
+++ b/package/unclutter-xfixes/unclutter-xfixes.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# unclutter-xfixes
+#
+################################################################################
+
+UNCLUTTER_XFIXES_VERSION = 1.5
+UNCLUTTER_XFIXES_SITE = $(call github,Airblader,unclutter-xfixes,v$(UNCLUTTER_XFIXES_VERSION))
+UNCLUTTER_XFIXES_LICENSE = MIT
+UNCLUTTER_XFIXES_LICENSE_FILES = LICENSE
+UNCLUTTER_XFIXES_DEPENDENCIES = libev xlib_libX11 xlib_libXfixes xlib_libXi host-pkgconf
+
+define UNCLUTTER_XFIXES_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+		$(MAKE) -C $(@D) unclutter CC="$(TARGET_CC)"
+endef
+
+define UNCLUTTER_XFIXES_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/unclutter $(TARGET_DIR)/usr/bin/unclutter
+endef
+
+$(eval $(generic-package))
