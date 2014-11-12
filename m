From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 12 Nov 2014 20:58:36 +0100
Subject: [Buildroot] [PATCH v4 8/9] autobuild-run: save config.log files for
	failed package
In-Reply-To: <1415822317-22500-1-git-send-email-patrickdepinguin@gmail.com>
References: <1415822317-22500-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1415822317-22500-9-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

This patch will save all config.log files of the failed package in the
result tarball, to help problem analysis. This is typically useful for
autotools packages, although the added logic does not check that
explicitly (i.e. any failing package that has a config.log file in the
output directory will see this file saved).

The saving of config.log files happens recursively, the directory
structure is preserved in the result directory.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 scripts/autobuild-run | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index a88838f..7fe0b00 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -44,9 +44,6 @@
 #
 # TODO:
 #
-# - Include the config.log file (when it exists) in the tarball for
-#   failed builds when the failure occurs on an autotools package.
-#
 # - Instead of excluding all configurations that have
 #   BR2_PACKAGE_CLASSPATH=y, improve the script to detect whether the
 #   necessary host machine requirements are there to build classpath.
@@ -534,6 +531,26 @@ def send_results(result, **kwargs):
 
     extract_end_log(os.path.join(resultdir, "build-end.log"))
 
+    def copy_config_log_files():
+        """Recursively copy any config.log files from the failing package"""
+
+        reason = get_failure_reason()
+        if not reason:
+            return
+
+        srcroot = os.path.join(outputdir, "build", '-'.join(reason))
+        destroot = os.path.join(resultdir, '-'.join(reason))
+
+        for root, dirs, files in os.walk(srcroot):
+            dest = os.path.join(destroot, os.path.relpath(root, srcroot))
+
+            for file in files:
+                if file == 'config.log':
+                    os.makedirs(dest)
+                    shutil.copy(os.path.join(root, file), os.path.join(dest, file))
+
+    copy_config_log_files()
+
     resultf = open(os.path.join(resultdir, "status"), "w+")
     if result == 0:
         resultf.write("OK")
-- 
1.8.5.1
