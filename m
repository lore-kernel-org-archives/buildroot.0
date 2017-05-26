From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 May 2017 14:58:20 +0200
Subject: [Buildroot] [git commit] package/dosfstools: bump version to 4.1
Message-ID: <20170601202856.22E6C807D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3347a7742c2905ab7e8245deb609f3452013cf37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches applied upstream:

0001-mkfs-Default-to-64-32-heads-sectors-for-targets-smalle.patch
https://github.com/dosfstools/dosfstools/commit/1e76e5778a1885452939a79d9145b80634a5b023

0002-src-device_info.c-Fix-undefined-PATH_MAX-under-musl.patch
https://github.com/dosfstools/dosfstools/commit/69ac2b0706ff01ea7a8b6efd9f9efa2481895261

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...to-64-32-heads-sectors-for-targets-smalle.patch | 42 ----------------------
 ..._info.c-Fix-undefined-PATH_MAX-under-musl.patch | 31 ----------------
 package/dosfstools/dosfstools.hash                 |  2 +-
 package/dosfstools/dosfstools.mk                   |  2 +-
 4 files changed, 2 insertions(+), 75 deletions(-)

diff --git a/package/dosfstools/0001-mkfs-Default-to-64-32-heads-sectors-for-targets-smalle.patch b/package/dosfstools/0001-mkfs-Default-to-64-32-heads-sectors-for-targets-smalle.patch
deleted file mode 100644
index ff3c3ff..0000000
--- a/package/dosfstools/0001-mkfs-Default-to-64-32-heads-sectors-for-targets-smalle.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 1e76e5778a1885452939a79d9145b80634a5b023 Mon Sep 17 00:00:00 2001
-From: Andreas Bombe <aeb@debian.org>
-Date: Wed, 11 May 2016 03:44:58 +0200
-Subject: [PATCH] mkfs: Default to 64/32 heads/sectors for targets smaller than
- 512 MB
-
-This may put defaults in certain use cases a little bit more in line
-with the old defaults in versions up to 3.0.28. It has mostly aesthetic
-value in most cases.
-
-Signed-off-by: Andreas Bombe <aeb@debian.org>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Patch status: upstream
-
- src/mkfs.fat.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/src/mkfs.fat.c b/src/mkfs.fat.c
-index 8a320fd..bad492b 100644
---- a/src/mkfs.fat.c
-+++ b/src/mkfs.fat.c
-@@ -519,6 +519,16 @@ static void establish_params(struct device_info *info)
-     unsigned int cluster_size = 4;  /* starting point for FAT12 and FAT16 */
-     int def_root_dir_entries = 512;
- 
-+    if (info->size < 512 * 1024 * 1024) {
-+	/*
-+	 * These values are more or less meaningless, but we can@least
-+	 * use less extreme values for smaller filesystems where the large
-+	 * dummy values signifying LBA only access are not needed.
-+	 */
-+	sec_per_track = 32;
-+	heads = 64;
-+    }
-+
-     if (info->type != TYPE_FIXED) {
- 	/* enter default parameters for floppy disks if the size matches */
- 	switch (info->size / 1024) {
--- 
-2.7.3
-
diff --git a/package/dosfstools/0002-src-device_info.c-Fix-undefined-PATH_MAX-under-musl.patch b/package/dosfstools/0002-src-device_info.c-Fix-undefined-PATH_MAX-under-musl.patch
deleted file mode 100644
index 9740304..0000000
--- a/package/dosfstools/0002-src-device_info.c-Fix-undefined-PATH_MAX-under-musl.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 06ce096dabd8a29c72dc0bc5110d2c4867baa490 Mon Sep 17 00:00:00 2001
-From: Alessio Sergi <al3hex@gmail.com>
-Date: Fri, 6 May 2016 18:18:18 +0200
-Subject: [PATCH] src/device_info.c: Fix undefined PATH_MAX under musl
-
-In musl libc, PATH_MAX is defined in <limits.h>.
-
-Status: pending
-https://github.com/dosfstools/dosfstools/pull/27
-
-[Romain: add patch status]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- src/device_info.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/device_info.c b/src/device_info.c
-index f5d11ac..cd57388 100644
---- a/src/device_info.c
-+++ b/src/device_info.c
-@@ -17,6 +17,7 @@
- */
- 
- 
-+#include <limits.h>
- #include <stdint.h>
- #include <stdbool.h>
- #include <sys/types.h>
--- 
-2.5.5
-
diff --git a/package/dosfstools/dosfstools.hash b/package/dosfstools/dosfstools.hash
index 777b8d9..2515ea6 100644
--- a/package/dosfstools/dosfstools.hash
+++ b/package/dosfstools/dosfstools.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	9037738953559d1efe04fc5408b6846216cc0138f7f9d32de80b6ec3c35e7daf	dosfstools-4.0.tar.xz
+sha256 e6b2aca70ccc3fe3687365009dd94a2e18e82b688ed4e260e04b7412471cc173  dosfstools-4.1.tar.xz
diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index c2e1690..6eb0851 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOSFSTOOLS_VERSION = 4.0
+DOSFSTOOLS_VERSION = 4.1
 DOSFSTOOLS_SOURCE = dosfstools-$(DOSFSTOOLS_VERSION).tar.xz
 DOSFSTOOLS_SITE = https://github.com/dosfstools/dosfstools/releases/download/v$(DOSFSTOOLS_VERSION)
 DOSFSTOOLS_LICENSE = GPL-3.0+
