From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 May 2014 13:08:41 +0200
Subject: [Buildroot] [PATCH 18/30] libva-intel-driver: new package
In-Reply-To: <cover.1401274944.git.yann.morin.1998@free.fr>
References: <cover.1401274944.git.yann.morin.1998@free.fr>
Message-ID: <d66bbf9daa9b4422c6015a4506b6d2387a991e78.1401274944.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                                |  1 +
 package/libva-intel-driver/Config.in             | 19 ++++++++++++++++
 package/libva-intel-driver/libva-intel-driver.mk | 29 ++++++++++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100644 package/libva-intel-driver/Config.in
 create mode 100644 package/libva-intel-driver/libva-intel-driver.mk

diff --git a/package/Config.in b/package/Config.in
index e2499f7..4115002 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -600,6 +600,7 @@ source "package/libsvg-cairo/Config.in"
 source "package/libsvgtiny/Config.in"
 source "package/libungif/Config.in"
 source "package/libva/Config.in"
+source "package/libva-intel-driver/Config.in"
 source "package/opencv/Config.in"
 source "package/opengl/Config.in"
 source "package/pango/Config.in"
diff --git a/package/libva-intel-driver/Config.in b/package/libva-intel-driver/Config.in
new file mode 100644
index 0000000..89a3264
--- /dev/null
+++ b/package/libva-intel-driver/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_LIBVA_INTEL_DRIVER
+	bool "libva-intel-driver"
+	select BR2_PACKAGE_LIBVA
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBDRM_INTEL
+	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm/libpthread-stubs
+	depends on BR2_LARGEFILE # libdrm
+	help
+	  VA-API back-end driver for Intel graphics chips
+
+	  https://01.org/linuxgraphics/community/vaapi
+
+comment "libva intel driver needs a toolchain w/ largefile, threads"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_i386 || BR2_x86_64
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
new file mode 100644
index 0000000..5ada9f1
--- /dev/null
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# libva-intel-driver
+#
+################################################################################
+
+LIBVA_INTEL_DRIVER_VERSION = 1.3.1
+LIBVA_INTEL_DRIVER_SOURCE = libva-intel-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
+LIBVA_INTEL_DRIVER_SITE = http://www.freedesktop.org/software/vaapi/releases/libva-intel-driver
+LIBVA_INTEL_DRIVER_LICENSE = MIT
+LIBVA_INTEL_DRIVER_LICENSE_FILES = COPYING
+LIBVA_INTEL_DRIVER_AUTORECONF = YES
+LIBVA_INTEL_DRIVER_DEPENDENCIES = host-pkgconf libdrm libva
+
+ifeq ($(BR2_PACKAGE_XORG7),y)
+LIBVA_INTEL_DRIVER_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXfixes
+LIBVA_INTEL_DRIVER_CONF_OPT += --enable-x11
+else
+LIBVA_INTEL_DRIVER_CONF_OPT += --disable-x11
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+LIBVA_DEPENDENCIES += wayland
+LIBVA_INTEL_DRIVER_CONF_OPT += --enable-wayland
+else
+LIBVA_INTEL_DRIVER_CONF_OPT += --disable-wayland
+endif
+
+$(eval $(autotools-package))
-- 
1.8.3.2
