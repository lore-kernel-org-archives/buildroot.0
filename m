From: Atharva Lele <itsatharva@gmail.com>
Date: Sat, 10 Aug 2019 09:29:02 +0530
Subject: [Buildroot] [PATCH v2 5/5] autobuild-run: account for
 reproducibility failures in get_failure_reason()
In-Reply-To: <20190810035902.14047-1-itsatharva@gmail.com>
References: <20190810035902.14047-1-itsatharva@gmail.com>
Message-ID: <20190810035902.14047-5-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 1be392a..7fc8d3a 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -690,15 +690,26 @@ class Builder:
 
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
+            reproducible_results = os.path.join(self.resultdir, "reproducible_results")
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
