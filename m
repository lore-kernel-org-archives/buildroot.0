From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 21 Aug 2019 00:48:07 +0200
Subject: [Buildroot] [git commit] package/util-linux: build programs and
 libraries in separate packages
Message-ID: <20190903133621.869B88A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=335c77b667c68975b65edd0ac0d6ec214a9cb1c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The findmount and lsblk utilities need udev to work correctly but cannot
be built with udev support because the packages providing libudev (eudev
and systemd) depend on util-linux, creating a chicken-egg problem. Solve
it by means of the following changes:

- Split util-linux into three packages:
  - util-linux-libs, providing lib{blkid,fdisk,mount,smartcols,uuid}.
  - util-linux-programs, providing both the aforementioned libs and the
    programs.
  - util-linux, a dummy package that drives configuration and building
    of the other ones.
- Add blind selections for -libs and -programs, i.e. they are indirectly
  selected according to the util-linux options.
- Make util-linux have build dependencies on util-linux-{libs,programs}
  if they are selected.
- host-util-linux has a build dependency on either host-util-linux-libs
  or host-util-linux-programs (not on both, since they are installed on
  the same destination).
- Make eudev and systemd have build dependencies on util-linux-libs.
  This can be extended to other packages in the future but is not needed
  right now because the configuration options are backward-compatible.
- Make util-linux-programs have an optional build dependency on the
  package that provides libudev (either eudev or systemd), if it is
  selected.

util-linux-libs is installed on STAGING_DIR by default and on TARGET_DIR
if util-linux-programs is not selected. Conversely, util-linux-programs
installs on TARGET_DIR by default and on STAGING_DIR if util-linux-libs
is not selected. This prevents installing the libraries twice on the
same destination, which would confuse check-uniq-files.

With this approach we don't need to patch configuration files neither
change other packages besides eudev and systemd. Other packages that
require util-linux libraries and whose libraries can be used by
util-linux programs can be updated later. We also don't need to change
any existing defcconfig, since all configuration options are kept in
the dummy util-linux package.

The main drawback of this approach is that util-linux-rebuild, as wel as
-reinstall, -reconfigure and even -dirclean targets do not have real
effect. It's necessary to use util-linux-libs-rebuild, for instance, but
this is a reasonable price to pay for the solution.

Fixes: https://bugs.busybox.net/show_bug.cgi?id=11811

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/eudev/Config.in                            |   1 +
 package/eudev/eudev.mk                             |   3 +-
 package/systemd/Config.in                          |   1 +
 package/systemd/systemd.mk                         |   4 +-
 package/util-linux/Config.in                       |  59 +++++
 .../util-linux-libs/util-linux-libs.hash           |   1 +
 .../util-linux/util-linux-libs/util-linux-libs.mk  |  91 +++++++
 .../util-linux/{ => util-linux-programs}/su.pam    |   0
 .../util-linux-programs/util-linux-programs.hash   |   1 +
 .../util-linux-programs.mk}                        | 139 ++++++-----
 package/util-linux/util-linux.mk                   | 269 ++-------------------
 11 files changed, 251 insertions(+), 318 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 2220265a55..2df94fb68c 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_EUDEV
 	depends on !BR2_STATIC_LIBS # kmod
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_KMOD
 	help
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 78d0ea670e..21860643ae 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -18,7 +18,8 @@ EUDEV_CONF_OPTS = \
 	--enable-kmod \
 	--enable-blkid
 
-EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod
+# eudev requires only the util-linux libraries at build time
+EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux-libs kmod
 EUDEV_PROVIDES = udev
 
 ifeq ($(BR2_ROOTFS_MERGED_USR),)
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index ad72a269ef..e8444e4e0b 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -23,6 +23,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_DBUS # runtime dependency only
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_UTIL_LINUX_BINARIES
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b6aac6dc53..20a6c1b714 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -9,12 +9,14 @@ SYSTEMD_SITE = $(call github,systemd,systemd,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
 SYSTEMD_INSTALL_STAGING = YES
+
+# systemd requires only the util-linux libraries at build time
 SYSTEMD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_BASH_COMPLETION),bash-completion) \
 	host-gperf \
 	kmod \
 	libcap \
-	util-linux \
+	util-linux-libs \
 	$(TARGET_NLS_DEPENDENCIES)
 
 SYSTEMD_PROVIDES = udev
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 39eb2c03a0..a76ffeb518 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -9,6 +9,9 @@ menuconfig BR2_PACKAGE_UTIL_LINUX
 
 if BR2_PACKAGE_UTIL_LINUX
 
+config BR2_PACKAGE_UTIL_LINUX_LIBS
+	bool
+
 config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	bool "libblkid"
 	depends on BR2_USE_MMU # fork()
@@ -41,6 +44,9 @@ config BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Install libuuid.
 
+config BR2_PACKAGE_UTIL_LINUX_PROGRAMS
+	bool
+
 config BR2_PACKAGE_UTIL_LINUX_BINARIES
 	bool "basic set"
 	depends on BR2_USE_MMU # fork()
@@ -49,6 +55,7 @@ config BR2_PACKAGE_UTIL_LINUX_BINARIES
 	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
 	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Install the basic set of util-linux binaries.
 
@@ -67,16 +74,19 @@ config BR2_PACKAGE_UTIL_LINUX_BINARIES
 config BR2_PACKAGE_UTIL_LINUX_AGETTY
 	bool "agetty"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Alternative linux getty
 
 config BR2_PACKAGE_UTIL_LINUX_BFS
 	bool "bfs"
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  SCO bfs filesystem support
 
 config BR2_PACKAGE_UTIL_LINUX_CAL
 	bool "cal"
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Display a calendar, or some part of it
 
@@ -87,6 +97,7 @@ config BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on BR2_USE_MMU # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Change login shell, real user name and information
 
