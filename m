From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 Apr 2020 15:05:17 +0200
Subject: [Buildroot] [git commit] package/cage: new package
Message-ID: <20200426125322.11F40908A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b59cb5def14794edd94459c00b69ccc2041d8946
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cage is a "kiosk" Wayland compositor, which shows a single maximized
application at a time and limits user interaction to that application.

https://www.hjdskes.nl/projects/cage/

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/cage/Config.in | 24 ++++++++++++++++++++++++
 package/cage/cage.hash |  5 +++++
 package/cage/cage.mk   | 18 ++++++++++++++++++
 5 files changed, 49 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d6557f1143..34e19b451e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -95,6 +95,7 @@ F:	package/jack1/
 N:	Adrian Perez de Castro <aperez@igalia.com>
 F:	package/brotli/
 F:	package/bubblewrap/
+F:	package/cage/
 F:	package/cog/
 F:	package/libepoxy/
 F:	package/libwpe/
diff --git a/package/Config.in b/package/Config.in
index 6c55c5bc42..bf02870ea2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -278,6 +278,7 @@ endmenu
 menu "Graphic libraries and applications (graphic/text)"
 
 comment "Graphic applications"
+	source "package/cage/Config.in"
 	source "package/cog/Config.in"
 	source "package/fswebcam/Config.in"
 	source "package/ghostscript/Config.in"
diff --git a/package/cage/Config.in b/package/cage/Config.in
new file mode 100644
index 0000000000..c8097751f0
--- /dev/null
+++ b/package/cage/Config.in
@@ -0,0 +1,24 @@
+comment "cage needs udev, mesa3d w/ EGL and GLES support"
+	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL || \
+		!BR2_PACKAGE_MESA3D_OPENGL_ES || \
+		!BR2_PACKAGE_HAS_UDEV
+
+comment "cage needs a toolchain w/ threads, locale, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_ENABLE_LOCALE || \
+		BR2_STATIC_LIBS
+
+config BR2_PACKAGE_CAGE
+	bool "cage"
+	depends on !BR2_STATIC_LIBS # wlroots
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wlroots
+	depends on BR2_ENABLE_LOCALE # wlroots
+	depends on BR2_PACKAGE_HAS_UDEV # wlroots
+	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # wlroots
+	depends on BR2_PACKAGE_MESA3D_OPENGL_ES # wlroots
+	select BR2_PACKAGE_WLROOTS
+	help
+	  Kiosk compositor for Wayland, which displays a single
+	  maximized application at a time.
+
+	  https://www.hjdskes.nl/projects/cage/
diff --git a/package/cage/cage.hash b/package/cage/cage.hash
new file mode 100644
index 0000000000..49b84f98af
--- /dev/null
+++ b/package/cage/cage.hash
@@ -0,0 +1,5 @@
+# Generated locally, after checking https://github.com/Hjdskes/cage/releases/download/v0.1.1/cage-0.1.1.tar.gz.sig
+sha256 63efbe96cf307381f2bedf9b80153343e255970a70d612515da7dc325dd49478  cage-0.1.1.tar.gz
+
+# Hashes for license files:
+sha256 1fd28695090b961ed2846627365489228d84f784bff60a90e933febcedaeb65d  LICENSE
diff --git a/package/cage/cage.mk b/package/cage/cage.mk
new file mode 100644
index 0000000000..6a9c067735
--- /dev/null
+++ b/package/cage/cage.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# cage
+#
+################################################################################
+
+CAGE_VERSION = 0.1.1
+CAGE_SITE = $(call github,Hjdskes,cage,v$(CAGE_VERSION))
+CAGE_LICENSE = MIT
+CAGE_DEPENDENCIES = host-pkgconf wlroots
+
+ifeq ($(BR2_PACKAGE_XORG7),y)
+CAGE_CONF_OPTS = -Dxwayland=true
+else
+CAGE_CONF_OPTS = -Dxwayland=false
+endif
+
+$(eval $(meson-package))
