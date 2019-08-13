From: Victor Huesca <victor.huesca@bootlin.com>
Date: Tue, 13 Aug 2019 15:13:18 +0200
Subject: [Buildroot] [PATCH buildroot-test v3 2/3] web/funcs.inc.php: add
 support for filtering autobuild results by configuration options
In-Reply-To: <20190813131319.14860-1-victor.huesca@bootlin.com>
References: <20190813131319.14860-1-victor.huesca@bootlin.com>
Message-ID: <20190813131319.14860-3-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch improves 'bab_get_results()' and 'bab_total_results_count()'
so that we can filter autobuilder results from the database with a list
of configuration options and values.

The SQL query has been optimized to scale the better when multiple
symbols are involved altogether. There is at least 3 ways to get
the same results: 'join', 'where in' and 'intersect'.
- The 'join' does not scale at all and can only return a dozen
  configurations in a reasonable amount of time.
- The 'intersect' outperforms the two others and allows to add as many
  configuration symbols as wanted, even when thousand of configs are
  returned.
- The 'where in' is the compromise solution. It works well for asking
  two or three configuration symbols at the same time but can become a
  real bottleneck when those symbols are commons are returns a too many
  configurations.
  Also its results depends on the underlying DBMS, this make its
  performances unpredictable.

The current deployment uses an old mysql server that does not supports
the 'intersect' queries. In order to scale well with a potential
migration of the SQL server to a MariaDB 10.3.10+, this patch implements
both the 'intersect' and 'where in' versions of the query. The default
behavior is to look for 'intersect' support and fallback on the 'where
in' query otherwise.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 web/funcs.inc.php | 40 ++++++++++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/web/funcs.inc.php b/web/funcs.inc.php
index 84f79a3..e3fb577 100644
--- a/web/funcs.inc.php
+++ b/web/funcs.inc.php
@@ -30,6 +30,24 @@ function bab_footer()
   echo "</html>\n";
 }
 
+function bab_format_sql_config_symbol_filter($db, $symbols)
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
@@ -38,6 +56,10 @@ function bab_format_sql_filter($db, $filters)
     "TIMEOUT" => 2,
   );
 
+  # Move the symbols away from filters since implode wouldn't work with an empty key
+  $symbols = $filters['symbols'];
+  unset($filters['symbols']);
+
   $sql_filters = implode(' and ', array_map(
     function ($v, $k) use ($db, $status_map) {
       if ($k == "reason")
@@ -61,10 +83,16 @@ function bab_format_sql_filter($db, $filters)
     array_keys($filters)
   ));
 
-  if (count($filters))
-    return "where " . $sql_filters;
-  else
-    return "";
+  $sql = "";
+  if ($symbols) {
+    $symbols_condition = bab_format_sql_config_symbol_filter($db, $symbols);
+    $sql .= " inner join ($symbols_condition) symbols using (id)";
+
+  }
+  if (count($filters) != 0)
+    $sql .= " where $sql_filters";
+
+  return $sql;
 }
 
 /*
@@ -74,7 +102,7 @@ function bab_total_results_count($filters)
 {
   $db = new db();
   $condition = bab_format_sql_filter($db, $filters);
-  $sql = "select count(*) from results $condition;";
+  $sql = "select count(*) from results$condition;";
   $ret = $db->query($sql);
   if ($ret == FALSE) {
     echo "Something's wrong in here\n";
@@ -96,7 +124,7 @@ function bab_get_results($start=0, $count=100, $filters = array())
   $db = new db();
 
   $condition = bab_format_sql_filter($db, $filters);
-  $sql = "select * from results $condition order by builddate desc limit $start, $count;";
+  $sql = "select * from results$condition order by builddate desc limit $start, $count;";
   $ret = $db->query($sql);
   if ($ret == FALSE) {
     echo "Something's wrong with the SQL query\n";
-- 
2.21.0
