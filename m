From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Sep 2019 21:37:54 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/e2fsprogs: bump
 to version 1.44.6
Message-ID: <20190917193422.716DD8E8AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6243b953be03b4120f3a70ce1a23eebfb91fd25d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes a number of bugs:

- If files are created while e4defrag is running, it's quite possible for
  succeed_cnt to be larger than total_count, in which case the number of
  failures (calculated via total_count - succeed_cnt) will overflow and
  become a very large unsigned number.  (Addresses Debian Bug: #888899)

- Fix e2fsck so it can correctly handle directories > 2 GiB when the
  largedir feature is enabled.

- Fix mke2fs's hugefile creation so that we correctly reserve enough
  metadata blocks for a given file system size.  Otherwise for certain
  unfortunately sized disks/partitions, the hugefile creation would fail.
  (Addresses Google Bug: 123239032)

- Fix the libext2fs library to be more robust against invalid block group
  descriptors to prevent e2fsprogs from crashing (or possibly being p0wned)
  by maliciously modified file systems.  (Addresses Google Bugs: 119171089,
  119929050)

- Fix mke2fs and debugfs so they can correctly copy in files > 2 GiB.

- Fix debugfs so its stat command can correct supportly display directory
  sizes > 2 GiB.

- Fix memory leaks in debugfs, mke2fs, and e2freefrag.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/e2fsprogs/e2fsprogs.hash | 4 ++--
 package/e2fsprogs/e2fsprogs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index 7619e26275..e2790336e7 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,5 +1,5 @@
-# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.44.5/sha256sums.asc
-sha256 ba5eb3069d69160d96818bb9700de9ab5a8458d9add1fd85d427c0000d34c5b9  e2fsprogs-1.44.5.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.44.6/sha256sums.asc
+sha256 883ae736d5a1cd954ff40a11a6743cd5913322a7685b10c8ed757eab5298ee90  e2fsprogs-1.44.6.tar.xz
 # Locally calculated
 sha256 5da5ef153e559c1d990d4c3eedbedd4442db892d37eae1f35fff069de8ec9020  NOTICE
 sha256 032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index f5785ab4f2..50397097d7 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.44.5
+E2FSPROGS_VERSION = 1.44.6
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
