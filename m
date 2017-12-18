From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 09:24:38 +0100
Subject: [Buildroot] [git commit] package/*/Config.in: fix property order
 warning of check-package
Message-ID: <20171218083058.63BA181054@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1610200e7863a73dafac7890bc339bea47605c05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes the ordering of the Config.in option properties, as
reported by check-package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dfu-util/Config.in            | 2 +-
 package/gettext/Config.in             | 2 +-
 package/gstreamer1/gst1-imx/Config.in | 2 +-
 package/ifupdown-scripts/Config.in    | 2 +-
 package/luajit/Config.in              | 6 +++---
 package/lvm2/Config.in                | 2 +-
 package/qt5/qt5charts/Config.in       | 2 +-
 package/selinux-python/Config.in      | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/dfu-util/Config.in b/package/dfu-util/Config.in
index 2f45fcd..201c8a7 100644
--- a/package/dfu-util/Config.in
+++ b/package/dfu-util/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_DFU_UTIL
 	bool "dfu-util"
-	select BR2_PACKAGE_LIBUSB
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBUSB
 	help
 	  Dfu-util is the host side implementation of the DFU 1.0
 	  specification of the USB forum. DFU is intended to download
diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index 60f8d4f..e55663b 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -16,8 +16,8 @@ if BR2_PACKAGE_GETTEXT
 
 config BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL
 	bool
-	depends on !BR2_TOOLCHAIN_HAS_FULL_GETTEXT
 	default y if BR2_SYSTEM_ENABLE_NLS
+	depends on !BR2_TOOLCHAIN_HAS_FULL_GETTEXT
 
 endif
 
diff --git a/package/gstreamer1/gst1-imx/Config.in b/package/gstreamer1/gst1-imx/Config.in
index f64ed71..e4cee05 100644
--- a/package/gstreamer1/gst1-imx/Config.in
+++ b/package/gstreamer1/gst1-imx/Config.in
@@ -87,8 +87,8 @@ config BR2_PACKAGE_GST1_IMX_V4L2VIDEOSRC
 
 config BR2_PACKAGE_GST1_IMX_V4L2VIDEOSINK
 	bool "imxv4l2videosink"
-	select BR2_PACKAGE_GST1_PLUGINS_BAD
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_2 # V4L2_COLORSPACE_DEFAULT
+	select BR2_PACKAGE_GST1_PLUGINS_BAD
 	help
 	  Elements for V4L2 output
 
diff --git a/package/ifupdown-scripts/Config.in b/package/ifupdown-scripts/Config.in
index 9cd0395..2f4b0d5 100644
--- a/package/ifupdown-scripts/Config.in
+++ b/package/ifupdown-scripts/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_IFUPDOWN_SCRIPTS
 	bool "ifupdown scripts"
-	depends on !BR2_PACKAGE_SYSTEMD_NETWORKD
 	default y if BR2_ROOTFS_SKELETON_DEFAULT
+	depends on !BR2_PACKAGE_SYSTEMD_NETWORKD
 	help
 	  Set of scripts used by ifupdown (either the standalone one,
 	  or the busybox one) to bring network up, or tear it down.
diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 6b9c6e6..7e792c5 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	bool
-	# -m32 flag is used for 32bit builds and host-luajit has
-	# limited architecture support
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	default y if BR2_i386 || \
 		(BR2_x86_64 && BR2_HOSTARCH='x86_64') || \
 		BR2_powerpc || BR2_arm || BR2_armeb || \
 		((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT && \
 		!BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6)
+	# -m32 flag is used for 32bit builds and host-luajit has
+	# limited architecture support
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 
 config BR2_PACKAGE_LUAJIT
 	bool "luajit"
diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index 2fa3fc1..0dd6d53 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -25,9 +25,9 @@ if BR2_PACKAGE_LVM2
 
 config BR2_PACKAGE_LVM2_STANDARD_INSTALL
 	bool "standard install instead of only dmsetup"
+	default y if !BR2_PACKAGE_LVM2_DMSETUP_ONLY # legacy 2013.11
 	# http://lists.busybox.net/pipermail/buildroot/2016-August/170592.html
 	depends on !BR2_TOOLCHAIN_USES_MUSL
-	default y if !BR2_PACKAGE_LVM2_DMSETUP_ONLY # legacy 2013.11
 	help
 	  Install the standard suite of lvm2 programs. When this option
 	  is not set, only dmsetup is installed.
diff --git a/package/qt5/qt5charts/Config.in b/package/qt5/qt5charts/Config.in
index 4a6c356..78f08fe 100644
--- a/package/qt5/qt5charts/Config.in
+++ b/package/qt5/qt5charts/Config.in
@@ -3,10 +3,10 @@ comment "qt5charts needs at least qt-5.7"
 
 config BR2_PACKAGE_QT5CHARTS
 	bool "qt5charts"
+	depends on BR2_PACKAGE_QT5_VERSION_LATEST
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_WIDGETS
-	depends on BR2_PACKAGE_QT5_VERSION_LATEST
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/selinux-python/Config.in b/package/selinux-python/Config.in
index e453450..b9fab9a 100644
--- a/package/selinux-python/Config.in
+++ b/package/selinux-python/Config.in
@@ -1,10 +1,10 @@
 menuconfig BR2_PACKAGE_SELINUX_PYTHON
 	bool "selinux-python"
-	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
 	depends on BR2_USE_MMU
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
 	help
 	  A set of SELinux tools written in python that help with
 	  managing a system with SELinux enabled. If no packages are
