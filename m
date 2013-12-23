From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 23 Dec 2013 09:35:48 +0100
Subject: [Buildroot] [PATCH 2 of 3 v2] squashfs3: remove deprecated
	package/rootfs
In-Reply-To: <patchbomb.1387787746@argentina>
References: <patchbomb.1387787746@argentina>
Message-ID: <c5a56efdbbeba48daf09.1387787748@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Note: I did not add a legacy entry for  BR2_TARGET_ROOTFS_SQUASHFS4 because
it's simply removed, its role now played by the parent
BR2_TARGET_ROOTFS_SQUASHFS. Therefore, I don't think we need legacy symbols
in this case, right?

 Config.in.legacy                                       |  17 ++++++
 feature-removal-schedule.txt                           |   4 -
 fs/squashfs/Config.in                                  |  16 ------
 fs/squashfs/squashfs.mk                                |  12 ----
 package/Config.in                                      |   1 -
 package/squashfs3/Config.in                            |  12 ----
 package/squashfs3/squashfs3-3.4-build-system-fix.patch |  37 --------------
 package/squashfs3/squashfs3-3.4-get_nprocs.patch       |  33 ------------
 package/squashfs3/squashfs3.mk                         |  34 ------------
 9 files changed, 17 insertions(+), 149 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,23 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.02"
 
+config BR2_PACKAGE_SQUASHFS3
+	bool "squashfs3 has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_SQUASHFS
+	help
+	  The 'squashfs3' package has been removed since it has been
+	  deprecated for more than four buildroot releases. Package
+	  'squashfs' (4) has been selected automatically as replacement.
+
+config BR2_TARGET_ROOTFS_SQUASHFS3
+	bool "squashfs3 rootfs support has been removed"
+	select BR2_LEGACY
+	help
+	  Together with the removal of the squashfs3 package, support
+	  for squashfs3 root filesystems has been removed too. Squashfs
+	  root filesystems will automatically use squashfs4 now.
+
 config BR2_PACKAGE_NETKITBASE
 	bool "netkitbase has been removed"
 	select BR2_LEGACY
diff --git a/feature-removal-schedule.txt b/feature-removal-schedule.txt
--- a/feature-removal-schedule.txt
+++ b/feature-removal-schedule.txt
@@ -7,10 +7,6 @@ Note that several features/packages have
 should have been removed right now. Expect this to be corrected soon.
 
 
-To be removed in 2011.05:
-BR2_PACKAGE_SQUASHFS3
-BR2_TARGET_ROOTFS_SQUASHFS3
-
 To be removed in 2011.11:
 BR2_PACKAGE_LZMA
 
diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
--- a/fs/squashfs/Config.in
+++ b/fs/squashfs/Config.in
@@ -4,26 +4,10 @@ config BR2_TARGET_ROOTFS_SQUASHFS
 	  Build a squashfs root filesystem
 
 if BR2_TARGET_ROOTFS_SQUASHFS
-choice
-	prompt "SquashFS version"
-	default BR2_TARGET_ROOTFS_SQUASHFS4
-	help
-	  Select the Squash filesystem version to use to generate the
-	  root filesystem.
-
-config BR2_TARGET_ROOTFS_SQUASHFS4
-	bool "4.x"
-
-config BR2_TARGET_ROOTFS_SQUASHFS3
-	depends on BR2_DEPRECATED
-	bool "3.x"
-
-endchoice
 
 choice
 	prompt "Compression algorithm"
 	default BR2_TARGET_ROOTFS_SQUASHFS4_GZIP
-	depends on BR2_TARGET_ROOTFS_SQUASHFS4
 	help
 	  Select the squashfs compression algorithm to use when
 	  generating the filesystem.
diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
--- a/fs/squashfs/squashfs.mk
+++ b/fs/squashfs/squashfs.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4),y)
 ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
 
 ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZO),y)
@@ -21,17 +20,6 @@ endif
 endif
 endif
 
-else
-ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs3
-
-ifeq ($(BR2_ENDIAN),"BIG")
-ROOTFS_SQUASHFS_ARGS=-be
-else
-ROOTFS_SQUASHFS_ARGS=-le
-endif
-
-endif
-
 define ROOTFS_SQUASHFS_CMD
 	$(HOST_DIR)/usr/bin/mksquashfs $(TARGET_DIR) $@ -noappend \
 		$(ROOTFS_SQUASHFS_ARGS) && \
diff --git a/package/Config.in b/package/Config.in
--- a/package/Config.in
+++ b/package/Config.in
@@ -146,7 +146,6 @@ source "package/mtd/Config.in"
 source "package/nfs-utils/Config.in"
 source "package/ntfs-3g/Config.in"
 source "package/squashfs/Config.in"
-source "package/squashfs3/Config.in"
 source "package/sshfs/Config.in"
 source "package/sunxi-tools/Config.in"
 source "package/unionfs/Config.in"
