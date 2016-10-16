From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 15:53:53 +0200
Subject: [Buildroot] [git commit] util-linux: allow disabling the basic set
	of tools
Message-ID: <20161016135433.8E4B9817E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8ddc0de9eb1ee6dc0c255ef03ba654f42453433
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When even a single extra util-linux utility is enabled, the default
build and install will install many more programs, including many that
overlap with those offered by busybox.

Fix by reworking the install-utilies menu to take advantage of the new
--disable-all-programs config option. This option make it possible to
disable the basic set of apps, and then enable only the desired apps.

Original patch by Danomi Manchego, visible at
http://patchwork.ozlabs.org/patch/494866/

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
[Thomas/Arnout: remove the choice between all/custom/no, and simply have
a list of options with the basic set of tools, and then one option for
each tool. This gives the same flexibility, but avoids the choice, which
is never nice to have.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/util-linux/Config.in     | 20 ++++++++------------
 package/util-linux/util-linux.mk |  7 +------
 2 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 917a53d..38d68ca 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -45,7 +45,7 @@ config BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	  Install libuuid.
 
 config BR2_PACKAGE_UTIL_LINUX_BINARIES
-	bool "install utilities"
+	bool "basic set"
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
@@ -55,19 +55,17 @@ config BR2_PACKAGE_UTIL_LINUX_BINARIES
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
@@ -371,7 +369,5 @@ config BR2_PACKAGE_UTIL_LINUX_ZRAMCTL
 
 endif
 
-endif
-
 comment "util-linux needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 4dadc3f..bd6508c 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -71,6 +71,7 @@ UTIL_LINUX_DEPENDENCIES += $(if $(BR2_PACKAGE_LINUX_PAM),linux-pam)
 
 # Disable/Enable utilities
 UTIL_LINUX_CONF_OPTS += \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_BINARIES),--enable-all-programs,--disable-all-programs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_AGETTY),--enable-agetty,--disable-agetty) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_BFS),--enable-bfs,--disable-bfs) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_CAL),--enable-cal,--disable-cal) \
@@ -142,12 +143,6 @@ else
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
