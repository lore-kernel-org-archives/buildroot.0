From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 22 Apr 2017 13:59:43 +0200
Subject: [Buildroot] [PATCH v8 00/12] e2fsprogs: refactor to fix conflicts
	with busybox and util-linux
Message-ID: <20170422115955.22718-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 This is v8 of the large patch sent previously by Carlos Santos, split
up into smaller bits for each individual change.

 There are also a few things I modified myself - each individual patch
contains a comment that explains what I changed. For completeness, the
diff between the end of this series and the v7 previously posted by
Carlos is below.

 I have not tested this series as extensively as Carlos, but as you can
see in the diff below there is nothing major or risky that I changed.

 Regards,
 Arnout

---
Carlos Santos (12):
  e2fsprogs: change upstream URL sf.net -> sourceforge.net
  e2fsprogs: add missing arch depends to comment
  e2fsprogs: change into menuconfig
  e2fsprogs: remove uuidgen support
  e2fsprogs: use libblkid and libuuid from util-linux for host
  e2fsprogs: let it create symlinks
  e2fsprogs: refactor to fix conflicts with busybox and util-linux
  e2fsprogs: add help text for all config options
  e2fsprogs: disable unneeded features for host
  e2fsprogs: add explicit --enable/--disable configure options
  e2fsprogs: avoid conflict with util-linux fsck wrapper
  e2fsprogs: only add -lintl for static builds

 package/e2fsprogs/Config.in      |  84 ++++++++----------------
 package/e2fsprogs/Config.in.host |   1 +
 package/e2fsprogs/e2fsprogs.mk   | 134 +++++++++++----------------------------
 3 files changed, 63 insertions(+), 156 deletions(-)
---
diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index 03a17c9dc6..819d82760c 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -3,6 +3,7 @@ menuconfig BR2_PACKAGE_E2FSPROGS
 	depends on BR2_USE_MMU # util-linux/libblkid
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  The EXT2 file system utilities.
 
@@ -16,7 +17,7 @@ menuconfig BR2_PACKAGE_E2FSPROGS
 
 	  Other programs can be selected individually.
 
-	  http://e2fsprogs.sourceforge.net/
+	  http://e2fsprogs.sourceforge.net
 
 if BR2_PACKAGE_E2FSPROGS
 
@@ -49,9 +50,6 @@ config BR2_PACKAGE_E2FSPROGS_FSCK
 	  Check and repair a Linux file system. This is a wrapper around
 	  the filesystem-specific fsck tools.
 
-comment "the fsck from util-linux has preference over this one"
-	depends on BR2_PACKAGE_UTIL_LINUX_FSCK
-
 config BR2_PACKAGE_E2FSPROGS_FUSE2FS
 	bool "fuse2fs"
 	depends on !BR2_STATIC_LIBS # libfuse
@@ -65,7 +63,6 @@ comment "fuse2fs needs a toolchain w/ threads, dynamic library"
 
 config BR2_PACKAGE_E2FSPROGS_RESIZE2FS
 	bool "resize2fs"
-	default y
 	help
 	  ext2/ext3/ext4 file system resizer
 
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 2a736838a9..84af7abab8 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -7,8 +7,8 @@
 E2FSPROGS_VERSION = 1.43.4
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
-E2FSPROGS_LICENSE = GPL-2.0, BSD-3-Clause (libuuid), MIT-like with advertising clause (libss and libet)
-E2FSPROGS_LICENSE_FILES = NOTICE lib/uuid/COPYING lib/ss/mit-sipb-copyright.h lib/et/internal.h
+E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
+E2FSPROGS_LICENSE_FILES = NOTICE lib/ss/mit-sipb-copyright.h lib/et/internal.h
 E2FSPROGS_INSTALL_STAGING = YES
 
 # Use libblkid and libuuid from util-linux for host and target packages.
@@ -23,46 +23,43 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 E2FSPROGS_DEPENDENCIES += busybox
 endif
 
-ifeq ($(BR2_PACKAGE_E2FSPROGS_FUSE2FS),y)
-E2FSPROGS_DEPENDENCIES += libfuse
-endif
-
 # e4defrag doesn't build on older systems like RHEL5.x, and we don't
 # need it on the host anyway.
 # Disable fuse2fs as well to avoid carrying over deps, and it's unused
-# Set the binary directories to "$(HOST_DIR)/bin" and "$(HOST_DIR)/sbin"
-# to match the target paths (the $(HOST_DIR) prefix is required because
-# passing DESTDIR=$(HOST_DIR) in the install command does not work).
 HOST_E2FSPROGS_CONF_OPTS = \
 	--disable-defrag \
+	--disable-e2initrd-helper \
 	--disable-fuse2fs \
-	--bindir=$(HOST_DIR)/bin \
-	--sbindir=$(HOST_DIR)/sbin \
-	--enable-symlink-install \
 	--disable-libblkid \
 	--disable-libuuid \
-	--disable-e2initrd-helper \
-	--disable-testio-debug \
-	--disable-rpath
+	--enable-symlink-install \
+	--disable-testio-debug
 
 # Set the binary directories to "/bin" and "/sbin" to override programs
 # installed by busybox.
 E2FSPROGS_CONF_OPTS = \
+	--bindir=/bin \
+	--sbindir=/sbin \
 	$(if $(BR2_STATIC_LIBS),--disable-elf-shlibs,--enable-elf-shlibs) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_DEBUGFS),--enable-debugfs,--disable-debugfs) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_E2IMAGE),--enable-imager,--disable-imager) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_E4DEFRAG),--enable-defrag,--disable-defrag) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_FSCK),--enable-fsck,--disable-fsck) \
-	$(if $(BR2_PACKAGE_E2FSPROGS_FUSE2FS),--enable-fuse2fs,--disable-fuse2fs) \
 	$(if $(BR2_PACKAGE_E2FSPROGS_RESIZE2FS),--enable-resizer,--disable-resizer) \
-	--bindir=/bin \
-	--sbindir=/sbin \
-	--enable-symlink-install \
+	--disable-uuidd \
 	--disable-libblkid \
 	--disable-libuuid \
 	--disable-e2initrd-helper \
 	--disable-testio-debug \
-	--disable-rpath
+	--disable-rpath \
+	--enable-symlink-install
+
+ifeq ($(BR2_PACKAGE_E2FSPROGS_FUSE2FS),y)
+E2FSPROGS_CONF_OPTS += --enable-fuse2fs
+E2FSPROGS_DEPENDENCIES += libfuse
+else
+E2FSPROGS_CONF_OPTS += --disable-fuse2fs
+endif
 
 ifeq ($(BR2_nios2),y)
 E2FSPROGS_CONF_ENV += ac_cv_func_fallocate=no
