From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Sun, 26 Apr 2015 23:47:51 +0200
Subject: [Buildroot] [PATCH v3 2/4] autobuild-run: log stderr of "git log" /
	"tail"
In-Reply-To: <1430084873-19977-1-git-send-email-dywi@mailerd.de>
References: <1430084873-19977-1-git-send-email-dywi@mailerd.de>
Message-ID: <1430084873-19977-3-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rather than printing error messages from "git log" and "tail" to
the autobuilder's console, redirect them to the instance's logfile.

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index b7d552c..9e50906 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -656,7 +656,7 @@ def send_results(result, **kwargs):
 
     sysinfo.run_cmd(["git log master -n 1 --pretty=format:%%H > %s" % \
                      os.path.join(resultdir, "gitid")],
-                    shell=True, cwd=srcdir, stderr=None)
+                    shell=True, cwd=srcdir, stderr=log)
 
     def get_failure_reason():
         # Output is a tuple (package, version), or None.
@@ -678,7 +678,7 @@ def send_results(result, **kwargs):
         def extract_last_500_lines():
             sysinfo.run_cmd(["tail -500 %s > %s" % \
                              (os.path.join(outputdir, "logfile"), resultfile)],
-                            shell=True, stderr=None)
+                            shell=True, stderr=log)
 
         reason = get_failure_reason()
         if not reason:
-- 
2.3.6
