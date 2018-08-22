From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 Aug 2018 13:34:15 +0200
Subject: [Buildroot] [git commit branch/next] btrfs-progs: make e2fsprogs an
 optional dependency
Message-ID: <20180822113133.A40848E24A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=237c8d6b0ced7954ef64bd8b4d82a95d93443a88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

e2fsprogs is only needed to build the btrfs-convert program, that
allows to convert an existing ext2 filesystem into a btrfs
filesystem. Not everybody needs to do that and making this dependency
optional is nicer, so this is what this patch does.

Note that btrfs-progs also supports converting from reiserfs, which is
why the --with-convert option supports a list of filesystems. Since
Buildroot has no package for the reiserfs library, we for now only
support the ext2 case, with e2fsprogs as a dependency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/btrfs-progs/Config.in      |  1 -
 package/btrfs-progs/btrfs-progs.mk | 12 +++++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/btrfs-progs/Config.in b/package/btrfs-progs/Config.in
index ad86bab580..35dfc39193 100644
--- a/package/btrfs-progs/Config.in
+++ b/package/btrfs-progs/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_BTRFS_PROGS
 	bool "btrfs-progs"
 	depends on BR2_USE_MMU # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 2f9f4127b6..33a6be324f 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -7,7 +7,7 @@
 BTRFS_PROGS_VERSION = 4.16.1
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
-BTRFS_PROGS_DEPENDENCIES = host-pkgconf e2fsprogs lzo util-linux zlib
+BTRFS_PROGS_DEPENDENCIES = host-pkgconf lzo util-linux zlib
 BTRFS_PROGS_CONF_OPTS = --disable-backtrace --disable-zstd --disable-python
 BTRFS_PROGS_LICENSE = GPL-2.0, LGPL-3.0+ (libbtrfsutil)
 BTRFS_PROGS_LICENSE_FILES = COPYING libbtrfsutil/COPYING \
@@ -21,6 +21,16 @@ BTRFS_PROGS_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-static
 BTRFS_PROGS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-static
 endif
 
+# convert also supports conversion from reiserfs, which needs some
+# reiserfs libraries, but we have no package for them in Buildroot, so
+# we keep things simple and only handle ext2.
+ifeq ($(BR2_PACKAGE_E2FSPROGS),y)
+BTRFS_PROGS_CONF_OPTS += --enable-convert --with-convert=ext2
+BTRFS_PROGS_DEPENDENCIES += e2fsprogs
+else
+BTRFS_PROGS_CONF_OPTS += --disable-convert
+endif
+
 HOST_BTRFS_PROGS_DEPENDENCIES = host-util-linux host-lzo host-zlib
 HOST_BTRFS_PROGS_CONF_OPTS = \
 	--disable-backtrace \
