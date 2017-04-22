From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 22 Apr 2017 13:18:01 -0400
Subject: [Buildroot] [PATCH v2 15/25] fix ordering on configs starting with
	'o'
In-Reply-To: <20170422171811.1346-1-Adamduskett@outlook.com>
References: <20170422171811.1346-1-Adamduskett@outlook.com>
Message-ID: <20170422171811.1346-15-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter o in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
v1 -> v2:
  - Broke package up into just packages starting with the letter o.
  
 package/odroid-mali/Config.in       |  4 ++--
 package/ola/Config.in               |  6 +++---
 package/on2-8170-libs/Config.in     |  2 +-
 package/opencv/Config.in            |  4 ++--
 package/opencv3/Config.in           |  2 +-
 package/opengl/libegl/Config.in     |  2 +-
 package/opengl/libgl/Config.in      |  2 +-
 package/opengl/libgles/Config.in    |  2 +-
 package/opengl/libopenmax/Config.in |  2 +-
 package/opengl/libopenvg/Config.in  |  2 +-
 package/openocd/Config.in           | 34 +++++++++++++++++-----------------
 package/openpowerlink/Config.in     |  2 +-
 package/openvmtools/Config.in       |  2 +-
 package/opkg/Config.in              |  2 +-
 package/oprofile/Config.in          |  6 +++---
 15 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/package/odroid-mali/Config.in b/package/odroid-mali/Config.in
index e5c07f2..1c31c2d 100644
--- a/package/odroid-mali/Config.in
+++ b/package/odroid-mali/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_ODROID_MALI
 	bool "odroid-mali"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_aarch64 || BR2_ARM_EABIHF
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_ODROID_SCRIPTS # runtime
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_aarch64 || BR2_ARM_EABIHF
 	help
 	  Install the ARM Mali drivers for odroidc2 based systems.
 
diff --git a/package/ola/Config.in b/package/ola/Config.in
index 90a92fd..7c3708d 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -5,13 +5,13 @@ comment "ola needs a toolchain w/ C++, threads, dynamic library"
 
 menuconfig BR2_PACKAGE_OLA
 	bool "ola (open lighting architecture)"
-	select BR2_PACKAGE_PROTOBUF
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	select BR2_PACKAGE_UTIL_LINUX
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on !BR2_STATIC_LIBS # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX
 	help
 	  Open Lighting Architecture provides applications
 	  with a mechanism to send and receive DMX512 & RDM
diff --git a/package/on2-8170-libs/Config.in b/package/on2-8170-libs/Config.in
index 40cad3d..2a60c58 100644
--- a/package/on2-8170-libs/Config.in
+++ b/package/on2-8170-libs/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_ON2_8170_LIBS
+	bool "on2-8170-libs"
 	#This is a binary only package which has been compiled for glibc
 	depends on BR2_arm926t
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_LINUX_KERNEL # on2-8170-modules
 	select BR2_PACKAGE_ON2_8170_MODULES # runtime
-	bool "on2-8170-libs"
 	help
 	  Libraries for Hantro X170 video decoder
 
diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index c046baa..0260851 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -1,9 +1,9 @@
 menuconfig BR2_PACKAGE_OPENCV
 	bool "opencv-2.4"
-	select BR2_PACKAGE_ZLIB
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_ZLIB
 	help
 	  OpenCV (Open Source Computer Vision) is a library of programming
 	  functions for real time computer vision.
@@ -52,13 +52,13 @@ config BR2_PACKAGE_OPENCV_LIB_FLANN
 config BR2_PACKAGE_OPENCV_LIB_GPU
 	bool "gpu"
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # opencv libphoto
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
 	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV_LIB_LEGACY
 	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
 	select BR2_PACKAGE_OPENCV_LIB_PHOTO
 	select BR2_PACKAGE_OPENCV_LIB_VIDEO
-	depends on !BR2_STATIC_LIBS
 	help
 	  Include opencv_gpu module into the OpenCV build.
 
diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index ee589f9..3b0a9d6 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -1,12 +1,12 @@
 menuconfig BR2_PACKAGE_OPENCV3
 	bool "opencv3"
-	select BR2_PACKAGE_ZLIB
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS # include dlfcn.h
 	depends on !BR2_PACKAGE_OPENCV
+	select BR2_PACKAGE_ZLIB
 	help
 	  OpenCV (Open Source Computer Vision) is a library of programming
 	  functions for real time computer vision.
diff --git a/package/opengl/libegl/Config.in b/package/opengl/libegl/Config.in
index f756fbe..a236998 100644
--- a/package/opengl/libegl/Config.in
+++ b/package/opengl/libegl/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 	depends on BR2_PACKAGE_HAS_LIBEGL
 
 config BR2_PACKAGE_PROVIDES_LIBEGL
-	depends on BR2_PACKAGE_HAS_LIBEGL
 	string
