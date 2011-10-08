From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 8 Oct 2011 21:49:58 +0200
Subject: [Buildroot] [git commit] lite: unbreak build
Message-ID: <20111008195108.2A1C78E2C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0fccab65a3006d67a1805f30ca7f1af41c98e14d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lite breaks because of a conflict with 'stat'. Fix taken from LiTE git.

At the same time rename and fixup no-tests patch to apply.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lite/lite-dfbspy-stat.patch                |   53 ++++++++++++++++++++
 .../lite/{no_tests.patch => lite-no-tests.patch}   |    4 +-
 2 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/package/lite/lite-dfbspy-stat.patch b/package/lite/lite-dfbspy-stat.patch
new file mode 100644
index 0000000..5ca7369
--- /dev/null
+++ b/package/lite/lite-dfbspy-stat.patch
@@ -0,0 +1,53 @@
+From upstream git (git://git.directfb.org/git/directfb/libs/LiTE.git)
+
+From ffe0ce78327a63ddb1265328ea9b5b03acdca019 Mon Sep 17 00:00:00 2001
+From: Denis Oliver Kropp <dok@directfb.org>
+Date: Fri, 1 Apr 2011 20:20:26 +0200
+Subject: [PATCH] dfbspy: Build fix for dfbspy example.
+
+---
+ examples/dfbspy.c |   20 ++++++++++----------
+ 1 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/examples/dfbspy.c b/examples/dfbspy.c
+index 5f36f0b..c7f9725 100644
+--- a/examples/dfbspy.c
++++ b/examples/dfbspy.c
+@@ -89,9 +89,9 @@ read_stat( FusionStat *stat, int world )
+ 
+ /**************************************************************************************************/
+ 
+-#define CALC(x)     stat.x = (int)(((s.x - last_stat.x) * 1000 / (float) diff) + 0.5f)
++#define CALC(x)     stats.x = (int)(((s.x - last_stat.x) * 1000 / (float) diff) + 0.5f)
+ 
+-static FusionStat last_stat, stat;
++static FusionStat last_stat, stats;
+ static long long  last_millis;
+ 
+ static int
+@@ -145,14 +145,14 @@ static const struct {
+      void          (*update)( LiteLabel *label, void *ctx );
+      void           *ctx;
+ } list[] = {
+-     { "lease/purchase", update_number, &stat.lease_purchase },
+-     { "cede",           update_number, &stat.cede },
+-     { "attach",         update_number, &stat.attach },
+-     { "detach",         update_number, &stat.detach },
+-     { "ref up",         update_number, &stat.ref_up },
+-     { "ref down",       update_number, &stat.ref_down },
+-     { "prevail/swoop",  update_number, &stat.prevail_swoop },
+-     { "dismiss",        update_number, &stat.dismiss }
++     { "lease/purchase", update_number, &stats.lease_purchase },
++     { "cede",           update_number, &stats.cede },
++     { "attach",         update_number, &stats.attach },
++     { "detach",         update_number, &stats.detach },
++     { "ref up",         update_number, &stats.ref_up },
++     { "ref down",       update_number, &stats.ref_down },
++     { "prevail/swoop",  update_number, &stats.prevail_swoop },
++     { "dismiss",        update_number, &stats.dismiss }
+ };
+ 
+ #define NUM_LIST    (sizeof(list)/sizeof(list[0]))
+-- 
+1.7.6.3
+
diff --git a/package/lite/no_tests.patch b/package/lite/lite-no-tests.patch
similarity index 73%
rename from package/lite/no_tests.patch
rename to package/lite/lite-no-tests.patch
index c6e8092..3a47186 100644
--- a/package/lite/no_tests.patch
+++ b/package/lite/lite-no-tests.patch
@@ -1,5 +1,5 @@
---- Makefile.in.orig	2008-07-07 13:07:12.000000000 +0200
-+++ Makefile.in	2008-07-07 13:07:05.000000000 +0200
+--- a/Makefile.in.orig	2008-07-07 13:07:12.000000000 +0200
++++ b/Makefile.in	2008-07-07 13:07:05.000000000 +0200
 @@ -202,7 +202,7 @@
  target_vendor = @target_vendor@
  top_builddir = @top_builddir@
