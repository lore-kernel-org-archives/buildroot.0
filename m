From: Victor Huesca <victor.huesca@bootlin.com>
Date: Fri, 21 Jun 2019 14:37:09 +0200
Subject: [Buildroot] [PATCH buildroot-test 1/4] web/{funcs,
 db}.inc.php: add support for symbols in sql query
In-Reply-To: <20190621123712.8060-1-victor.huesca@bootlin.com>
References: <20190621123712.8060-1-victor.huesca@bootlin.com>
Message-ID: <20190621123712.8060-2-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provide a way to filter results from database with a list of symbols.

This query has been optimized to scale the best it can when multiple symbols are
asked together. Actually I found 3 way to get the same results: `join`, `where in`
and `intersect`.
- The 1st one is really not usable in practice since it only returns results if
the symbols subquery return only a douzen of rows and there no more than 2 or 3
symbols asked at the same time.
- The 2nd can handle queries where thousand rows are involved -- which is still
less than common cases -- but on a very limited number of symbols too. We could
have hope a better result but it is still a way better than join.
- The last is the one realy want to use. It can handle any number of symbols
with any number of rows and return a result in a few seconds.

Unfortunalty this query make use of `intersect` which is not implemented in
mysql. However mariaDB implemented this feature in 2017 w/ the version 10.3.10
but our current databse is an oracle mysql not a mariaDB :(
We planned to move the database to an other server but since it is an stable
debian, the mariadb verison is too old to support select.
I implemented a dynamic check of mysql version. The type of query use to
handle symbols read this version and use `intersect` in case when the
version supports it.

TDRL; The select on symbols works but is not optimal yet. It will be optimal
as soon as the database support `intersect` without changing the php code.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 web/db.inc.php    | 28 +++++++++++++++++++++++++--
 web/funcs.inc.php | 48 +++++++++++++++++++++++++++++++++++++----------
 2 files changed, 64 insertions(+), 12 deletions(-)

diff --git a/web/db.inc.php b/web/db.inc.php
index 99f83a2..f8b10a2 100644
--- a/web/db.inc.php
+++ b/web/db.inc.php
@@ -54,6 +54,30 @@ class db
 
     return $value;
   }
-}
 
-?>
\ No newline at end of file
+
+  // Test whereas the database the support a given feature
+  function has_feature($feature)
+  {
+    // Return -1 on v1 < v2, 0 on v1 = v2 and 1 on v1 > v2
+    $compare_versions = function($v1, $v2) {
+      for ($i = 0; $i < min(sizeof($v1), sizeof($v2)); $i++)
+        if ($v1[$i] != $v2[$i])
+          return $v1[$i] - $v2[$i];
+      return 0;
+    };
+
+    switch ($feature) {
+      case 'intersect': // SELECT was introduced in mariadb version 10.3.10
+        $res = $this->query("select version() version;");
+        $ver = mysqli_fetch_object($res)->version;
+        preg_match("/^(\d+(?:\.\d+)*)-.+$/", $ver, $match);
+        $version = array_map(function ($v) { return (int)$v; }, explode('.', $match[1]));
+        return $compare_versions($version, array(10, 3, 10)) >= 0;
+
+      default:
+        throw new Exception("Unknown feature", 1);
+    }
+  }
+}
+?>
diff --git a/web/funcs.inc.php b/web/funcs.inc.php
index 7e912c1..f1f74dc 100644
--- a/web/funcs.inc.php
+++ b/web/funcs.inc.php
@@ -1,4 +1,5 @@
 <?php
+set_time_limit(0);
 include(dirname(__FILE__) . "/../web/config.inc.php");
 include(dirname(__FILE__) . "/../web/db.inc.php");
 
@@ -30,6 +31,24 @@ function bab_footer()
   echo "</html>\n";
 }
 
+function bab_format_sql_symbols($db, $symbols)
+{
+  $get_res_id = "select result_id id from symbol_per_result where symbol_id = (select id from config_symbol where name=%s and value=%s)";
+
+  $r = array_map(
+    function($name, $value) use ($db, $get_res_id) {
+      return sprintf($get_res_id, $db->quote_smart($name), $db->quote_smart($value));
+    },
+    array_keys($symbols),
+    $symbols
+  );
+
+  if ($db->has_feature('intersect'))
+    return implode(" intersect ", $r);
+  else
+    return implode(" and result_id in (", $r) . str_repeat(")", count($symbols)-1);
+}
+
 function bab_format_sql_filter($db, $filters)
 {
 	$status_map = array(
@@ -44,27 +63,35 @@ function bab_format_sql_filter($db, $filters)
 				return sprintf("%s like %s", $k, $db->quote_smart($v));
 			else if ($k == "status")
 				return sprintf("%s=%s", $k, $db->quote_smart($status_map[$v]));
-			else
+      elseif ($k == "date")
+        if (is_array($v)) {
+          if (isset($v['from'], $v['to']))
+            return sprintf("builddate between %s and %s", $db->quote_smart($v['from']), $db->quote_smart($v['to']));
+          else if (isset($v['to']))
+            return sprintf("builddate<=%s", $db->quote_smart($v['to']));
+          else
+            return sprintf("builddate>=%s", $db->quote_smart($v['from']));
+        } else // Assuming the date is a lower-bound
+          return sprintf("builddate>=%s", $db->quote_smart($v));
+      else
 				return sprintf("%s=%s", $k, $db->quote_smart($v));
 		},
 		$filters,
 		array_keys($filters)
 	));
 
-	if (count($filters))
-		return "where " . $sql_filters;
-	else
-		return "";
+  return (count($filters) ? "where " . $sql_filters : "");
 }
 
 /*
  * Returns the total number of results.
  */
-function bab_total_results_count($filters)
+function bab_total_results_count($filters, $symbols)
 {
   $db = new db();
   $condition = bab_format_sql_filter($db, $filters);
-  $sql = "select count(*) from results $condition;";
+  $symbols_condition = bad_format_sql_symbols($db, $symbols);
+  $sql = "select count(*) from results ".(count($symbols) > 0 ? "inner join ($symbols_condition) SYMBOLS using (id)" : "")."$condition;";
   $ret = $db->query($sql);
   if ($ret == FALSE) {
     echo "Something's wrong in here\n";
@@ -80,13 +107,14 @@ function bab_total_results_count($filters)
  * and limited to $count items. The items starting with $start=0 are
  * the most recent build results.
  */
-function bab_get_results($start=0, $count=100, $filters = array())
+function bab_get_results($start=0, $count=100, $filters = array(), $symbols = array())
 {
   global $status_map;
   $db = new db();
-
+  $symbols_condition = bab_format_sql_symbols($db, $symbols);
   $condition = bab_format_sql_filter($db, $filters);
-  $sql = "select * from results $condition order by builddate desc limit $start, $count;";
+  $sql = "select * from results ".(count($symbols) > 0 ? "inner join ($symbols_condition) SYMBOLS using (id)" : "")."$condition order by builddate desc limit $start, $count;";
+
   $ret = $db->query($sql);
   if ($ret == FALSE) {
     echo "Something's wrong with the SQL query\n";
-- 
2.21.0
