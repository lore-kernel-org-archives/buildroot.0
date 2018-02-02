From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Fri,  2 Feb 2018 14:57:13 -0600
Subject: [Buildroot] [PATCH v3 3/3] autobuilder: failure reason use
 build-time.log
In-Reply-To: <20180202205713.27191-1-matthew.weber@rockwellcollins.com>
References: <20180202205713.27191-1-matthew.weber@rockwellcollins.com>
Message-ID: <20180202205713.27191-5-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the make output doesn't parse to provide a result and unknown
is assumed, check the build-time.log and see if the last line was
a <stamp>:start:<pkgname>.  IF so, use this pkgname instead
before declaring unknown.

This was tested against the ti-cgt-pru hang.
http://autobuild.buildroot.net/results/60e/60e11a3bb90b9f41259e4a970081b72d8b8d100b//

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 web/import.inc.php | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/web/import.inc.php b/web/import.inc.php
index 8eb3066..081a1cb 100644
--- a/web/import.inc.php
+++ b/web/import.inc.php
@@ -235,7 +235,12 @@ function import_result($buildid, $filename)
 	if (trim($tmp[0]))
 	  $reason = $tmp[0];
 	else
-	  $reason = "unknown";
+	  exec("tail -1 " . $thisbuildfinaldir . "build-time.log | grep :start: | cut -d':' -f4", $tmp);
+	  if (trim($tmp[0]))
+	    print "Using build-time.log for reason[".trim($tmp[0])."]";
+	    $reason = trim($tmp[0]);
+	  else
+	    $reason = "unknown";
     }
 
     $db = new db();
-- 
2.14.2
