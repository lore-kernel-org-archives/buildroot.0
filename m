From: Atharva Lele <itsatharva@gmail.com>
Date: Sun, 23 Jun 2019 00:11:16 +0530
Subject: [Buildroot] [PATCH v2 1/3] autobuild-run: create reason file on
 build failures
Message-ID: <20190622184118.5627-1-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a build fails, we calculate the reason of failure on
the server side as well as client side. To solve this redundancy
we only calculate on the client side and submit a file which
contains the reason of failure.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
NOTE: This series depends on work from builder-class series

Changes v1 -> v2:
  - Split commit into two, one for adding reason file and one for
    accounting for reproducibility failures (next patch).
---
 scripts/autobuild-run | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 92afb26..c18d8aa 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -596,6 +596,11 @@ class Builder:
             # not found
             return None
 
+        reason = get_failure_reason()
+        if reason:
+            with open(os.path.join(self.resultdir, "reason"), "w+") as reasonf:
+                reasonf.write("-".join(reason))
+
         def extract_end_log(resultfile):
             """Save the last part of the build log, starting from the failed package"""
 
@@ -604,7 +609,6 @@ class Builder:
                                 (os.path.join(self.outputdir, "logfile"), resultfile)],
                                 shell=True)
 
-            reason = get_failure_reason()
             if not reason:
                 extract_last_500_lines()
             else:
@@ -628,7 +632,6 @@ class Builder:
         def copy_config_log_files():
             """Recursively copy any config.log files from the failing package"""
 
-            reason = get_failure_reason()
             if not reason:
                 return
 
-- 
2.20.1
