From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue,  5 Jul 2016 23:55:19 -0300
Subject: [Buildroot] [PATCH v6] util-linux: rework utilities menu for finer
	control
In-Reply-To: <1275872201.8394962.1467773032223.JavaMail.zimbra@datacom.ind.br>
References: <1275872201.8394962.1467773032223.JavaMail.zimbra@datacom.ind.br>
Message-ID: <1467773719-10013-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When even a single extra util-linux utility is enabled, the
default build and install will install many more programs,
including many that overlap with those offered by busybox.

Fix by reworking the install-utilies menu to take advantage
of the new --disable-all-programs config option.  This option
make it possible to disable the basic set of apps, and then
enable only the desired apps.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---

Changes v1 -> v2:
  - Rework to incorporate ideas and suggestions from Thomas Petazzoni
    and Arnout Vandecappelle.  At least, in spirit.

Changes v2 -> v3:
  - Change BR2_PACKAGE_UTIL_LINUX_SELECTED_BINARIES to
    BR2_PACKAGE_UTIL_LINUX_BINARIES, to conserve backwards-
    compatibility without need for a legacy option.
  - Enable 'Basic set' by default to match output of previous
    build when binaries were selected.

Changes v3 -> v4:
  - Rework to apply on top of master branch

Changes v4 -> v5:
  - Add option to control installation of libfdisk.
  - Fine-grained selection of libraries in custom selection of
    utilities.
  - Document that linux32, linux64, uname26, i386 and x86_64 are
    setarch aliases.
  - Add options to instal cal, ipcrm, ipcs, logger, lslogin and pg.
  - Remove options to install findfs and lsblk because there are no
    corresponding --enable- and --disable- configure options.

CHanges v5 -> v6:
  - Make 'bool "lib<foo>"' the first item in each block
  - Add several missing dependencies on BR2_USE_MMU, for fork()
  - Options corresponding to package/utility/library names in
    lowercase (do the same for "none", "all" and "custom")
  - Improve help for cramfs utilities and login utilities

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/util-linux/Config.in     | 158 ++++++++++++++++++++++++++++++++-------
 package/util-linux/util-linux.mk |  23 +++---
 2 files changed, 144 insertions(+), 37 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 429dfa7..3a56f7c 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -12,22 +12,30 @@ menuconfig BR2_PACKAGE_UTIL_LINUX
 if BR2_PACKAGE_UTIL_LINUX
 
 config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
-	depends on BR2_USE_MMU # fork
 	bool "libblkid"
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	depends on BR2_USE_MMU # fork()
 	help
 	  Install libblkid.
 
-config BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+config BR2_PACKAGE_UTIL_LINUX_LIBFDISK
+	bool "libfdisk"
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	depends on BR2_USE_MMU # util-linux/libblkid
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	depends on BR2_USE_MMU # fork()
+	help
+	  Install libfdisk.
+
+config BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
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
 
@@ -36,20 +44,65 @@ config BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Install libuuid.
 
-config BR2_PACKAGE_UTIL_LINUX_BINARIES
-	bool "install utilities"
+choice
+	prompt "Install utilities"
+	default BR2_PACKAGE_UTIL_LINUX_NO_BINARIES
+
+config BR2_PACKAGE_UTIL_LINUX_NO_BINARIES
+	bool "none"
+	help
+	  Disable all util-linux binaries.
+
+config BR2_PACKAGE_UTIL_LINUX_ALL_BINARIES
+	bool "all"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
-	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID     # findmnt, etc
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT     # findmnt, etc
+	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK     # fdisk, etc
+	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS # findmnt, etc
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID      # findmnt, etc
+	select BR2_PACKAGE_LINUX_PAM  # login utils
+	select BR2_PACKAGE_ZLIB  # cramfs
+	select BR2_PACKAGE_NCURSES  # more, setterm, ul
+	select BR2_PACKAGE_LIBCAP_NG  # setpriv
+	help
+	  Install the complete set of util-linux binaries.
+
+config BR2_PACKAGE_UTIL_LINUX_BINARIES
+	bool "custom"
 	help
-	  Install the basic set of util-linux binaries.
+	  Manually select which util-linux binaries to install.
+
+endchoice
 
 if BR2_PACKAGE_UTIL_LINUX_BINARIES
 
