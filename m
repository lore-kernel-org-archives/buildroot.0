From: Victor Huesca <victor.huesca@bootlin.com>
Date: Tue, 13 Aug 2019 15:13:17 +0200
Subject: [Buildroot] [PATCH buildroot-test v3 1/3] web/db.inc.php: add
 support to test if the database supports a feature
In-Reply-To: <20190813131319.14860-1-victor.huesca@bootlin.com>
References: <20190813131319.14860-1-victor.huesca@bootlin.com>
Message-ID: <20190813131319.14860-2-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch allows to test if the database supports a given feature.

Any feature to be test against can be added by simply adding a new case
to the switch.

This patch allows to check if the database engine supports the
'intersect' SQL keyword. This keyword was implemented in mariadb 10.3.10
released in oct. 2018

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 web/db.inc.php | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/web/db.inc.php b/web/db.inc.php
index 99f83a2..2dee2af 100644
--- a/web/db.inc.php
+++ b/web/db.inc.php
@@ -54,6 +54,30 @@ class db
 
     return $value;
   }
-}
 
-?>
\ No newline at end of file
+
+  // Test whereas the database supports a given feature
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
-- 
2.21.0