@@ -96,11 +107,13 @@ comment "chfn/chsh needs a uClibc or glibc toolchain w/ wchar, locale, dynamic l
 
 config BR2_PACKAGE_UTIL_LINUX_CHMEM
 	bool "chmem"
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Sets a particular size or range of memory online or offline
 
 config BR2_PACKAGE_UTIL_LINUX_CRAMFS
 	bool "cramfs utilities"
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	select BR2_PACKAGE_ZLIB
 	help
 	  Utilities for compressed ROM file system (fsck.cramfs,
@@ -112,16 +125,19 @@ config BR2_PACKAGE_UTIL_LINUX_EJECT
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Eject removable media
 
 config BR2_PACKAGE_UTIL_LINUX_FALLOCATE
 	bool "fallocate"
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Preallocate space to a file
 
 config BR2_PACKAGE_UTIL_LINUX_FDFORMAT
 	bool "fdformat"
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Low-level format a floppy disk
 
@@ -131,6 +147,7 @@ config BR2_PACKAGE_UTIL_LINUX_FSCK
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Check and repair a linux filesystem
 
@@ -141,36 +158,43 @@ config BR2_PACKAGE_UTIL_LINUX_HARDLINK
 
 config BR2_PACKAGE_UTIL_LINUX_HWCLOCK
 	bool "hwclock"
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Query or set the hardware clock (RTC)
 
 config BR2_PACKAGE_UTIL_LINUX_IPCRM
 	bool "ipcrm"
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Remove certain IPC resources
 
 config BR2_PACKAGE_UTIL_LINUX_IPCS
 	bool "ipcs"
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Show information on IPC facilities
 
 config BR2_PACKAGE_UTIL_LINUX_KILL
 	bool "kill"
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Send a signal to a process
 
 config BR2_PACKAGE_UTIL_LINUX_LAST
 	bool "last"
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Show a listing of last logged in users
 
 config BR2_PACKAGE_UTIL_LINUX_LINE
 	bool "line"
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Read one line
 
 config BR2_PACKAGE_UTIL_LINUX_LOGGER
 	bool "logger"
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Enter messages into the system log
 
@@ -182,6 +206,7 @@ config BR2_PACKAGE_UTIL_LINUX_LOGIN
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on BR2_USE_MMU # fork(), linux-pam
 	select BR2_PACKAGE_LINUX_PAM
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Begin a session on the system
 
@@ -193,6 +218,7 @@ config BR2_PACKAGE_UTIL_LINUX_LOSETUP
 	bool "losetup"
 	depends on BR2_USE_MMU # libsmartcols
 	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Set up and control loop devices
 
@@ -200,6 +226,7 @@ config BR2_PACKAGE_UTIL_LINUX_LSLOGINS
 	bool "lslogins"
 	depends on BR2_USE_MMU # libsmartcols
 	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Display information about known users in the system
 
@@ -207,17 +234,20 @@ config BR2_PACKAGE_UTIL_LINUX_LSMEM
 	bool "lsmem"
 	depends on BR2_USE_MMU # libsmartcols
 	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  List the ranges of available memory with their online status
 
 config BR2_PACKAGE_UTIL_LINUX_MESG
 	bool "mesg"
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Control write access to your terminal
 
 config BR2_PACKAGE_UTIL_LINUX_MINIX
 	bool "minix"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Minix filesystem support
 
@@ -225,6 +255,7 @@ config BR2_PACKAGE_UTIL_LINUX_MORE
 	bool "more"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  File perusal filter for crt viewing
 
@@ -234,6 +265,7 @@ config BR2_PACKAGE_UTIL_LINUX_MOUNT
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Mount/unmount filesystems
 
@@ -243,16 +275,19 @@ config BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  See if a directory is a mountpoint
 
 config BR2_PACKAGE_UTIL_LINUX_NEWGRP
 	bool "newgrp"
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Log in to a new group
 
 config BR2_PACKAGE_UTIL_LINUX_NOLOGIN
 	bool "nologin"
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Politely refuse a login
 
@@ -260,6 +295,7 @@ config BR2_PACKAGE_UTIL_LINUX_NSENTER
 	bool "nsenter"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Enter the namespaces of another process
 
@@ -270,6 +306,7 @@ config BR2_PACKAGE_UTIL_LINUX_PG
 	bool "pg"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Browse pagewise through text files
 
@@ -279,21 +316,25 @@ config BR2_PACKAGE_UTIL_LINUX_PARTX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Partition utilities (addpart, delpart, partx)
 
 config BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
 	bool "pivot_root"
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Change the root filesystem
 
 config BR2_PACKAGE_UTIL_LINUX_RAW
 	bool "raw"
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Build a linux raw character device
 
 config BR2_PACKAGE_UTIL_LINUX_RENAME
 	bool "rename"
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Rename files
 
@@ -301,6 +342,7 @@ config BR2_PACKAGE_UTIL_LINUX_RFKILL
 	bool "rfkill"
 	depends on BR2_USE_MMU # libsmartcols
 	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Tool for enabling and disabling wireless devices. This new
 	  implementation is based upon, and backward compatible with,
@@ -313,6 +355,7 @@ config BR2_PACKAGE_UTIL_LINUX_RUNUSER
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on BR2_USE_MMU # fork(), linux-pam
 	select BR2_PACKAGE_LINUX_PAM
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Run a command with substitute user and group ID (does not need
 	  to ask for a password, because it may be executed by the root
@@ -324,18 +367,21 @@ comment "runuser needs a uClibc or glibc toolchain w/ wchar, locale, dynamic lib
 
 config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
 	bool "scheduling utilities"
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Scheduling utilities (chrt, ionice, taskset)
 
 config BR2_PACKAGE_UTIL_LINUX_SETPRIV
 	bool "setpriv"
 	select BR2_PACKAGE_LIBCAP_NG
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Run a program with different Linux privilege settings
 
 config BR2_PACKAGE_UTIL_LINUX_SETTERM
 	bool "setterm"
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Set terminal attributes
 
@@ -346,6 +392,7 @@ config BR2_PACKAGE_UTIL_LINUX_SU
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on BR2_USE_MMU # fork(), linux-pam
 	select BR2_PACKAGE_LINUX_PAM
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Run a command with substitute user and group ID
 
@@ -356,35 +403,41 @@ comment "su needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
 config BR2_PACKAGE_UTIL_LINUX_SULOGIN
 	bool "sulogin"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Single-user login
 
 config BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT
 	bool "switch_root"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Switch to another filesystem as the root of the mount tree
 
 config BR2_PACKAGE_UTIL_LINUX_TUNELP
 	bool "tunelp"
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Set various parameters for the lp device
 
 config BR2_PACKAGE_UTIL_LINUX_UL
 	bool "ul"
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Do underlining
 
 config BR2_PACKAGE_UTIL_LINUX_UNSHARE
 	bool "unshare"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Run program with some namespaces unshared from parent
 
 config BR2_PACKAGE_UTIL_LINUX_UTMPDUMP
 	bool "utmpdump"
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Dump UTMP and WTMP files in raw format
 
@@ -392,18 +445,21 @@ config BR2_PACKAGE_UTIL_LINUX_UUIDD
 	bool "uuidd"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  UUID generation daemon
 
 config BR2_PACKAGE_UTIL_LINUX_VIPW
 	bool "vipw"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Edit the password, group, shadow-password or shadow-group file
 
 config BR2_PACKAGE_UTIL_LINUX_WALL
 	bool "wall"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Send a message to everybody's terminal
 
@@ -411,11 +467,13 @@ config BR2_PACKAGE_UTIL_LINUX_WDCTL
 	bool "wdctl"
 	depends on BR2_USE_MMU # libsmartcols
 	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Shows hardware watchdog status
 
 config BR2_PACKAGE_UTIL_LINUX_WRITE
 	bool "write"
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Send a message to another user
 
@@ -423,6 +481,7 @@ config BR2_PACKAGE_UTIL_LINUX_ZRAMCTL
 	bool "zramctl"
 	depends on BR2_USE_MMU # libsmartcols
 	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	select BR2_PACKAGE_UTIL_LINUX_PROGRAMS
 	help
 	  Set up and control zram devices
 
diff --git a/package/util-linux/util-linux-libs/util-linux-libs.hash b/package/util-linux/util-linux-libs/util-linux-libs.hash
new file mode 120000
index 0000000000..dc1b2f866a
--- /dev/null
+++ b/package/util-linux/util-linux-libs/util-linux-libs.hash
@@ -0,0 +1 @@
+../util-linux.hash
\ No newline at end of file
diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
new file mode 100644
index 0000000000..48d3373bb4
--- /dev/null
+++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
@@ -0,0 +1,91 @@
+################################################################################
+#
+# util-linux-libs
+#
+################################################################################
+
+UTIL_LINUX_LIBS_VERSION = $(UTIL_LINUX_VERSION)
+UTIL_LINUX_LIBS_SOURCE = $(UTIL_LINUX_SOURCE)
+UTIL_LINUX_LIBS_SITE = $(UTIL_LINUX_SITE)
+UTIL_LINUX_LIBS_DL_SUBDIR = $(UTIL_LINUX_DL_SUBDIR)
+
+# README.licensing claims that some files are GPL-2.0 only, but this is not true.
+# Some files are GPL-3.0+ but only in tests. rfkill uses an ISC-style license.
+UTIL_LINUX_LIBS_LICENSE = LGPL-2.1+ (libblkid, libfdisk, libmount, libsmartcols), BSD-3-Clause (libuuid)
+UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
+	Documentation/licenses/COPYING.BSD-3-Clause \
+	Documentation/licenses/COPYING.LGPL-2.1-or-later
+UTIL_LINUX_LIBS_INSTALL_STAGING = YES
+# Prevent installing the libraries twice on TARGET_DIR
+UTIL_LINUX_LIBS_INSTALL_TARGET = $(if $(BR2_PACKAGE_UTIL_LINUX_PROGRAMS),NO,YES)
+UTIL_LINUX_LIBS_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
+UTIL_LINUX_LIBS_CONF_OPTS += \
+	--disable-rpath \
+	--disable-makeinstall-chown
+UTIL_LINUX_LIBS_LINK_LIBS = $(TARGET_NLS_LIBS)
+
+# systemd depends on util-linux so we enable systemd support
+# (which needs systemd to be installed)
+UTIL_LINUX_LIBS_CONF_OPTS += \
+	--without-systemd \
+	--with-systemdsystemunitdir=no
+
+HOST_UTIL_LINUX_LIBS_DEPENDENCIES = host-pkgconf
+HOST_UTIL_LINUX_LIBS_CONF_OPTS = --disable-makeinstall-chown
+
+# We also don't want the host-python dependency
+HOST_UTIL_LINUX_LIBS_CONF_OPTS += --without-python
+
+# Prevent the installation from attempting to move shared libraries from
+# ${usrlib_execdir} (/usr/lib) to ${libdir} (/lib), since both paths are
+# the same when merged usr is in use.
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+UTIL_LINUX_LIBS_CONF_OPTS += --bindir=/usr/bin --sbindir=/usr/sbin --libdir=/usr/lib
+endif
+
+# Unfortunately, the util-linux does LIBS="" at the end of its
+# configure script. So we have to pass the proper LIBS value when
+# calling the configure script to make configure tests pass properly,
+# and then pass it again at build time.
+UTIL_LINUX_LIBS_CONF_ENV += LIBS="$(UTIL_LINUX_LIBS_LINK_LIBS)"
+UTIL_LINUX_LIBS_MAKE_OPTS += LIBS="$(UTIL_LINUX_LIBS_LINK_LIBS)"
+
+# libmount optionally uses selinux
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT)$(BR2_PACKAGE_LIBSELINUX),yy)
+UTIL_LINUX_LIBS_DEPENDENCIES += libselinux
+UTIL_LINUX_LIBS_CONF_OPTS += --with-selinux
+else
+UTIL_LINUX_LIBS_CONF_OPTS += --without-selinux
+endif
+
+# Disable utilities
+UTIL_LINUX_LIBS_CONF_OPTS += \
+	--disable-all-programs \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),--enable-libblkid,--disable-libblkid) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBFDISK),--enable-libfdisk,--disable-libfdisk) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),--enable-libmount,--disable-libmount) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS),--enable-libsmartcols,--disable-libsmartcols) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBUUID),--enable-libuuid,--disable-libuuid)
+
+# In the host version of util-linux-libs, we only require libuuid and libmount
+# (plus libblkid as an indirect dependency of libmount). So disable libfdisk
+# and libsmartcols, unless BR2_PACKAGE_HOST_UTIL_LINUX is set.
+HOST_UTIL_LINUX_LIBS_CONF_OPTS += \
+	--enable-libblkid \
+	$(if $(BR2_PACKAGE_HOST_UTIL_LINUX),--enable-libfdisk,--disable-libfdisk) \
+	--enable-libmount \
+	$(if $(BR2_PACKAGE_HOST_UTIL_LINUX),--enable-libsmartcols,--disable-libsmartcols) \
+	--enable-libuuid \
+	--without-ncurses \
+	--without-ncursesw \
+	--without-tinfo
+
+# Install libmount Python bindings
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT)$(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),yy)
+UTIL_LINUX_LIBS_CONF_OPTS += --with-python --enable-pylibmount
+UTIL_LINUX_LIBS_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
+UTIL_LINUX_LIBS_CONF_OPTS += --without-python --disable-pylibmount
+endif
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
diff --git a/package/util-linux/su.pam b/package/util-linux/util-linux-programs/su.pam
similarity index 100%
rename from package/util-linux/su.pam
rename to package/util-linux/util-linux-programs/su.pam
diff --git a/package/util-linux/util-linux-programs/util-linux-programs.hash b/package/util-linux/util-linux-programs/util-linux-programs.hash
new file mode 120000
index 0000000000..dc1b2f866a
--- /dev/null
+++ b/package/util-linux/util-linux-programs/util-linux-programs.hash
@@ -0,0 +1 @@
+../util-linux.hash
\ No newline at end of file
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux-programs/util-linux-programs.mk
similarity index 65%
copy from package/util-linux/util-linux.mk
copy to package/util-linux/util-linux-programs/util-linux-programs.mk
index 99ec39467f..20335e9eb6 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux-programs/util-linux-programs.mk
@@ -1,101 +1,112 @@
 ################################################################################
 #