diff --git a/package/squashfs3/Config.in b/package/squashfs3/Config.in
deleted file mode 100644
--- a/package/squashfs3/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_SQUASHFS3
-	bool "squashfs3"
-	depends on BR2_DEPRECATED
-	depends on BR2_LARGEFILE
-	help
-	  Tools to generate SquashFS 3.x filesystems.
-
-	  http://squashfs.sourceforge.net/
-
-comment "squashfs3 needs a toolchain w/ largefile"
-	depends on BR2_DEPRECATED
-	depends on !BR2_LARGEFILE
diff --git a/package/squashfs3/squashfs3-3.4-build-system-fix.patch b/package/squashfs3/squashfs3-3.4-build-system-fix.patch
deleted file mode 100644
--- a/package/squashfs3/squashfs3-3.4-build-system-fix.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-[PATCH]: squashfs-tools: Handle user supplied CFLAGS/LDFLAGS
-
-Properly handle make CFLAGS=.. LDFLAGS=..
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- squashfs-tools/Makefile |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-Index: squashfs3.4/squashfs-tools/Makefile
-===================================================================
---- squashfs3.4.orig/squashfs-tools/Makefile	2008-08-26 09:10:13.000000000 +0200
-+++ squashfs3.4/squashfs-tools/Makefile	2010-05-06 21:09:28.000000000 +0200
-@@ -2,12 +2,12 @@
- 
- INCLUDEDIR = .
- 
--CFLAGS := -I$(INCLUDEDIR) -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_GNU_SOURCE -O2
-+override CFLAGS += -I$(INCLUDEDIR) -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_GNU_SOURCE -O2
- 
- all: mksquashfs unsquashfs
- 
- mksquashfs: mksquashfs.o read_fs.o sort.o
--	$(CC) mksquashfs.o read_fs.o sort.o -lz -lpthread -lm -o $@
-+	$(CC) $(LDFLAGS) mksquashfs.o read_fs.o sort.o -lz -lpthread -lm -o $@
- 
- mksquashfs.o: mksquashfs.c squashfs_fs.h mksquashfs.h global.h sort.h
- 
-@@ -16,7 +16,7 @@
- sort.o: sort.c squashfs_fs.h global.h sort.h
- 
- unsquashfs: unsquashfs.o
--	$(CC) unsquashfs.o -lz -lpthread -lm -o $@
-+	$(CC) $(LDFLAGS) unsquashfs.o -lz -lpthread -lm -o $@
- 
- unsquashfs.o: unsquashfs.c squashfs_fs.h read_fs.h global.h
- 
diff --git a/package/squashfs3/squashfs3-3.4-get_nprocs.patch b/package/squashfs3/squashfs3-3.4-get_nprocs.patch
deleted file mode 100644
--- a/package/squashfs3/squashfs3-3.4-get_nprocs.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-squashfs3: fix build with uClibc
-
-The squashfs3 package uses the old get_nprocs() GNU extension which does not
-exist in uClibc. This has already been fixed in newer squashfs releases
-(>=4.0).
-
-Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
-Index: squashfs3-3.4/squashfs-tools/mksquashfs.c
-===================================================================
---- squashfs3-3.4.orig/squashfs-tools/mksquashfs.c
-+++ squashfs3-3.4/squashfs-tools/mksquashfs.c
-@@ -3178,7 +3178,7 @@ void initialise_threads()
- 			processors = 1;
- 		}
- #else
--		processors = get_nprocs();
-+		processors = sysconf(_SC_NPROCESSORS_CONF);
- #endif
- 	}
- 
-Index: squashfs3-3.4/squashfs-tools/unsquashfs.c
-===================================================================
---- squashfs3-3.4.orig/squashfs-tools/unsquashfs.c
-+++ squashfs3-3.4/squashfs-tools/unsquashfs.c
-@@ -2428,7 +2428,7 @@ void initialise_threads(int fragment_buf
- 			processors = 1;
- 		}
- #else
--		processors = get_nprocs();
-+		processors = sysconf(_SC_NPROCESSORS_CONF);
- #endif
- 	}
- 
diff --git a/package/squashfs3/squashfs3.mk b/package/squashfs3/squashfs3.mk
deleted file mode 100644
--- a/package/squashfs3/squashfs3.mk
+++ /dev/null
@@ -1,34 +0,0 @@
-################################################################################
-#
-# squashfs3
-#
-################################################################################
-
-SQUASHFS3_VERSION = 3.4
-SQUASHFS3_SOURCE = squashfs$(SQUASHFS3_VERSION).tar.gz
-SQUASHFS3_SITE = http://downloads.sourceforge.net/project/squashfs/squashfs/$(SQUASHFS3_VERSION)
-
-SQUASHFS3_DEPENDENCIES = zlib
-
-define SQUASHFS3_BUILD_CMDS
- $(TARGET_MAKE_ENV) $(MAKE)    \
-   CC="$(TARGET_CC)"           \
-   CFLAGS="$(TARGET_CFLAGS)"   \
-   LDFLAGS="$(TARGET_LDFLAGS)" \
-   -C $(@D)/squashfs-tools/
-endef
-
-define SQUASHFS3_INSTALL_TARGET_CMDS
- $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/squashfs-tools/ INSTALL_DIR=$(TARGET_DIR)/usr/bin install
-endef
-
-define HOST_SQUASHFS3_BUILD_CMDS
- $(HOST_MAKE_ENV) $(MAKE) CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)" -C $(@D)/squashfs-tools/
-endef
-
-define HOST_SQUASHFS3_INSTALL_CMDS
- $(HOST_MAKE_ENV) $(MAKE) -C $(@D)/squashfs-tools/ INSTALL_DIR=$(HOST_DIR)/usr/bin install
-endef
-
-$(eval $(generic-package))
-$(eval $(host-generic-package))
