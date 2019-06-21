From: Atharva Lele <itsatharva@gmail.com>
Date: Fri, 21 Jun 2019 14:17:30 +0530
Subject: [Buildroot] [PATCH 19/19] autobuild-run: define results directory
 as part of Builder class
In-Reply-To: <20190621084730.16411-1-itsatharva@gmail.com>
References: <20190621084730.16411-1-itsatharva@gmail.com>
Message-ID: <20190621084730.16411-19-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 5f0fd0a..92afb26 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -299,6 +299,7 @@ class Builder:
         # Buildroot sources, but to the location of the autobuilder
         # script.
         self.outputdir = os.path.abspath(os.path.join(self.idir, "output"))
+        self.resultdir = os.path.join(self.outputdir, "results")
 
         if self.debug:
             self.log = sys.stdout
@@ -541,19 +542,17 @@ class Builder:
         are available) or stores them locally as tarballs.
         """
 
-        resultdir = os.path.join(self.outputdir, "results")
-
         shutil.copyfile(os.path.join(self.outputdir, ".config"),
-                        os.path.join(resultdir, "config"))
+                        os.path.join(self.resultdir, "config"))
         shutil.copyfile(os.path.join(self.outputdir, "defconfig"),
-                        os.path.join(resultdir, "defconfig"))
+                        os.path.join(self.resultdir, "defconfig"))
         shutil.copyfile(os.path.join(self.outputdir, "branch"),
-                        os.path.join(resultdir, "branch"))
+                        os.path.join(self.resultdir, "branch"))
 
         def copy_if_exists(directory, src, dst=None):
             if os.path.exists(os.path.join(self.outputdir, directory, src)):
                 shutil.copyfile(os.path.join(self.outputdir, directory, src),
-                                os.path.join(resultdir, src if dst is None else dst))
+                                os.path.join(self.resultdir, src if dst is None else dst))
 
         copy_if_exists("build", "build-time.log")
         copy_if_exists("build", "packages-file-list.txt")
@@ -562,7 +561,7 @@ class Builder:
         copy_if_exists("legal-info", "manifest.csv", "licenses-manifest.csv")
 
         subprocess.call(["git log -n 1 --pretty=format:%%H > %s" % \
-                        os.path.join(resultdir, "gitid")],
+                        os.path.join(self.resultdir, "gitid")],
                         shell=True, cwd=self.srcdir)
 
         # Return True if the result should be rejected, False otherwise
@@ -624,7 +623,7 @@ class Builder:
                 mf.close()
                 f.close()
 
-        extract_end_log(os.path.join(resultdir, "build-end.log"))
+        extract_end_log(os.path.join(self.resultdir, "build-end.log"))
 
         def copy_config_log_files():
             """Recursively copy any config.log files from the failing package"""
@@ -634,7 +633,7 @@ class Builder:
                 return
 
             srcroot = os.path.join(self.outputdir, "build", '-'.join(reason))
-            destroot = os.path.join(resultdir, '-'.join(reason))
+            destroot = os.path.join(self.resultdir, '-'.join(reason))
             config_files = ('config.log', 'CMakeCache.txt', 'CMakeError.log',
                 'CMakeOutput.log')
 
@@ -649,7 +648,7 @@ class Builder:
 
         copy_config_log_files()
 
-        resultf = open(os.path.join(resultdir, "status"), "w+")
+        resultf = open(os.path.join(self.resultdir, "status"), "w+")
         if result == 0:
             resultf.write("OK")
         elif result == -1:
@@ -658,7 +657,7 @@ class Builder:
             resultf.write("TIMEOUT")
         resultf.close()
 
-        with open(os.path.join(resultdir, "submitter"), "w+") as submitterf:
+        with open(os.path.join(self.resultdir, "submitter"), "w+") as submitterf:
             submitterf.write(self.submitter)
 
         # Yes, shutil.make_archive() would be nice, but it doesn't exist
@@ -712,8 +711,7 @@ class Builder:
             if ret != 0:
                 continue
 
-            resultdir = os.path.join(self.idir, "output", "results")
-            os.mkdir(resultdir)
+            os.mkdir(self.resultdir)
 
             ret = self.gen_config()
             if ret != 0:
-- 
2.20.1
