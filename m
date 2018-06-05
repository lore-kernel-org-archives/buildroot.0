From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  5 Jun 2018 15:10:36 +0300
Subject: [Buildroot] [PATCH] btrfs-progs: bump to version 4.16.1
Message-ID: <e53a8182bb77e84d2d406289a1fe7652a019e28a.1528200636.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...0003-btrfs.static-needs-libbtrfsutil.patch | 39 -------------------
 package/btrfs-progs/btrfs-progs.hash          |  2 +-
 package/btrfs-progs/btrfs-progs.mk            |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 package/btrfs-progs/0003-btrfs.static-needs-libbtrfsutil.patch

diff --git a/package/btrfs-progs/0003-btrfs.static-needs-libbtrfsutil.patch b/package/btrfs-progs/0003-btrfs.static-needs-libbtrfsutil.patch
deleted file mode 100644
index 30ab75ae5733..000000000000
--- a/package/btrfs-progs/0003-btrfs.static-needs-libbtrfsutil.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 5023fdf9a4524106ef6fe1d0fdd75ade16dec62c Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 10 Apr 2018 22:56:31 +0300
-Subject: [PATCH] btrfs.static: needs libbtrfsutil
-
-Add libbtrfsutil objects to btrfs.static link command. This fixes static
-build failure:
-
-utils.static.o: In function `parse_qgroupid':
-utils.c:(.text.parse_qgroupid+0xb0): undefined reference to `btrfs_util_is_subvolume'
-props.static.o: In function `prop_read_only':
-props.c:(.text.prop_read_only+0x70): undefined reference to `btrfs_util_set_subvolume_read_only'
-...
-Makefile:457: recipe for target 'btrfs.static' failed
-make[1]: *** [btrfs.static] Error 1
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://patchwork.kernel.org/patch/10333795/
-
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 5ba76d2eee40..9b97c36a44a5 100644
---- a/Makefile
-+++ b/Makefile
-@@ -453,7 +453,7 @@ btrfs: btrfs.o $(objects) $(cmds_objects) $(libs_static)
- 	@echo "    [LD]     $@"
- 	$(Q)$(CC) -o $@ $^ $(LDFLAGS) $(LIBS) $(LIBS_COMP)
- 
--btrfs.static: btrfs.static.o $(static_objects) $(static_cmds_objects) $(static_libbtrfs_objects)
-+btrfs.static: btrfs.static.o $(static_objects) $(static_cmds_objects) $(static_libbtrfs_objects) $(libbtrfsutil_objects)
- 	@echo "    [LD]     $@"
- 	$(Q)$(CC) -o $@ $^ $(STATIC_LDFLAGS) $(STATIC_LIBS) $(STATIC_LIBS_COMP)
- 
--- 
-2.16.3
-
diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index 79aee129f788..71793d1c687d 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256 f3e0ec4864b7b89db1a6a36fa48bf8a9217117714a04b13c84d0fea1eac154b2  btrfs-progs-v4.16.tar.xz
+sha256 013403fb67b17975b21408fa9eb7523b0ecf94f84f8a4397cf972e8e254d2246  btrfs-progs-v4.16.1.tar.xz
 # Locally computed
 sha256 0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
 sha256 3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  libbtrfsutil/COPYING
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index ec2eae707ca5..b4cc83935295 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 4.16
+BTRFS_PROGS_VERSION = 4.16.1
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf e2fsprogs lzo util-linux zlib
-- 
2.17.1
