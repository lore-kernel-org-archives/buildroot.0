From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 12:08:52 +0200
Subject: [Buildroot] [git commit] xlib_libpciaccess: Rename package to
	libpciaccess
Message-ID: <20141019101010.20293ADFEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bfd87877fe214af08a3eb4df160dc300a3b85203
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While libpciaccess is part of the X libraries, it does not
depend upon X11 or any other X library.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |    9 +++++++++
 package/Config.in                                  |    1 +
 package/libdrm/Config.in                           |    7 +------
 package/libdrm/libdrm.mk                           |    2 +-
 .../xlib_libpciaccess => libpciaccess}/Config.in   |    2 +-
 package/libpciaccess/libpciaccess.mk               |   14 ++++++++++++++
 package/x11r7/Config.in                            |    1 -
 package/x11r7/xdriver_xf86-video-intel/Config.in   |    2 +-
 .../xdriver_xf86-video-intel.mk                    |    2 +-
 .../x11r7/xlib_libpciaccess/xlib_libpciaccess.mk   |   14 --------------
 package/x11r7/xserver_xorg-server/Config.in        |    2 +-
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
 12 files changed, 31 insertions(+), 27 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6e202fe..b441e67 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,15 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.11"
 
+config BR2_PACKAGE_XLIB_LIBPCIACCESS
+	bool "xlib-libpciaccess option has been renamed"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_LEGACY
+	select BR2_PACKAGE_LIBPCIACCESS
+	help
+	  libpciaccess neither depends on X11 nor Xlib. Thus the
+	  package has been renamed BR2_PACKAGE_LIBPCIACCESS
+
 config BR2_PACKAGE_LINUX_FIRMWARE_XC5000
 	bool "Xceive xc5000 option has been renamed"
 	select BR2_PACKAGE_LINUX_FIRMWARE_XCx000
diff --git a/package/Config.in b/package/Config.in
index 8b8a20f..7b18715 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -684,6 +684,7 @@ menu "Hardware handling"
 	source "package/libllcp/Config.in"
 	source "package/libmbim/Config.in"
 	source "package/libnfc/Config.in"
+	source "package/libpciaccess/Config.in"
 	source "package/libphidget/Config.in"
 	source "package/libqmi/Config.in"
 	source "package/libraw1394/Config.in"
diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index a9c9171..8f70db5 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -19,17 +19,12 @@ menu "DRM Drivers"
 
 config BR2_PACKAGE_LIBDRM_INTEL
 	bool "intel"
-	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBATOMIC_OPS
-	select BR2_PACKAGE_XLIB_LIBPCIACCESS
+	select BR2_PACKAGE_LIBPCIACCESS
 	depends on BR2_i386 || BR2_x86_64
 	help
 	  installs intel graphics driver
 
-comment "libdrm intel driver depends on X.org"
-	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_PACKAGE_XORG7
-
 config BR2_PACKAGE_LIBDRM_RADEON
 	bool "radeon"
 	help
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 108ecdd..28a801f 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -21,7 +21,7 @@ LIBDRM_CONF_OPTS = \
 
 ifeq ($(BR2_PACKAGE_LIBDRM_INTEL),y)
 LIBDRM_CONF_OPTS += --enable-intel
-LIBDRM_DEPENDENCIES += libatomic_ops xlib_libpciaccess
+LIBDRM_DEPENDENCIES += libatomic_ops libpciaccess
 else
 LIBDRM_CONF_OPTS += --disable-intel
 endif
diff --git a/package/x11r7/xlib_libpciaccess/Config.in b/package/libpciaccess/Config.in
similarity index 80%
rename from package/x11r7/xlib_libpciaccess/Config.in
rename to package/libpciaccess/Config.in
index 5f7d136..8b05ebf 100644
--- a/package/x11r7/xlib_libpciaccess/Config.in
+++ b/package/libpciaccess/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_XLIB_LIBPCIACCESS
+config BR2_PACKAGE_LIBPCIACCESS
 	bool "libpciaccess"
 	depends on BR2_LARGEFILE
 	help
