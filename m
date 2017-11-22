From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 22 Nov 2017 19:34:20 +0100
Subject: [Buildroot] [PATCH v6 1/1] package/waylandpp: new package
Message-ID: <20171122183420.4544-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building waylandpp for the target requires a wayland-scanner++ binary
built for the host.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Package is needed for Wayland support in the next Kodi release 18-Leia:

https://kodi.tv/article/gsoc-2017-update-wayland-support
https://forum.kodi.tv/showthread.php?tid=309254

v6: bumped to version 0.1.5
v5: added dependencies for threads and !static (Yann)
    added note why host package is needed (Yann)
    fixed sorting in package/Config.in (Yann)
v4: bumped to version 0.1.4, added license hashes
v3: bumped to version 0.1.3
v2: switched to cmake, added dependency on host-gcc >= 4.9

 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/waylandpp/Config.in      | 18 ++++++++++++++++++
 package/waylandpp/waylandpp.hash |  4 ++++
 package/waylandpp/waylandpp.mk   | 27 +++++++++++++++++++++++++++
 5 files changed, 51 insertions(+)
 create mode 100644 package/waylandpp/Config.in
 create mode 100644 package/waylandpp/waylandpp.hash
 create mode 100644 package/waylandpp/waylandpp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 37b7dfe815..9e72910da0 100644
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
index 23526b4124..053919d1af 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1143,6 +1143,7 @@ menu "Graphics"
 	source "package/tiff/Config.in"
 	source "package/wayland/Config.in"
 	source "package/wayland-protocols/Config.in"
+	source "package/waylandpp/Config.in"
 	source "package/webkitgtk/Config.in"
 	source "package/webp/Config.in"
 	source "package/zbar/Config.in"
diff --git a/package/waylandpp/Config.in b/package/waylandpp/Config.in
new file mode 100644
index 0000000000..726653421c
--- /dev/null
+++ b/package/waylandpp/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_WAYLANDPP
+	bool "waylandpp"
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	depends on BR2_HOST_GCC_AT_LEAST_4_9
+	depends on !BR2_STATIC_LIBS # wayland
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
+	select BR2_PACKAGE_WAYLAND
+	help
+	  Wayland C++ bindings
+
+	  https://github.com/NilsBrause/waylandpp
+
+comment "waylandpp needs an OpenGL-EGL/wayland backend, a toolchain w/ threads, dynamic library, gcc >= 4.9, host gcc >= 4.9"
+	depends on !BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
+		!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_HOST_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/waylandpp/waylandpp.hash b/package/waylandpp/waylandpp.hash
new file mode 100644
index 0000000000..7e793cc866
--- /dev/null
+++ b/package/waylandpp/waylandpp.hash
@@ -0,0 +1,4 @@
+# Locally computed
+sha256 3d6d07a6fa4164c092608cdc53172af11138fbe7b7a9894090ca6502d8153448  waylandpp-0.1.5.tar.gz
+sha256 49aa6d728fd13226952c9e3a5a9cae46379b2a501010064760172b5ce7cd94bb  LICENSE
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  scanner/gpl-3.0.txt
diff --git a/package/waylandpp/waylandpp.mk b/package/waylandpp/waylandpp.mk
new file mode 100644
index 0000000000..0054838876
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
-- 
2.11.0
