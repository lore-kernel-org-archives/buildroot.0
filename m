From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 23:03:05 +0100
Subject: [Buildroot] [git commit] btrfs-progs: fix build with musl
Message-ID: <20170312220316.A945A81EC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=948e07da9a187b51c8f526a50e618a7b75050695
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch adding the required limits headers.

Fixes:
http://autobuild.buildroot.net/results/dd5/dd556f2adc449c4961ff425c52fb78c5279bfae7/
http://autobuild.buildroot.net/results/7b5/7b5ccd88cdedd02d7fe77d4a07dd88d4045f4284/
http://autobuild.buildroot.net/results/ab1/ab12d07c73e3f8af102f00bd2e7124f6c6a076c3/

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...03-btrfs-progs-add-missing-limits-headers.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/btrfs-progs/0003-btrfs-progs-add-missing-limits-headers.patch b/package/btrfs-progs/0003-btrfs-progs-add-missing-limits-headers.patch
new file mode 100644
index 0000000..4b72287
--- /dev/null
+++ b/package/btrfs-progs/0003-btrfs-progs-add-missing-limits-headers.patch
@@ -0,0 +1,43 @@
+From 6b5e0ad992750e81c8eb9118b52179b8fad4426b Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Sun, 12 Mar 2017 19:46:52 +0200
+Subject: [PATCH] btrfs-progs: add missing limits headers
+
+Build under musl libc fails because of missing PATH_MAX and XATTR_NAME_MAX
+macro declarations. Add the required headers.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/kdave/btrfs-progs/pull/28
+
+ convert/source-ext2.c | 1 +
+ mkfs/common.c         | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/convert/source-ext2.c b/convert/source-ext2.c
+index 824d45d063d4..77ce0c66ac2a 100644
+--- a/convert/source-ext2.c
++++ b/convert/source-ext2.c
+@@ -16,6 +16,7 @@
+ 
+ #if BTRFSCONVERT_EXT2
+ 
++#include <linux/limits.h>
+ #include "kerncompat.h"
+ #include "disk-io.h"
+ #include "transaction.h"
+diff --git a/mkfs/common.c b/mkfs/common.c
+index 1e6a32419b68..1e8f26ea4dda 100644
+--- a/mkfs/common.c
++++ b/mkfs/common.c
+@@ -18,6 +18,7 @@
+ #include <uuid/uuid.h>
+ #include <blkid/blkid.h>
+ #include <fcntl.h>
++#include <limits.h>
+ #include "ctree.h"
+ #include "disk-io.h"
+ #include "volumes.h"
+-- 
+2.11.0
+
