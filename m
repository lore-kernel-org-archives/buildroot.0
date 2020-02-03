From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 09:58:50 +0100
Subject: [Buildroot] [git commit] package/libinput: remove dependency on
 BR2_ENABLE_LOCALE
Message-ID: <20200203085934.2AD3E8855C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bef6b92b67e08ee8cba085ae95af7e94e7a28202
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream commit
https://gitlab.freedesktop.org/libinput/libinput/commit/99bb0ee7cb35f7d7a932e7cf28885782bad17613

removed the dependency on locale support provided by the toolchain.
Removed reverse dependencies as well.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/efl/Config.in                               | 10 ++++------
 package/kodi/Config.in                              |  1 -
 package/libinput/Config.in                          |  5 ++---
 package/weston-imx/Config.in                        |  1 -
 package/weston/Config.in                            |  1 -
 package/x11r7/xdriver_xf86-input-libinput/Config.in |  5 ++---
 6 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 98b5b0731a..ff49161163 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -219,7 +219,6 @@ endchoice # OpenGL support
 
 config BR2_PACKAGE_EFL_ELPUT
 	bool "Elput"
-	depends on BR2_ENABLE_LOCALE # libinput
 	depends on BR2_PACKAGE_EFL_EEZE
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_LIBXKBCOMMON
@@ -230,24 +229,23 @@ config BR2_PACKAGE_EFL_ELPUT
 	  libinput without having to duplicate the code in each
 	  subsystem.
 
-comment "Elput support needs udev /dev management (eeze), locales"
-	depends on !BR2_PACKAGE_EFL_EEZE || !BR2_ENABLE_LOCALE
+comment "Elput support needs udev /dev management (eeze)"
+	depends on !BR2_PACKAGE_EFL_EEZE
 
 config BR2_PACKAGE_EFL_DRM
 	bool "Evas DRM Engine"
 	depends on BR2_PACKAGE_EFL_EEZE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # require libgbm from mesa3d
-	depends on BR2_ENABLE_LOCALE # efl-elput <- libinput
 	select BR2_PACKAGE_EFL_ELPUT
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBXKBCOMMON
 	help
 	  This option enable building support for the Evas DRM Engine.
 
-comment "Evas DRM Engine needs udev /dev management (eeze), mesa3d w/ EGL support, threads, locales"
+comment "Evas DRM Engine needs udev /dev management (eeze), mesa3d w/ EGL support, threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_MESA3D_OPENGL_EGL \
-		|| !BR2_PACKAGE_EFL_EEZE || !BR2_ENABLE_LOCALE
+		|| !BR2_PACKAGE_EFL_EEZE
 
 comment "libevas loaders"
 
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index f592e18e13..40ce3bfc59 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -23,7 +23,6 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_RBPI
 	# List of valid CPUs can be found here:
 	# https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/scripts/rbpi/ArchSetup.cmake#L12
 	depends on BR2_arm1176jzf_s || BR2_cortex_a7 || BR2_cortex_a53
-	depends on BR2_ENABLE_LOCALE # libinput
 	depends on BR2_PACKAGE_RPI_USERLAND
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
diff --git a/package/libinput/Config.in b/package/libinput/Config.in
index f7793df84f..14e4e70f96 100644
--- a/package/libinput/Config.in
+++ b/package/libinput/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBINPUT
 	bool "libinput"
-	depends on BR2_ENABLE_LOCALE
 	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LIBEVDEV
 	select BR2_PACKAGE_MTDEV
@@ -14,5 +13,5 @@ config BR2_PACKAGE_LIBINPUT
 
 	  http://freedesktop.org/wiki/Software/libinput/
 
-comment "libinput needs udev /dev management and a toolchain w/ locale"
-	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_ENABLE_LOCALE
+comment "libinput needs udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/weston-imx/Config.in b/package/weston-imx/Config.in
index 712341b24e..36ff7ae5ab 100644
--- a/package/weston-imx/Config.in
+++ b/package/weston-imx/Config.in
@@ -15,7 +15,6 @@ config BR2_PACKAGE_WESTON_IMX
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
-	depends on BR2_ENABLE_LOCALE # libinput
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 	depends on !BR2_PACKAGE_WESTON
diff --git a/package/weston/Config.in b/package/weston/Config.in
index f874b0cc6a..696b85b54d 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -5,7 +5,6 @@ comment "weston needs udev and a toolchain w/ locale, threads, dynamic library,
 
 config BR2_PACKAGE_WESTON
 	bool "weston"
-	depends on BR2_ENABLE_LOCALE # libinput
 	depends on BR2_PACKAGE_HAS_UDEV
 	depends on !BR2_STATIC_LIBS # wayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
diff --git a/package/x11r7/xdriver_xf86-input-libinput/Config.in b/package/x11r7/xdriver_xf86-input-libinput/Config.in
index 0cfbfc664a..f66196a52b 100644
--- a/package/x11r7/xdriver_xf86-input-libinput/Config.in
+++ b/package/x11r7/xdriver_xf86-input-libinput/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_XDRIVER_XF86_INPUT_LIBINPUT
 	bool "xf86-input-libinput"
-	depends on BR2_ENABLE_LOCALE # libinput
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	select BR2_PACKAGE_LIBINPUT
 	select BR2_PACKAGE_XORGPROTO
@@ -9,5 +8,5 @@ config BR2_PACKAGE_XDRIVER_XF86_INPUT_LIBINPUT
 	  around libinput, so while it does provide all features that
 	  libinput supports it does little beyond.
 
-comment "xf86-input-libinput needs udev /dev management and a toolchain w/ locale"
-	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_ENABLE_LOCALE
+comment "xf86-input-libinput needs udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
