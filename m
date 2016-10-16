From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 15:53:53 +0200
Subject: [Buildroot] [git commit] util-linux: expand selection of libraries
	and utilities
Message-ID: <20161016135433.71FB9817E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc2d5d3ec71db904213131df56c749acfa9874cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add option to control installation of libfdisk
- Add libfdisk license to the comment in util-linux.mk
- List all utilities provided by the basic set and document that
  linux32, linux64, uname26, i386 and x86_64 are symlinks to setarch
- Add options to install cal, ipcrm, ipcs, logger, lslogin and pg

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
[Thomas: add missing dependency of the new lslogins option on
libsmartcols, and therefore !MMU.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/Config.in     | 53 ++++++++++++++++++++++++++++++++++++++++
 package/util-linux/util-linux.mk |  9 ++++++-
 2 files changed, 61 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 8945b7f..917a53d 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -18,6 +18,14 @@ config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	help
 	  Install libblkid.
 
+config BR2_PACKAGE_UTIL_LINUX_LIBFDISK
+	bool "libfdisk"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Install libfdisk.
+
 config BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	bool "libmount"
 	depends on BR2_USE_MMU # fork()
@@ -41,11 +49,23 @@ config BR2_PACKAGE_UTIL_LINUX_BINARIES
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
 	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Install the basic set of util-linux binaries.
 
+	  blkdiscard, blkid, blockdev, cfdisk, chcpu, col, colcrt,
+	  colrm, column, ctrlaltdel, dmesg, fdisk, findfs, findmnt,
+	  flock, fsfreeze, fstrim, getopt, hexdump, ipcmk, isosize,
+	  ldattach, look, lsblk, lscpu, lsipc, lslocks, lsns, mcookie,
+	  mkfs, mkswap, namei, prlimit, readprofile, renice, rev,
+	  rtcwake, script, scriptreplay, setarch, setsid, sfdisk,
+	  swaplabel, swapoff, swapon, tailf, uuidgen, whereis, wipefs
+
+	  The setarch utility also installs architecture-specific
+	  symlinks like linux32, linux64, uname26, i386 and x86_64.
+
 if BR2_PACKAGE_UTIL_LINUX_BINARIES
 
 config BR2_PACKAGE_UTIL_LINUX_AGETTY
@@ -59,6 +79,11 @@ config BR2_PACKAGE_UTIL_LINUX_BFS
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
@@ -112,6 +137,16 @@ config BR2_PACKAGE_UTIL_LINUX_HWCLOCK
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
@@ -142,6 +177,11 @@ comment "login utilities needs a uClibc or glibc toolchain w/ wchar, locale, dyn
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
 		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
 
+config BR2_PACKAGE_UTIL_LINUX_LOGGER
+	bool "logger"
+	help
+	  Enter messages into the system log
+
 config BR2_PACKAGE_UTIL_LINUX_LOSETUP
 	bool "losetup"
 	depends on BR2_USE_MMU # libsmartcols
@@ -149,6 +189,13 @@ config BR2_PACKAGE_UTIL_LINUX_LOSETUP
 	help
 	  Set up and control loop devices
 
+config BR2_PACKAGE_UTIL_LINUX_LSLOGINS
+	bool "lslogins"
+	depends on BR2_USE_MMU # libsmartcols
+	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	help
+	  Display information about known users in the system
+
 config BR2_PACKAGE_UTIL_LINUX_MESG
 	bool "mesg"
 	help
@@ -204,6 +251,12 @@ config BR2_PACKAGE_UTIL_LINUX_NSENTER
 comment "nsenter needs a toolchain w/ headers >= 3.0"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
+config BR2_PACKAGE_UTIL_LINUX_PG
+	bool "pg"
+	depends on BR2_USE_MMU # fork()
+	help
+	  Browse pagewise through text files
+
 config BR2_PACKAGE_UTIL_LINUX_PARTX
 	bool "partition utilities"
 	depends on BR2_USE_MMU # fork()
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index f648155..ca00f30 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -11,7 +11,7 @@ UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERS
 
 # README.licensing claims that some files are GPLv2-only, but this is not true.
 # Some files are GPLv3+ but only in tests.
-UTIL_LINUX_LICENSE = GPLv2+, BSD-4c, libblkid and libmount LGPLv2.1+, libuuid BSD-3c
+UTIL_LINUX_LICENSE = GPLv2+, BSD-4c, libblkid, libfdisk and libmount LGPLv2.1+, libuuid BSD-3c
 UTIL_LINUX_LICENSE_FILES = README.licensing Documentation/licenses/COPYING.GPLv2 Documentation/licenses/COPYING.UCB Documentation/licenses/COPYING.LGPLv2.1 Documentation/licenses/COPYING.BSD-3
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = host-pkgconf
@@ -73,6 +73,7 @@ UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_LINUX_PAM),linux-pam)
 UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_AGETTY),--enable-agetty,--disable-agetty) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_BFS),--enable-bfs,--disable-bfs) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_CAL),--enable-cal,--disable-cal) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH),--enable-chfn-chsh,--disable-chfn-chsh) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CRAMFS),--enable-cramfs,--disable-cramfs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_EJECT),--enable-eject,--disable-eject) \
@@ -80,15 +81,20 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FDFORMAT),--enable-fdformat,--disable-fdformat) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FSCK),--enable-fsck,--disable-fsck) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_HWCLOCK),--enable-hwclock,--disable-hwclock) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCRM),--enable-ipcrm,--disable-ipcrm) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCS),--enable-ipcs,--disable-ipcs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_KILL),--enable-kill,--disable-kill) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LAST),--enable-last,--disable-last) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),--enable-libblkid,--disable-libblkid) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBFDISK),--enable-libfdisk,--disable-libfdisk) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),--enable-libmount,--disable-libmount) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS),--enable-libsmartcols,--disable-libsmartcols) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBUUID),--enable-libuuid,--disable-libuuid) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LINE),--enable-line,--disable-line) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGGER),--enable-logger,--disable-logger) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-last --enable-login --enable-runuser --enable-su --enable-sulogin,--disable-last --disable-login --disable-runuser --disable-su --disable-sulogin) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOSETUP),--enable-losetup,--disable-losetup) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LSLOGINS),--enable-lslogins,--disable-lslogins) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MESG),--enable-mesg,--disable-mesg) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MINIX),--enable-minix,--disable-minix) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MORE),--enable-more,--disable-more) \
@@ -98,6 +104,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_NOLOGIN),--enable-nologin,--disable-nologin) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_NSENTER),--enable-nsenter,--disable-nsenter) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_PARTX),--enable-partx,--disable-partx) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_PG),--enable-pg,--disable-pg) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT),--enable-pivot_root,--disable-pivot_root) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_RAW),--enable-raw,--disable-raw) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_RENAME),--enable-rename,--disable-rename) \
