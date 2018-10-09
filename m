From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  9 Oct 2018 19:14:36 +0200
Subject: [Buildroot] [PATCH 1/1] collectd: fix build with gpsd 3.18
Message-ID: <20181009171436.4333-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to fix call to gps_read

Fixes:
 - http://autobuild.buildroot.net/results/63a4f980d7cdb4b0823840f747589803fcd0d69f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/collectd/0002-gps-fix-gps_read.patch | 33 ++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/collectd/0002-gps-fix-gps_read.patch

diff --git a/package/collectd/0002-gps-fix-gps_read.patch b/package/collectd/0002-gps-fix-gps_read.patch
new file mode 100644
index 0000000000..6e1dd839cd
--- /dev/null
+++ b/package/collectd/0002-gps-fix-gps_read.patch
@@ -0,0 +1,33 @@
+From 3e369c98213d248fb5821fc29033877e83bf7fe1 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 9 Oct 2018 18:55:00 +0200
+Subject: [PATCH] gps: fix gps_read
+
+gps_read now takes three arguments since version 3.18 of gpsd: see
+http://git.savannah.gnu.org/cgit/gpsd.git/commit/?id=6bba8b329fc7687b15863d30471d5af402467802
+
+Fixes:
+ - http://autobuild.buildroot.net/results/63a4f980d7cdb4b0823840f747589803fcd0d69f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/collectd/collectd/pull/2946]
+---
+ src/gps.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gps.c b/src/gps.c
+index 1d32d049..ae3889c9 100644
+--- a/src/gps.c
++++ b/src/gps.c
+@@ -141,7 +141,7 @@ static void *cgps_thread(void *pData) {
+         continue;
+       }
+ 
+-      if (gps_read(&gpsd_conn) == -1) {
++      if (gps_read(&gpsd_conn, NULL, 0) == -1) {
+         WARNING("gps plugin: incorrect data! (err_count: %d)", err_count);
+         err_count++;
+ 
+-- 
+2.17.1
+
-- 
2.17.1
