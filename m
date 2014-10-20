From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 20 Oct 2014 21:39:26 +0200
Subject: [Buildroot] [PATCHv3 buildroot-test 7/9] autobuild-run: improve the
	logic to generate build-end.log
In-Reply-To: <1413833968-11808-1-git-send-email-patrickdepinguin@gmail.com>
References: <1413833968-11808-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1413833968-11808-8-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

This patch makes the generation of build-end.log more intelligent, by
not simply adding the 500 last lines, but instead capture the entire
output of the failed package.

If no failure reason can be found (possibly a good run) or the start for
that package cannot be found, use the 500 last lines as fallback.

The logic to find the failed package is taken from the result import
script web/import.inc.php. If needed, the search range of the last 3
lines could be extended.

Note that the package-version string extracted from the build log is
split on the last hyphen into a tuple (package, version). This is
needed to find back the beginning of that package's build (where the
package name is separated from the version with a space, not a hyphen).
However, this logic will fail to work when the version also contains a
hyphen, for example lmbench-3.0-a9. In this case, the resulting tuple
will be (lmbench-3.0,a9) and the text searched in the build log
'>>> lmbench-3.0 a9' (which will not be found). In this case, the
fallback of the last 500 lines will be used.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 scripts/autobuild-run | 53 ++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 7 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 299a931..7b88c20 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -44,10 +44,6 @@
 #
 # TODO:
 #
-# - Improve the logic that generates the 'build-end.log' file. Instead
-#   of just using the last 500 lines of the build log, search the
-#   start of the build of the failing package.
-#
 # - Include the config.log file (when it exists) in the tarball for
 #   failed builds when the failure occurs on an autotools package.
 #
@@ -485,9 +481,52 @@ def send_results(result, **kwargs):
     subprocess.call(["git log master -n 1 --pretty=format:%%H > %s" % \
                      os.path.join(resultdir, "gitid")],
                     shell=True, cwd=srcdir)
-    subprocess.call(["tail -500 %s > %s" % \
-                     (os.path.join(outputdir, "logfile"), os.path.join(resultdir, "build-end.log"))],
-                    shell=True)
+
+    def get_failure_reason():
+        # Output is a tuple (package, version), or None.
+
+        lastlines = subprocess.check_output(["tail", "-n", "3",
+                        os.path.join(outputdir, "logfile")]).splitlines()
+
+        import re
+        regexp = re.compile(r'make: \*\*\* .*/(?:build|toolchain)/([^/]*)/')
+        for line in lastlines:
+            m = regexp.search(line)
+            if m:
+                return m.group(1).rsplit('-', 1)
+
+        # not found
+        return None
+
+    def extract_end_log(resultfile):
+        """Save the last part of the build log, starting from the failed package"""
+
+        def extract_last_500_lines():
+            subprocess.call(["tail -500 %s > %s" % \
+                             (os.path.join(outputdir, "logfile"), resultfile)],
+                            shell=True)
+
+        reason = get_failure_reason()
+        if not reason:
+            extract_last_500_lines()
+        else:
+            import mmap
+            f = open(os.path.join(outputdir, "logfile"), 'r')
+            mf = mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ)
+            mf.seek(0)
+            # Search for first action on the failed package
+            offset = mf.find('>>> %s' % ' '.join(reason))
+            if offset != -1:
+                with open(resultfile, "w") as endlog:
+                    endlog.write(mf[offset:])
+            else:
+                # not found, use last 500 lines as fallback
+                extract_last_500_lines()
+
+            mf.close()
+            f.close()
+
+    extract_end_log(os.path.join(resultdir, "build-end.log"))
 
     resultf = open(os.path.join(resultdir, "status"), "w+")
     if result == 0:
-- 
1.8.5.1
