From: Victor Huesca <victor.huesca@bootlin.com>
Date: Tue, 13 Aug 2019 09:08:21 +0200
Subject: [Buildroot] [PATCH buildroot-test 1/2] web/funcs.inc.php: add
 support for filtering by date
In-Reply-To: <20190813070822.30230-1-victor.huesca@bootlin.com>
References: <20190813070822.30230-1-victor.huesca@bootlin.com>
Message-ID: <20190813070822.30230-2-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides support for filtering by date in the
'bab_format_sql_filter' function. The date can be either a singe value
-- in which case it is assumed as a 'from' date -- or an associative
array with 'from' and/or 'to' keys defined.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 web/funcs.inc.php | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/web/funcs.inc.php b/web/funcs.inc.php
index 9582e50..84f79a3 100644
--- a/web/funcs.inc.php
+++ b/web/funcs.inc.php
@@ -44,6 +44,16 @@ function bab_format_sql_filter($db, $filters)
         return sprintf("%s like %s", $k, $db->quote_smart($v));
       else if ($k == "status")
         return sprintf("%s=%s", $k, $db->quote_smart($status_map[$v]));
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
       else
         return sprintf("%s=%s", $k, $db->quote_smart($v));
     },
-- 
2.21.0
