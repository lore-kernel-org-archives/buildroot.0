From: Carlos Santos <casantos@datacom.ind.br>
Date: Sat,  9 Jul 2016 22:16:09 -0300
Subject: [Buildroot] [PATCH v7 3/3] util-linux: rework utilities menu for
	finer control
In-Reply-To: <1468113369-16118-1-git-send-email-casantos@datacom.ind.br>
References: <20160708205217.GB3757@free.fr>
 <1468113369-16118-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <1468113369-16118-5-git-send-email-casantos@datacom.ind.br>
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

Original patch by Danomi Manchego, visible at
http://patchwork.ozlabs.org/patch/494866/

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 Config.in.legacy                 | 16 ++++++++++++
 package/util-linux/Config.in     | 53 +++++++++++++++++++++++++++++++---------
 package/util-linux/util-linux.mk | 15 ++++++------
 3 files changed, 66 insertions(+), 18 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4101cb0..78a6866 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,22 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.08"
 
+config BR2_PACKAGE_UTIL_LINUX_BINARIES
+	bool "utility selection in util-linux has been refactored"
+	select BR2_LEGACY
+	select BR2_PACKAGE_UTIL_LINUX_CUSTOM_BINARIES
+	select BR2_PACKAGE_UTIL_LINUX_BASIC_BINARIES
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
+	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  This option has been removed in favor of a more fine-grained
+	  configuration, which is recommended. Selecting this option
+	  enables building and installing the basic set of utilities.
+	  It will also install all util-linux libraries.
+
 config BR2_PACKAGE_SYSTEMD_COMPAT
 	bool "systemd compatibility libraries have been removed"
 	help
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 266dc47..0ca961d 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -44,8 +44,41 @@ config BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Install libuuid.
 
-config BR2_PACKAGE_UTIL_LINUX_BINARIES
-	bool "Install utilities"
+choice
+	prompt "Install utilities"
+	default BR2_PACKAGE_UTIL_LINUX_NO_BINARIES
+
+config BR2_PACKAGE_UTIL_LINUX_ALL_BINARIES
+	bool "all"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
+	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
+	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	select BR2_PACKAGE_LINUX_PAM
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_LIBCAP_NG
+	help
+	  Install the complete set of util-linux binaries.
+
+config BR2_PACKAGE_UTIL_LINUX_CUSTOM_BINARIES
+	bool "custom"
+	help
+	  Manually select which util-linux binaries to install.
+
+config BR2_PACKAGE_UTIL_LINUX_NO_BINARIES
+	bool "none"
+	help
+	  Disable all util-linux binaries.
+
+endchoice
+
+if BR2_PACKAGE_UTIL_LINUX_CUSTOM_BINARIES
+
+config BR2_PACKAGE_UTIL_LINUX_BASIC_BINARIES
+	bool "Basic set"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
@@ -55,19 +88,17 @@ config BR2_PACKAGE_UTIL_LINUX_BINARIES
 	help
 	  Install the basic set of util-linux binaries.
 
-	  blkdiscard, blkid, blockdev, cfdisk, chcpu, col, colcrt,
-	  colrm, column, ctrlaltdel, dmesg, fdisk, findfs, findmnt,
-	  flock, fsfreeze, fstrim, getopt, hexdump, ipcmk, isosize,
-	  ldattach, look, lsblk, lscpu, lsipc, lslocks, lsns, mcookie,
-	  mkfs, mkswap, namei, prlimit, readprofile, renice, rev,
-	  rtcwake, script, scriptreplay, setarch, setsid, sfdisk,
-	  swaplabel, swapoff, swapon, tailf, uuidgen, whereis, wipefs
+	  blkdiscard, blkid, blockdev, chcpu, col, colcrt, colrm,
+	  column, ctrlaltdel, dmesg, fdisk, findfs, findmnt, flock,
+	  fsfreeze, fstrim, getopt, hexdump, ipcmk, isosize, ldattach,
+	  look, lsblk, lscpu, lsipc, lslocks, lsns, mcookie, mkfs,
+	  mkswap, namei, prlimit, readprofile, renice, rev, rtcwake,
+	  script, scriptreplay, setarch, setsid, sfdisk, swaplabel,
+	  swapoff, swapon, tailf, uuidgen, whereis, wipefs
 
 	  The setarch utility also installs architecture-specific
 	  symlinks like linux32, linux64, uname26, i386 and x86_64.
 
-if BR2_PACKAGE_UTIL_LINUX_BINARIES
-
 config BR2_PACKAGE_UTIL_LINUX_AGETTY
 	bool "agetty"
 	depends on BR2_USE_MMU # fork()
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 097291d..c78ca7d 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -63,8 +63,14 @@ UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 # Used by login-utils
 UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_LINUX_PAM),linux-pam)
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_NO_BINARIES),y)
+UTIL_LINUX_CONF_OPTS += --disable-all-programs
+else ifeq ($(BR2_PACKAGE_UTIL_LINUX_ALL_BINARIES),y)
+UTIL_LINUX_CONF_OPTS += --enable-all-programs
+else
 # Disable/Enable utilities
 UTIL_LINUX_CONF_OPTS += \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_BASIC_BINARIES),,--disable-all-programs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_AGETTY),--enable-agetty,--disable-agetty) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_BFS),--enable-bfs,--disable-bfs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CAL),--enable-cal,--disable-cal) \
@@ -117,6 +123,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WDCTL),--enable-wdctl,--disable-wdctl) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_WRITE),--enable-write,--disable-write) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_ZRAMCTL),--enable-zramctl,--disable-zramctl)
+endif
 
 # In the host version of util-linux, we so far only require libuuid,
 # and none of the util-linux utilities, so we disable all of them, unless
@@ -135,12 +142,6 @@ else
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
@@ -167,7 +168,7 @@ endif
 UTIL_LINUX_POST_INSTALL_TARGET_HOOKS += UTIL_LINUX_INSTALL_PAMFILES
 
 # Install agetty->getty symlink to avoid breakage when there's no busybox
-ifeq ($(BR2_PACKAGE_UTIL_LINUX_AGETTY),y)
+ifeq ($(or $(BR2_PACKAGE_UTIL_LINUX_ALL_BINARIES),$(BR2_PACKAGE_UTIL_LINUX_AGETTY)),y)
 ifeq ($(BR2_PACKAGE_BUSYBOX),)
 define UTIL_LINUX_GETTY_SYMLINK
 	ln -sf agetty $(TARGET_DIR)/sbin/getty
-- 
2.7.4
