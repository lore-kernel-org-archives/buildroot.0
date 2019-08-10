From: Atharva Lele <itsatharva@gmail.com>
Date: Sat, 10 Aug 2019 09:28:58 +0530
Subject: [Buildroot] [PATCH v2 1/5] autobuild-run: use different output
 directories for reproducible builds testing
Message-ID: <20190810035902.14047-1-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Having different output directories increases variation in the build.

This commit also changes the directory name of the single output directory to
"output-1", as having varied length names for output directories introduces a
lot of reproducibility issues.

Official Debian efforts also currently use same length names for different
directories: "/build/1st/$pkg-$ver" and "/build/$pkg-$ver/2nd"
Cfr: https://tests.reproducible-builds.org/debian/index_variations.html

Reproducible-Builds has proposed a spec called BUILD_PATH_PREFIX_MAP to help
with this. However, that is still in the works and not fully solved yet.
(As told on the #reproducible-builds IRC).

So I think until further work is done on BUILD_PATH_PREFIX_MAP, we will have
to stay with output directories of same length.

See: https://wiki.debian.org/ReproducibleBuilds/GCC-build-path and
https://reproducible-builds.org/specs/build-path-prefix-map/

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
Changes v1 -> v2:
  - Added more details in commit log (suggested by Thomas)
---
 scripts/autobuild-run | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index f208a56..21eb47a 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -275,7 +275,10 @@ class Builder:
         # path to the output directory here is not relative to the
         # Buildroot sources, but to the location of the autobuilder
         # script.
-        self.outputdir = os.path.abspath(os.path.join(self.idir, "output"))
+        self.outputdir = os.path.abspath(os.path.join(self.idir, "output-1"))
+        # We use a different output directory for more variance in reproducibility
+        # testing.
+        self.outputdir_2 = os.path.abspath(os.path.join(self.idir, "output-2"))
         self.resultdir = os.path.join(self.outputdir, "results")
 
         # If it doesn't exist, create the instance directory
@@ -434,8 +437,8 @@ class Builder:
 
         reproducible_results = os.path.join(self.outputdir, "results", "reproducible_results")
         # Using only tar images for now
-        build_1_image = os.path.join(self.outputdir, "images-1", "rootfs.tar")
-        build_2_image = os.path.join(self.outputdir, "images", "rootfs.tar")
+        build_1_image = os.path.join(self.outputdir, "images", "rootfs.tar")
+        build_2_image = os.path.join(self.outputdir_2, "images", "rootfs.tar")
 
         with open(reproducible_results, 'w') as diff:
             if self.sysinfo.has("diffoscope"):
@@ -523,16 +526,17 @@ class Builder:
             log_write(self.log, "INFO: build 1 failed, skipping build 2")
             return ret
 
-        # First build has been built, move files and start build 2
-        os.rename(os.path.join(self.outputdir, "images"), os.path.join(self.outputdir, "images-1"))
+        # Create the second output directory if it does not exist
+        if not os.path.exists(self.outputdir_2):
+            os.mkdir(self.outputdir_2)
 
-        # Clean up build 1
-        f = open(os.path.join(self.outputdir, "logfile"), "w+")
-        subprocess.call(["make", "O=%s" % self.outputdir, "-C", self.srcdir, "clean"], stdout=f, stderr=f)
+        # Copy .config to the other output directory
+        shutil.copyfile(os.path.join(self.outputdir, ".config"),
+                        os.path.join(self.outputdir_2, ".config"))
 
         # Start the second build
         log_write(self.log, "INFO: Reproducible Build Test, starting build 2")
-        ret = self.do_build(self.outputdir)
+        ret = self.do_build(self.outputdir_2)
         if ret != 0:
             log_write(self.log, "INFO: build 2 failed")
             return ret
-- 
2.22.0
