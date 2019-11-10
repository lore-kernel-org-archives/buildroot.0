From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 10 Nov 2019 22:06:38 +0200
Subject: [Buildroot] [PATCH v3 2/2] package/cage: new package
In-Reply-To: <20191110200638.3570497-1-aperez@igalia.com>
References: <20191110200638.3570497-1-aperez@igalia.com>
Message-ID: <20191110200638.3570497-3-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cage is a "kiosk" Wayland compositor, which shows a single maximized
application at a time and limits user interaction to that application.

https://www.hjdskes.nl/projects/cage/

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
Changes v2 -> v3:
  - Fix dependencies in Config.in
  - Enable XWayland support automatically if BR2_PACKAGE_XORG7 is
    enabled, and remove the sub-option from Config.in.
  - Add note about the PGP signature being checked before generating
    the package hashes locally.
  - Use GitHub helper for CAGE_SITE.

---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/cage/Config.in | 17 +++++++++++++++++
 package/cage/cage.hash |  5 +++++
 package/cage/cage.mk   | 18 ++++++++++++++++++
 5 files changed, 42 insertions(+)
 create mode 100644 package/cage/Config.in
 create mode 100644 package/cage/cage.hash
 create mode 100644 package/cage/cage.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 29cd425bc7..3a7ee6d95b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -80,6 +80,7 @@ F:	package/jack1/
 
 N:	Adrian Perez de Castro <aperez@igalia.com>
 F:	package/brotli/
+F:	package/cage/
 F:	package/cog/
 F:	package/libepoxy/
 F:	package/libwpe/
diff --git a/package/Config.in b/package/Config.in
index d426d05832..4031d27e99 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -337,6 +337,7 @@ comment "QT libraries and helper libraries"
 	source "package/quazip/Config.in"
 	source "package/qwt/Config.in"
 endif
+	source "package/cage/Config.in"
 	source "package/tekui/Config.in"
 	source "package/weston/Config.in"
 	source "package/x11r7/Config.in"
diff --git a/package/cage/Config.in b/package/cage/Config.in
new file mode 100644
index 0000000000..bfa777fb1f
--- /dev/null
+++ b/package/cage/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_CAGE
+	bool "cage"
+	depends on !BR2_STATIC_LIBS # wlroots -> wayland
+	depends on BR2_INSTALL_LIBSTDCPP # wlroots -> wayland
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wlroots -> wayland
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # wlroots
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # wlroots
+	depends on BR2_ENABLE_LOCALE # wlroots -> libinput
+	depends on BR2_PACKAGE_HAS_UDEV # wlroots -> libinput
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
-- 
2.24.0
