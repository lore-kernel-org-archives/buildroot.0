From: Maxim Mikityanskiy <maxtram95@gmail.com>
Date: Mon, 19 Jan 2015 18:14:14 +0200
Subject: [Buildroot] [PATCH 14/16] package/util-linux: add more tool select
	options
In-Reply-To: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
Message-ID: <1421684056-5266-15-git-send-email-maxtram95@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add more options to Config.in to allow optionally select or deselect
util-linux tools.

Also fix s/BR2_PACKAGE_WDCTL/BR2_PACKAGE_UTIL_LINUX_WDCTL/

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 package/util-linux/Config.in     | 64 +++++++++++++++++++++++++++++++++++++++-
 package/util-linux/util-linux.mk | 17 +++++++++--
 2 files changed, 78 insertions(+), 3 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index a8dfa1c..78648c1 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -26,6 +26,11 @@ config BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	help
 	  Install libmount.
 
+config BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	bool "libsmartcols"
+	help
+	  Install libsmartcols.
+
 config BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	bool "libuuid"
 	help
@@ -36,6 +41,7 @@ config BR2_PACKAGE_UTIL_LINUX_BINARIES
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Install the basic set of util-linux binaries.
@@ -52,6 +58,11 @@ config BR2_PACKAGE_UTIL_LINUX_ARCH
 	help
 	  Print machine architecture
 
+config BR2_PACKAGE_UTIL_LINUX_BFS
+	bool "bfs"
+	help
+	  SCO bfs filesystem support
+
 config BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH
 	bool "chfn/chsh"
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
@@ -86,16 +97,31 @@ config BR2_PACKAGE_UTIL_LINUX_FALLOCATE
 	help
 	  Preallocate space to a file
 
+config BR2_PACKAGE_UTIL_LINUX_FDFORMAT
+	bool "fdformat"
+	help
+	  Low-level format a floppy disk
+
 config BR2_PACKAGE_UTIL_LINUX_FSCK
 	bool "fsck"
 	help
 	  Check and repair a linux filesystem
 
+config BR2_PACKAGE_UTIL_LINUX_HWCLOCK
+	bool "hwclock"
+	help
+	  Query or set the hardware clock (RTC)
+
 config BR2_PACKAGE_UTIL_LINUX_KILL
 	bool "kill"
 	help
 	  Send a signal to a process
 
+config BR2_PACKAGE_UTIL_LINUX_LAST
+	bool "last"
+	help
+	  Show a listing of last logged in users
+
 config BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS
 	bool "login utilities"
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
@@ -118,6 +144,11 @@ config BR2_PACKAGE_UTIL_LINUX_MESG
 	help
 	  Control write access to your terminal
 
+config BR2_PACKAGE_UTIL_LINUX_MINIX
+	bool "minix"
+	help
+	  Minix filesystem support
+
 config BR2_PACKAGE_UTIL_LINUX_NSENTER
 	bool "nsenter"
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
@@ -127,16 +158,31 @@ config BR2_PACKAGE_UTIL_LINUX_NSENTER
 comment "nsenter needs a toolchain w/ headers >= 3.0"
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 
+config BR2_PACKAGE_UTIL_LINUX_MORE
+	bool "more"
+	help
+	  File perusal filter for crt viewing
+
 config BR2_PACKAGE_UTIL_LINUX_MOUNT
 	bool "mount/umount"
 	help
 	  Mount/unmount filesystems
 
+config BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT
+	bool "mountpoint"
+	help
+	  See if a directory is a mountpoint
+
 config BR2_PACKAGE_UTIL_LINUX_NEWGRP
 	bool "newgrp"
 	help
 	  Log in to a new group
 
+config BR2_PACKAGE_UTIL_LINUX_NOLOGIN
+	bool "nologin"
+	help
+	  Politely refuse a login
+
 config BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
 	bool "pivot_root"
 	help
@@ -167,11 +213,27 @@ config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
 	help
 	  Scheduling utilities (chrt, ionice, taskset)
 
