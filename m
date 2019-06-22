From: Atharva Lele <itsatharva@gmail.com>
Date: Sun, 23 Jun 2019 00:11:17 +0530
Subject: [Buildroot] [PATCH v2 2/3] autobuild-run: account for
 reproducibility failures when creating the reason file
In-Reply-To: <20190622184118.5627-1-itsatharva@gmail.com>
References: <20190622184118.5627-1-itsatharva@gmail.com>
Message-ID: <20190622184118.5627-2-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
Changes v1 -> v2:
  - Split into separate commit for reproducibility failures
---
 scripts/autobuild-run | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index c18d8aa..6068376 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -582,16 +582,26 @@ class Builder:
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
@@ -599,7 +609,10 @@ class Builder:
         reason = get_failure_reason()
         if reason:
             with open(os.path.join(self.resultdir, "reason"), "w+") as reasonf:
-                reasonf.write("-".join(reason))
+                if reason == "reproducible":
+                    reasonf.write(reason)
+                else:
+                    reasonf.write("-".join(reason))
 
         def extract_end_log(resultfile):
             """Save the last part of the build log, starting from the failed package"""
-- 
2.20.1
