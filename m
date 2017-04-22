From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 22 Apr 2017 13:17:59 -0400
Subject: [Buildroot] [PATCH v2 13/25] fix ordering on configs starting with
	'm'
In-Reply-To: <20170422171811.1346-1-Adamduskett@outlook.com>
References: <20170422171811.1346-1-Adamduskett@outlook.com>
Message-ID: <20170422171811.1346-13-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter m in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
v1 -> v2:
  - Broke package up into just packages starting with the letter m.
  
 package/mali-t76x/Config.in       |  6 +++---
 package/matchbox-common/Config.in |  2 +-
 package/mediastreamer/Config.in   |  2 +-
 package/menu-cache/Config.in      |  4 ++--
 package/mesa3d-demos/Config.in    |  4 ++--
 package/mesa3d/Config.in          |  4 ++--
 package/micropython-lib/Config.in |  2 +-
 package/micropython/Config.in     |  2 +-
 package/midori/Config.in          | 12 ++++++------
 package/mjpegtools/Config.in      |  2 +-
 package/mongrel2/Config.in        |  4 ++--
 package/mtdev2tuio/Config.in      |  2 +-
 package/musl/Config.in            |  2 +-
 13 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/package/mali-t76x/Config.in b/package/mali-t76x/Config.in
index 26a7f6c..07f1f31 100644
--- a/package/mali-t76x/Config.in
+++ b/package/mali-t76x/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_MALI_T76X
 	bool "mali-t76x"
-	select BR2_PACKAGE_MESA3D_HEADERS
-	select BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_HAS_LIBGLES
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_ARM_EABIHF
 	depends on BR2_arm
+	select BR2_PACKAGE_MESA3D_HEADERS
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
 	help
 	  Install the binary user-space components for the ARM Mali Midgard
 	  T76X GPU. This package requires a kernel with the ARM Mali Midgard
diff --git a/package/matchbox-common/Config.in b/package/matchbox-common/Config.in
index 5a038e1..587a069 100644
--- a/package/matchbox-common/Config.in
+++ b/package/matchbox-common/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MATCHBOX_COMMON
 	bool "matchbox-common"
-	select BR2_PACKAGE_MATCHBOX_LIB
 	depends on BR2_PACKAGE_MATCHBOX_PANEL || BR2_PACKAGE_MATCHBOX_DESKTOP
+	select BR2_PACKAGE_MATCHBOX_LIB
 	help
 	  Common desktop folders and matchbox-session script.
 
diff --git a/package/mediastreamer/Config.in b/package/mediastreamer/Config.in
index 7e62bf2..afaed4a 100644
--- a/package/mediastreamer/Config.in
+++ b/package/mediastreamer/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_MEDIASTREAMER
 	bool "mediastreamer"
-	select BR2_PACKAGE_ORTP
 	depends on BR2_INSTALL_LIBSTDCPP # ortp
 	depends on BR2_TOOLCHAIN_HAS_THREADS # ortp
+	select BR2_PACKAGE_ORTP
 	help
 	  Mediastreamer is a powerful and lightweighted streaming
 	  engine specialized for voice/video telephony applications.
diff --git a/package/menu-cache/Config.in b/package/menu-cache/Config.in
index b75c8ec..e61ca44 100644
--- a/package/menu-cache/Config.in
+++ b/package/menu-cache/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_MENU_CACHE
 	bool "menu-cache"
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBFM_EXTRA
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBFM_EXTRA
 	help
 	  Small library from LXDE project used for application menu
 	  integration
diff --git a/package/mesa3d-demos/Config.in b/package/mesa3d-demos/Config.in
index f22c0de..b716cf5 100644
--- a/package/mesa3d-demos/Config.in
+++ b/package/mesa3d-demos/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_MESA3D_DEMOS
 	bool "mesa3d-demos"
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES \
+		|| BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBOPENVG
 	select BR2_PACKAGE_LIBGLEW if BR2_PACKAGE_XORG7 && BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_XORG7 && BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7 && BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7 && BR2_PACKAGE_HAS_LIBGL
-	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES \
-		|| BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBOPENVG
 	help
 	  OpenGL demos from the Mesa 3D project.
 
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 099dfd4..e5ff7d7 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -24,14 +24,14 @@ if BR2_PACKAGE_MESA3D
 
 # inform the .mk file of gallium, dri or vulkan driver selection
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
-	select BR2_PACKAGE_MESA3D_DRIVER
 	bool
+	select BR2_PACKAGE_MESA3D_DRIVER
 
 config BR2_PACKAGE_MESA3D_DRI_DRIVER
