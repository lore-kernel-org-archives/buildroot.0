From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 28 Mar 2019 14:47:54 +0100
Subject: [Buildroot] [PATCH] package/mtd: bump to version 2.1.0
Message-ID: <20190328134755.12044-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Patch is removed because it is included in the release.

From the release notes:
-----------------------------------------------------------------
Changes from 2.0.2 to 2.1.0:

Features:
 - mkfs.ubifs: Implement support for file system encryption
 - mkfs.ubifs: Implement selinux labelling support
 - ubinize: add support for skipping CRC check of a static volume when opening
 - ubimkvol: add support for skipping CRC check of a static volume when opening
 - Add lsmtd program

Fixes:
 - update various kernel headers
 - Instead of doing preprocessor magic, just output off_t as long long
 - fix verification percent display in flashcp
 - mkfs.ubifs: fix double free
 - mkfs.ubifs: Fix xattr nlink value
 - ubinize: avoid to create two UBI_LAYOUT_VOLUME_ID volume
 - common.h: fix prompt function
 - libmtd: don't print an error message for devices without ecc support
 - io_paral: Fix error handling of update_volume()
 - ubimkvol: Initialize req to zero to make sure no flags are set by default
 - libubi: add volume flags to ubi_mkvol_request
 - mkfs.ubifs: add_xattr is not depending on host XATTR support
 - Revert "Return correct error number in ubi_get_vol_info1" which
   introduced a regression.
 - make sure pkg-config is installed in configure script
 - ubiformat: process command line arguments before handling file arguments

Cleanup:
 - ubiformat: remove no-volume-table option
-----------------------------------------------------------------

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 ...ct-error-number-in-ubi_get_vol_info1.patch | 92 -------------------
 package/mtd/mtd.hash                          |  2 +-
 package/mtd/mtd.mk                            |  2 +-
 3 files changed, 2 insertions(+), 94 deletions(-)
 delete mode 100644 package/mtd/0001-revert-return-correct-error-number-in-ubi_get_vol_info1.patch

diff --git a/package/mtd/0001-revert-return-correct-error-number-in-ubi_get_vol_info1.patch b/package/mtd/0001-revert-return-correct-error-number-in-ubi_get_vol_info1.patch
deleted file mode 100644
index 1fd4f7693b..0000000000
--- a/package/mtd/0001-revert-return-correct-error-number-in-ubi_get_vol_info1.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 0f833ac73ad631248826386e2918d8571ecf0347 Mon Sep 17 00:00:00 2001
-From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
-Date: Sat, 9 Jun 2018 16:45:22 +0200
-Subject: [PATCH] Revert "Return correct error number in ubi_get_vol_info1"
-
-This reverts commit dede98ffb706676309488d7cc660f569548d5930.
-
-The original commit tried to fix a descrepancy between the implementation
-and the documentation by making the implementation comply.
-
-When making the change, it was overlooked, that ubinfo and ubirename were
-written against the implementation instead of the behaviour specified by
-the documentation. So were further internal functions like
-ubi_get_vol_info1_nm which further breaks ubirmvol.
-
-A report with an outline of a resulting problem can be read on
-the mailing list:
-
-http://lists.infradead.org/pipermail/linux-mtd/2018-June/081562.html
-
-From the report:
-
-steps to reproduce: have mtd-utils 2.0.1 or 2.0.2
-
-0. make a bunch of ubi volumes in sequential order
-
-ubimkvol /dev/ubi0 -s 64KiB -N test1
-ubimkvol /dev/ubi0 -s 64KiB -N test2
-ubimkvol /dev/ubi0 -s 64KiB -N test3
-ubimkvol /dev/ubi0 -s 64KiB -N test4
-..
-
-1. delete the test1 volume, making a hole in the volume table
-
-ubirmvol /dev/ubi0 -N test1
-
-2. try an affected tool (i.e. "ubirmvol /dev/ubi0 -N test4" )
-
- |root at mr24:/# ubirmvol /dev/ubi0 -N test4
- |ubirmvol: error!: cannot find UBI volume "test4"
- |         error 19 (No such device)
-
-or "ubinfo -a"
-
- | root at mr24:/# ubinfo -a
- | UBI version:                    1
- | Count of UBI devices:           1
- | UBI control device major/minor: 10:59
- | Present UBI devices:            ubi0
- |
- | ubi0
- | Volumes count:                           11
- | Logical eraseblock size:                 15872 bytes, 15.5 KiB
- | Total amount of logical eraseblocks:     1952 (30982144 bytes, 29.5 MiB)
- | Amount of available logical eraseblocks: 75 (1190400 bytes, 1.1 MiB)
- | Maximum count of volumes                 92
- | Count of bad physical eraseblocks:       0
- | Count of reserved physical eraseblocks:  40
- | Current maximum erase counter value:     984
- | Minimum input/output unit size:          512 bytes
- | Character device major/minor:            251:0
- | ubinfo: error!: libubi failed to probe volume 5 on ubi0
- |        error 19 (No such device)
- | Present volumes:                         0, 1, 2, 3, 4root at mr24:/#
-
-Reported-by: Christian Lamparter <chunkeey@gmail.com>
-Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
-Signed-off-by: David Owens <david.owens@rockwellcollins.com>
----
- lib/libubi.c | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/lib/libubi.c b/lib/libubi.c
-index b50e68a..978b433 100644
---- a/lib/libubi.c
-+++ b/lib/libubi.c
-@@ -1240,11 +1240,8 @@ int ubi_get_vol_info1(libubi_t desc, int dev_num, int vol_id,
- 	info->dev_num = dev_num;
- 	info->vol_id = vol_id;
- 
--	if (vol_get_major(lib, dev_num, vol_id, &info->major, &info->minor)) {
--		if (errno == ENOENT)
--			errno = ENODEV;
-+	if (vol_get_major(lib, dev_num, vol_id, &info->major, &info->minor))
- 		return -1;
--	}
- 
- 	ret = vol_read_data(lib->vol_type, dev_num, vol_id, buf, 50);
- 	if (ret < 0)
--- 
-2.14.4
-
diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
index 4bd0cda097..e82b3522cb 100644
--- a/package/mtd/mtd.hash
+++ b/package/mtd/mtd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
 # ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.0.2.tar.bz2.asc
-sha256	fb3de61be8e932abb424e8ea3c30298f553d5f970ad158a737bb303bbf9660b8	mtd-utils-2.0.2.tar.bz2
+sha256	b4b995b06d93aee4125e8e44c05a1cae6eea545ca5a6e8a377405ee8aa454bd2	mtd-utils-2.1.0.tar.bz2
 sha256	dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa	COPYING
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 13e501fc33..aa19e94c39 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTD_VERSION = 2.0.2
+MTD_VERSION = 2.1.0
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
 MTD_LICENSE = GPL-2.0
-- 
2.19.2
