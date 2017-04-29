From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 21:17:55 +0200
Subject: [Buildroot] [git commit] package/f*/Config.in: fix ordering of
	statements
Message-ID: <20170429191812.547F180468@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7e7bf72a7ddbd72041090ae6ba97778f7b96948
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter f in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/f2fs-tools/Config.in                     | 2 +-
 package/faifa/Config.in                          | 2 +-
 package/fastd/Config.in                          | 2 +-
 package/fetchmail/Config.in                      | 2 +-
 package/ffmpeg/Config.in                         | 2 +-
 package/filemq/Config.in                         | 6 +++---
 package/flashrom/Config.in                       | 4 ++--
 package/freescale-imx/gpu-amd-bin-mx51/Config.in | 8 ++++----
 package/freescale-imx/imx-gpu-viv/Config.in      | 6 +++---
 9 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/package/f2fs-tools/Config.in b/package/f2fs-tools/Config.in
index ab81734..f0630e9 100644
--- a/package/f2fs-tools/Config.in
+++ b/package/f2fs-tools/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_F2FS_TOOLS
 	bool "f2fs-tools"
+	depends on BR2_USE_WCHAR # uses wchar_t
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	depends on BR2_USE_WCHAR # uses wchar_t
 	help
 	  Tools for Flash-Friendly File System (F2FS)
 
diff --git a/package/faifa/Config.in b/package/faifa/Config.in
index de2cc79..753abc6 100644
--- a/package/faifa/Config.in
+++ b/package/faifa/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_FAIFA
 	bool "faifa"
-	select BR2_PACKAGE_LIBPCAP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBPCAP
 	help
 	  Faifa can configure any Intellon-based Power Line
 	  Communication device using Intellon INT5000 and INT6000
diff --git a/package/fastd/Config.in b/package/fastd/Config.in
index 546d449..47c76b5 100644
--- a/package/fastd/Config.in
+++ b/package/fastd/Config.in
@@ -16,8 +16,8 @@ if BR2_PACKAGE_FASTD
 config BR2_PACKAGE_FASTD_STATUS_SOCKET
 	bool "status socket support"
 	default y
-	select BR2_PACKAGE_JSON_C
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	select BR2_PACKAGE_JSON_C
 	help
 	  Enable support for a socket to get fastd's status.
 
diff --git a/package/fetchmail/Config.in b/package/fetchmail/Config.in
index 1eb0359..1e829a0 100644
--- a/package/fetchmail/Config.in
+++ b/package/fetchmail/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_FETCHMAIL
 	bool "fetchmail"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_CA_CERTIFICATES
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	depends on BR2_USE_MMU # fork()
 	help
 	  Fetchmail - the mail-retrieval daemon
 	  Client daemon to move mail from POP and IMAP to your local computer
diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index b5850db..383374d 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -40,9 +40,9 @@ config BR2_PACKAGE_FFMPEG_FFMPEG
 
 config BR2_PACKAGE_FFMPEG_FFPLAY
 	bool "Build ffplay"
+	depends on !BR2_STATIC_LIBS # sdl2
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	select BR2_PACKAGE_SDL2
-	depends on !BR2_STATIC_LIBS # sdl2
 	help
 	  FFplay is a very simple and portable media player using the
 	  FFmpeg libraries and the SDL library.
diff --git a/package/filemq/Config.in b/package/filemq/Config.in
index e06a267..b4720c1 100644
--- a/package/filemq/Config.in
+++ b/package/filemq/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_FILEMQ
 	bool "filemq"
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_CZMQ
-	select BR2_PACKAGE_ZEROMQ
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	depends on BR2_USE_MMU # czmq
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_CZMQ
+	select BR2_PACKAGE_ZEROMQ
 	help
 	  FileMQ is a publish-subscribe file service based on 0MQ.
 
diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
index adc068c..e7844a0 100644
--- a/package/flashrom/Config.in
+++ b/package/flashrom/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_FLASHROM
 	bool "flashrom"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_PCIUTILS
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	select BR2_PACKAGE_LIBFTDI
 	# dmidecode is only a runtime dependency
 	select BR2_PACKAGE_DMIDECODE
-	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_TOOLCHAIN_HAS_THREADS 	# libusb
 	help
 	  flashrom is a utility for identifying, reading, writing,
 	  verifying and erasing flash chips. It is designed to flash
diff --git a/package/freescale-imx/gpu-amd-bin-mx51/Config.in b/package/freescale-imx/gpu-amd-bin-mx51/Config.in
index 337713c..cd66c73 100644
--- a/package/freescale-imx/gpu-amd-bin-mx51/Config.in
+++ b/package/freescale-imx/gpu-amd-bin-mx51/Config.in
@@ -5,12 +5,12 @@ comment "gpu-amd-bin-mx51 needs a glibc EABI toolchain w/ C++"
 
 config BR2_PACKAGE_GPU_AMD_BIN_MX51
 	bool "gpu-amd-bin-mx51 (also imx53)"
-	select BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_HAS_LIBGLES
-	select BR2_PACKAGE_HAS_LIBOPENVG
 	depends on BR2_ARM_EABI
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_HAS_LIBOPENVG
 	help
 	  Freescale libraries, headers and executables for the
 	  AMD GPU on i.MX5x, containing OpenGL/ES, OpenVG
@@ -26,6 +26,7 @@ choice
 	  Choose here which version to install.
 
 config BR2_PACKAGE_GPU_AMD_BIN_MX51_OUTPUT_X11
+	bool "X11"
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBXCB
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -33,7 +34,6 @@ config BR2_PACKAGE_GPU_AMD_BIN_MX51_OUTPUT_X11
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXDMCP
 	select BR2_PACKAGE_XLIB_LIBXAU
-	bool "X11"
 
 comment "X11 backend needs X.org enabled"
 	depends on !BR2_PACKAGE_XORG7
diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index effb24b..dba378c 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -4,13 +4,13 @@ comment "imx-gpu-viv needs a glibc toolchain with armhf enabled"
 
 config BR2_PACKAGE_IMX_GPU_VIV
 	bool "imx-gpu-viv"
-	select BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_HAS_LIBGLES
-	select BR2_PACKAGE_HAS_LIBOPENVG
 	# Pre-built binaries only available for ARM EABIhf
 	depends on BR2_ARM_EABIHF
 	# Library binaries are linked against libc.so.6
 	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_HAS_LIBOPENVG
 	help
 	  Userspace libraries for Vivante GPU on i.MX6 platforms
 
