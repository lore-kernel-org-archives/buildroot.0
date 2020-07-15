From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 15 Jul 2020 22:58:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/mtd: bump to version 2.1.2
Message-ID: <20200715205838.22062-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- drop patch included in version
- update hash file formatting (2 spaces)

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 ...-utils-Fix-return-value-of-ubiformat.patch | 60 -------------------
 package/mtd/mtd.hash                          |  6 +-
 package/mtd/mtd.mk                            |  2 +-
 3 files changed, 4 insertions(+), 64 deletions(-)
 delete mode 100644 package/mtd/0001-mtd-utils-Fix-return-value-of-ubiformat.patch

diff --git a/package/mtd/0001-mtd-utils-Fix-return-value-of-ubiformat.patch b/package/mtd/0001-mtd-utils-Fix-return-value-of-ubiformat.patch
deleted file mode 100644
index 88c8389a64..0000000000
--- a/package/mtd/0001-mtd-utils-Fix-return-value-of-ubiformat.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 95633c4dfe943a701d4fcd809e6cabf4bf8710b8 Mon Sep 17 00:00:00 2001
-From: Barry Grussling <barry@grussling.com>
-Date: Sun, 12 Jan 2020 12:33:32 -0800
-Subject: [PATCH] mtd-utils: Fix return value of ubiformat
-
-This changeset fixes a feature regression in ubiformat.  Older versions of
-ubiformat, when invoked with a flash-image, would return 0 in the case no error
-was encountered.  Upon upgrading to latest, it was discovered that ubiformat
-returned 255 even without encountering an error condition.
-
-This changeset corrects the above issue and causes ubiformat, when given an
-image file, to return 0 when no errors are detected.
-
-Tested by running through my loading scripts and verifying ubiformat returned
-0.
-
-Signed-off-by: Barry Grussling <barry@grussling.com>
-Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
-Backported-from: 95633c4dfe943a701d4fcd809e6cabf4bf8710b8
-Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
----
- ubi-utils/ubiformat.c | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
-index 64afad2..be40e52 100644
---- a/ubi-utils/ubiformat.c
-+++ b/ubi-utils/ubiformat.c
-@@ -550,6 +550,7 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
- 	struct ubi_vtbl_record *vtbl;
- 	int eb1 = -1, eb2 = -1;
- 	long long ec1 = -1, ec2 = -1;
-+	int ret = -1;
- 
- 	write_size = UBI_EC_HDR_SIZE + mtd->subpage_size - 1;
- 	write_size /= mtd->subpage_size;
-@@ -643,8 +644,10 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
- 	if (!args.quiet && !args.verbose)
- 		printf("\n");
- 
--	if (novtbl)
-+	if (novtbl) {
-+		ret = 0;
- 		goto out_free;
-+	}
- 
- 	if (eb1 == -1 || eb2 == -1) {
- 		errmsg("no eraseblocks for volume table");
-@@ -669,7 +672,7 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
- 
- out_free:
- 	free(hdr);
--	return -1;
-+	return ret;
- }
- 
- int main(int argc, char * const argv[])
--- 
-2.24.1
-
diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
index 2e23fbb819..fda5a6ea36 100644
--- a/package/mtd/mtd.hash
+++ b/package/mtd/mtd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.1.tar.bz2.asc
-sha256	8d15e8b70f036d6af1a66011f8ca0e048e9675fa7983d33bea92c24313a232d2	mtd-utils-2.1.1.tar.bz2
-sha256	dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa	COPYING
+# ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.2.tar.bz2.asc
+sha256  8ad4c5f34716d40646aa28724a2f5616d325a6f119254f914e26976f1f76e9d6  mtd-utils-2.1.2.tar.bz2
+sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 3477460200..74b19c7e4a 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTD_VERSION = 2.1.1
+MTD_VERSION = 2.1.2
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
 MTD_LICENSE = GPL-2.0
-- 
2.20.1
