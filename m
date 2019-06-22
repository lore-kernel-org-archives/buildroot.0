From: Atharva Lele <itsatharva@gmail.com>
Date: Sat, 22 Jun 2019 23:14:48 +0530
Subject: [Buildroot] [PATCH 1/2] autobuild-run: create reason file on build
 failures
Message-ID: <20190622174449.4340-1-itsatharva@gmail.com>
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
---
 scripts/autobuild-run | 38 +++++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 92afb26..6068376 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -582,20 +582,38 @@ class Builder:
             return
 
         def get_failure_reason():
-            # Output is a tuple (package, version), or None.
-            lastlines = decode_bytes(subprocess.Popen(
-                ["tail", "-n", "3", os.path.join(self.outputdir, "logfile")],
-                stdout=subprocess.PIPE).communicate()[0]).splitlines()
+            # Output is a tuple (package, version), or None in case of package failure
+            # Output is "reproducible" in case of reproducibility failure
+
+            reproducible_results = os.path.join(self.resultdir, "reproducible_results")
+            if os.path.exists(reproducible_results):
+                if os.stat(reproducible_results).st_size > 0:
+                    reason = "reproducible"
+                    return reason
+                else:
+                    return None
+            else:
+                lastlines = decode_bytes(subprocess.Popen(
+                    ["tail", "-n", "3", os.path.join(self.outputdir, "logfile")],
+                    stdout=subprocess.PIPE).communicate()[0]).splitlines()
 
-            regexp = re.compile(r'make: \*\*\* .*/(?:build|toolchain)/([^/]*)/')
-            for line in lastlines:
-                m = regexp.search(line)
-                if m:
-                    return m.group(1).rsplit('-', 1)
+                regexp = re.compile(r'make: \*\*\* .*/(?:build|toolchain)/([^/]*)/')
+                for line in lastlines:
+                    m = regexp.search(line)
+                    if m:
+                        return m.group(1).rsplit('-', 1)
 
             # not found
             return None
 
+        reason = get_failure_reason()
+        if reason:
+            with open(os.path.join(self.resultdir, "reason"), "w+") as reasonf:
+                if reason == "reproducible":
+                    reasonf.write(reason)
+                else:
+                    reasonf.write("-".join(reason))
+
         def extract_end_log(resultfile):
             """Save the last part of the build log, starting from the failed package"""
 
@@ -604,7 +622,6 @@ class Builder:
                                 (os.path.join(self.outputdir, "logfile"), resultfile)],
                                 shell=True)
 
-            reason = get_failure_reason()
             if not reason:
                 extract_last_500_lines()
             else:
@@ -628,7 +645,6 @@ class Builder:
         def copy_config_log_files():
             """Recursively copy any config.log files from the failing package"""
 
-            reason = get_failure_reason()
             if not reason:
                 return
 
-- 
2.20.1
