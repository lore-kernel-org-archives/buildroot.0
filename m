From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  9 Oct 2018 20:18:11 +0300
Subject: [Buildroot] [PATCH] collect: fix build with latest gpsd
Message-ID: <72fea15defb00f67c15ccef164dfa1a2c7e36a43.1539105491.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The last bump of gpsd to version 3.18 broke the build due to a change in
the gps_read() prototype. Add a patch fixing that.

Fixes:
http://autobuild.buildroot.net/results/b08/b0829bc3343d6dc3065078e94896725b1c808bc1/
http://autobuild.buildroot.net/results/1a6/1a6f2fcf1a88ecc5b598dd11c5914dcacf0e1e6b/
http://autobuild.buildroot.net/results/63a/63a4f980d7cdb4b0823840f747589803fcd0d69f/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...gps-plugin-fix-build-with-newer-gpsd.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/collectd/0002-gps-plugin-fix-build-with-newer-gpsd.patch

diff --git a/package/collectd/0002-gps-plugin-fix-build-with-newer-gpsd.patch b/package/collectd/0002-gps-plugin-fix-build-with-newer-gpsd.patch
new file mode 100644
index 000000000000..b5abf8159a3b
--- /dev/null
+++ b/package/collectd/0002-gps-plugin-fix-build-with-newer-gpsd.patch
@@ -0,0 +1,43 @@
+From 991a6d3fd38c2435d94de3853fda36b3330cf6ab Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 9 Oct 2018 19:57:21 +0300
+Subject: [PATCH] gps plugin: fix build with newer gpsd
+
+gpsd version 3.18 changed the prototype of gps_read(). Make the
+gps_read() call depend on GPSD_API_MAJOR_VERSION to fix that.
+
+This fixes build failures like:
+
+gps.c: In function 'cgps_thread':
+gps.c:144:11: error: too few arguments to function 'gps_read'
+       if (gps_read(&gpsd_conn) == -1) {
+		   ^~~~~~~~
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/collectd/collectd/pull/2947
+
+ src/gps.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/gps.c b/src/gps.c
+index 1d32d0492617..b22c3a2e5ecd 100644
+--- a/src/gps.c
++++ b/src/gps.c
+@@ -141,7 +141,12 @@ static void *cgps_thread(void *pData) {
+         continue;
+       }
+ 
+-      if (gps_read(&gpsd_conn) == -1) {
++#if GPSD_API_MAJOR_VERSION > 6
++      if (gps_read(&gpsd_conn, NULL, 0) == -1)
++#else
++      if (gps_read(&gpsd_conn) == -1)
++#endif
++      {
+         WARNING("gps plugin: incorrect data! (err_count: %d)", err_count);
+         err_count++;
+ 
+-- 
+2.19.1
+
-- 
2.19.1
