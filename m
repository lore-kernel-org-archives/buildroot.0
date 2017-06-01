From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu,  1 Jun 2017 09:37:58 +0200
Subject: [Buildroot] [PATCH] gcc: add upstream patch to fix build of GCC6
	with GCC7
Message-ID: <20170601073758.9833-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building host-gcc-initial with GCC7 on the host fails due to the
comparison of a pointer to an integer in ubsan_use_new_style_p, which
is forbidden by ISO C++:

ubsan.c:1474:23: error: ISO C++ forbids comparison between pointer and
integer [-fpermissive]
       || xloc.file == '\0' || xloc.file[0] == '\xff'

Backported from:
https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=239971

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../6.3.0/942-ubsan-fix-check-empty-string.patch   | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/gcc/6.3.0/942-ubsan-fix-check-empty-string.patch

diff --git a/package/gcc/6.3.0/942-ubsan-fix-check-empty-string.patch b/package/gcc/6.3.0/942-ubsan-fix-check-empty-string.patch
new file mode 100644
index 000000000..98e627053
--- /dev/null
+++ b/package/gcc/6.3.0/942-ubsan-fix-check-empty-string.patch
@@ -0,0 +1,40 @@
+From 8db2cf6353c13f2a84cbe49b689654897906c499 Mon Sep 17 00:00:00 2001
+From: kyukhin <kyukhin@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Sat, 3 Sep 2016 10:57:05 +0000
+Subject: [PATCH] gcc/ubsan.c: Fix check for empty string
+
+Building host-gcc-initial with GCC7 on the host fails due to the
+comparison of a pointer to an integer in ubsan_use_new_style_p, which
+is forbidden by ISO C++:
+
+ubsan.c:1474:23: error: ISO C++ forbids comparison between pointer and
+integer [-fpermissive]
+       || xloc.file == '\0' || xloc.file[0] == '\xff'
+
+Backport the fix from upstream GCC to enable the build with GCC 7.
+
+Backported from:
+https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=239971
+
+Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
+[Add commit log from [1]]
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+
+[1] https://patchwork.openembedded.org/patch/138884/
+---
+ gcc/ubsan.c   | 2 +-
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+Index: gcc-6.3.0/gcc/ubsan.c
+===================================================================
+--- gcc-6.3.0.orig/gcc/ubsan.c
++++ gcc-6.3.0/gcc/ubsan.c
+@@ -1471,7 +1471,7 @@ ubsan_use_new_style_p (location_t loc)
+ 
+   expanded_location xloc = expand_location (loc);
+   if (xloc.file == NULL || strncmp (xloc.file, "\1", 2) == 0
+-      || xloc.file == '\0' || xloc.file[0] == '\xff'
++      || xloc.file[0] == '\0' || xloc.file[0] == '\xff'
+       || xloc.file[1] == '\xff')
+     return false;
+ 
-- 
2.13.0
