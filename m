From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 20:42:03 +0200
Subject: [Buildroot] [git commit] libva-intel-driver: new package
Message-ID: <20140716184354.6F2339D244@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc36c8b5f0493bce4ba585a697dcccd34f4dbb00
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                |    1 +
 package/libva-intel-driver/Config.in             |   19 ++++++++++++++
 package/libva-intel-driver/libva-intel-driver.mk |   29 ++++++++++++++++++++++
 3 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index fe5e59b..2196783 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -620,6 +620,7 @@ menu "Graphics"
 	source "package/libsvgtiny/Config.in"
 	source "package/libungif/Config.in"
 	source "package/libva/Config.in"
+	source "package/libva-intel-driver/Config.in"
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
index 0000000..48b8559
--- /dev/null
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# libva-intel-driver
+#
+################################################################################
+
+LIBVA_INTEL_DRIVER_VERSION = 1.3.2
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