+	bool
 	select BR2_PACKAGE_MESA3D_DRIVER
 	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_XPROTO_DRI3PROTO
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO if BR2_PACKAGE_XPROTO_DRI3PROTO
-	bool
 
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	bool
diff --git a/package/micropython-lib/Config.in b/package/micropython-lib/Config.in
index 599af77..76557b2 100644
--- a/package/micropython-lib/Config.in
+++ b/package/micropython-lib/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MICROPYTHON_LIB
 	bool "micropython-lib"
-	select BR2_PACKAGE_PCRE # runtime
 	depends on BR2_PACKAGE_MICROPYTHON
+	select BR2_PACKAGE_PCRE # runtime
 	help
 	  Core Python libraries ported to MicroPython.
 
diff --git a/package/micropython/Config.in b/package/micropython/Config.in
index ed65d6a..ac06d7f 100644
--- a/package/micropython/Config.in
+++ b/package/micropython/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_MICROPYTHON
 	bool "micropython"
-	select BR2_PACKAGE_LIBFFI
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	# libffi doesn't provide the closure implementation on Blackfin
 	depends on !BR2_bfin
+	select BR2_PACKAGE_LIBFFI
 	help
 	  Micro Python is a lean and fast implementation of the Python 3
 	  programming language that is optimised to run on a microcontroller.
diff --git a/package/midori/Config.in b/package/midori/Config.in
index 0d7672c..cfd0535 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -6,6 +6,12 @@ comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 4.9"
 config BR2_PACKAGE_MIDORI
 	bool "midori"
 	# GCR can only be used with the X11 backend
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, gcr, gnupg2
+	depends on BR2_PACKAGE_LIBGTK3
+	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # webkitgtk
+	depends on BR2_TOOLCHAIN_USES_GLIBC # webkitgtk
+	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	select BR2_PACKAGE_GCR if BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_GRANITE
 	select BR2_PACKAGE_LIBSOUP
@@ -15,12 +21,6 @@ config BR2_PACKAGE_MIDORI
 	select BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt, gcr, gnupg2
-	depends on BR2_PACKAGE_LIBGTK3
-	depends on BR2_INSTALL_LIBSTDCPP # webkitgtk
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # webkitgtk
-	depends on BR2_TOOLCHAIN_USES_GLIBC # webkitgtk
-	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	help
 	  Midori is a lightweight web browser based on WebKit
 
diff --git a/package/mjpegtools/Config.in b/package/mjpegtools/Config.in
index 6a36109..c486361 100644
--- a/package/mjpegtools/Config.in
+++ b/package/mjpegtools/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_MJPEGTOOLS
 	bool "mjpegtools"
-	select BR2_PACKAGE_JPEG
 	depends on BR2_USE_MMU # fork
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_JPEG
 	help
 	  The mjpegtools programs are a set of tools
 	  that can do recording of videos and playback,
diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
index 796bae6..a9b09b7 100644
--- a/package/mongrel2/Config.in
+++ b/package/mongrel2/Config.in
@@ -14,12 +14,12 @@ comment "mongrel2 needs a uClibc or glibc toolchain w/ C++, threads, dynamic lib
 
 config BR2_PACKAGE_MONGREL2
 	bool "mongrel2"
-	select BR2_PACKAGE_SQLITE
-	select BR2_PACKAGE_ZEROMQ
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	depends on !BR2_STATIC_LIBS # uses dlopen()
 	depends on BR2_PACKAGE_MONGREL2_LIBC_SUPPORTS
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_ZEROMQ
 	help
 	  Mongrel2 is an application, language, and network architecture
 	  agnostic web server that focuses on web applications using
diff --git a/package/mtdev2tuio/Config.in b/package/mtdev2tuio/Config.in
index 4195ecf..3e88d21 100644
--- a/package/mtdev2tuio/Config.in
+++ b/package/mtdev2tuio/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_MTDEV2TUIO
 	bool "mtdev2tuio"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # liblo
 	select BR2_PACKAGE_LIBLO
 	select BR2_PACKAGE_MTDEV
-	depends on BR2_TOOLCHAIN_HAS_THREADS # liblo
 	help
 	  mtdev2tuio is a simple application for converting touch
 	  events captured from libmtdev to TUIO 1.1
diff --git a/package/musl/Config.in b/package/musl/Config.in
index 2775313..bedc50c 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_MUSL
 	bool
-	depends on BR2_TOOLCHAIN_USES_MUSL
 	default y
+	depends on BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_LINUX_HEADERS
 	# SSP broken on i386/ppc: http://www.openwall.com/lists/musl/2016/12/04/2
 	select BR2_TOOLCHAIN_HAS_SSP if !(BR2_i386 || BR2_powerpc)
-- 
2.9.3
