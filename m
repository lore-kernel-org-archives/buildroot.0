From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Aug 2020 12:17:34 +0200
Subject: [Buildroot] [git commit] package/iftop: fix build with gcc 10
Message-ID: <20200817101113.B5988867AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1c3f077e24a41f004945f94aceb6f059c58e423
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/55a8581f11e776439782c228441ef1c8c1243386

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-ui_common.h-fix-build-with-gcc-10.patch   | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/package/iftop/0001-ui_common.h-fix-build-with-gcc-10.patch b/package/iftop/0001-ui_common.h-fix-build-with-gcc-10.patch
new file mode 100644
index 0000000000..4bee03eb1b
--- /dev/null
+++ b/package/iftop/0001-ui_common.h-fix-build-with-gcc-10.patch
@@ -0,0 +1,60 @@
+From 18a9f7732944bfe45023f9dd7528295e7d43e678 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 12 Aug 2020 22:31:33 +0200
+Subject: [PATCH] ui_common.h: fix build with gcc 10
+
+Define global variables as extern in header to fix the build with gcc 10
+which default to -fno-common: https://gcc.gnu.org/gcc-10/porting_to.html
+
+Fixes:
+ - http://autobuild.buildroot.org/results/55a8581f11e776439782c228441ef1c8c1243386
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to iftop-users at lists.beasts.org]
+---
+ ui_common.c |  6 ++++++
+ ui_common.h | 10 +++++-----
+ 2 files changed, 11 insertions(+), 5 deletions(-)
+
+diff --git a/ui_common.c b/ui_common.c
+index dcf6646..b1027ec 100644
+--- a/ui_common.c
++++ b/ui_common.c
+@@ -17,6 +17,12 @@
+ 
+ #include "ui_common.h"
+ 
++sorted_list_type screen_list;
++host_pair_line totals;
++int peaksent, peakrecv, peaktotal;
++hash_type* screen_hash;
++hash_type* service_hash;
++
+ /* 2, 10 and 40 seconds */
+ int history_divs[HISTORY_DIVISIONS] = {1, 5, 20};
+ 
+diff --git a/ui_common.h b/ui_common.h
+index 63ae5bb..add72fe 100644
+--- a/ui_common.h
++++ b/ui_common.h
+@@ -33,12 +33,12 @@ typedef struct host_pair_line_tag {
+ 
+ extern options_t options;
+ 
+-sorted_list_type screen_list;
+-host_pair_line totals;
+-int peaksent, peakrecv, peaktotal;
++extern sorted_list_type screen_list;
++extern host_pair_line totals;
++extern int peaksent, peakrecv, peaktotal;
+ extern history_type history_totals;
+-hash_type* screen_hash;
+-hash_type* service_hash;
++extern hash_type* screen_hash;
++extern hash_type* service_hash;
+ 
+ void analyse_data(void);
+ void screen_list_init(void);
+-- 
+2.27.0
+
