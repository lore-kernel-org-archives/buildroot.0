From: Gao Xiang <hsiangkao@aol.com>
Date: Thu, 26 Mar 2020 10:12:15 +0800
Subject: [Buildroot] [PATCH] package/erofs-utils: add patch to resolve
 PAGE_SIZE redefinition
References: <20200326021215.23749-1-hsiangkao.ref@aol.com>
Message-ID: <20200326021215.23749-1-hsiangkao@aol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch resolves PAGE_SIZE redefinition reported by autobuild [1]
with some configrations on i586 platform.

As what I said in the patch, I didn't get such error report before.

[1] http://autobuild.buildroot.net/results/340b98caa45bafd43f109002be9da59ba7f6d971
Signed-off-by: Gao Xiang <hsiangkao@aol.com>
---
Hi all,

I have no simple way to verify the whole compilation with such
configuration due to poor Internet quality to download all
necessary packages in China mainland.

I've just verified with my own old configuration and it has no
impact. Hopefully it's the last patch for all configration to
work.

Thanks,
Gao Xiang

 ...s-utils-avoid-PAGE_SIZE-redefinition.patch | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/erofs-utils/0004-erofs-utils-avoid-PAGE_SIZE-redefinition.patch

diff --git a/package/erofs-utils/0004-erofs-utils-avoid-PAGE_SIZE-redefinition.patch b/package/erofs-utils/0004-erofs-utils-avoid-PAGE_SIZE-redefinition.patch
new file mode 100644
index 0000000000..2441a841ba
--- /dev/null
+++ b/package/erofs-utils/0004-erofs-utils-avoid-PAGE_SIZE-redefinition.patch
@@ -0,0 +1,57 @@
+From 6c087a91c968197b5a95578fc645617947c943ad Mon Sep 17 00:00:00 2001
+From: Gao Xiang <hsiangkao@aol.com>
+Date: Wed, 25 Mar 2020 15:42:22 +0800
+Subject: [PATCH] erofs-utils: avoid PAGE_SIZE redefinition
+
+Buildroot autobuild reported a PAGE_SIZE redefinition with some
+configrations on i586 toolchain [1] (I didn't notice such report
+from erofs-utils travis CI or distribution builds before.)
+
+In file included from config.c:11:
+../include/erofs/internal.h:27: error: "PAGE_SIZE" redefined [-Werror]
+ #define PAGE_SIZE  (1U << PAGE_SHIFT)
+
+In file included from ../include/erofs/defs.h:17,
+                 from ../include/erofs/config.h:12,
+                 from ../include/erofs/print.h:12,
+                 from config.c:10:
+.../sysroot/usr/include/limits.h:89: note: this is the location of the previous definition
+ #define PAGE_SIZE PAGESIZE
+
+cc1: all warnings being treated as errors
+
+Fix it now.
+
+[1] http://autobuild.buildroot.net/results/340b98caa45bafd43f109002be9da59ba7f6d971
+Link: https://lore.kernel.org/r/20200325082930.2025-1-hsiangkao at aol.com
+Signed-off-by: Gao Xiang <hsiangkao@aol.com>
+---
+ include/erofs/internal.h | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/include/erofs/internal.h b/include/erofs/internal.h
+index e7d5a64..41da189 100644
+--- a/include/erofs/internal.h
++++ b/include/erofs/internal.h
+@@ -23,8 +23,18 @@ typedef unsigned short umode_t;
+ #define PATH_MAX        4096    /* # chars in a path name including nul */
+ #endif
+ 
++#ifndef PAGE_SHIFT
+ #define PAGE_SHIFT		(12)
++#endif
++
++#ifndef PAGE_SIZE
+ #define PAGE_SIZE		(1U << PAGE_SHIFT)
++#endif
++
++/* no obvious reason to support explicit PAGE_SIZE != 4096 for now */
++#if PAGE_SIZE != 4096
++#error incompatible PAGE_SIZE is already defined
++#endif
+ 
+ #define LOG_BLOCK_SIZE          (12)
+ #define EROFS_BLKSIZ            (1U << LOG_BLOCK_SIZE)
+-- 
+2.20.1
+
-- 
2.20.1
