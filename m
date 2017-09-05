From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Sep 2017 00:30:40 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] e2fsprogs: add patch for
	recent glibc
Message-ID: <20170905222811.AF4A480755@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3afb4a1f9cbc25fd9175a9177e045b39ae899088
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Recent glibc have deprecated the implicit include of sys/sysmacros.h
from sys/types.h. That means that the macros major and minor are no
longer defined unless this header is included.

This problem was observed for host-e2fsprogs when building on a host
with recent glibc.

Add an upstream patch that includes sys/sysmacros.h when needed.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Dagg Stompler <daggs@gmx.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Tested-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit ed295ce49b9284eef30dd81f1398b6357a7ee428)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-include-sys-sysmacros.h-as-needed.patch   | 129 +++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/package/e2fsprogs/0002-include-sys-sysmacros.h-as-needed.patch b/package/e2fsprogs/0002-include-sys-sysmacros.h-as-needed.patch
new file mode 100644
index 0000000..c58fcb3
--- /dev/null
+++ b/package/e2fsprogs/0002-include-sys-sysmacros.h-as-needed.patch
@@ -0,0 +1,129 @@
+From 3fb715b55426875902dfef3056b2cf7335953178 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Fri, 19 May 2017 13:25:59 -0400
+Subject: [PATCH] include sys/sysmacros.h as needed
+
+The minor/major/makedev macros are not entirely standard.  glibc has had
+the definitions in sys/sysmacros.h since the start, and wants to move away
+from always defining them implicitly via sys/types.h (as this pollutes the
+namespace in violation of POSIX).  Other C libraries have already dropped
+them.  Since the configure script already checks for this header, use that
+to pull in the header in files that use these macros.
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+
+Upstream commit 3fb715b55426875902dfef3056b2cf7335953178
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ debugfs/debugfs.c      | 3 +++
+ lib/blkid/devname.c    | 3 +++
+ lib/blkid/devno.c      | 3 +++
+ lib/ext2fs/finddev.c   | 3 +++
+ lib/ext2fs/ismounted.c | 3 +++
+ misc/create_inode.c    | 4 ++++
+ misc/mk_hugefiles.c    | 3 +++
+ 7 files changed, 22 insertions(+)
+
+diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
+index 059ddc39..453f5b52 100644
+--- a/debugfs/debugfs.c
++++ b/debugfs/debugfs.c
+@@ -26,6 +26,9 @@ extern char *optarg;
+ #include <errno.h>
+ #endif
+ #include <fcntl.h>
++#ifdef HAVE_SYS_SYSMACROS_H
++#include <sys/sysmacros.h>
++#endif
+ 
+ #include "debugfs.h"
+ #include "uuid/uuid.h"
+diff --git a/lib/blkid/devname.c b/lib/blkid/devname.c
+index 3e2efa9d..671e781f 100644
+--- a/lib/blkid/devname.c
++++ b/lib/blkid/devname.c
+@@ -36,6 +36,9 @@
+ #if HAVE_SYS_MKDEV_H
+ #include <sys/mkdev.h>
+ #endif
++#ifdef HAVE_SYS_SYSMACROS_H
++#include <sys/sysmacros.h>
++#endif
+ #include <time.h>
+ 
+ #include "blkidP.h"
+diff --git a/lib/blkid/devno.c b/lib/blkid/devno.c
+index aa6eb907..480030f2 100644
+--- a/lib/blkid/devno.c
++++ b/lib/blkid/devno.c
+@@ -31,6 +31,9 @@
+ #if HAVE_SYS_MKDEV_H
+ #include <sys/mkdev.h>
+ #endif
++#ifdef HAVE_SYS_SYSMACROS_H
++#include <sys/sysmacros.h>
++#endif
+ 
+ #include "blkidP.h"
+ 
+diff --git a/lib/ext2fs/finddev.c b/lib/ext2fs/finddev.c
+index 311608de..62fa0dbe 100644
+--- a/lib/ext2fs/finddev.c
++++ b/lib/ext2fs/finddev.c
+@@ -31,6 +31,9 @@
+ #if HAVE_SYS_MKDEV_H
+ #include <sys/mkdev.h>
+ #endif
++#ifdef HAVE_SYS_SYSMACROS_H
++#include <sys/sysmacros.h>
++#endif
+ 
+ #include "ext2_fs.h"
+ #include "ext2fs.h"
+diff --git a/lib/ext2fs/ismounted.c b/lib/ext2fs/ismounted.c
+index bcac0f15..7d524715 100644
+--- a/lib/ext2fs/ismounted.c
++++ b/lib/ext2fs/ismounted.c
+@@ -49,6 +49,9 @@
+ #if HAVE_SYS_TYPES_H
+ #include <sys/types.h>
+ #endif
++#ifdef HAVE_SYS_SYSMACROS_H
++#include <sys/sysmacros.h>
++#endif
+ 
+ #include "ext2_fs.h"
+ #include "ext2fs.h"
+diff --git a/misc/create_inode.c b/misc/create_inode.c
+index ae22ff6f..8ce3fafa 100644
+--- a/misc/create_inode.c
++++ b/misc/create_inode.c
+@@ -22,6 +22,10 @@
+ #include <attr/xattr.h>
+ #endif
+ #include <sys/ioctl.h>
++#ifdef HAVE_SYS_SYSMACROS_H
++#include <sys/sysmacros.h>
++#endif
++
+ #include <ext2fs/ext2fs.h>
+ #include <ext2fs/ext2_types.h>
+ #include <ext2fs/fiemap.h>
+diff --git a/misc/mk_hugefiles.c b/misc/mk_hugefiles.c
+index 049c6f41..5882394d 100644
+--- a/misc/mk_hugefiles.c
++++ b/misc/mk_hugefiles.c
+@@ -35,6 +35,9 @@ extern int optind;
+ #include <sys/ioctl.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#ifdef HAVE_SYS_SYSMACROS_H
++#include <sys/sysmacros.h>
++#endif
+ #include <libgen.h>
+ #include <limits.h>
+ #include <blkid/blkid.h>
+-- 
+2.13.3
+
