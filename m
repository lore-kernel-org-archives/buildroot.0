From: Victor Huesca <victor.huesca@bootlin.com>
Date: Fri, 21 Jun 2019 14:37:10 +0200
Subject: [Buildroot] [PATCH buildroot-test 2/4] web/index.php: add support
 for symbols to be passed via GET
In-Reply-To: <20190621123712.8060-1-victor.huesca@bootlin.com>
References: <20190621123712.8060-1-victor.huesca@bootlin.com>
Message-ID: <20190621123712.8060-3-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch add support of a `symbols[<symbol>]=<value>` option via GET as it is
done with other fields.

The syntax used is `symbols[<symbol>]=<value>`, so multiple symbols can be
passed while the url is still readable and symbols are clearly isolated from
other fields.
These symbols are forwared to the backend to be integrated in the sql query.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 web/index.php | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/web/index.php b/web/index.php
index f3af62d..289a866 100644
--- a/web/index.php
+++ b/web/index.php
@@ -34,7 +34,18 @@ function format_url_args($args)
 	));
 }
 
+function setup_date($dates)
+{
+  if (isset($dates['from']) && isset($dates['to']))
+    return $dates;
+  else if (isset($dates['from']))
+    return $dates['from'];
+  else if (isset($dates['to']))
+    return array('to' => $dates['to']);
+}
+
 $filters = array();
+$symbols = array();
 
 /* When no start is given, or start is a crazy value (not an integer),
    just default to start=0 */
@@ -53,7 +64,7 @@ if ($step > 250)
 
 $valid_status = array("OK", "NOK", "TIMEOUT");
 
-if (isset ($_GET['status']) && in_array($_GET['status'], $valid_status))
+if (isset($_GET['status']) && in_array($_GET['status'], $valid_status))
   $filters["status"] = $_GET['status'];
 
 if (isset($_GET['arch']) && preg_match("/^[a-z0-9_]*$/", $_GET['arch']))
@@ -74,9 +85,15 @@ if (isset($_GET['static']) && preg_match("/^[0-1]$/", $_GET['static']))
 if (isset($_GET['subarch']) && preg_match("/^[A-Za-z0-9_\+\.\-]*$/", $_GET['subarch']))
   $filters["subarch"] = $_GET['subarch'];
 
-if (isset ($_GET['submitter']))
+if (isset($_GET['submitter']))
   $filters["submitter"] = urldecode($_GET['submitter']);
 
+if (isset($_GET['symbols']) && is_array($_GET['symbols']))
+  $symbols = $_GET['symbols'];
+
+if (isset($_GET['date']))
+  $filters["date"] = setup_date($_GET['date']);
+
 bab_header("Buildroot tests");
 
 echo "<table>\n";
@@ -85,7 +102,7 @@ echo "<tr class=\"header\">";
 echo "<td>Date</td><td>Duration</td><td>Status</td><td>Commit ID</td><td>Submitter</td><td>Arch/Subarch</td><td>Failure reason</td><td>Libc</td><td>Static?</td><td>Data</td>";
 echo "</tr>";
 
-$results = bab_get_results($start, $step, $filters);
+$results = bab_get_results($start, $step, $filters, $symbols);
 
 while ($current = mysqli_fetch_object($results)) {
 
@@ -156,7 +173,7 @@ echo "</table>\n";
 
 echo "<p style=\"text-align: center;\">";
 
-$total = bab_total_results_count($filters);
+$total = bab_total_results_count($filters, $symbols);
 
 $prev_args = $filters;
 $next_args = $filters;
-- 
2.21.0
