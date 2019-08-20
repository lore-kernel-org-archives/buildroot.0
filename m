From: Atharva Lele <itsatharva@gmail.com>
Date: Tue, 20 Aug 2019 20:22:29 +0530
Subject: [Buildroot] [PATCH v4 3/5] autobuild-run: account for
 reproducibility failures in get_failure_reason()
In-Reply-To: <20190820145231.15507-1-itsatharva@gmail.com>
References: <20190820145231.15507-1-itsatharva@gmail.com>
Message-ID: <20190820145231.15507-3-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
Changes v1 -> v3:
  - Account for changed name of diffoscope output
---
 scripts/autobuild-run | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 384cf73..876feb2 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -689,15 +689,26 @@ class Builder:
 
         def get_failure_reason():
             # Output is a tuple (package, version), or None.
-            lastlines = decode_bytes(subprocess.Popen(
-                ["tail", "-n", "3", os.path.join(self.outputdir, "logfile")],
-                stdout=subprocess.PIPE).communicate()[0]).splitlines()
-
-            regexp = re.compile(r'make: \*\*\* .*/(?:build|toolchain)/([^/]*)/')
-            for line in lastlines:
-                m = regexp.search(line)
-                if m:
-                    return m.group(1).rsplit('-', 1)
+            # Output is "package-reproducible" in case of reproducibility failure.
+
+            reproducible_results = os.path.join(self.resultdir, "diffoscope-results.json")
+            if os.path.exists(reproducible_results) and os.stat(reproducible_results).st_size > 0:
+                if self.sysinfo.has("diffoscope"):
+                    reason = get_reproducibility_failure_reason(reproducible_results)
+                    reason.append("nonreproducible")
+                    return reason
+                else:
+                    return ["nonreproducible"]
+            else:
+                lastlines = decode_bytes(subprocess.Popen(
+                    ["tail", "-n", "3", os.path.join(self.outputdir, "logfile")],
+                    stdout=subprocess.PIPE).communicate()[0]).splitlines()
+
+                regexp = re.compile(r'make: \*\*\* .*/(?:build|toolchain)/([^/]*)/')
+                for line in lastlines:
+                    m = regexp.search(line)
+                    if m:
+                        return m.group(1).rsplit('-', 1)
 
             # not found
             return None
-- 
2.22.0