diff --git a/package/libpciaccess/libpciaccess.mk b/package/libpciaccess/libpciaccess.mk
new file mode 100644
index 0000000..010707e
--- /dev/null
+++ b/package/libpciaccess/libpciaccess.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libpciaccess
+#
+################################################################################
+
+LIBPCIACCESS_VERSION = 0.13.2
+LIBPCIACCESS_SOURCE = libpciaccess-$(LIBPCIACCESS_VERSION).tar.bz2
+LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
+LIBPCIACCESS_LICENSE = MIT
+LIBPCIACCESS_LICENSE_FILES = COPYING
+LIBPCIACCESS_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 1979a13..357d4b4 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -52,7 +52,6 @@ if BR2_PACKAGE_XORG7
 		source package/x11r7/xlib_libxkbfile/Config.in
 		source package/x11r7/xlib_libxshmfence/Config.in
 		source package/x11r7/xlib_xtrans/Config.in
-		source package/x11r7/xlib_libpciaccess/Config.in
 	endmenu
 	menu "X11R7 Applications"
 		source package/x11r7/xapp_appres/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-intel/Config.in b/package/x11r7/xdriver_xf86-video-intel/Config.in
index 0c04756..dc2fabf 100644
--- a/package/x11r7/xdriver_xf86-video-intel/Config.in
+++ b/package/x11r7/xdriver_xf86-video-intel/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL
 	depends on (BR2_i386 || BR2_x86_64)
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
-	select BR2_PACKAGE_XLIB_LIBPCIACCESS
+	select BR2_PACKAGE_LIBPCIACCESS
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_INTEL
 	select BR2_PACKAGE_XLIB_LIBXRANDR
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index 4e981c8..801cdae 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -20,8 +20,8 @@ XDRIVER_XF86_VIDEO_INTEL_CONF_OPTS = \
 
 XDRIVER_XF86_VIDEO_INTEL_DEPENDENCIES = \
 	libdrm \
+	libpciaccess \
 	xlib_libXrandr \
-	xlib_libpciaccess \
 	xproto_fontsproto \
 	xproto_xproto \
 	xserver_xorg-server
diff --git a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk b/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
deleted file mode 100644
index d065bf1..0000000
--- a/package/x11r7/xlib_libpciaccess/xlib_libpciaccess.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xlib_libpciaccess
-#
-################################################################################
-
-XLIB_LIBPCIACCESS_VERSION = 0.13.2
-XLIB_LIBPCIACCESS_SOURCE = libpciaccess-$(XLIB_LIBPCIACCESS_VERSION).tar.bz2
-XLIB_LIBPCIACCESS_SITE = http://xorg.freedesktop.org/releases/individual/lib
-XLIB_LIBPCIACCESS_LICENSE = MIT
-XLIB_LIBPCIACCESS_LICENSE_FILES = COPYING
-XLIB_LIBPCIACCESS_INSTALL_STAGING = YES
-
-$(eval $(autotools-package))
diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index e191dce..5581240 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_XSERVER_XORG_SERVER
 	bool "xorg-server"
 	select BR2_PACKAGE_LIBDRM if BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
+	select BR2_PACKAGE_LIBPCIACCESS if BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	# We need a SHA1 implementation. If either openssl or
 	# libgcrypt are already part of the build, we'll use one of
 	# them, otherwise, use the small libsha1 library.
@@ -9,7 +10,6 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 	select BR2_PACKAGE_XFONT_FONT_ALIAS if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
 	select BR2_PACKAGE_XFONT_FONT_MISC_MISC if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
 	select BR2_PACKAGE_XFONT_FONT_CURSOR_MISC if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
-	select BR2_PACKAGE_XLIB_LIBPCIACCESS if BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAU
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index b269985..6cbec15 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -63,7 +63,7 @@ XSERVER_XORG_SERVER_CONF_OPTS = --disable-config-hal \
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-xorg
-XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libpciaccess libdrm
+XSERVER_XORG_SERVER_DEPENDENCIES += libpciaccess libdrm
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-xorg
 endif
