From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 Oct 2017 20:11:25 +0100
Subject: [Buildroot] [git commit] btrfs-progs: bump to version 4.13.3
Message-ID: <20171031190547.CDE9D7FE8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33cc29dac3432e4462370984e4a825afca7db85c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch fixing build with musl.

Add license file hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...fs-progs-convert-add-missing-types-header.patch | 39 ++++++++++++++++++++++
 package/btrfs-progs/btrfs-progs.hash               |  4 ++-
 package/btrfs-progs/btrfs-progs.mk                 |  2 +-
 3 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/package/btrfs-progs/0003-btrfs-progs-convert-add-missing-types-header.patch b/package/btrfs-progs/0003-btrfs-progs-convert-add-missing-types-header.patch
new file mode 100644
index 0000000..7b09f27
--- /dev/null
+++ b/package/btrfs-progs/0003-btrfs-progs-convert-add-missing-types-header.patch
@@ -0,0 +1,39 @@
+From dda485a3d788c47bb6849218f695db7b51822872 Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 31 Oct 2017 14:51:51 +0200
+Subject: [PATCH] btrfs-progs: convert: add missing types header
+
+Build with musl libc needs the sys/types.h header for the dev_t type,
+since this header is not included indirectly. This fixes the following
+build failure:
+
+In file included from convert/source-fs.c:23:0:
+./convert/source-fs.h:112:1: error: unknown type name ???dev_t???
+ dev_t decode_dev(u32 dev);
+ ^~~~~
+convert/source-fs.c:31:1: error: unknown type name ???dev_t???
+ dev_t decode_dev(u32 dev)
+ ^~~~~
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://marc.info/?l=linux-btrfs&m=150945479718731&w=2
+
+ convert/source-fs.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/convert/source-fs.h b/convert/source-fs.h
+index 23f33567b42d..4e5babefe6a2 100644
+--- a/convert/source-fs.h
++++ b/convert/source-fs.h
+@@ -19,6 +19,7 @@
+ 
+ #include "kerncompat.h"
+ #include <linux/kdev_t.h>
++#include <sys/types.h>
+ #include <pthread.h>
+ 
+ #define CONV_IMAGE_SUBVOL_OBJECTID BTRFS_FIRST_FREE_OBJECTID
+-- 
+2.14.2
+
diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index 0b213ee..bdcb8ba 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,2 +1,4 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256 e17a68cc52a27d905b715445e91ddbaa4d42de4847d54836d6ed21e012dabf0e  btrfs-progs-v4.11.tar.xz
+sha256 805bdb0031c21a0a5d2ba295a8c9bdd8ba831a68c3fa801aab85677ec902d783  btrfs-progs-v4.13.3.tar.xz
+# Locally computed
+sha256 0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 2ea2f72..96c4350 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 4.11
+BTRFS_PROGS_VERSION = 4.13.3
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf e2fsprogs lzo util-linux zlib
