From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 27 Sep 2014 15:59:37 +0200
Subject: [Buildroot] [PATCH 1/1] autobuild-run: Include the config.log file
	(when it exists) in the tarball
Message-ID: <1411826377-17221-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a build error occurs, a line like this one is present in the log file:
make: *** [full_path_to_the_last_package/.stamp_*] Error 2

Simply extract the path to the package build directory and check if a file
named config.log exists. If this package used autotools then the config.log
file should be present.

Also, it's likely that the "Error" line is in the log's last lines,
so read the log from the end.

When the config.log file is found, it only remains to copy it to the
results directory.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 scripts/autobuild-run | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 7497001..496e66d 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -50,9 +50,6 @@
 #
 # - Add LC_ALL=C where appropriate.
 #
-# - Include the config.log file (when it exists) in the tarball for
-#   failed builds when the failure occurs on an autotools package.
-#
 # - Instead of excluding all configurations that have
 #   BR2_PACKAGE_CLASSPATH=y, improve the script to detect whether the
 #   necessary host machine requirements are there to build classpath.
@@ -70,6 +67,7 @@ import sys
 import hashlib
 import argparse
 import ConfigParser
+import re
 
 MAX_DURATION = 60 * 60 * 4
 VERSION = 1
@@ -399,6 +397,8 @@ def send_results(instance, http_login, http_password, submitter, log, result):
     outputdir = os.path.abspath(os.path.join(idir, "output"))
     srcdir = os.path.join(idir, "buildroot")
     resultdir = os.path.join(outputdir, "results")
+    logfile = os.path.join(outputdir, "logfile")
+    packagedir = ''
 
     os.mkdir(resultdir)
 
@@ -413,11 +413,25 @@ def send_results(instance, http_login, http_password, submitter, log, result):
         shutil.copyfile(os.path.join(outputdir, "legal-info", "manifest.csv"),
                         os.path.join(resultdir, "licenses-manifest.csv"))
 
+    if result == -1:
+        # Find the config.log file in the failing package directory
+        # and copy it (when it exists) to results directory.
+        f = open(logfile, "r")
+        for line in reversed(f.readlines()):
+            if re.match("(.*)/.stamp_(.*)", line):
+                packagedir = line[line.find("[")+1:line.find("]")]
+                packagedir = re.sub('\.stamp_(.*)$', '', packagedir)
+                break
+        if os.path.isdir(packagedir):
+            configfile = os.path.abspath(os.path.join(packagedir, "config.log"))
+            if os.path.isfile(configfile):
+                shutil.copyfile(configfile, os.path.join(resultdir, "config.log"))
+
     subprocess.call(["git log master -n 1 --pretty=format:%%H > %s" % \
                      os.path.join(resultdir, "gitid")],
                     shell=True, cwd=srcdir)
     subprocess.call(["tail -500 %s > %s" % \
-                     (os.path.join(outputdir, "logfile"), os.path.join(resultdir, "build-end.log"))],
+                     (logfile, os.path.join(resultdir, "build-end.log"))],
                     shell=True)
 
     resultf = open(os.path.join(resultdir, "status"), "w+")
-- 
1.9.3