-# util-linux
+# util-linux-programs
 #
 ################################################################################
 
-UTIL_LINUX_VERSION_MAJOR = 2.34
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
-UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
-UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
+UTIL_LINUX_PROGRAMS_VERSION = $(UTIL_LINUX_VERSION)
+UTIL_LINUX_PROGRAMS_SOURCE = $(UTIL_LINUX_SOURCE)
+UTIL_LINUX_PROGRAMS_SITE = $(UTIL_LINUX_SITE)
+UTIL_LINUX_PROGRAMS_DL_SUBDIR = $(UTIL_LINUX_DL_SUBDIR)
 
 # README.licensing claims that some files are GPL-2.0 only, but this is not true.
 # Some files are GPL-3.0+ but only in tests. rfkill uses an ISC-style license.
-UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4-Clause, LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3-Clause (libuuid) ISC (rfkill)
-UTIL_LINUX_LICENSE_FILES = README.licensing \
+UTIL_LINUX_PROGRAMS_LICENSE = GPL-2.0+, BSD-4-Clause, LGPL-2.1+ (libblkid, libfdisk, libmount, libsmartcols), BSD-3-Clause (libuuid) ISC (rfkill)
+UTIL_LINUX_PROGRAMS_LICENSE_FILES = README.licensing \
 	Documentation/licenses/COPYING.BSD-3-Clause \
 	Documentation/licenses/COPYING.BSD-4-Clause-UC \
 	Documentation/licenses/COPYING.GPL-2.0-or-later \
 	Documentation/licenses/COPYING.ISC \
 	Documentation/licenses/COPYING.LGPL-2.1-or-later
