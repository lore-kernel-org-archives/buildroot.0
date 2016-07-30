From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 14:39:20 +0200
Subject: [Buildroot] [git commit] iperf: fix "speed" display in csv report
Message-ID: <20160730132402.707638188A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04bf807173d388e48eb98e2e42d32e77ab940447
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some parameters displayed in the CSV reports are declared
as uint64_t, but the printf format doesn't reflect this.

Submitted bug: https://sourceforge.net/p/iperf/bugs/66/

Signed-off-by: Matt Poduska <matt.poduska@rockwellcollins.com>
Signed-off-by: Atul Singh <atul.singh.mandla@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-fix-speed-display-in-csv-report.patch     | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/iperf/0002-fix-speed-display-in-csv-report.patch b/package/iperf/0002-fix-speed-display-in-csv-report.patch
new file mode 100644
index 0000000..b06c709
--- /dev/null
+++ b/package/iperf/0002-fix-speed-display-in-csv-report.patch
@@ -0,0 +1,39 @@
+From f035e70b72d4285dcdbd393e680777a927cb9da4 Mon Sep 17 00:00:00 2001
+From: Matt Weber <matthew.weber@rockwellcollins.com>
+Date: Thu, 28 Jul 2016 19:04:01 -0500
+Subject: [PATCH] perf: fix "speed" display in csv report
+
+Some parameters displayed in the CSV reports are declared
+as uint64_t, but the printf format doesn't reflect this.
+
+Submitted bug: https://sourceforge.net/p/iperf/bugs/66/
+
+Signed-off-by: Matt Poduska <matt.poduska@rockwellcollins.com>
+Signed-off-by: Atul Singh <atul.singh.mandla@gmail.com>
+Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
+---
+ src/Locale.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/Locale.c b/src/Locale.c
+index b5d42b1..7b924fa 100644
+--- a/src/Locale.c
++++ b/src/Locale.c
+@@ -260,11 +260,12 @@ const char reportCSV_bw_format[] =
+ const char reportCSV_bw_jitter_loss_format[] =
+ "%s,%s,%d,%.1f-%.1f,%I64d,%I64d,%.3f,%d,%d,%.3f,%d\n";
+ #else
++#include "inttypes.h"
+ const char reportCSV_bw_format[] =
+-"%s,%s,%d,%.1f-%.1f,%d,%d\n";
++"%s,%s,%d,%.1f-%.1f,%" PRId64 ",%" PRId64 "\n";
+ 
+ const char reportCSV_bw_jitter_loss_format[] =
+-"%s,%s,%d,%.1f-%.1f,%d,%d,%.3f,%d,%d,%.3f,%d\n";
++"%s,%s,%d,%.1f-%.1f,%" PRId64 ",%" PRId64 ",%.3f,%d,%d,%.3f,%d\n";
+ #endif //WIN32
+ #endif //HAVE_QUAD_SUPPORT
+ /* -------------------------------------------------------------------
+-- 
+1.9.1
+
