From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Nov 2017 22:13:17 +0100
Subject: [Buildroot] [git commit] package/waylandpp: new package
Message-ID: <20171201205334.822617FF6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ba7d209c60fdb4c030a118c0ff9ed86c0769912
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building waylandpp for the target requires a wayland-scanner++ binary
built for the host.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: use 'depends on BR2_PACKAGE_WAYLAND' instead of a select.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/waylandpp/Config.in      | 16 ++++++++++++++++
 package/waylandpp/waylandpp.hash |  4 ++++
 package/waylandpp/waylandpp.mk   | 27 +++++++++++++++++++++++++++
 5 files changed, 49 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f93c617..fe943d3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -337,6 +337,7 @@ F:	package/vdr/
 F:	package/vdr-plugin-vnsiserver/
 F:	package/vlc/
 F:	package/vnstat/
+F:	package/waylandpp/
 F:	package/x11r7/
 F:	package/x264/
 F:	package/x265/
diff --git a/package/Config.in b/package/Config.in
index 54f6f57..0f5b7df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1145,6 +1145,7 @@ menu "Graphics"
 	source "package/tiff/Config.in"
 	source "package/wayland/Config.in"
 	source "package/wayland-protocols/Config.in"
+	source "package/waylandpp/Config.in"
 	source "package/webkitgtk/Config.in"
 	source "package/webp/Config.in"
 	source "package/zbar/Config.in"
diff --git a/package/waylandpp/Config.in b/package/waylandpp/Config.in
new file mode 100644
index 0000000..3d7362b
--- /dev/null
+++ b/package/waylandpp/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_WAYLANDPP
+	bool "waylandpp"
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	depends on BR2_HOST_GCC_AT_LEAST_4_9
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_PACKAGE_WAYLAND
+	help
+	  Wayland C++ bindings
+
+	  https://github.com/NilsBrause/waylandpp
+
+comment "waylandpp needs an OpenGL-EGL/wayland backend, a toolchain w/ gcc >= 4.9, host gcc >= 4.9"
+	depends on BR2_PACKAGE_WAYLAND
+	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
+		!BR2_HOST_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/waylandpp/waylandpp.hash b/package/waylandpp/waylandpp.hash
new file mode 100644
index 0000000..7e793cc
--- /dev/null
+++ b/package/waylandpp/waylandpp.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256 3d6d07a6fa4164c092608cdc53172af11138fbe7b7a9894090ca6502d8153448  waylandpp-0.1.5.tar.gz
+sha256 49aa6d728fd13226952c9e3a5a9cae46379b2a501010064760172b5ce7cd94bb  LICENSE
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  scanner/gpl-3.0.txt
diff --git a/package/waylandpp/waylandpp.mk b/package/waylandpp/waylandpp.mk
new file mode 100644
index 0000000..0054838
--- /dev/null
+++ b/package/waylandpp/waylandpp.mk
@@ -0,0 +1,27 @@
+################################################################################
+#
+# waylandpp
+#
+################################################################################
+
+WAYLANDPP_VERSION = 0.1.5
+WAYLANDPP_SITE = $(call github,NilsBrause,waylandpp,$(WAYLANDPP_VERSION))
+WAYLANDPP_LICENSE = MIT, GPL-3.0+ (wayland_scanner)
+WAYLANDPP_LICENSE_FILES = LICENSE scanner/gpl-3.0.txt
+WAYLANDPP_INSTALL_STAGING = YES
+HOST_WAYLANDPP_DEPENDENCIES = host-pkgconf host-wayland
+WAYLANDPP_DEPENDENCIES = libegl host-pkgconf wayland host-waylandpp
+
+# host variant of wayland-scanner++ is needed for building the target
+# package
+HOST_WAYLANDPP_CONF_OPTS = \
+	-DBUILD_LIBRARIES=OFF \
+	-DBUILD_SCANNER=ON
+
+WAYLANDPP_CONF_OPTS = \
+	-DBUILD_LIBRARIES=ON \
+	-DBUILD_SCANNER=OFF \
+	-DWAYLAND_SCANNERPP=$(HOST_DIR)/bin/wayland-scanner++
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
