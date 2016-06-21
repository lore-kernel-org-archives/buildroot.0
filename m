From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 21 Jun 2016 18:00:21 +0300
Subject: [Buildroot] [PATCH] strace: bump to version 4.12
Message-ID: <ac8fbcd7b8342a3fb2464655ad5248fe4ef10129.1466521221.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop upstream patch.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../0001-arc-metag-nios2-or1k-tile-fix-build.patch | 104 ---------------------
 package/strace/strace.hash                         |   6 +-
 package/strace/strace.mk                           |   2 +-
 3 files changed, 4 insertions(+), 108 deletions(-)
 delete mode 100644 package/strace/0001-arc-metag-nios2-or1k-tile-fix-build.patch

diff --git a/package/strace/0001-arc-metag-nios2-or1k-tile-fix-build.patch b/package/strace/0001-arc-metag-nios2-or1k-tile-fix-build.patch
deleted file mode 100644
index 0d81b5908179..000000000000
--- a/package/strace/0001-arc-metag-nios2-or1k-tile-fix-build.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From d83bcfa9a2977c037c638ae09e561f554ab19681 Mon Sep 17 00:00:00 2001
-From: Alexey Brodkin <abrodkin@synopsys.com>
-Date: Sat, 26 Dec 2015 00:13:36 +0300
-Subject: [PATCH] arc, metag, nios2, or1k, tile: fix build
-
-Fix build regression introduced by commit
-34683e3926d8c2daa368afb805da422ee7043396.
-
-* linux/32/syscallent.h: Add sys_ prefix to ARCH_mmap and mmap.
-* linux/arc/syscallent.h: Add sys_ prefix to ARCH_mmap and mmap_pgoff.
-* linux/nios2/syscallent.h: Likewise.
-* linux/or1k/syscallent.h: Likewise.
-* linux/tile/syscallent1.h: Add sys_ prefix to ARCH_mmap and sys_mmap_4koff.
-* pathtrace.c (pathtrace_match): Handle SEN_ARCH_mmap.
-
-This is a back-port of upstream commit
-http://sourceforge.net/p/strace/code/ci/dd1a80c8d213eed95fe55b7ebcb07ee165dd8e4b/
-
-It should be removed upon the next bump of strace version.
-
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- linux/32/syscallent.h    | 6 +++---
- linux/arc/syscallent.h   | 2 +-
- linux/nios2/syscallent.h | 2 +-
- linux/or1k/syscallent.h  | 2 +-
- linux/tile/syscallent1.h | 2 +-
- pathtrace.c              | 1 +
- 6 files changed, 8 insertions(+), 7 deletions(-)
-
-diff --git a/linux/32/syscallent.h b/linux/32/syscallent.h
-index 5f997e7..e6f895c 100644
---- a/linux/32/syscallent.h
-+++ b/linux/32/syscallent.h
-@@ -1,5 +1,5 @@
--#ifndef ARCH_mmap
--# define ARCH_mmap mmap
-+#ifndef sys_ARCH_mmap
-+# define sys_ARCH_mmap sys_mmap
- #endif
- [  0] = { 2,	0,		SEN(io_setup),			"io_setup"		},
- [  1] = { 1,	0,		SEN(io_destroy),		"io_destroy"		},
-@@ -276,5 +276,5 @@
- [283] = { 2,	0,		SEN(membarrier),		"membarrier",		},
- [284] = { 3,	TM,		SEN(mlock2),			"mlock2"		},
- 
--#undef ARCH_mmap
-+#undef sys_ARCH_mmap
- #undef ARCH_WANT_SYNC_FILE_RANGE2
-diff --git a/linux/arc/syscallent.h b/linux/arc/syscallent.h
-index 5847dc4..1100008 100644
---- a/linux/arc/syscallent.h
-+++ b/linux/arc/syscallent.h
-@@ -1,4 +1,4 @@
--#define ARCH_mmap mmap_pgoff
-+#define sys_ARCH_mmap sys_mmap_pgoff
- #include "32/syscallent.h"
- [244] = { 3,	0,	SEN(printargs),	"arc_cacheflush"},
- [245] = { 1,	0,	SEN(printargs),	"arc_settls"	},
-diff --git a/linux/nios2/syscallent.h b/linux/nios2/syscallent.h
-index 8a4b70e..01efe3a 100644
---- a/linux/nios2/syscallent.h
-+++ b/linux/nios2/syscallent.h
-@@ -1,4 +1,4 @@
--#define ARCH_mmap mmap_pgoff
-+#define sys_ARCH_mmap sys_mmap_pgoff
- #include "32/syscallent.h"
- [244] = {4,    0,	SEN(cacheflush), "cacheflush"},
- [245 ... 259] = { },
-diff --git a/linux/or1k/syscallent.h b/linux/or1k/syscallent.h
-index ed84b3b..351fe25 100644
---- a/linux/or1k/syscallent.h
-+++ b/linux/or1k/syscallent.h
-@@ -1,4 +1,4 @@
--#define ARCH_mmap mmap_pgoff
-+#define sys_ARCH_mmap sys_mmap_pgoff
- #include "32/syscallent.h"
- [244] = { 3,	NF,	SEN(or1k_atomic),	"or1k_atomic"	},
- [245 ... 259] = { },
-diff --git a/linux/tile/syscallent1.h b/linux/tile/syscallent1.h
-index c86f059..28dbab4 100644
---- a/linux/tile/syscallent1.h
-+++ b/linux/tile/syscallent1.h
-@@ -1,4 +1,4 @@
--#define ARCH_mmap mmap_4koff
-+#define sys_ARCH_mmap sys_mmap_4koff
- #define ARCH_WANT_SYNC_FILE_RANGE2 1
- #include "32/syscallent.h"
- [244] = { 1,	0,	SEN(printargs),	"cmpxchg_badaddr"	},
-diff --git a/pathtrace.c b/pathtrace.c
-index d530ec2..e72cdf7 100644
---- a/pathtrace.c
-+++ b/pathtrace.c
-@@ -216,6 +216,7 @@ pathtrace_match(struct tcb *tcp)
- 	case SEN_mmap:
- 	case SEN_mmap_4koff:
- 	case SEN_mmap_pgoff:
-+	case SEN_ARCH_mmap:
- 		/* x, x, x, x, fd */
- 		return fdmatch(tcp, tcp->u_arg[4]);
- 
--- 
-2.4.3
-
diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index f47d51b059d7..432df7de88db 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/strace/files/strace/4.11/
-md5	a15d2555a7febb56d00c6e1a51c655dc	strace-4.11.tar.xz
-sha1	8fd717dc3c51b69fde51ce0bdb066404a678363c	strace-4.11.tar.xz
+# From http://sourceforge.net/projects/strace/files/strace/4.12/
+md5	efb8611fc332e71ec419c53f59faa93e	strace-4.12.tar.xz
+sha1	30d79bc07e46a8672decb945e458447c1b66e496	strace-4.12.tar.xz
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index e25428e653f3..7465baad701c 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 4.11
+STRACE_VERSION = 4.12
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
 STRACE_LICENSE = BSD-3c
-- 
2.8.1
