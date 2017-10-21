From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Oct 2017 20:12:53 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/waylandpp: new package
Message-ID: <20171021181253.2705-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for Wayland support in the next Kodi release 18-Leia:

https://kodi.tv/article/gsoc-2017-update-wayland-support
https://forum.kodi.tv/showthread.php?tid=309254

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: bumped to version 0.1.3
v2: switched to cmake, added dependency on host-gcc >= 4.9

 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/waylandpp/Config.in      | 15 +++++++++++++++
 package/waylandpp/waylandpp.hash |  2 ++
 package/waylandpp/waylandpp.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 43 insertions(+)
 create mode 100644 package/waylandpp/Config.in
 create mode 100644 package/waylandpp/waylandpp.hash
 create mode 100644 package/waylandpp/waylandpp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ac1bc9cefe..c039b8ddaf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -321,6 +321,7 @@ F:	package/vdr/
 F:	package/vdr-plugin-vnsiserver/
 F:	package/vlc/
 F:	package/vnstat/
+F:	package/waylandpp/
 F:	package/x11r7/
 F:	package/x264/
 F:	package/x265/
diff --git a/package/Config.in b/package/Config.in
index 6a7950509a..77f345d7a2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1143,6 +1143,7 @@ menu "Graphics"
 	source "package/powervr/Config.in"
 	source "package/tiff/Config.in"
 	source "package/wayland/Config.in"
+	source "package/waylandpp/Config.in"
 	source "package/wayland-protocols/Config.in"
 	source "package/webkitgtk/Config.in"
 	source "package/webp/Config.in"
diff --git a/package/waylandpp/Config.in b/package/waylandpp/Config.in
new file mode 100644
index 0000000000..92af363789
--- /dev/null
+++ b/package/waylandpp/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_WAYLANDPP
+	bool "waylandpp"
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	depends on BR2_HOST_GCC_AT_LEAST_4_9
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	select BR2_PACKAGE_WAYLAND
+	help
+	  Wayland C++ bindings
+
+	  https://github.com/NilsBrause/waylandpp
+
+comment "waylandpp needs an OpenGL-EGL/wayland backend, gcc >= 4.9, host gcc >= 4.9"
+	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
+		!BR2_HOST_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/waylandpp/waylandpp.hash b/package/waylandpp/waylandpp.hash
new file mode 100644
index 0000000000..c1eeae7ff4
--- /dev/null
+++ b/package/waylandpp/waylandpp.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 cb779ffdfe72d0f8d79eb9085914f7b246aee6acb8c92b947ee2d19acead0cb5  waylandpp-0.1.3.tar.gz
diff --git a/package/waylandpp/waylandpp.mk b/package/waylandpp/waylandpp.mk
new file mode 100644
index 0000000000..9ebb6b5466
--- /dev/null
+++ b/package/waylandpp/waylandpp.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# waylandpp
+#
+################################################################################
+
+WAYLANDPP_VERSION = 0.1.3
+WAYLANDPP_SITE = $(call github,NilsBrause,waylandpp,$(WAYLANDPP_VERSION))
+WAYLANDPP_LICENSE = MIT, GPL-3.0+ (wayland_scanner)
+WAYLANDPP_LICENSE_FILES = LICENSE scanner/gpl-3.0.txt
+WAYLANDPP_INSTALL_STAGING = YES
+HOST_WAYLANDPP_DEPENDENCIES = host-pkgconf host-wayland
+WAYLANDPP_DEPENDENCIES = libegl host-pkgconf wayland host-waylandpp
+
+HOST_WAYLANDPP_CONF_OPTS = \
+	-DBUILD_LIBRARIES=OFF \
+	-DBUILD_SCANNER=ON
+WAYLANDPP_CONF_OPTS = \
+	-DBUILD_LIBRARIES=ON \
+	-DBUILD_SCANNER=OFF \
+	-DWAYLAND_SCANNERPP=$(HOST_DIR)/bin/wayland-scanner++
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.11.0
