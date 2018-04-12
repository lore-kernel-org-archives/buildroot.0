From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 23:04:21 +0200
Subject: [Buildroot] [git commit] btrfs-progs: bump to version 4.16
Message-ID: <20180412210601.820CF8856F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a66ec02b24b6035c40087480e9dc29c62d8fc33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch.

Add a patch for fixing static build.

Add license information about the newly introduced libbtrfsutil.

Disable the libbtrfsutil python binding. It does not cross compile
nicely.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...stall-static-library-and-headers-in-insta.patch |  4 ++-
 ...-convert-ext2-Remove-check-for-ext2_ext_a.patch | 38 ---------------------
 .../0003-btrfs.static-needs-libbtrfsutil.patch     | 39 ++++++++++++++++++++++
 package/btrfs-progs/btrfs-progs.hash               |  4 ++-
 package/btrfs-progs/btrfs-progs.mk                 |  9 ++---
 5 files changed, 50 insertions(+), 44 deletions(-)

diff --git a/package/btrfs-progs/0001-Makefile-install-static-library-and-headers-in-insta.patch b/package/btrfs-progs/0001-Makefile-install-static-library-and-headers-in-insta.patch
index ba65ac4185..1cdedfd984 100644
--- a/package/btrfs-progs/0001-Makefile-install-static-library-and-headers-in-insta.patch
+++ b/package/btrfs-progs/0001-Makefile-install-static-library-and-headers-in-insta.patch
@@ -16,6 +16,8 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Vincent: Rebase for btrfs-progs 4.10]
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+[baruch: Rebase for btrfs-progs 4.16]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 ---
  Makefile | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)
@@ -40,7 +42,7 @@ index 67fbc48..d9e34be 100644
 +	$(INSTALL) -m755 -d $(DESTDIR)$(libdir)
 +	$(INSTALL) $(libs_static) $(DESTDIR)$(libdir)
 +	$(INSTALL) -m755 -d $(DESTDIR)$(incdir)
-+	$(INSTALL) -m644 $(headers) $(DESTDIR)$(incdir)
++	$(INSTALL) -m644 $(libbtrfs_headers) $(DESTDIR)$(incdir)
  
  $(INSTALLDIRS):
  	@echo "Making install in $(patsubst install-%,%,$@)"