+config BR2_PACKAGE_UTIL_LINUX_BASIC_SET
+	bool "Basic set"
+	default y
+	depends on BR2_USE_MMU # fork() (dmesg, flock, script, setsid, swapon)
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID     # findmnt, etc
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT     # findmnt, etc
+	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK     # fdisk, etc
+	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS # findmnt, etc
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID      # findmnt, etc
+	help
+	  Install a basic set of util-linux binaries.
+
+	  blkdiscard, blkid, blockdev, chcpu, col, colcrt, colrm,
+	  column, ctrlaltdel, dmesg, fdisk, findfs, findmnt, flock,
+	  fsfreeze, fstrim, getopt, hexdump, ipcmk, isosize, ldattach,
+	  look, lsblk, lscpu, lsipc, lslocks, lsns, mcookie, mkfs,
+	  mkswap, namei, prlimit, readprofile, renice, rev, rtcwake,
+	  script, scriptreplay, setarch, setsid, sfdisk, swaplabel,
+	  swapoff, swapon, tailf, uuidgen, whereis, wipefs
+
+	  The setarch utility may also install architecture-specific
+	  "aliases" like linux32, linux64, uname26, i386 and x86_64.
+
 config BR2_PACKAGE_UTIL_LINUX_AGETTY
 	bool "agetty"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Alternative linux getty
 
@@ -58,6 +111,11 @@ config BR2_PACKAGE_UTIL_LINUX_BFS
 	help
 	  SCO bfs filesystem support
 
+config BR2_PACKAGE_UTIL_LINUX_CAL
+	bool "cal"
+	help
+	  Display a calendar, or some part of it
+
 config BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH
 	bool "chfn/chsh"
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
@@ -75,10 +133,14 @@ config BR2_PACKAGE_UTIL_LINUX_CRAMFS
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
 
@@ -92,13 +154,12 @@ config BR2_PACKAGE_UTIL_LINUX_FDFORMAT
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
 
@@ -107,6 +168,16 @@ config BR2_PACKAGE_UTIL_LINUX_HWCLOCK
 	help
 	  Query or set the hardware clock (RTC)
 
+config BR2_PACKAGE_UTIL_LINUX_IPCRM
+	bool "ipcrm"
+	help
+	  Remove certain IPC resources
+
+config BR2_PACKAGE_UTIL_LINUX_IPCS
+	bool "ipcs"
+	help
+	  Show information on IPC facilities
+
 config BR2_PACKAGE_UTIL_LINUX_KILL
 	bool "kill"
 	help
@@ -123,27 +194,33 @@ config BR2_PACKAGE_UTIL_LINUX_LINE
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
 
+config BR2_PACKAGE_UTIL_LINUX_LOGGER
+	bool "logger"
+	help
+	  Enter messages into the system log
+
 config BR2_PACKAGE_UTIL_LINUX_LOSETUP
 	bool "losetup"
 	help
 	  Set up and control loop devices
 
-config BR2_PACKAGE_UTIL_LINUX_LSBLK
-	bool "lsblk"
+config BR2_PACKAGE_UTIL_LINUX_LSLOGINS
+	bool "lslogin"
 	help
-	  List block devices.
+	  Display information about known users in the system
 
 config BR2_PACKAGE_UTIL_LINUX_MESG
 	bool "mesg"
@@ -157,17 +234,26 @@ config BR2_PACKAGE_UTIL_LINUX_MINIX
 
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
 
@@ -183,17 +269,27 @@ config BR2_PACKAGE_UTIL_LINUX_NOLOGIN
 
 config BR2_PACKAGE_UTIL_LINUX_NSENTER
 	bool "nsenter"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	help
-	  Enter the namespaces of another process.
+	  Enter the namespaces of another process
 
 comment "nsenter needs a toolchain w/ headers >= 3.0"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
+config BR2_PACKAGE_UTIL_LINUX_PG
+	bool "pg"
+	depends on BR2_USE_MMU # fork()
+	help
+	  Browse pagewise through text files
+
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
@@ -216,7 +312,7 @@ config BR2_PACKAGE_UTIL_LINUX_RESET
 	  Reset the terminal
 
 config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
-	bool "schedutils"
+	bool "Scheduling utilities"
 	help
 	  Scheduling utilities (chrt, ionice, taskset)
 
@@ -234,6 +330,7 @@ config BR2_PACKAGE_UTIL_LINUX_SETTERM
 
 config BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT
 	bool "switch_root"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Switch to another filesystem as the root of the mount tree
 
