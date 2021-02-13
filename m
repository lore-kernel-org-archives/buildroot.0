From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Feb 2021 16:21:05 +0100
Subject: [Buildroot] [PATCH/next v4] package/libcamera-apps: new package
Message-ID: <20210213152105.23605-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v3 -> v4:
  - bump version
  - remove 14 upstream applied patches

Changes v2 -> v3:
  - bump version
  - add license file entry/hash
  - exchange patch 0002-cmake-remove-unrecognized-gcc-command-line-option.patch with
    0002-cmake-add-option-ENABLE_COMPILE_FLAGS_FOR_TARGET.patch (a upstream suggested
    solution) and add cmake configure option accordingly

Changes v1 -> v2:
  - fix Config.in indent (Thomas Petazzoni)
  - fix Config.in select ordering (Thomas Petazzoni)
  - fix Config.in comment regarding OpenGL
  - change download to use github macro (Thomas Petazzoni)
  - update 0001-cmake-remove-unsafe-host-include-path-for-libdrm-use.patch
    (add upstream link)
  - update 0002-cmake-remove-unrecognized-gcc-command-line-option.patch
    (add upstream link)
  - update 0003-cmake-remove-Wfatal-errors-compiler-command-line-opt.patch
    (new patch)
  - update 0004-libcamera_vid-fix-getline-call-needs-size_t.patch
    (add upstream link)
  - update 0005-libcamera_still-fix-getline-call-needs-size_t.patch
    (add upstream link)
  - update 0006-libcamera_app-fix-int64_t-constants.patch
    (add upstream link)
  - update 0007-cmake-fix-linking-with-exif-jpeg.patch
    (add upstream link)
  - update 0008-cmake-add-install-target.patch
    (add upstream link, update on upstream request to support older
    cmake versions - add DESTINATION defaults)
  - update 0009-cmake-no-need-to-link-against-ipa_rpi.so.patch
    (add upstream link)
  - update 0010-circular_output-fix-size_t-vs.-unsigned-int-narrowin.patch
    (new patch)
  - update 0011-egl_preview-fix-XVisualInfo-initializer.patch
    (new patch)
  - update 0012-jpeg-fix-long-unsigned-int-vs.-size_t-mismatch.patch
    (new patch)
  - update 0013-jpeg-fix-bool-vs.-boolean-mismatch.patch
    (new patch)
  - update 0014-mjpeg_encoder-fix-long-unsigned-int-vs.-size_t-misma.patch
    (new patch)
  - update 0015-mjpeg_encoder-fix-bool-vs.-boolean-mismatch.patch
    (new patch)

Notes:
  - Tested with test-pkg and the following two test configs

    BR2_PACKAGE_MESA3D=y
    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER=y
    BR2_PACKAGE_MESA3D_DRIVER=y
    BR2_PACKAGE_MESA3D_GALLIUM_KMSRO=y
    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D=y
    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4=y
    BR2_PACKAGE_MESA3D_GBM=y
    BR2_PACKAGE_MESA3D_OPENGL_EGL=y
    BR2_PACKAGE_XORG7=y
    BR2_PACKAGE_XLIB_LIBX11=y
    BR2_PACKAGE_LIBEPOXY=y
    BR2_PACKAGE_LIBDRM=y
    BR2_PACKAGE_BOOST=y
    BR2_PACKAGE_BOOST_PROGRAM_OPTIONS=y
    BR2_PACKAGE_LIBEXIF=y
    BR2_PACKAGE_JPEG=y
    BR2_PACKAGE_TIFF=y
    BR2_PACKAGE_LIBPNG=y
    BR2_PACKAGE_LIBCAMERA=y
    BR2_PACKAGE_LIBCAMERA_V4L2=y

    BR2_PACKAGE_MESA3D=y
    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER=y
    BR2_PACKAGE_MESA3D_DRIVER=y
    BR2_PACKAGE_MESA3D_GALLIUM_KMSRO=y
    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
    BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
    BR2_PACKAGE_MESA3D_GBM=y
    BR2_PACKAGE_MESA3D_OPENGL_EGL=y
    BR2_PACKAGE_XORG7=y
    BR2_PACKAGE_XLIB_LIBX11=y
    BR2_PACKAGE_LIBEPOXY=y
    BR2_PACKAGE_LIBDRM=y
    BR2_PACKAGE_BOOST=y
    BR2_PACKAGE_BOOST_PROGRAM_OPTIONS=y
    BR2_PACKAGE_LIBEXIF=y
    BR2_PACKAGE_JPEG=y
    BR2_PACKAGE_TIFF=y
    BR2_PACKAGE_LIBPNG=y
    BR2_PACKAGE_LIBCAMERA=y
    BR2_PACKAGE_LIBCAMERA_V4L2=y

  - runtime tested on RPi4 as described here
    http://lists.busybox.net/pipermail/buildroot/2021-January/302373.html
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...tal-errors-compiler-command-line-opt.patch | 25 +++++++++++++++
 package/libcamera-apps/Config.in              | 31 +++++++++++++++++++
 package/libcamera-apps/libcamera-apps.hash    |  3 ++
 package/libcamera-apps/libcamera-apps.mk      | 25 +++++++++++++++
 6 files changed, 86 insertions(+)
 create mode 100644 package/libcamera-apps/0001-cmake-remove-Wfatal-errors-compiler-command-line-opt.patch
 create mode 100644 package/libcamera-apps/Config.in
 create mode 100644 package/libcamera-apps/libcamera-apps.hash
 create mode 100644 package/libcamera-apps/libcamera-apps.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 361ee2f35a..6527d723ed 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2102,6 +2102,7 @@ F:	package/gstreamer1/gst1-devtools/
 F:	package/gstreamer1/gst1-interpipe/
 F:	package/gstreamer1/gstreamer1-editing-services/
 F:	package/iwd/
