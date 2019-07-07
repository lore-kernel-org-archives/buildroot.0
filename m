From: Atharva Lele <itsatharva@gmail.com>
Date: Sun,  7 Jul 2019 10:58:17 +0530
Subject: [Buildroot] [PATCH v3 17/31] autobuild-run: define source directory
 as part of Builder class
In-Reply-To: <20190707052831.9469-1-itsatharva@gmail.com>
References: <20190707052831.9469-1-itsatharva@gmail.com>
Message-ID: <20190707052831.9469-17-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v1 -> v2:
  - Fix whitespace issue
---
 scripts/autobuild-run | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index adc8795..741d316 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -292,6 +292,7 @@ class Builder:
 
         # frequently needed directories
         self.idir = "instance-%d" % self.instance
+        self.srcdir = os.path.join(self.idir, "buildroot")
 
         if self.debug:
             self.log = sys.stdout
@@ -344,16 +345,15 @@ class Builder:
 
         # Clone Buildroot. This only happens if the source directory
         # didn't exist already.
-        srcdir = os.path.join(self.idir, "buildroot")
-        if not os.path.exists(srcdir):
-            ret = subprocess.call(["git", "clone", self.repo, srcdir],
+        if not os.path.exists(self.srcdir):
+            ret = subprocess.call(["git", "clone", self.repo, self.srcdir],
                                   stdout=self.log, stderr=self.log)
             if ret != 0:
                 log_write(self.log, "ERROR: could not clone Buildroot sources")
                 return -1
 
         # Update the Buildroot sources.
-        abssrcdir = os.path.abspath(srcdir)
+        abssrcdir = os.path.abspath(self.srcdir)
         ret = subprocess.call(["git", "fetch", "origin"], cwd=abssrcdir, stdout=self.log, stderr=self.log)
         if ret != 0:
             log_write(self.log, "ERROR: could not fetch Buildroot sources")
@@ -378,7 +378,6 @@ class Builder:
     def gen_config(self):
         """Generate a new random configuration."""
         outputdir = os.path.abspath(os.path.join(self.idir, "output"))
-        srcdir = os.path.join(self.idir, "buildroot")
 
         log_write(self.log, "INFO: generate the configuration")
 
@@ -387,13 +386,13 @@ class Builder:
         else:
             devnull = open(os.devnull, "w")
 
-        args = [os.path.join(srcdir, "utils/genrandconfig"),
-                "-o", outputdir, "-b", srcdir]
+        args = [os.path.join(self.srcdir, "utils/genrandconfig"),
+                "-o", outputdir, "-b", self.srcdir]
 
         toolchains_csv = self.toolchains_csv
         if toolchains_csv:
             if not os.path.isabs(toolchains_csv):
-                toolchains_csv = os.path.join(srcdir, toolchains_csv)
+                toolchains_csv = os.path.join(self.srcdir, toolchains_csv)
             args.extend(["--toolchains-csv", toolchains_csv])
 
         ret = subprocess.call(args, stdout=devnull, stderr=self.log)
@@ -425,7 +424,6 @@ class Builder:
         """
 
         outputdir = os.path.join(self.idir, "output")
-        srcdir = os.path.join(self.idir, "buildroot")
         reproducible_results = os.path.join(outputdir, "results", "reproducible_results")
         # Using only tar images for now
         build_1_image = os.path.join(outputdir, "images-1", "rootfs.tar")
@@ -434,7 +432,7 @@ class Builder:
         with open(reproducible_results, 'w') as diff:
             if self.sysinfo.has("diffoscope"):
                 # Prefix to point diffoscope towards cross-tools
-                prefix = subprocess.check_output(["make", "O=%s" % outputdir, "-C", srcdir, "printvars", "VARS=TARGET_CROSS"])
+                prefix = subprocess.check_output(["make", "O=%s" % outputdir, "-C", self.srcdir, "printvars", "VARS=TARGET_CROSS"])
                 # Remove TARGET_CROSS= and \n from the string
                 prefix = prefix[13:-1]
                 log_write(self.log, "INFO: running diffoscope on images")
@@ -461,13 +459,12 @@ class Builder:
         # script.
         dldir = os.path.abspath(os.path.join(self.idir, "dl"))
         outputdir = os.path.abspath(os.path.join(self.idir, "output"))
-        srcdir = os.path.join(self.idir, "buildroot")
         f = open(os.path.join(outputdir, "logfile"), "w+")
         log_write(self.log, "INFO: build started")
 
         cmd = ["nice", "-n", str(self.nice),
                "make", "O=%s" % outputdir,
-               "-C", srcdir, "BR2_DL_DIR=%s" % dldir,
+               "-C", self.srcdir, "BR2_DL_DIR=%s" % dldir,
                "BR2_JLEVEL=%s" % self.njobs] \
             + self.make_opts.split()
         sub = subprocess.Popen(cmd, stdout=f, stderr=f)
@@ -499,7 +496,7 @@ class Builder:
             log_write(self.log, "INFO: build failed [%d]" % ret)
             return -1
 
-        cmd = ["make", "O=%s" % outputdir, "-C", srcdir,
+        cmd = ["make", "O=%s" % outputdir, "-C", self.srcdir,
                "BR2_DL_DIR=%s" % dldir, "legal-info"] \
             + self.make_opts.split()
         ret = subprocess.call(cmd, stdout=f, stderr=f)
@@ -517,7 +514,6 @@ class Builder:
         """
 
         outputdir = os.path.abspath(os.path.join(self.idir, "output"))
-        srcdir = os.path.join(self.idir, "buildroot")
 
         # Start the first build
         log_write(self.log, "INFO: Reproducible Build Test, starting build 1")
@@ -531,7 +527,7 @@ class Builder:
 
         # Clean up build 1
         f = open(os.path.join(outputdir, "logfile"), "w+")
-        subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir, "clean"], stdout=f, stderr=f)
+        subprocess.call(["make", "O=%s" % outputdir, "-C", self.srcdir, "clean"], stdout=f, stderr=f)
 
         # Start the second build
         log_write(self.log, "INFO: Reproducible Build Test, starting build 2")
@@ -553,7 +549,6 @@ class Builder:
         """
 
         outputdir = os.path.abspath(os.path.join(self.idir, "output"))
-        srcdir = os.path.join(self.idir, "buildroot")
         resultdir = os.path.join(outputdir, "results")
 
         shutil.copyfile(os.path.join(outputdir, ".config"),
@@ -576,7 +571,7 @@ class Builder:
 
         subprocess.call(["git log -n 1 --pretty=format:%%H > %s" % \
                          os.path.join(resultdir, "gitid")],
-                        shell=True, cwd=srcdir)
+                        shell=True, cwd=self.srcdir)
 
         # Return True if the result should be rejected, False otherwise
         def reject_results():
-- 
2.22.0
