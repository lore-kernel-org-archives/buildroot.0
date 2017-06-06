From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Jun 2017 17:08:10 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] gcc: add upstream patch
	to fix build of GCC6 with GCC7
Message-ID: <20170606150816.75753828BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc00cd601b60efc930d89247c607cc835680277a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Building host-gcc-initial with GCC7 on the host fails due to the
comparison of a pointer to an integer in ubsan_use_new_style_p, which
is forbidden by ISO C++:

ubsan.c:1474:23: error: ISO C++ forbids comparison between pointer and
integer [-fpermissive]
       || xloc.file == '\0' || xloc.file[0] == '\xff'

Backported from:
https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=239971

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 2d57ad29b15628b01cdca37e8f05ac1dd376602c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../6.3.0/942-ubsan-fix-check-empty-string.patch   | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/gcc/6.3.0/942-ubsan-fix-check-empty-string.patch b/package/gcc/6.3.0/942-ubsan-fix-check-empty-string.patch
new file mode 100644
index 0000000..98e6270
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
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
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
