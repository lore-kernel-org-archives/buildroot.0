From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 11 Jul 2015 18:10:00 -0400
Subject: [Buildroot] [PATCH v2 2/3] util-linux: rework utilities menu for
	finer control
In-Reply-To: <1436652601-2227-1-git-send-email-danomimanchego123@gmail.com>
References: <1436652601-2227-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1436652601-2227-3-git-send-email-danomimanchego123@gmail.com>
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

---

Changes v1 -> v2:
  - Rework to incorporate ideas and suggestions from Thomas Petazzoni
    and Arnout Vandecappelle.  At least, in spirit.
---
 package/util-linux/Config.in     |   46 ++++++++++++++++++++++++++++++++++----
 package/util-linux/util-linux.mk |   15 +++++++------
 2 files changed, 50 insertions(+), 11 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index e0a25bf..31ef12d 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -35,17 +35,55 @@ config BR2_PACKAGE_UTIL_LINUX_LIBUUID
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
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_LINUX_PAM  # login utils
+	select BR2_PACKAGE_ZLIB  # cramfs
+	select BR2_PACKAGE_NCURSES  # more, setterm, ul
+	select BR2_PACKAGE_LIBCAP_NG  # setpriv
+	help
+	  Install the complete set of util-linux binaries.
+
+config BR2_PACKAGE_UTIL_LINUX_SELECTED_BINARIES
+	bool "custom"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
-	  Install the basic set of util-linux binaries.
+	  Manually select which util-linux binaries to install.
+
+endchoice
+
+if BR2_PACKAGE_UTIL_LINUX_SELECTED_BINARIES
+
+config BR2_PACKAGE_UTIL_LINUX_BASIC_SET
+	bool "Basic set"
+	help
+	  Install a basic set of util-linux binaries.
 
-if BR2_PACKAGE_UTIL_LINUX_BINARIES
+	  blkdiscard, blkid, blockdev, cal, chcpu, col, colcrt, colrm, column,
+	  ctrlaltdel, dmesg, fdisk, findfs, findmnt, flock, fsfreeze, fstrim,
+	  getopt, hexdump, ipcmk, ipcrm, ipcs, isosize, ldattach, linux32,
+	  linux64, logger, look, lsblk, lscpu, lslocks, lslogins, mcookie,
+	  mkfs, mkswap, namei, prlimit, readprofile, renice, rev, rtcwake,
+	  script, scriptreplay, setarch, setsid, sfdisk, swaplabel, swapoff,
+	  swapon, tailf, uname26, uuidgen, whereis, wipefs
 
 config BR2_PACKAGE_UTIL_LINUX_AGETTY
 	bool "agetty"
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 116596f..fc94a99 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -65,8 +65,14 @@ UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
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
 	$(if $(BR2_PACKAGE_UTIL_LINUX_ARCH),--enable-arch,--disable-arch) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_BFS),--enable-bfs,--disable-bfs) \
@@ -114,6 +120,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WDCTL),--enable-wdctl,--disable-wdctl) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write,--disable-write) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_ZRAMCTL),--enable-zramctl,--disable-zramctl)
+endif
 
 # In the host version of util-linux, we so far only require libuuid,
 # and none of the util-linux utilities, so we disable all of them, unless
@@ -132,12 +139,6 @@ else
 HOST_UTIL_LINUX_CONF_OPTS += --disable-all-programs
 endif
 
-# Avoid building the tools if they are disabled since we can't install on
-# a per-directory basis.
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_BINARIES),)
-UTIL_LINUX_CONF_OPTS += --disable-all-programs
-endif
-
 # Install PAM configuration files
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS),y)
 define UTIL_LINUX_INSTALL_PAMFILES
@@ -153,7 +154,7 @@ endif
 UTIL_LINUX_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_INSTALL_PAMFILES
 
 # Install agetty->getty symlink to avoid breakage when there's no busybox
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_AGETTY),y)
+ifneq ($(BR2_PACKAGE_UTIL_LINUX_ALL_BINARIES)$(BR2_PACKAGE_UTIL_LINUX_AGETTY),)
 ifeq ($(BR2_PACKAGE_BUSYBOX),)
 define UTIL_LINUX_GETTY_SYMLINK
 	ln -sf agetty $(TARGET_DIR)/sbin/getty
-- 
1.7.9.5