+F:	package/libcamera-apps/
 F:	package/libevdev/
 F:	package/libuev/
 F:	package/log4cplus/
diff --git a/package/Config.in b/package/Config.in
index 5304ab141c..bc66e492a5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1673,6 +1673,7 @@ menu "Multimedia"
 	source "package/libbdplus/Config.in"
 	source "package/libbluray/Config.in"
 	source "package/libcamera/Config.in"
+	source "package/libcamera-apps/Config.in"
 	source "package/libdcadec/Config.in"
 	source "package/libdvbcsa/Config.in"
 	source "package/libdvbpsi/Config.in"
diff --git a/package/libcamera-apps/0001-cmake-remove-Wfatal-errors-compiler-command-line-opt.patch b/package/libcamera-apps/0001-cmake-remove-Wfatal-errors-compiler-command-line-opt.patch
new file mode 100644
index 0000000000..11d19fa526
--- /dev/null
+++ b/package/libcamera-apps/0001-cmake-remove-Wfatal-errors-compiler-command-line-opt.patch
@@ -0,0 +1,25 @@
+From 22096ef8cfb18563c1955145db24742081910e10 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Fri, 5 Feb 2021 18:24:08 +0100
+Subject: [PATCH] cmake: remove -Wfatal-errors compiler command line option
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ CMakeLists.txt | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4191245..199a0f6 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -10,7 +10,6 @@ endif()
+ set (CMAKE_EXPORT_COMPILE_COMMANDS ON)
+ set (CMAKE_CXX_STANDARD 17)
+ set (CMAKE CXX_FLAGS "-Wall -Wextra -pedantic -Wno-unused-parameter -faligned-new")
+-add_definitions(-Wfatal-errors)
+ add_definitions(-Wno-psabi)
+ add_definitions(-DBOOST_LOG_DYN_LINK)
+ 
+-- 
+2.30.0
+
diff --git a/package/libcamera-apps/Config.in b/package/libcamera-apps/Config.in
new file mode 100644
index 0000000000..08667eb830
--- /dev/null
+++ b/package/libcamera-apps/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_LIBCAMERA_APPS
+	bool "libcamera-apps"
+	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS # libcamera
+	depends on BR2_INSTALL_LIBSTDCPP # libcamera/boost
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libcamera/boost/libdrm
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17/libcamera
+	depends on !BR2_STATIC_LIBS # gnutls/libcamera
+	depends on BR2_USE_WCHAR # gnutls/libcamera/boost
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_HAS_LIBEGL || BR2_PACKAGE_HAS_LIBGL # libepoxy
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBCAMERA
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBEPOXY
+	select BR2_PACKAGE_LIBEXIF
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_TIFF
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  This is a small suite of libcamera-based apps that aim to copy
+	  the functionality of the existing "raspicam" apps.
+
+	  https://github.com/raspberrypi/libcamera-apps
+
+comment "libcamera-apps needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 7 and needs an OpenGL and/or OpenGL EGL backend"
+	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
+	depends on !BR2_PACKAGE_HAS_LIBEGL && !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
new file mode 100644
index 0000000000..f762f6a205
--- /dev/null
+++ b/package/libcamera-apps/libcamera-apps.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  4d962e1e892c90cd5dc4e4f090baf6cdb00e3533a0596d12dd855b5af25cfe6a  libcamera-apps-b20dc097621a31a1edf0bd26d39aae0ee1398e2f.tar.gz
+sha256  36dfed86bdef661a0a14ec1a1cc84c771d5a06b6f9b92e9ebb610ba711bd528a  license.txt
diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
new file mode 100644
index 0000000000..d706066849
--- /dev/null
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# libcamera-apps
+#
+################################################################################
+
+LIBCAMERA_APPS_VERSION = b20dc097621a31a1edf0bd26d39aae0ee1398e2f
+LIBCAMERA_APPS_SITE = $(call github,raspberrypi,libcamera-apps,$(LIBCAMERA_APPS_VERSION))
+LIBCAMERA_APPS_LICENSE = BSD-2-Clause
+LIBCAMERA_APPS_LICENSE_FILES = license.txt
+LIBCAMERA_APPS_DEPENDENCIES = \
+	host-pkgconf \
+	boost \
+	jpeg \
+	libcamera \
+	libdrm \
+	libexif \
+	libepoxy \
+	libpng \
+	tiff \
+	xlib_libX11
+
+LIBCAMERA_APPS_CONF_OPTS = -DENABLE_COMPILE_FLAGS_FOR_TARGET=disabled
+
+$(eval $(cmake-package))
-- 
2.30.0
