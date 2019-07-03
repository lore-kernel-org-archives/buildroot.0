From: Atharva Lele <itsatharva@gmail.com>
Date: Thu,  4 Jul 2019 00:01:52 +0530
Subject: [Buildroot] [PATCH v2 20/27] autobuild-run: define results
 directory as part of Builder class
In-Reply-To: <20190703183159.3415-1-itsatharva@gmail.com>
References: <20190703183159.3415-1-itsatharva@gmail.com>
Message-ID: <20190703183159.3415-20-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 scripts/autobuild-run | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index f2a28d5..8f3e602 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -299,6 +299,7 @@ class Builder:
         # Buildroot sources, but to the location of the autobuilder
         # script.
         self.outputdir = os.path.abspath(os.path.join(self.idir, "output"))
+        self.resultdir = os.path.join(self.outputdir, "results")
 
         if self.debug:
             self.log = sys.stdout
@@ -540,19 +541,17 @@ class Builder:
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
@@ -561,7 +560,7 @@ class Builder:
         copy_if_exists("legal-info", "manifest.csv", "licenses-manifest.csv")
 
         subprocess.call(["git log -n 1 --pretty=format:%%H > %s" % \
-                         os.path.join(resultdir, "gitid")],
+                         os.path.join(self.resultdir, "gitid")],
                         shell=True, cwd=self.srcdir)
 
         # Return True if the result should be rejected, False otherwise
@@ -623,7 +622,7 @@ class Builder:
                 mf.close()
                 f.close()
 
-        extract_end_log(os.path.join(resultdir, "build-end.log"))
+        extract_end_log(os.path.join(self.resultdir, "build-end.log"))
 
         def copy_config_log_files():
             """Recursively copy any config.log files from the failing package"""
@@ -633,7 +632,7 @@ class Builder:
                 return
 
             srcroot = os.path.join(self.outputdir, "build", '-'.join(reason))
-            destroot = os.path.join(resultdir, '-'.join(reason))
+            destroot = os.path.join(self.resultdir, '-'.join(reason))
             config_files = ('config.log', 'CMakeCache.txt', 'CMakeError.log',
                 'CMakeOutput.log')
 
@@ -648,7 +647,7 @@ class Builder:
 
         copy_config_log_files()
 
-        resultf = open(os.path.join(resultdir, "status"), "w+")
+        resultf = open(os.path.join(self.resultdir, "status"), "w+")
         if result == 0:
             resultf.write("OK")
         elif result == -1:
@@ -657,7 +656,7 @@ class Builder:
             resultf.write("TIMEOUT")
         resultf.close()
 
-        with open(os.path.join(resultdir, "submitter"), "w+") as submitterf:
+        with open(os.path.join(self.resultdir, "submitter"), "w+") as submitterf:
             submitterf.write(self.submitter)
 
         # Yes, shutil.make_archive() would be nice, but it doesn't exist
@@ -711,8 +710,7 @@ class Builder:
             if ret != 0:
                 continue
 
-            resultdir = os.path.join(self.idir, "output", "results")
-            os.mkdir(resultdir)
+            os.mkdir(self.resultdir)
 
             ret = self.gen_config()
             if ret != 0:
-- 
2.22.0
