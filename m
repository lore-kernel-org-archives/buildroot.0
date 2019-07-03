From: Atharva Lele <itsatharva@gmail.com>
Date: Thu,  4 Jul 2019 00:01:56 +0530
Subject: [Buildroot] [PATCH v2 24/27] autobuild-run: create reason file on
 build failures
In-Reply-To: <20190703183159.3415-1-itsatharva@gmail.com>
References: <20190703183159.3415-1-itsatharva@gmail.com>
Message-ID: <20190703183159.3415-24-itsatharva@gmail.com>
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
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes from reason-file-v2 series:
  - Move to builder-class series
---
 scripts/autobuild-run | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index af77ea5..bc47aa3 100755
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
2.22.0
