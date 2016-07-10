From: Carlos Santos <casantos@datacom.ind.br>
Date: Sat,  9 Jul 2016 22:16:06 -0300
Subject: [Buildroot] [PATCH v7 1/3] util-linux: clean up libraries and tools
	selections
In-Reply-To: <1468113369-16118-1-git-send-email-casantos@datacom.ind.br>
References: <20160708205217.GB3757@free.fr>
 <1468113369-16118-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <1468113369-16118-2-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix several problems in the package recipe:

- Make 'bool "lib<foo>"' the first item in each block
- Move the depends before the selects
- Add missing dependencies on BR2_USE_MMU, for fork()
- Put option names corresponding to package/utility/library names in
  lowercase, others start with capital letter
- Improve help for cramfs utilities and login utilities

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/util-linux/Config.in     | 67 ++++++++++++++++++++++++++--------------
 package/util-linux/util-linux.mk |  2 --
 2 files changed, 43 insertions(+), 26 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 429dfa7..3b32bc7 100644
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
 
@@ -37,7 +37,7 @@ config BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	  Install libuuid.
 
 config BR2_PACKAGE_UTIL_LINUX_BINARIES
-	bool "install utilities"
+	bool "Install utilities"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
@@ -50,6 +50,7 @@ if BR2_PACKAGE_UTIL_LINUX_BINARIES
 
 config BR2_PACKAGE_UTIL_LINUX_AGETTY
 	bool "agetty"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Alternative linux getty
 
@@ -75,10 +76,14 @@ config BR2_PACKAGE_UTIL_LINUX_CRAMFS
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
 
@@ -92,13 +97,12 @@ config BR2_PACKAGE_UTIL_LINUX_FDFORMAT
 	help
 	  Low-level format a floppy disk
 
-config BR2_PACKAGE_UTIL_LINUX_FINDFS
-	bool "findfs"
-	help
-	  Find a filesystem by label or UUID
-
 config BR2_PACKAGE_UTIL_LINUX_FSCK
 	bool "fsck"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Check and repair a linux filesystem
 
@@ -123,15 +127,16 @@ config BR2_PACKAGE_UTIL_LINUX_LINE
 	  Read one line
 
 config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
-	bool "login utilities"
+	bool "Login utilities"
+	depends on BR2_USE_MMU # fork() (login, runuser, su, sulogin)
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
-	  Build login utilities (last, login, su, sulogin)
+	  Login utilities (last, login, runuser, su, sulogin)
 
-comment "login utilities needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
+comment "Login utilities needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
 		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
 
@@ -140,11 +145,6 @@ config BR2_PACKAGE_UTIL_LINUX_LOSETUP
 	help
 	  Set up and control loop devices
 
-config BR2_PACKAGE_UTIL_LINUX_LSBLK
-	bool "lsblk"
-	help
-	  List block devices.
-
 config BR2_PACKAGE_UTIL_LINUX_MESG
 	bool "mesg"
 	help
@@ -157,17 +157,26 @@ config BR2_PACKAGE_UTIL_LINUX_MINIX
 
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
 
@@ -183,17 +192,21 @@ config BR2_PACKAGE_UTIL_LINUX_NOLOGIN
 
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
-	bool "partition utilities"
+	bool "Partition utilities"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
-	  Partition tools (addpart, delpart, partx)
+	  Partition utilities (addpart, delpart, partx)
 
 config BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
 	bool "pivot_root"
@@ -216,7 +229,7 @@ config BR2_PACKAGE_UTIL_LINUX_RESET
 	  Reset the terminal
 
 config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
-	bool "schedutils"
+	bool "Scheduling utilities"
 	help
 	  Scheduling utilities (chrt, ionice, taskset)
 
@@ -234,6 +247,7 @@ config BR2_PACKAGE_UTIL_LINUX_SETTERM
 
 config BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT
 	bool "switch_root"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Switch to another filesystem as the root of the mount tree
 
@@ -251,6 +265,7 @@ config BR2_PACKAGE_UTIL_LINUX_UL
 
 config BR2_PACKAGE_UTIL_LINUX_UNSHARE
 	bool "unshare"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Run program with some namespaces unshared from parent
 
@@ -261,16 +276,20 @@ config BR2_PACKAGE_UTIL_LINUX_UTMPDUMP
 
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
 
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 93f45c2..ed734b0 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -72,7 +72,6 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_EJECT),--enable-eject,--disable-eject) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FALLOCATE),--enable-fallocate,--disable-fallocate) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FDFORMAT),--enable-fdformat,--disable-fdformat) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_FINDFS),--enable-findfs,--disable-findfs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FSCK),--enable-fsck,--disable-fsck) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_HWCLOCK),--enable-hwclock,--disable-hwclock) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_KILL),--enable-kill,--disable-kill) \
@@ -84,7 +83,6 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LINE),--enable-line,--disable-line) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-last --enable-login --enable-runuser --enable-su --enable-sulogin,--disable-last --disable-login --disable-runuser --disable-su --disable-sulogin) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOSETUP),--enable-losetup,--disable-losetup) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LSBLK),--enable-lsblk,--disable-lsblk) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MESG),--enable-mesg,--disable-mesg) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MINIX),--enable-minix,--disable-minix) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MORE),--enable-more,--disable-more) \
-- 
2.7.4