+	depends on BR2_PACKAGE_HAS_LIBEGL
diff --git a/package/opengl/libgl/Config.in b/package/opengl/libgl/Config.in
index 8b99e5b..b9a1602 100644
--- a/package/opengl/libgl/Config.in
+++ b/package/opengl/libgl/Config.in
@@ -2,5 +2,5 @@ config BR2_PACKAGE_HAS_LIBGL
 	bool
 
 config BR2_PACKAGE_PROVIDES_LIBGL
-	depends on BR2_PACKAGE_HAS_LIBGL
 	string
+	depends on BR2_PACKAGE_HAS_LIBGL
diff --git a/package/opengl/libgles/Config.in b/package/opengl/libgles/Config.in
index b7b800f..090ef16 100644
--- a/package/opengl/libgles/Config.in
+++ b/package/opengl/libgles/Config.in
@@ -2,5 +2,5 @@ config BR2_PACKAGE_HAS_LIBGLES
 	bool
 
 config BR2_PACKAGE_PROVIDES_LIBGLES
-	depends on BR2_PACKAGE_HAS_LIBGLES
 	string
+	depends on BR2_PACKAGE_HAS_LIBGLES
diff --git a/package/opengl/libopenmax/Config.in b/package/opengl/libopenmax/Config.in
index d50f2ce..901426a 100644
--- a/package/opengl/libopenmax/Config.in
+++ b/package/opengl/libopenmax/Config.in
@@ -2,5 +2,5 @@ config BR2_PACKAGE_HAS_LIBOPENMAX
 	bool
 
 config BR2_PACKAGE_PROVIDES_LIBOPENMAX
-	depends on BR2_PACKAGE_HAS_LIBOPENMAX
 	string
+	depends on BR2_PACKAGE_HAS_LIBOPENMAX
diff --git a/package/opengl/libopenvg/Config.in b/package/opengl/libopenvg/Config.in
index 53cde6a..37d9410 100644
--- a/package/opengl/libopenvg/Config.in
+++ b/package/opengl/libopenvg/Config.in
@@ -2,5 +2,5 @@ config BR2_PACKAGE_HAS_LIBOPENVG
 	bool
 
 config BR2_PACKAGE_PROVIDES_LIBOPENVG
-	depends on BR2_PACKAGE_HAS_LIBOPENVG
 	string
+	depends on BR2_PACKAGE_HAS_LIBOPENVG
diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index 2313671..d4c4719 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -11,109 +11,109 @@ comment "Adapters"
 
 config BR2_PACKAGE_OPENOCD_FTDI
 	bool "MPSSE mode of FTDI based devices"
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the MPSSE mode of FTDI
 	  (FT2xxx/FT4xxx) based devices (default is auto)
 
 config BR2_PACKAGE_OPENOCD_STLINK
 	bool "ST-Link JTAG Programmer"
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the ST-Link JTAG
 	  Programmer (default is auto)
 
 config BR2_PACKAGE_OPENOCD_TI_ICDI
 	bool "TI ICDI JTAG Programmer"
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the TI ICDI JTAG
 	  Programmer (default is auto)
 
 config BR2_PACKAGE_OPENOCD_ULINK
 	bool "Keil ULINK JTAG Programmer"
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the Keil ULINK JTAG
 	  Programmer (default is auto)
 
 config BR2_PACKAGE_OPENOCD_UBLASTER2
 	bool "Altera USB-Blaster II Compatible"
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the Altera USB-Blaster
 	  II Compatible (default is auto)
 
 config BR2_PACKAGE_OPENOCD_JLINK
 	bool "Segger J-Link JTAG Programmer"
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
 	help
 	  Segger J-Link JTAG Programmer and clone such as Atmel
 	  SAM-ICE
 
 config BR2_PACKAGE_OPENOCD_OSDBM
 	bool "OSDBM JTAG (only) Programmer"
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the OSBDM (JTAG only)
 	  Programmer (default is auto)
 
 config BR2_PACKAGE_OPENOCD_OPENDOUS
 	bool "eStick/opendous JTAG Programmer"
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the eStick/opendous JTAG
 	  Programmer (default is auto)
 
 config BR2_PACKAGE_OPENOCD_AICE
 	bool "Andes JTAG Programmer"
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_USE_MMU # use fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
 	help
 	  Enable building support for the Andes JTAG
 	  Programmer (default is auto)
 
 config BR2_PACKAGE_OPENOCD_VSLLINK
 	bool "Versaloon-Link JTAG Programmer"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
 	help
 	  Enable building support for the Versaloon-Link JTAG
 	  Programmer (default is auto)
 
 config BR2_PACKAGE_OPENOCD_USBPROG
 	bool "USBProg JTAG Programmer"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
 	help
 	  Enable building support for the USBProg JTAG
 	  Programmer (default is auto)
 
 config BR2_PACKAGE_OPENOCD_RLINK
 	bool "Raisonance RLink JTAG Programmer"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
 	help
 	  Enable building support for the Raisonance RLink
 	  JTAG Programmer (default is auto)
 
 config BR2_PACKAGE_OPENOCD_ARMEW
 	bool "Olimex ARM-JTAG-EW Programmer"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
 	help
 	  Enable building support for the Olimex ARM-JTAG-EW
 	  Programmer (default is auto)
