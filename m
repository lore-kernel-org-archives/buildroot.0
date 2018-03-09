From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Mar 2018 22:24:51 +0100
Subject: [Buildroot] [git commit] btrfs-progs: bump to version 4.15.1
Message-ID: <20180309213409.5FC6C82885@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d314d9cc2aea106f52fff18d9120eb4ea80769a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable libzstd support explicitly to avoid configure failure. The
Buildroot zstd package does not currently install its library.

Drop upstream patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...fs-progs-convert-add-missing-types-header.patch | 39 ----------------------
 package/btrfs-progs/btrfs-progs.hash               |  2 +-
 package/btrfs-progs/btrfs-progs.mk                 |  4 +--
 3 files changed, 3 insertions(+), 42 deletions(-)

diff --git a/package/btrfs-progs/0003-btrfs-progs-convert-add-missing-types-header.patch b/package/btrfs-progs/0003-btrfs-progs-convert-add-missing-types-header.patch
deleted file mode 100644
index 7b09f2785c..0000000000
--- a/package/btrfs-progs/0003-btrfs-progs-convert-add-missing-types-header.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From dda485a3d788c47bb6849218f695db7b51822872 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 31 Oct 2017 14:51:51 +0200
-Subject: [PATCH] btrfs-progs: convert: add missing types header
-
-Build with musl libc needs the sys/types.h header for the dev_t type,
-since this header is not included indirectly. This fixes the following
-build failure:
-
-In file included from convert/source-fs.c:23:0:
-./convert/source-fs.h:112:1: error: unknown type name ???dev_t???
- dev_t decode_dev(u32 dev);
- ^~~~~
-convert/source-fs.c:31:1: error: unknown type name ???dev_t???
- dev_t decode_dev(u32 dev)
- ^~~~~
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://marc.info/?l=linux-btrfs&m=150945479718731&w=2
-
- convert/source-fs.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/convert/source-fs.h b/convert/source-fs.h
-index 23f33567b42d..4e5babefe6a2 100644
---- a/convert/source-fs.h
-+++ b/convert/source-fs.h
-@@ -19,6 +19,7 @@
- 
- #include "kerncompat.h"
- #include <linux/kdev_t.h>
-+#include <sys/types.h>
- #include <pthread.h>
- 
- #define CONV_IMAGE_SUBVOL_OBJECTID BTRFS_FIRST_FREE_OBJECTID
--- 
-2.14.2
-
diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index bdcb8bada1..54d34c9191 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256 805bdb0031c21a0a5d2ba295a8c9bdd8ba831a68c3fa801aab85677ec902d783  btrfs-progs-v4.13.3.tar.xz
+sha256 67102ac0d6795f368acc94efaca29b6626d972638790a4a0c9f89a27cd543f96  btrfs-progs-v4.15.1.tar.xz
 # Locally computed
 sha256 0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 96c4350d26..776a3ef841 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 4.13.3
+BTRFS_PROGS_VERSION = 4.15.1
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf e2fsprogs lzo util-linux zlib
-BTRFS_PROGS_CONF_OPTS = --disable-backtrace
+BTRFS_PROGS_CONF_OPTS = --disable-backtrace --disable-zstd
 BTRFS_PROGS_LICENSE = GPL-2.0
 BTRFS_PROGS_LICENSE_FILES = COPYING
 BTRFS_PROGS_INSTALL_STAGING = YES