-UTIL_LINUX_INSTALL_STAGING = YES
-UTIL_LINUX_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
-UTIL_LINUX_CONF_OPTS += \
+# Prevent installing the libraries twice on STAGING_DIR
+UTIL_LINUX_PROGRAMS_INSTALL_STAGING = $(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),NO,YES)
+UTIL_LINUX_PROGRAMS_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
+UTIL_LINUX_PROGRAMS_CONF_OPTS += \
 	--disable-rpath \
 	--disable-makeinstall-chown
-UTIL_LINUX_LIBS = $(TARGET_NLS_LIBS)
+UTIL_LINUX_PROGRAMS_LINK_LIBS = $(TARGET_NLS_LIBS)
 
-# system depends on util-linux so we enable systemd support
-# (which needs systemd to be installed)
-UTIL_LINUX_CONF_OPTS += \
-	--without-systemd \
-	--with-systemdsystemunitdir=no
+# udev support, provided by either eudev or systemd
+ifeq ($(BR2_PACKAGE_EUDEV),y)
+UTIL_LINUX_PROGRAMS_DEPENDENCIES += eudev
+endif
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+UTIL_LINUX_PROGRAMS_CONF_OPTS += --with-systemd --with-systemdsystemunitdir=/usr/lib/systemd/system
+UTIL_LINUX_PROGRAMS_DEPENDENCIES += systemd
+else
+UTIL_LINUX_PROGRAMS_CONF_OPTS += --without-systemd --with-systemdsystemunitdir=no
+endif
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+UTIL_LINUX_PROGRAMS_CONF_OPTS += --with-udev
+else
+UTIL_LINUX_PROGRAMS_CONF_OPTS += --without-udev
+endif
 
-HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
+HOST_UTIL_LINUX_PROGRAMS_DEPENDENCIES = host-pkgconf
 
 # We also don't want the host-python dependency
-HOST_UTIL_LINUX_CONF_OPTS = --without-python
+HOST_UTIL_LINUX_PROGRAMS_CONF_OPTS = --without-python
 
 # Prevent the installation from attempting to move shared libraries from
 # ${usrlib_execdir} (/usr/lib) to ${libdir} (/lib), since both paths are
 # the same when merged usr is in use.
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
-UTIL_LINUX_CONF_OPTS += --bindir=/usr/bin --sbindir=/usr/sbin --libdir=/usr/lib
+UTIL_LINUX_PROGRAMS_CONF_OPTS += --bindir=/usr/bin --sbindir=/usr/sbin --libdir=/usr/lib
 endif
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
-UTIL_LINUX_DEPENDENCIES += ncurses
+UTIL_LINUX_PROGRAMS_DEPENDENCIES += ncurses
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
-UTIL_LINUX_CONF_OPTS += --with-ncursesw
-UTIL_LINUX_CONF_ENV += NCURSESW6_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
+UTIL_LINUX_PROGRAMS_CONF_OPTS += --with-ncursesw
+UTIL_LINUX_PROGRAMS_CONF_ENV += NCURSESW6_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 else
-UTIL_LINUX_CONF_OPTS += --without-ncursesw --with-ncurses --disable-widechar
-UTIL_LINUX_CONF_ENV += NCURSES6_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
+UTIL_LINUX_PROGRAMS_CONF_OPTS += --without-ncursesw --with-ncurses --disable-widechar
+UTIL_LINUX_PROGRAMS_CONF_ENV += NCURSES6_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
 endif
 else
 ifeq ($(BR2_USE_WCHAR),y)
-UTIL_LINUX_CONF_OPTS += --enable-widechar
+UTIL_LINUX_PROGRAMS_CONF_OPTS += --enable-widechar
 else
-UTIL_LINUX_CONF_OPTS += --disable-widechar
+UTIL_LINUX_PROGRAMS_CONF_OPTS += --disable-widechar
 endif
-UTIL_LINUX_CONF_OPTS += --without-ncursesw --without-ncurses
+UTIL_LINUX_PROGRAMS_CONF_OPTS += --without-ncursesw --without-ncurses
 endif
 
 ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
-UTIL_LINUX_DEPENDENCIES += libcap-ng
+UTIL_LINUX_PROGRAMS_DEPENDENCIES += libcap-ng
 endif
 
 # Unfortunately, the util-linux does LIBS="" at the end of its
 # configure script. So we have to pass the proper LIBS value when
 # calling the configure script to make configure tests pass properly,
 # and then pass it again at build time.
-UTIL_LINUX_CONF_ENV += LIBS="$(UTIL_LINUX_LIBS)"
-UTIL_LINUX_MAKE_OPTS += LIBS="$(UTIL_LINUX_LIBS)"
+UTIL_LINUX_PROGRAMS_CONF_ENV += LIBS="$(UTIL_LINUX_PROGRAMS_LINK_LIBS)"
+UTIL_LINUX_PROGRAMS_MAKE_OPTS += LIBS="$(UTIL_LINUX_PROGRAMS_LINK_LIBS)"
 
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
-UTIL_LINUX_DEPENDENCIES += libselinux
-UTIL_LINUX_CONF_OPTS += --with-selinux
-define UTIL_LINUX_SELINUX_PAMFILES_TWEAK
+UTIL_LINUX_PROGRAMS_DEPENDENCIES += libselinux
+UTIL_LINUX_PROGRAMS_CONF_OPTS += --with-selinux
+define UTIL_LINUX_PROGRAMS_SELINUX_PAMFILES_TWEAK
 	$(foreach f,su su-l,
 		$(SED) 's/^# \(.*pam_selinux.so.*\)$$/\1/' \
 			$(TARGET_DIR)/etc/pam.d/$(f)
 	)
 endef
 else
-UTIL_LINUX_CONF_OPTS += --without-selinux
+UTIL_LINUX_PROGRAMS_CONF_OPTS += --without-selinux
 endif
 
 # Used by cramfs utils
-UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
+UTIL_LINUX_PROGRAMS_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 
 # Used by login-utils
-UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_LINUX_PAM),linux-pam)
+UTIL_LINUX_PROGRAMS_DEPENDENCIES += $(if $(BR2_PACKAGE_LINUX_PAM),linux-pam)
 
 # Used by hardlink
-UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_PCRE2),pcre2)
+UTIL_LINUX_PROGRAMS_DEPENDENCIES += $(if $(BR2_PACKAGE_PCRE2),pcre2)
 
 # Disable/Enable utilities
-UTIL_LINUX_CONF_OPTS += \
+UTIL_LINUX_PROGRAMS_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_BINARIES),--enable-all-programs,--disable-all-programs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_AGETTY),--enable-agetty,--disable-agetty) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_BFS),--enable-bfs,--disable-bfs) \
@@ -160,7 +171,7 @@ UTIL_LINUX_CONF_OPTS += \
 # libmount (plus libblkid as an indirect dependency of libmount).
 # So disable all of the programs, unless BR2_PACKAGE_HOST_UTIL_LINUX is set
 
