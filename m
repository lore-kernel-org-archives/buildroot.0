From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Feb 2021 23:31:44 +0100
Subject: [Buildroot] [PATCH RFC autobuilder] scripts/autobuild-run: generate
 and validate show-info
Message-ID: <20210207223144.1581308-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We've recently had a case where the generated show-info was not valid
JSON, see e4c284e6b9 (package/pkg-utils: escape \ in generated
legal-info) in the main tree.

Add a test that we can generate show-info, and that it is valid json. We
use python's json module: if the module can load the generated blurb, we
consider it is valid json.

Save the generated blurb with the other artefacts, and like the
build-time.log, compress it.

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

---
Note: I'm using a real text editor that ensures the last line of the
file is properly terminated with a \n, hence the seemingly-spurious
hunk at the end... ;-]

Also: totally untested...

---
 scripts/autobuild-run | 19 +++++++++++++++++++
 web/import.inc.php    |  5 +++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 84e4d40..908245f 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -131,6 +131,7 @@ import csv
 import docopt
 import errno
 import hashlib
+import json
 import mmap
 import multiprocessing
 import os
@@ -536,6 +537,23 @@ class Builder:
         if ret != 0:
             log_write(self.log, "INFO: build failed during legal-info")
             return -1
+
+        cmd = ["make", "O=%s" % outputdir, "-C", self.srcdir,
+               "BR2_DL_DIR=%s" % self.dldir, "show-info"] \
+            + self.make_opts.split()
+        with open(os.path.join(outputdir, "show-info"), "w") as info_f:
+            ret = subprocess.call(cmd, stdout=info_f, stderr=f)
+        if ret != 0:
+            log_write(self.log, "INFO: build failed during show-info")
+            return -1
+        with open(os.path.join(outputdir, "show-info"), "r") as info_f:
+            try:
+                json.load(info_f)
+            except Exception as e:
+                log_write(self.log,
+                          "INFO: build failed during show-info: {}".format(e))
+                return -1
+
         log_write(self.log, "INFO: build successful")
         return 0
 
@@ -597,6 +615,7 @@ class Builder:
         copy_if_exists("build", "packages-file-list-host.txt")
         copy_if_exists("build", "packages-file-list-staging.txt")
         copy_if_exists("legal-info", "manifest.csv", "licenses-manifest.csv")
+        copy_if_exists(".", "show-info", "show-info.json")
 
         subprocess.call(["git log -n 1 --pretty=format:%%H > %s" % \
                          os.path.join(self.resultdir, "gitid")],
diff --git a/web/import.inc.php b/web/import.inc.php
index 6f878e0..a0a03fa 100644
--- a/web/import.inc.php
+++ b/web/import.inc.php
@@ -253,7 +253,8 @@ function import_result($buildid, $filename)
 			       "licenses-manifest.csv",
 			       "packages-file-list-host.txt",
 			       "packages-file-list-staging.txt",
-			       "packages-file-list.txt");
+			       "packages-file-list.txt",
+			       "show-info.json");
     foreach ($files_to_compress as $f) {
 	system("gzip " . $thisbuildfinaldir . $f, $retval);
     }
@@ -290,4 +291,4 @@ function import_result($buildid, $filename)
     echo "Build result accepted. Thanks!";
 }
 
-?>
\ No newline at end of file
+?>
-- 
2.25.1
