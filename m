From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  3 Oct 2020 10:13:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/xfsprogs: bump to version 5.8.0
Message-ID: <20201003081359.2969479-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update hash of GPL-2.0 file because spdx tags have been updated by
  https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=c7498b6911d03f2bd7f74e9f9862d8d5fbd5b5da
- Drop third patch (already in version)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...eclare-globals-provided-by-libraries.patch | 83 -------------------
 package/xfsprogs/xfsprogs.hash                |  6 +-
 package/xfsprogs/xfsprogs.mk                  |  2 +-
 3 files changed, 4 insertions(+), 87 deletions(-)
 delete mode 100644 package/xfsprogs/0003-xfsprogs-do-not-redeclare-globals-provided-by-libraries.patch

diff --git a/package/xfsprogs/0003-xfsprogs-do-not-redeclare-globals-provided-by-libraries.patch b/package/xfsprogs/0003-xfsprogs-do-not-redeclare-globals-provided-by-libraries.patch
deleted file mode 100644
index ef2053e9bb..0000000000
--- a/package/xfsprogs/0003-xfsprogs-do-not-redeclare-globals-provided-by-libraries.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 123b851389ef9a012a469ef982ac7b819db59342 Mon Sep 17 00:00:00 2001
-From: Eric Sandeen <sandeen@redhat.com>
-Date: Thu, 30 Jan 2020 13:34:17 -0500
-Subject: xfsprogs: do not redeclare globals provided by libraries
-
-In each of these cases, db, logprint, and mdrestore are redeclaring
-as a global variable something which was already provided by a
-library they link with.
-
-gcc now defaults to -fno-common and trips over these global variables
-which are declared in utilities as well as in libxfs and libxlog, and
-it causes the build to fail.
-
-Signed-off-by: Eric Sandeen <sandeen@redhat.com>
-Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>
-Reviewed-by: Christoph Hellwig <hch@lst.de>
-Signed-off-by: Eric Sandeen <sandeen@sandeen.net>
-
-[Retrieved from:
-https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?id=123b851389ef9a012a469ef982ac7b819db59342]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- db/init.c                 | 1 -
- logprint/logprint.c       | 4 ++--
- mdrestore/xfs_mdrestore.c | 1 -
- 3 files changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/db/init.c b/db/init.c
-index 455220a86..0ac373685 100644
---- a/db/init.c
-+++ b/db/init.c
-@@ -27,7 +27,6 @@ static int		force;
- static struct xfs_mount	xmount;
- struct xfs_mount	*mp;
- static struct xlog	xlog;
--libxfs_init_t		x;
- xfs_agnumber_t		cur_agno = NULLAGNUMBER;
- 
- static void
-diff --git a/logprint/logprint.c b/logprint/logprint.c
-index 7754a2a6e..511a32aca 100644
---- a/logprint/logprint.c
-+++ b/logprint/logprint.c
-@@ -24,7 +24,6 @@ int	print_buffer;
- int	print_overwrite;
- int     print_no_data;
- int     print_no_print;
--int     print_exit = 1; /* -e is now default. specify -c to override */
- static int	print_operation = OP_PRINT;
- 
- static void
-@@ -132,6 +131,7 @@ main(int argc, char **argv)
- 	bindtextdomain(PACKAGE, LOCALEDIR);
- 	textdomain(PACKAGE);
- 	memset(&mount, 0, sizeof(mount));
-+	print_exit = 1; /* -e is now default. specify -c to override */
- 
- 	progname = basename(argv[0]);
- 	while ((c = getopt(argc, argv, "bC:cdefl:iqnors:tDVv")) != EOF) {
-@@ -152,7 +152,7 @@ main(int argc, char **argv)
- 			case 'e':
- 			    /* -e is now default
- 			     */
--				print_exit++;
-+				print_exit = 1;
- 				break;
- 			case 'C':
- 				print_operation = OP_COPY;
-diff --git a/mdrestore/xfs_mdrestore.c b/mdrestore/xfs_mdrestore.c
-index 3375e0806..1cd399dbc 100644
---- a/mdrestore/xfs_mdrestore.c
-+++ b/mdrestore/xfs_mdrestore.c
-@@ -7,7 +7,6 @@
- #include "libxfs.h"
- #include "xfs_metadump.h"
- 
--char 		*progname;
- static int	show_progress = 0;
- static int	show_info = 0;
- static int	progress_since_warning = 0;
--- 
-cgit 1.2.3-1.el7
-
diff --git a/package/xfsprogs/xfsprogs.hash b/package/xfsprogs/xfsprogs.hash
index 629d6fcf9d..79f953b33c 100644
--- a/package/xfsprogs/xfsprogs.hash
+++ b/package/xfsprogs/xfsprogs.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/sha256sums.asc
-sha256 7b500e148cebd08f99e37cf744c7843817b37e7be2a32c4dc57d6ea16e3019ae  xfsprogs-5.2.1.tar.xz
+sha256  8ef46ed9e6bb927f407f541dc4324857c908ddf1374265edc910d23724048c6b  xfsprogs-5.8.0.tar.xz
 
 # Hash for license files
-sha256 7ae50a5344af14d6231aff6814632a220b3127da4099aea2c6070fd79c407c1a  LICENSES/GPL-2.0
-sha256 0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
+sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
+sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
diff --git a/package/xfsprogs/xfsprogs.mk b/package/xfsprogs/xfsprogs.mk
index 43c921aa17..bfaf9fd712 100644
--- a/package/xfsprogs/xfsprogs.mk
+++ b/package/xfsprogs/xfsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFSPROGS_VERSION = 5.2.1
+XFSPROGS_VERSION = 5.8.0
 XFSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/fs/xfs/xfsprogs
 XFSPROGS_SOURCE = xfsprogs-$(XFSPROGS_VERSION).tar.xz
 XFSPROGS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1 (libhandle, few headers)
-- 
2.28.0
