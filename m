From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 29 Feb 2016 09:18:20 -0300
Subject: [Buildroot] [PATCH v4 1/1] util-linux: rework utilities menu for
	finer control
In-Reply-To: <1436842628-29469-2-git-send-email-danomimanchego123@gmail.com>
References: <1436842628-29469-2-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1456748300-13013-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Danomi Manchego <danomimanchego123@gmail.com>

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
---
 package/util-linux/Config.in     | 43 ++++++++++++++++++++++++++++++++++++++--
 package/util-linux/util-linux.mk | 15 +++++++-------
 2 files changed, 49 insertions(+), 9 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 60abd67..0bba2c2 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -36,18 +36,57 @@ config BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Install libuuid.
 
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
 config BR2_PACKAGE_UTIL_LINUX_BINARIES
-	bool "install utilities"
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
 
 if BR2_PACKAGE_UTIL_LINUX_BINARIES
 
+config BR2_PACKAGE_UTIL_LINUX_BASIC_SET
+	bool "Basic set"
+	default y
+	help
+	  Install a basic set of util-linux binaries.
+
+	  blkdiscard, blkid, blockdev, cal, chcpu, col, colcrt, colrm, column,
+	  ctrlaltdel, dmesg, fdisk, findfs, findmnt, flock, fsfreeze, fstrim,
+	  getopt, hexdump, ipcmk, ipcrm, ipcs, isosize, ldattach, linux32,
+	  linux64, logger, look, lsblk, lscpu, lslocks, lslogins, mcookie,
+	  mkfs, mkswap, namei, prlimit, readprofile, renice, rev, rtcwake,
+	  script, scriptreplay, setarch, setsid, sfdisk, swaplabel, swapoff,
+	  swapon, tailf, uname26, uuidgen, whereis, wipefs
+
 config BR2_PACKAGE_UTIL_LINUX_AGETTY
 	bool "agetty"
 	help
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 7342174..4c23b52 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -64,8 +64,14 @@ UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
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
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CHFN_CHSH),--enable-chfn-chsh,--disable-chfn-chsh) \
@@ -112,6 +118,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WDCTL),--enable-wdctl,--disable-wdctl) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write,--disable-write) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_ZRAMCTL),--enable-zramctl,--disable-zramctl)
+endif
 
 # In the host version of util-linux, we so far only require libuuid,
 # and none of the util-linux utilities, so we disable all of them, unless
@@ -130,12 +137,6 @@ else
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
@@ -164,7 +165,7 @@ endif
 UTIL_LINUX_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_INSTALL_PAMFILES
 
 # Install agetty->getty symlink to avoid breakage when there's no busybox
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_AGETTY),y)
+ifneq ($(BR2_PACKAGE_UTIL_LINUX_ALL_BINARIES)$(BR2_PACKAGE_UTIL_LINUX_AGETTY),)
 ifeq ($(BR2_PACKAGE_BUSYBOX),)
 define UTIL_LINUX_GETTY_SYMLINK
 	ln -sf agetty $(TARGET_DIR)/sbin/getty
-- 
2.5.0