-HOST_UTIL_LINUX_CONF_OPTS += \
+HOST_UTIL_LINUX_PROGRAMS_CONF_OPTS += \
 	--enable-libblkid \
 	--enable-libmount \
 	--enable-libuuid \
@@ -169,10 +180,10 @@ HOST_UTIL_LINUX_CONF_OPTS += \
 	--without-tinfo
 
 ifeq ($(BR2_PACKAGE_HOST_UTIL_LINUX),y)
-HOST_UTIL_LINUX_CONF_OPTS += --disable-makeinstall-chown
+HOST_UTIL_LINUX_PROGRAMS_CONF_OPTS += --disable-makeinstall-chown
 # disable commands that have ncurses dependency, as well as
 # other ones that are useless on the host
-HOST_UTIL_LINUX_CONF_OPTS += \
+HOST_UTIL_LINUX_PROGRAMS_CONF_OPTS += \
 	--disable-agetty \
 	--disable-chfn-chsh \
 	--disable-chmem \
@@ -200,61 +211,55 @@ HOST_UTIL_LINUX_CONF_OPTS += \
 	--disable-write \
 	--disable-zramctl
 # Used by cramfs utils
-HOST_UTIL_LINUX_DEPENDENCIES += host-zlib
+HOST_UTIL_LINUX_PROGRAMS_PROGRAMS_DEPENDENCIES += host-zlib
 else
-HOST_UTIL_LINUX_CONF_OPTS += --disable-all-programs
+HOST_UTIL_LINUX_PROGRAMS_CONF_OPTS += --disable-all-programs
 endif
 
 # Install libmount Python bindings
-ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
-UTIL_LINUX_CONF_OPTS += --with-python
-UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
-UTIL_LINUX_CONF_OPTS += --enable-pylibmount
-else
-UTIL_LINUX_CONF_OPTS += --disable-pylibmount
-endif
-else
-UTIL_LINUX_CONF_OPTS += --without-python
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT)$(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),yy)
+UTIL_LINUX_PROGRAMS_CONF_OPTS += --with-python --enable-pylibmount
+UTIL_LINUX_PROGRAMS_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
+UTIL_LINUX_PROGRAMS_CONF_OPTS += --without-python --disable-pylibmount
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
-UTIL_LINUX_CONF_OPTS += --with-readline
-UTIL_LINUX_LIBS += $(if $(BR2_STATIC_LIBS),-lcurses)
-UTIL_LINUX_DEPENDENCIES += readline
+UTIL_LINUX_PROGRAMS_CONF_OPTS += --with-readline
+UTIL_LINUX_PROGRAMS_LINK_LIBS += $(if $(BR2_STATIC_LIBS),-lcurses)
+UTIL_LINUX_PROGRAMS_DEPENDENCIES += readline
 else
-UTIL_LINUX_CONF_OPTS += --without-readline
+UTIL_LINUX_PROGRAMS_CONF_OPTS += --without-readline
 endif
 
 ifeq ($(BR2_PACKAGE_AUDIT),y)
-UTIL_LINUX_CONF_OPTS += --with-audit
-UTIL_LINUX_DEPENDENCIES += audit
+UTIL_LINUX_PROGRAMS_CONF_OPTS += --with-audit
+UTIL_LINUX_PROGRAMS_DEPENDENCIES += audit
 else
-UTIL_LINUX_CONF_OPTS += --without-audit
+UTIL_LINUX_PROGRAMS_CONF_OPTS += --without-audit
 endif
 
 # Install PAM configuration files
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_SU)$(BR2_PACKAGE_LINUX_PAM),yy)
-define UTIL_LINUX_INSTALL_PAMFILES
-	$(INSTALL) -m 0644 package/util-linux/su.pam \
+define UTIL_LINUX_PROGRAMS_INSTALL_PAMFILES
+	$(INSTALL) -D -m 0644 $(UTIL_LINUX_PROGRAMS_PKGDIR)su.pam \
 		$(TARGET_DIR)/etc/pam.d/su
-	$(INSTALL) -m 0644 package/util-linux/su.pam \
+	$(INSTALL) -m 0644 $(UTIL_LINUX_PROGRAMS_PKGDIR)su.pam \
 		$(TARGET_DIR)/etc/pam.d/su-l
-	$(UTIL_LINUX_SELINUX_PAMFILES_TWEAK)
+	$(UTIL_LINUX_PROGRAMS_SELINUX_PAMFILES_TWEAK)
 endef
-UTIL_LINUX_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_INSTALL_PAMFILES
+UTIL_LINUX_PROGRAMS_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_PROGRAMS_INSTALL_PAMFILES
 endif
 
 # Install agetty->getty symlink to avoid breakage when there's no busybox
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_AGETTY),y)
 ifeq ($(BR2_PACKAGE_BUSYBOX),)
-define UTIL_LINUX_GETTY_SYMLINK
+define UTIL_LINUX_PROGRAMS_GETTY_SYMLINK
 	ln -sf agetty $(TARGET_DIR)/sbin/getty
 endef
 endif
 endif
 
