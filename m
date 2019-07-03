From: Atharva Lele <itsatharva@gmail.com>
Date: Thu,  4 Jul 2019 00:01:58 +0530
Subject: [Buildroot] [PATCH v2 26/27] web/import.inc.php: support reading
 failure reason from reason file
In-Reply-To: <20190703183159.3415-1-itsatharva@gmail.com>
References: <20190703183159.3415-1-itsatharva@gmail.com>
Message-ID: <20190703183159.3415-26-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
NOTE: This patch is untested.

Changes from reason-file-v2 series:
  - Move to builder-class series
---
 web/import.inc.php | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/web/import.inc.php b/web/import.inc.php
index a9b368f..6f878e0 100644
--- a/web/import.inc.php
+++ b/web/import.inc.php
@@ -230,17 +230,21 @@ function import_result($buildid, $filename)
     if ($status == 0)
       $reason = "none";
     else {
-	$tmp = Array();
-	exec("tail -3 " . $thisbuildfinaldir . "build-end.log | grep -v '\[_all\]' | grep 'make.*: \*\*\*' | sed 's,.*\[\([^\]*\)\] Error.*,\\1,' | sed 's,.*/build/\([^/]*\)/.*,\\1,'", $tmp);
-	if (trim($tmp[0]))
-	  $reason = $tmp[0];
-	else {
-	  exec("tail -1 " . $thisbuildfinaldir . "build-time.log | grep :start: | cut -d':' -f4", $tmp);
-	  if (trim($tmp[0]))
-	    $reason = trim($tmp[0]);
-	  else
-	    $reason = "unknown";
-	}
+      if (file_exists($thisbuildfinaldir . "reason"))
+        $reason = trim(file_get_contents($thisbuildfinaldir . "reason", "r"));
+      else {
+        $tmp = Array();
+        exec("tail -3 " . $thisbuildfinaldir . "build-end.log | grep -v '\[_all\]' | grep 'make.*: \*\*\*' | sed 's,.*\[\([^\]*\)\] Error.*,\\1,' | sed 's,.*/build/\([^/]*\)/.*,\\1,'", $tmp);
+        if (trim($tmp[0]))
+          $reason = $tmp[0];
+        else {
+          exec("tail -1 " . $thisbuildfinaldir . "build-time.log | grep :start: | cut -d':' -f4", $tmp);
+          if (trim($tmp[0]))
+            $reason = trim($tmp[0]);
+          else
+            $reason = "unknown";
+        }
+      }
     }
 
     /* Compress files that are typically too large and infrequently
-- 
2.22.0