@@ -125,8 +125,8 @@ config BR2_PACKAGE_OPENOCD_PARPORT
 
 config BR2_PACKAGE_OPENOCD_FT2XXX
 	bool "FT2232 based devices (DEPRECATED)"
-	select BR2_PACKAGE_LIBFTDI1
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
+	select BR2_PACKAGE_LIBFTDI1
 	help
 	  (DEPRECATED) Enable building support for FT2232
 	  based devices using the libftdi library
@@ -138,8 +138,8 @@ config BR2_PACKAGE_OPENOCD_VPI
 
 config BR2_PACKAGE_OPENOCD_UBLASTER
 	bool "Altera USB-Blaster"
-	select BR2_PACKAGE_LIBFTDI1
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
+	select BR2_PACKAGE_LIBFTDI1
 	help
 	  Enable building support for the Altera USB-Blaster
 	  using the libftdi driver, opensource alternate of
@@ -178,18 +178,18 @@ config BR2_PACKAGE_OPENOCD_GW16012
 
 config BR2_PACKAGE_OPENOCD_PRESTO
 	bool "ASIX Presto Programmer"
-	select BR2_PACKAGE_LIBFTDI1
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
+	select BR2_PACKAGE_LIBFTDI1
 	help
 	  Enable building support for ASIX Presto Programmer
 	  using the libftdi driver
 
 config BR2_PACKAGE_OPENOCD_OPENJTAG
 	bool "OpenJTAG Programmer"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
 	select BR2_PACKAGE_LIBFTDI1
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT # needs usb.h
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
 	help
 	  Enable building support for the OpenJTAG Programmer
 	  with ftdi driver
diff --git a/package/openpowerlink/Config.in b/package/openpowerlink/Config.in
index d5e9764..68ea751 100644
--- a/package/openpowerlink/Config.in
+++ b/package/openpowerlink/Config.in
@@ -110,8 +110,8 @@ endmenu
 endif # BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_STACK_LIB
 
 config BR2_PACKAGE_OPENPOWERLINK_KERNEL_PCIE_DRIVER
-	depends on BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_PCIE_STACK_LIB
 	bool "PCIe Powerlink Driver"
+	depends on BR2_PACKAGE_OPENPOWERLINK_STACK_KERNEL_PCIE_STACK_LIB
 
 menu "demos"
 
diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index 79c503c..f76bdf2 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -33,11 +33,11 @@ comment "procps support needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS"
 
 config BR2_PACKAGE_OPENVMTOOLS_PAM
 	bool "PAM support"
-	select BR2_PACKAGE_LINUX_PAM
 	# linux-pam needs locale and wchar, but we already have this
 	# dependency on the main symbol, above.
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
+	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Support for PAM in openvmtools
 
diff --git a/package/opkg/Config.in b/package/opkg/Config.in
index 5a4bbc2..a188a7b 100644
--- a/package/opkg/Config.in
+++ b/package/opkg/Config.in
@@ -4,9 +4,9 @@ comment "opkg needs a toolchain w/ wchar"
 
 config BR2_PACKAGE_OPKG
 	bool "opkg"
-	select BR2_PACKAGE_LIBARCHIVE
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR # libarchive
+	select BR2_PACKAGE_LIBARCHIVE
 	help
 	  Opkg is a lightweight package management system, based on ipkg. It is
 	  written in C and resembles apt/dpkg in operation. It is intended for
diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index e2adde5..d99a7e6 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -15,14 +15,14 @@ config BR2_PACKAGE_OPROFILE_NEEDS_LIBPFM4
 config BR2_PACKAGE_OPROFILE
 	bool "oprofile"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_POPT
-	select BR2_PACKAGE_BINUTILS
-	select BR2_PACKAGE_LIBPFM4 if BR2_PACKAGE_OPROFILE_NEEDS_LIBPFM4
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # binutils
 	depends on BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS
 	# libpfm4 is needed on PowerPC, and requires thread support
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_PACKAGE_OPROFILE_NEEDS_LIBPFM4
+	select BR2_PACKAGE_POPT
+	select BR2_PACKAGE_BINUTILS
+	select BR2_PACKAGE_LIBPFM4 if BR2_PACKAGE_OPROFILE_NEEDS_LIBPFM4
 	help
 	  OProfile is a system-wide profiler for Linux systems,
 	  capable of profiling all running code at low overhead.
-- 
2.9.3