+config BR2_PACKAGE_UTIL_LINUX_SETPRIV
+	bool "setpriv"
+	select BR2_PACKAGE_LIBCAP_NG
+	help
+	  Run a program with different Linux privilege settings
+
+config BR2_PACKAGE_UTIL_LINUX_SETTERM
+	bool "setterm"
+	help
+	  Set terminal attributes
+
 config BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT
 	bool "switch_root"
 	help
 	  Switch to another filesystem as the root of the mount tree
 
+config BR2_PACKAGE_UTIL_LINUX_UL
+	bool "ul"
+	help
+	  Do underlining
+
 config BR2_PACKAGE_UTIL_LINUX_UNSHARE
 	bool "unshare"
 	help
@@ -197,7 +259,7 @@ config BR2_PACKAGE_UTIL_LINUX_WALL
 	help
 	  Send a message to everybody's terminal
 
-config BR2_PACKAGE_WDCTL
+config BR2_PACKAGE_UTIL_LINUX_WDCTL
 	bool "wdctl"
 	help
 	  Shows hardware watchdog status
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index c8fb77c..a70363f 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -66,34 +66,47 @@ UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_LINUX_PAM),linux-pam)
 UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_AGETTY),--enable-agetty,--disable-agetty) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_ARCH),--enable-arch,--disable-arch) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_BFS),--enable-bfs,--disable-bfs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH),--enable-chfn-chsh,--disable-chfn-chsh) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CRAMFS),--enable-cramfs,--disable-cramfs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_DDATE),--enable-ddate,--disable-ddate) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_EJECT),--enable-eject,--disable-eject) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FALLOCATE),--enable-fallocate,--disable-fallocate) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_FDFORMAT),--enable-fdformat,--disable-fdformat) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_FSCK),--enable-fsck,--disable-fsck) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_HWCLOCK),--enable-hwclock,--disable-hwclock) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_KILL),--enable-kill,--disable-kill) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LAST),--enable-last,--disable-last) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),--enable-libblkid,--disable-libblkid) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),--enable-libmount,--disable-libmount) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS),--enable-libsmartcols,--disable-libsmartcols) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBUUID),--enable-libuuid,--disable-libuuid) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-last --enable-login --enable-su --enable-sulogin,--disable-last --disable-login --disable-su --disable-sulogin) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),--enable-last --enable-login --enable-runuser --enable-su --enable-sulogin,--disable-last --disable-login --disable-runuser --disable-su --disable-sulogin) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOSETUP),--enable-losetup,--disable-losetup) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MESG),--enable-mesg,--disable-mesg) \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_NSENTER),--enable-nsenter,--disable-nsenter) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_MINIX),--enable-minix,--disable-minix) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_MORE),--enable-more,--disable-more) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_MOUNT),--enable-mount,--disable-mount) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT),--enable-mountpoint,--disable-mountpoint) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_NEWGRP),--enable-newgrp,--disable-newgrp) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_NOLOGIN),--enable-nologin,--disable-nologin) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_NSENTER),--enable-nsenter,--disable-nsenter) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_PARTX),--enable-partx,--disable-partx) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT),--enable-pivot_root,--disable-pivot_root) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_RAW),--enable-raw,--disable-raw) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_RENAME),--enable-rename,--disable-rename) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_RESET),--enable-reset,--disable-reset) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS),--enable-schedutils,--disable-schedutils) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_SETPRIV),--enable-setpriv,--disable-setpriv) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_SETTERM),--enable-setterm,--disable-setterm) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT),--enable-switch_root,--disable-switch_root) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_UL),--enable-ul,--disable-ul) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UNSHARE),--enable-unshare,--disable-unshare) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UTMPDUMP),--enable-utmpdump,--disable-utmpdump) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_UUIDD),--enable-uuidd,--disable-uuidd) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_VIPW),--enable-vipw,--disable-vipw) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WALL),--enable-wall,--disable-wall) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_WDCTL),--enable-wdctl,--disable-wdctl) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write,--disable-write)
 
 # In the host version of util-linux, we so far only require libuuid,
-- 
2.2.1
