From: Rodrigo Rebello <rprebello@gmail.com>
Date: Fri, 20 Nov 2015 20:48:15 -0200
Subject: [Buildroot] [PATCH v2 1/1] mongrel2: add upstream patch to fix
	symbol conflict
Message-ID: <1448059695-20671-1-git-send-email-rprebello@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The symbol 'max_align_t', defined in the mongrel2 sources
(src/mem/align.h), is also defined in one of the standard headers in
some toolchains (the ones based on GCC 5+ apparently).

This conflict has been solved upstream, and a new version (1.10.0)
containing the fix has been released already, so this backported patch
may be dropped in the future when mongrel2 gets a version bump.

Fixes:

  http://autobuild.buildroot.net/results/b7f/b7f86bdda094de96633e9921e0e5895eadc89217/
  http://autobuild.buildroot.net/results/f62/f623703aa6d7992b67d305331734e4ed0c7b2be4/
  http://autobuild.buildroot.net/results/eb3/eb385cb4f87078122028e85cbe31caa01d794991/
  ...

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
---
Changes v1 -> v2:
  - Fix wording in commit message:
    s/has been already released/has been released already/
---
 .../0004-Rename-symbol-to-prevent-conflict.patch   | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/mongrel2/0004-Rename-symbol-to-prevent-conflict.patch

diff --git a/package/mongrel2/0004-Rename-symbol-to-prevent-conflict.patch b/package/mongrel2/0004-Rename-symbol-to-prevent-conflict.patch
new file mode 100644
index 0000000..8369816
--- /dev/null
+++ b/package/mongrel2/0004-Rename-symbol-to-prevent-conflict.patch
@@ -0,0 +1,45 @@
+From 8d0bc79f38913b1a55e7d151b32bbc9462c24b47 Mon Sep 17 00:00:00 2001
+From: Jason Miller <jason@jasom.org>
+Date: Fri, 14 Aug 2015 19:03:09 -0700
+Subject: [PATCH] Rename symbol to prevent conflict
+
+One of the standard headers defines max_align_t on some versions of linux.
+
+[Backported from upstream commit
+https://github.com/mongrel2/mongrel2/commit/563bac8c59b9b32205164d237cf1ec0cb48d189f.]
+
+Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
+---
+ src/mem/align.h  | 2 +-
+ src/mem/halloc.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/mem/align.h b/src/mem/align.h
+index 4c6e183..03a4999 100644
+--- a/src/mem/align.h
++++ b/src/mem/align.h
+@@ -30,7 +30,7 @@ union max_align
+ 	void (*q)(void);
+ };
+ 
+-typedef union max_align max_align_t;
++typedef union max_align h_max_align_t;
+ 
+ #endif
+ 
+diff --git a/src/mem/halloc.c b/src/mem/halloc.c
+index b097d1f..40d0c09 100644
+--- a/src/mem/halloc.c
++++ b/src/mem/halloc.c
+@@ -34,7 +34,7 @@ typedef struct hblock
+ #endif
+ 	hlist_item_t  siblings; /* 2 pointers */
+ 	hlist_head_t  children; /* 1 pointer  */
+-	max_align_t   data[1];  /* not allocated, see below */
++	h_max_align_t   data[1];  /* not allocated, see below */
+ 	
+ } hblock_t;
+ 
+-- 
+2.1.4
+
-- 
2.1.4
