From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Jun 2019 16:41:49 +0200
Subject: [Buildroot] [PATCH buildroot-test] scripts/autobuild-run: reduce
 disk space consumption of build results
Message-ID: <20190618144149.1242-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit e0635d4f7a2c926944609876ea9129245306cdea ("autobuild-run:
also copy packages files lists if they exist"), we added some logic in
autobuild-run to copy the package file lists as part of the build
results. This means these files are now collected on the
autobuild.buildroot.org machine.

However, it turns out that those files are taking a significant amount
of disk space, especially considered to the other files stored as part
of the build results. Taking
http://autobuild.buildroot.net/results/2ec994e1bb737c6b75c79f743763ebb690481604/
as an example, we have:

-rw-rw-r-- 1 thomas thomas    6 18 juin  16:01 branch
-rw-rw-r-- 1 thomas thomas  31K 18 juin  16:01 build-end.log
-rw-rw-r-- 1 thomas thomas 450K 18 juin  16:01 build-time.log
-rw-rw-r-- 1 thomas thomas 105K 18 juin  16:01 config
-rw-rw-r-- 1 thomas thomas  12K 18 juin  16:01 defconfig
-rw-rw-r-- 1 thomas thomas   40 18 juin  16:01 gitid
-rw-rw-r-- 1 thomas thomas 189K 18 juin  16:01 licenses-manifest.csv
-rw-rw-r-- 1 thomas thomas 4,7M 18 juin  16:01 packages-file-list-host.txt
-rw-rw-r-- 1 thomas thomas 2,2M 18 juin  16:01 packages-file-list-staging.txt
-rw-rw-r-- 1 thomas thomas 3,5M 18 juin  16:01 packages-file-list.txt
-rw-rw-r-- 1 thomas thomas    2 18 juin  16:01 status
-rw-rw-r-- 1 thomas thomas   25 18 juin  16:01 submitter

So the package file lists are several MBs large and it makes the total
build result data weight 12 MB.

The below patch proposes to store the build-time.log,
licenses-manifest.csv and packages-file-list* files gzip-compressed in
the build results. This reduces the total size of the build results to
1.2 MB, i.e dividing by 10 the disk space consumption.

While files like the build-end.log are very frequently used and nice
to access directly uncompessed, the other files are much less often
needed to analyze a build result, and having to uncompress them prior
to usage seems reasonable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 scripts/autobuild-run | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 601fb31..925d95f 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -145,6 +145,7 @@ from distutils.version import StrictVersion
 import platform
 from threading import Thread, Event
 import datetime
+import gzip
 
 if sys.hexversion >= 0x3000000:
     import configparser
@@ -551,16 +552,20 @@ def send_results(result, **kwargs):
     shutil.copyfile(os.path.join(outputdir, "branch"),
                     os.path.join(resultdir, "branch"))
 
-    def copy_if_exists(directory, src, dst=None):
-        if os.path.exists(os.path.join(outputdir, directory, src)):
-            shutil.copyfile(os.path.join(outputdir, directory, src),
-                            os.path.join(resultdir, src if dst is None else dst))
-
-    copy_if_exists("build", "build-time.log")
-    copy_if_exists("build", "packages-file-list.txt")
-    copy_if_exists("build", "packages-file-list-host.txt")
-    copy_if_exists("build", "packages-file-list-staging.txt")
-    copy_if_exists("legal-info", "manifest.csv", "licenses-manifest.csv")
+    def copy_compress_if_exists(directory, src, dst=None):
+        srcfile = os.path.join(outputdir, directory, src)
+        dstfile = os.path.join(resultdir, src if dst is None else dst) + ".gz"
+        if not os.path.exists(srcfile):
+            return
+        with open(srcfile, 'rb') as f_in:
+            with gzip.open(dstfile, 'wb') as f_out:
+                shutil.copyfileobj(f_in, f_out)
+
+    copy_compress_if_exists("build", "build-time.log")
+    copy_compress_if_exists("build", "packages-file-list.txt")
+    copy_compress_if_exists("build", "packages-file-list-host.txt")
+    copy_compress_if_exists("build", "packages-file-list-staging.txt")
+    copy_compress_if_exists("legal-info", "manifest.csv", "licenses-manifest.csv")
 
     subprocess.call(["git log -n 1 --pretty=format:%%H > %s" % \
                      os.path.join(resultdir, "gitid")],
-- 
2.21.0