diff --git a/package/btrfs-progs/0003-btrfs-progs-convert-ext2-Remove-check-for-ext2_ext_a.patch b/package/btrfs-progs/0003-btrfs-progs-convert-ext2-Remove-check-for-ext2_ext_a.patch
deleted file mode 100644
index cb92837d21..0000000000
--- a/package/btrfs-progs/0003-btrfs-progs-convert-ext2-Remove-check-for-ext2_ext_a.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 3dd9cc2b2411a691f321c01a91bcdac42d476150 Mon Sep 17 00:00:00 2001
-From: Qu Wenruo <wqu@suse.com>
-Date: Wed, 14 Mar 2018 08:56:57 +0800
-Subject: [PATCH] btrfs-progs: convert/ext2: Remove check for
- ext2_ext_attr_entry->e_value_block
-
-In latest e2fsprogs (1.44.0) definition of ext2_ext_attr_entry has
-removed member e_value_block, as currently ext* doesn't support it set
-anyway.
-
-So remove such check so that we can pass compile.
-
-Signed-off-by: Qu Wenruo <wqu@suse.com>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://patchwork.kernel.org/patch/10281327/ (applied; not
-yet in git)
-
- convert/source-ext2.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/convert/source-ext2.c b/convert/source-ext2.c
-index b1492c78693d..070126ec38ec 100644
---- a/convert/source-ext2.c
-+++ b/convert/source-ext2.c
-@@ -422,8 +422,7 @@ static int ext2_xattr_check_entry(struct ext2_ext_attr_entry *entry,
- {
- 	size_t value_size = entry->e_value_size;
- 
--	if (entry->e_value_block != 0 || value_size > size ||
--	    entry->e_value_offs + value_size > size)
-+	if (value_size > size || entry->e_value_offs + value_size > size)
- 		return -EIO;
- 	return 0;
- }
--- 
-2.16.2
-
diff --git a/package/btrfs-progs/0003-btrfs.static-needs-libbtrfsutil.patch b/package/btrfs-progs/0003-btrfs.static-needs-libbtrfsutil.patch
new file mode 100644
index 0000000000..30ab75ae57
--- /dev/null
+++ b/package/btrfs-progs/0003-btrfs.static-needs-libbtrfsutil.patch
@@ -0,0 +1,39 @@
+From 5023fdf9a4524106ef6fe1d0fdd75ade16dec62c Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 10 Apr 2018 22:56:31 +0300
+Subject: [PATCH] btrfs.static: needs libbtrfsutil
+
+Add libbtrfsutil objects to btrfs.static link command. This fixes static
+build failure:
+
+utils.static.o: In function `parse_qgroupid':
+utils.c:(.text.parse_qgroupid+0xb0): undefined reference to `btrfs_util_is_subvolume'
+props.static.o: In function `prop_read_only':
+props.c:(.text.prop_read_only+0x70): undefined reference to `btrfs_util_set_subvolume_read_only'
+...
+Makefile:457: recipe for target 'btrfs.static' failed
+make[1]: *** [btrfs.static] Error 1
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://patchwork.kernel.org/patch/10333795/
+
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 5ba76d2eee40..9b97c36a44a5 100644
+--- a/Makefile
++++ b/Makefile
+@@ -453,7 +453,7 @@ btrfs: btrfs.o $(objects) $(cmds_objects) $(libs_static)
+ 	@echo "    [LD]     $@"
+ 	$(Q)$(CC) -o $@ $^ $(LDFLAGS) $(LIBS) $(LIBS_COMP)
+ 
+-btrfs.static: btrfs.static.o $(static_objects) $(static_cmds_objects) $(static_libbtrfs_objects)
++btrfs.static: btrfs.static.o $(static_objects) $(static_cmds_objects) $(static_libbtrfs_objects) $(libbtrfsutil_objects)
+ 	@echo "    [LD]     $@"
+ 	$(Q)$(CC) -o $@ $^ $(STATIC_LDFLAGS) $(STATIC_LIBS) $(STATIC_LIBS_COMP)
+ 
+-- 
+2.16.3
+
diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index 54d34c9191..79aee129f7 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,4 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256 67102ac0d6795f368acc94efaca29b6626d972638790a4a0c9f89a27cd543f96  btrfs-progs-v4.15.1.tar.xz
+sha256 f3e0ec4864b7b89db1a6a36fa48bf8a9217117714a04b13c84d0fea1eac154b2  btrfs-progs-v4.16.tar.xz
 # Locally computed
 sha256 0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
+sha256 3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  libbtrfsutil/COPYING
+sha256 e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  libbtrfsutil/COPYING.LESSER
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 776a3ef841..ec2eae707c 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 4.15.1
+BTRFS_PROGS_VERSION = 4.16
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf e2fsprogs lzo util-linux zlib
-BTRFS_PROGS_CONF_OPTS = --disable-backtrace --disable-zstd
-BTRFS_PROGS_LICENSE = GPL-2.0
-BTRFS_PROGS_LICENSE_FILES = COPYING
+BTRFS_PROGS_CONF_OPTS = --disable-backtrace --disable-zstd --disable-python
+BTRFS_PROGS_LICENSE = GPL-2.0, LGPL-3.0+ (libbtrfsutil)
+BTRFS_PROGS_LICENSE_FILES = COPYING libbtrfsutil/COPYING \
+	libbtrfsutil/COPYING.LESSER
 BTRFS_PROGS_INSTALL_STAGING = YES
 
 # Doesn't autodetect static-only and tries to build both
