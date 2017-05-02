From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 May 2017 14:36:19 +0200
Subject: [Buildroot] [git commit] package/r*/Config.in: fix ordering of
	statements
Message-ID: <20170502123649.173B982866@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2db9d93282a3c198ddc908082a17f261a48aa7b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter r in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rdesktop/Config.in     | 2 +-
 package/rpcbind/Config.in      | 3 +--
 package/rpi-firmware/Config.in | 4 ++--
 package/rsyslog/Config.in      | 8 ++++----
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/rdesktop/Config.in b/package/rdesktop/Config.in
index f683ed3..0335bee 100644
--- a/package/rdesktop/Config.in
+++ b/package/rdesktop/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_RDESKTOP
 	bool "rdesktop"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXT
-	depends on BR2_PACKAGE_XORG7
 	help
 	  rdesktop is an open source client for Windows NT Terminal
 	  Server and Windows 2000/2003 Terminal Services, capable of
diff --git a/package/rpcbind/Config.in b/package/rpcbind/Config.in
index 9ff64a5..9998200 100644
--- a/package/rpcbind/Config.in
+++ b/package/rpcbind/Config.in
@@ -3,9 +3,8 @@ config BR2_PACKAGE_RPCBIND
 	# We really need libtirpc and can't work with the native RPC
 	# implementation of toolchains.
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc
+	depends on BR2_USE_MMU 	# fork()
 	select BR2_PACKAGE_LIBTIRPC
-	# fork()
-	depends on BR2_USE_MMU
 	help
 	  The rpcbind utility is a server that converts RPC program numbers
 	  into universal addresses.
diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index 7b37a30..4efef86 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -47,8 +47,8 @@ config BR2_PACKAGE_RPI_FIRMWARE_BOOT
 
 config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
 	bool "Install Device Tree Blobs (DTBs)"
-	depends on !BR2_LINUX_KERNEL_DTS_SUPPORT
 	default y
+	depends on !BR2_LINUX_KERNEL_DTS_SUPPORT
 	help
 	  If you are using a Linux kernel <= 3.18, you should say 'y' here.
 
@@ -58,9 +58,9 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
 
 config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 	bool "Install DTB overlays"
+	default y
 	depends on BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS \
 		|| BR2_LINUX_KERNEL_DTS_SUPPORT
-	default y
 	help
 	  Say 'y' here if you need to load one or more of the DTB overlays,
 	  to support HATs (Hardware Attached on Top, add-on modules).
diff --git a/package/rsyslog/Config.in b/package/rsyslog/Config.in
index c4dc97a..8c024e6 100644
--- a/package/rsyslog/Config.in
+++ b/package/rsyslog/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_RSYSLOG
 	bool "rsyslog"
-	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_LIBESTR
-	select BR2_PACKAGE_LIBLOGGING
-	select BR2_PACKAGE_LIBFASTJSON
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # modules
@@ -12,6 +8,10 @@ config BR2_PACKAGE_RSYSLOG
 	# even though rsyslog already depends on threads for itself:
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBESTR
+	select BR2_PACKAGE_LIBLOGGING
+	select BR2_PACKAGE_LIBFASTJSON
 	help
 	  Rsyslog is a powerful and flexible syslog implementation
 