-UTIL_LINUX_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_GETTY_SYMLINK
+UTIL_LINUX_PROGRAMS_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_PROGRAMS_GETTY_SYMLINK
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 99ec39467f..bf22219878 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -9,252 +9,23 @@ UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
-# README.licensing claims that some files are GPL-2.0 only, but this is not true.
-# Some files are GPL-3.0+ but only in tests. rfkill uses an ISC-style license.
-UTIL_LINUX_LICENSE = GPL-2.0+, BSD-4-Clause, LGPL-2.1+ (libblkid, libfdisk, libmount), BSD-3-Clause (libuuid) ISC (rfkill)
-UTIL_LINUX_LICENSE_FILES = README.licensing \
-	Documentation/licenses/COPYING.BSD-3-Clause \
-	Documentation/licenses/COPYING.BSD-4-Clause-UC \
-	Documentation/licenses/COPYING.GPL-2.0-or-later \
-	Documentation/licenses/COPYING.ISC \
-	Documentation/licenses/COPYING.LGPL-2.1-or-later
-UTIL_LINUX_INSTALL_STAGING = YES
-UTIL_LINUX_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
-UTIL_LINUX_CONF_OPTS += \
-	--disable-rpath \
-	--disable-makeinstall-chown
-UTIL_LINUX_LIBS = $(TARGET_NLS_LIBS)
-
-# system depends on util-linux so we enable systemd support
-# (which needs systemd to be installed)
-UTIL_LINUX_CONF_OPTS += \
-	--without-systemd \
-	--with-systemdsystemunitdir=no
-
-HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
-
-# We also don't want the host-python dependency
-HOST_UTIL_LINUX_CONF_OPTS = --without-python
-
-# Prevent the installation from attempting to move shared libraries from
-# ${usrlib_execdir} (/usr/lib) to ${libdir} (/lib), since both paths are
-# the same when merged usr is in use.
-ifeq ($(BR2_ROOTFS_MERGED_USR),y)
-UTIL_LINUX_CONF_OPTS += --bindir=/usr/bin --sbindir=/usr/sbin --libdir=/usr/lib
-endif
-
-ifeq ($(BR2_PACKAGE_NCURSES),y)
-UTIL_LINUX_DEPENDENCIES += ncurses
-ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
-UTIL_LINUX_CONF_OPTS += --with-ncursesw
-UTIL_LINUX_CONF_ENV += NCURSESW6_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
-else
-UTIL_LINUX_CONF_OPTS += --without-ncursesw --with-ncurses --disable-widechar
-UTIL_LINUX_CONF_ENV += NCURSES6_CONFIG=$(STAGING_DIR)/usr/bin/$(NCURSES_CONFIG_SCRIPTS)
-endif
-else
-ifeq ($(BR2_USE_WCHAR),y)
-UTIL_LINUX_CONF_OPTS += --enable-widechar
-else
-UTIL_LINUX_CONF_OPTS += --disable-widechar
-endif
-UTIL_LINUX_CONF_OPTS += --without-ncursesw --without-ncurses
-endif
-
-ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
-UTIL_LINUX_DEPENDENCIES += libcap-ng
-endif
-
-# Unfortunately, the util-linux does LIBS="" at the end of its
-# configure script. So we have to pass the proper LIBS value when
-# calling the configure script to make configure tests pass properly,
-# and then pass it again at build time.
-UTIL_LINUX_CONF_ENV += LIBS="$(UTIL_LINUX_LIBS)"
-UTIL_LINUX_MAKE_OPTS += LIBS="$(UTIL_LINUX_LIBS)"
-
-ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
-UTIL_LINUX_DEPENDENCIES += libselinux
-UTIL_LINUX_CONF_OPTS += --with-selinux
-define UTIL_LINUX_SELINUX_PAMFILES_TWEAK
-	$(foreach f,su su-l,
-		$(SED) 's/^# \(.*pam_selinux.so.*\)$$/\1/' \
-			$(TARGET_DIR)/etc/pam.d/$(f)
-	)
-endef
-else
-UTIL_LINUX_CONF_OPTS += --without-selinux
-endif
-
-# Used by cramfs utils
-UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
-
-# Used by login-utils
-UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_LINUX_PAM),linux-pam)
-
-# Used by hardlink
-UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_PCRE2),pcre2)
-
-# Disable/Enable utilities
-UTIL_LINUX_CONF_OPTS += \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_BINARIES),--enable-all-programs,--disable-all-programs) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_AGETTY),--enable-agetty,--disable-agetty) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_BFS),--enable-bfs,--disable-bfs) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_CAL),--enable-cal,--disable-cal) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH),--enable-chfn-chsh,--disable-chfn-chsh) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_CHMEM),--enable-chmem,--disable-chmem) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_CRAMFS),--enable-cramfs,--disable-cramfs) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_EJECT),--enable-eject,--disable-eject) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_FALLOCATE),--enable-fallocate,--disable-fallocate) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_FDFORMAT),--enable-fdformat,--disable-fdformat) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_FSCK),--enable-fsck,--disable-fsck) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_HARDLINK),--enable-hardlink,--disable-hardlink) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_HWCLOCK),--enable-hwclock,--disable-hwclock) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCRM),--enable-ipcrm,--disable-ipcrm) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCS),--enable-ipcs,--disable-ipcs) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_KILL),--enable-kill,--disable-kill) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LAST),--enable-last,--disable-last) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),--enable-libblkid,--disable-libblkid) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBFDISK),--enable-libfdisk,--disable-libfdisk) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),--enable-libmount,--disable-libmount) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS),--enable-libsmartcols,--disable-libsmartcols) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBUUID),--enable-libuuid,--disable-libuuid) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LINE),--enable-line,--disable-line) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGGER),--enable-logger,--disable-logger) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN),--enable-login,--disable-login) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LOSETUP),--enable-losetup,--disable-losetup) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LSLOGINS),--enable-lslogins,--disable-lslogins) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LSMEM),--enable-lsmem,--disable-lsmem) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_MESG),--enable-mesg,--disable-mesg) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_MINIX),--enable-minix,--disable-minix) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_MORE),--enable-more,--disable-more) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_MOUNT),--enable-mount,--disable-mount) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT),--enable-mountpoint,--disable-mountpoint) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_NEWGRP),--enable-newgrp,--disable-newgrp) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_NOLOGIN),--enable-nologin,--disable-nologin) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_NSENTER),--enable-nsenter,--disable-nsenter) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_PARTX),--enable-partx,--disable-partx) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_PG),--enable-pg,--disable-pg) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT),--enable-pivot_root,--disable-pivot_root) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_RAW),--enable-raw,--disable-raw) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_RENAME),--enable-rename,--disable-rename) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_RFKILL),--enable-rfkill,--disable-rfkill) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_RUNUSER),--enable-runuser,--disable-runuser) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS),--enable-schedutils,--disable-schedutils) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_SETPRIV),--enable-setpriv,--disable-setpriv) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_SETTERM),--enable-setterm,--disable-setterm) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_SU),--enable-su,--disable-su) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_SULOGIN),--enable-sulogin,--disable-sulogin) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT),--enable-switch_root,--disable-switch_root) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_TUNELP),--enable-tunelp,--disable-tunelp) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_UL),--enable-ul,--disable-ul) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_UNSHARE),--enable-unshare,--disable-unshare) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_UTMPDUMP),--enable-utmpdump,--disable-utmpdump) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_UUIDD),--enable-uuidd,--disable-uuidd) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_VIPW),--enable-vipw,--disable-vipw) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_WALL),--enable-wall,--disable-wall) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_WDCTL),--enable-wdctl,--disable-wdctl) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write,--disable-write) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_ZRAMCTL),--enable-zramctl,--disable-zramctl)
-
-# In the host version of util-linux, we only require libuuid and
-# libmount (plus libblkid as an indirect dependency of libmount).
-# So disable all of the programs, unless BR2_PACKAGE_HOST_UTIL_LINUX is set
-
-HOST_UTIL_LINUX_CONF_OPTS += \
-	--enable-libblkid \
-	--enable-libmount \
-	--enable-libuuid \
-	--without-ncurses \
-	--without-ncursesw \
-	--without-tinfo
-
-ifeq ($(BR2_PACKAGE_HOST_UTIL_LINUX),y)
-HOST_UTIL_LINUX_CONF_OPTS += --disable-makeinstall-chown
-# disable commands that have ncurses dependency, as well as
-# other ones that are useless on the host
-HOST_UTIL_LINUX_CONF_OPTS += \
-	--disable-agetty \
-	--disable-chfn-chsh \
-	--disable-chmem \
-	--disable-login \
-	--disable-lslogins \
-	--disable-mesg \
-	--disable-more \
-	--disable-newgrp \
-	--disable-nologin \
-	--disable-nsenter \
-	--disable-pg \
-	--disable-rfkill \
-	--disable-schedutils \
-	--disable-setpriv \
-	--disable-setterm \
-	--disable-su \
-	--disable-sulogin \
-	--disable-tunelp \
-	--disable-ul \
-	--disable-unshare \
-	--disable-uuidd \
-	--disable-vipw \
-	--disable-wall \
-	--disable-wdctl \
-	--disable-write \
-	--disable-zramctl
-# Used by cramfs utils
-HOST_UTIL_LINUX_DEPENDENCIES += host-zlib
-else
-HOST_UTIL_LINUX_CONF_OPTS += --disable-all-programs
-endif
-
-# Install libmount Python bindings
-ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
-UTIL_LINUX_CONF_OPTS += --with-python
-UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
-UTIL_LINUX_CONF_OPTS += --enable-pylibmount
-else
-UTIL_LINUX_CONF_OPTS += --disable-pylibmount
-endif
-else
-UTIL_LINUX_CONF_OPTS += --without-python
-endif
-
-ifeq ($(BR2_PACKAGE_READLINE),y)
-UTIL_LINUX_CONF_OPTS += --with-readline
-UTIL_LINUX_LIBS += $(if $(BR2_STATIC_LIBS),-lcurses)
-UTIL_LINUX_DEPENDENCIES += readline
-else
-UTIL_LINUX_CONF_OPTS += --without-readline
-endif
-
-ifeq ($(BR2_PACKAGE_AUDIT),y)
-UTIL_LINUX_CONF_OPTS += --with-audit
-UTIL_LINUX_DEPENDENCIES += audit
-else
-UTIL_LINUX_CONF_OPTS += --without-audit
-endif
-
-# Install PAM configuration files
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_SU)$(BR2_PACKAGE_LINUX_PAM),yy)
-define UTIL_LINUX_INSTALL_PAMFILES
-	$(INSTALL) -m 0644 package/util-linux/su.pam \
-		$(TARGET_DIR)/etc/pam.d/su
-	$(INSTALL) -m 0644 package/util-linux/su.pam \
-		$(TARGET_DIR)/etc/pam.d/su-l
-	$(UTIL_LINUX_SELINUX_PAMFILES_TWEAK)
-endef
-UTIL_LINUX_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_INSTALL_PAMFILES
-endif
-
-# Install agetty->getty symlink to avoid breakage when there's no busybox
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_AGETTY),y)
-ifeq ($(BR2_PACKAGE_BUSYBOX),)
-define UTIL_LINUX_GETTY_SYMLINK
-	ln -sf agetty $(TARGET_DIR)/sbin/getty
-endef
-endif
-endif
-
-UTIL_LINUX_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_GETTY_SYMLINK
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
+UTIL_LINUX_EXTRACT_CMDS =
+HOST_UTIL_LINUX_EXTRACT_CMDS =
+
+# util-linux-libs installs on STAGING_DIR only, for build time,
+# util-linux-programs installs on TARGET_DIR only, for run time.
+# We may need both.
+UTIL_LINUX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_PROGRAMS),util-linux-programs)
+
+# In the host version we need either host-util-linux-programs or
+# host-util-linux-libs, only.
+HOST_UTIL_LINUX_DEPENDENCIES = \
+	host-util-linux-$(if $(BR2_PACKAGE_HOST_UTIL_LINUX),programs,libs)
+
+$(eval $(generic-package))
+$(eval $(host-generic-package))
+
+include package/util-linux/util-linux-libs/util-linux-libs.mk
+include package/util-linux/util-linux-programs/util-linux-programs.mk
