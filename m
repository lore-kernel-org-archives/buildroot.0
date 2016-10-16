From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 15:53:53 +0200
Subject: [Buildroot] [git commit] util-linux: clean up libraries and tools
	selections
Message-ID: <20161016135433.6568C8197C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e10c7324c7273163bd4abc6128e85e9f790793a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix several problems in the package recipe:

- Make 'bool "lib<foo>"' the first item in each block
- Move the depends before the selects
- Add missing dependencies on BR2_USE_MMU, for fork()
- Improve help for cramfs utilities and login utilities

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
[Thomas:
 - remove capitalization of prompts, for consistency
 - add missing dependencies on libsmartcols, and therefore !MMU]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/Config.in | 55 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 10 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index b2307f4..8945b7f 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -12,22 +12,22 @@ menuconfig BR2_PACKAGE_UTIL_LINUX
 if BR2_PACKAGE_UTIL_LINUX
 
 config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	depends on BR2_USE_MMU # fork
 	bool "libblkid"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Install libblkid.
 
 config BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	depends on BR2_USE_MMU # util-linux/libblkid
 	bool "libmount"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	help
 	  Install libmount.
 
 config BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	bool "libsmartcols"
-	depends on BR2_USE_MMU # fork
+	depends on BR2_USE_MMU # fork()
 	help
 	  Install libsmartcols.
 
@@ -50,6 +50,7 @@ if BR2_PACKAGE_UTIL_LINUX_BINARIES
 
 config BR2_PACKAGE_UTIL_LINUX_AGETTY
 	bool "agetty"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Alternative linux getty
 
@@ -76,10 +77,14 @@ config BR2_PACKAGE_UTIL_LINUX_CRAMFS
 	bool "cramfs utilities"
 	select BR2_PACKAGE_ZLIB
 	help
-	  Build fsck.cramfs and mkfs.cramfs
+	  Utilities for compressed ROM file system (fsck.cramfs, mkfs.cramfs)
 
 config BR2_PACKAGE_UTIL_LINUX_EJECT
 	bool "eject"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Eject removable media
 
@@ -95,6 +100,10 @@ config BR2_PACKAGE_UTIL_LINUX_FDFORMAT
 
 config BR2_PACKAGE_UTIL_LINUX_FSCK
 	bool "fsck"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Check and repair a linux filesystem
 
@@ -120,13 +129,14 @@ config BR2_PACKAGE_UTIL_LINUX_LINE
 
 config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
 	bool "login utilities"
+	depends on BR2_USE_MMU # fork() (login, runuser, su, sulogin)
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on BR2_USE_MMU # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
-	  Build login utilities (last, login, su, sulogin)
+	  Login utilities (last, login, runuser, su, sulogin)
 
 comment "login utilities needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
@@ -134,6 +144,8 @@ comment "login utilities needs a uClibc or glibc toolchain w/ wchar, locale, dyn
 
 config BR2_PACKAGE_UTIL_LINUX_LOSETUP
 	bool "losetup"
+	depends on BR2_USE_MMU # libsmartcols
+	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	help
 	  Set up and control loop devices
 
@@ -149,17 +161,26 @@ config BR2_PACKAGE_UTIL_LINUX_MINIX
 
 config BR2_PACKAGE_UTIL_LINUX_MORE
 	bool "more"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	help
 	  File perusal filter for crt viewing
 
 config BR2_PACKAGE_UTIL_LINUX_MOUNT
 	bool "mount/umount"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Mount/unmount filesystems
 
 config BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT
 	bool "mountpoint"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  See if a directory is a mountpoint
 
@@ -175,17 +196,21 @@ config BR2_PACKAGE_UTIL_LINUX_NOLOGIN
 
 config BR2_PACKAGE_UTIL_LINUX_NSENTER
 	bool "nsenter"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	help
-	  Enter the namespaces of another process.
+	  Enter the namespaces of another process
 
 comment "nsenter needs a toolchain w/ headers >= 3.0"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
 config BR2_PACKAGE_UTIL_LINUX_PARTX
 	bool "partition utilities"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
-	  Partition tools (addpart, delpart, partx)
+	  Partition utilities (addpart, delpart, partx)
 
 config BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
 	bool "pivot_root"
@@ -208,7 +233,7 @@ config BR2_PACKAGE_UTIL_LINUX_RESET
 	  Reset the terminal
 
 config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
-	bool "schedutils"
+	bool "scheduling utilities"
 	help
 	  Scheduling utilities (chrt, ionice, taskset)
 
@@ -226,6 +251,7 @@ config BR2_PACKAGE_UTIL_LINUX_SETTERM
 
 config BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT
 	bool "switch_root"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Switch to another filesystem as the root of the mount tree
 
@@ -243,6 +269,7 @@ config BR2_PACKAGE_UTIL_LINUX_UL
 
 config BR2_PACKAGE_UTIL_LINUX_UNSHARE
 	bool "unshare"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Run program with some namespaces unshared from parent
 
@@ -253,21 +280,27 @@ config BR2_PACKAGE_UTIL_LINUX_UTMPDUMP
 
 config BR2_PACKAGE_UTIL_LINUX_UUIDD
 	bool "uuidd"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  UUID generation daemon
 
 config BR2_PACKAGE_UTIL_LINUX_VIPW
 	bool "vipw"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Edit the password, group, shadow-password or shadow-group file
 
 config BR2_PACKAGE_UTIL_LINUX_WALL
 	bool "wall"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Send a message to everybody's terminal
 
 config BR2_PACKAGE_UTIL_LINUX_WDCTL
 	bool "wdctl"
+	depends on BR2_USE_MMU # libsmartcols
+	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	help
 	  Shows hardware watchdog status
 
@@ -278,6 +311,8 @@ config BR2_PACKAGE_UTIL_LINUX_WRITE
 
 config BR2_PACKAGE_UTIL_LINUX_ZRAMCTL
 	bool "zramctl"
+	depends on BR2_USE_MMU # libsmartcols
+	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	help
 	  Set up and control zram devices
 