@@ -251,6 +348,7 @@ config BR2_PACKAGE_UTIL_LINUX_UL
 
 config BR2_PACKAGE_UTIL_LINUX_UNSHARE
 	bool "unshare"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Run program with some namespaces unshared from parent
 
@@ -261,16 +359,20 @@ config BR2_PACKAGE_UTIL_LINUX_UTMPDUMP
 
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
index 93f45c2..d979852 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -63,18 +63,26 @@ UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 # Used by login-utils
 UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_LINUX_PAM),linux-pam)
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_NO_BINARIES),y)
+UTIL_LINUX_CONF_OPTS += --disable-all-programs
+else ifeq ($(BR2_PACKAGE_UTIL_LINUX_ALL_BINARIES),y)
+UTIL_LINUX_CONF_OPTS += --enable-all-programs
+else
 # Disable/Enable utilities
 UTIL_LINUX_CONF_OPTS += \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_BASIC_SET),,--disable-all-programs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_AGETTY),--enable-agetty,--disable-agetty) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_BFS),--enable-bfs,--disable-bfs) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_CAL),--enable-cal,--disable-cal) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH),--enable-chfn-chsh,--disable-chfn-chsh) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CRAMFS),--enable-cramfs,--disable-cramfs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_EJECT),--enable-eject,--disable-eject) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FALLOCATE),--enable-fallocate,--disable-fallocate) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FDFORMAT),--enable-fdformat,--disable-fdformat) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_FINDFS),--enable-findfs,--disable-findfs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FSCK),--enable-fsck,--disable-fsck) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_HWCLOCK),--enable-hwclock,--disable-hwclock) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCRM),--enable-ipcrm,--disable-ipcrm) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCS),--enable-ipcs,--disable-ipcs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_KILL),--enable-kill,--disable-kill) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LAST),--enable-last,--disable-last) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),--enable-libblkid,--disable-libblkid) \
@@ -83,8 +91,9 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBUUID),--enable-libuuid,--disable-libuuid) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LINE),--enable-line,--disable-line) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-last --enable-login --enable-runuser --enable-su --enable-sulogin,--disable-last --disable-login --disable-runuser --disable-su --disable-sulogin) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGGER),--enable-logger,--disable-logger) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOSETUP),--enable-losetup,--disable-losetup) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LSBLK),--enable-lsblk,--disable-lsblk) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LSLOGINS),--enable-lslogins,--disable-lslogins) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MESG),--enable-mesg,--disable-mesg) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MINIX),--enable-minix,--disable-minix) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MORE),--enable-more,--disable-more) \
@@ -94,6 +103,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_NOLOGIN),--enable-nologin,--disable-nologin) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_NSENTER),--enable-nsenter,--disable-nsenter) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_PARTX),--enable-partx,--disable-partx) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_PG),--enable-pg,--disable-pg) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT),--enable-pivot_root,--disable-pivot_root) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_RAW),--enable-raw,--disable-raw) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_RENAME),--enable-rename,--disable-rename) \
@@ -112,6 +122,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WDCTL),--enable-wdctl,--disable-wdctl) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write,--disable-write) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_ZRAMCTL),--enable-zramctl,--disable-zramctl)
+endif
 
 # In the host version of util-linux, we so far only require libuuid,
 # and none of the util-linux utilities, so we disable all of them, unless
@@ -130,12 +141,6 @@ else
 HOST_UTIL_LINUX_CONF_OPTS += --disable-all-programs
 endif
 
-# Avoid building the tools if they are disabled since we can't install on
-# a per-directory basis.
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_BINARIES),)
-UTIL_LINUX_CONF_OPTS += --disable-all-programs
-endif
-
 # Install libmount Python bindings
 ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
 UTIL_LINUX_CONF_OPTS += --with-python
@@ -162,7 +167,7 @@ endif
 UTIL_LINUX_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_INSTALL_PAMFILES
 
 # Install agetty->getty symlink to avoid breakage when there's no busybox
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_AGETTY),y)
+ifneq ($(BR2_PACKAGE_UTIL_LINUX_ALL_BINARIES)$(BR2_PACKAGE_UTIL_LINUX_AGETTY),)
 ifeq ($(BR2_PACKAGE_BUSYBOX),)
 define UTIL_LINUX_GETTY_SYMLINK
 	ln -sf agetty $(TARGET_DIR)/sbin/getty
-- 
2.7.4
