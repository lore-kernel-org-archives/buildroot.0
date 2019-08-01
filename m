From: Atharva Lele <itsatharva@gmail.com>
Date: Thu,  1 Aug 2019 08:16:42 +0530
Subject: [Buildroot] [PATCH v4 29/30] autobuild-run: use different output
 directories for reproducible builds testing
In-Reply-To: <20190801024643.11024-1-itsatharva@gmail.com>
References: <20190801024643.11024-1-itsatharva@gmail.com>
Message-ID: <20190801024643.11024-30-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
Changes v3:
  - New patch
---
 scripts/autobuild-run | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index a96840f..b32cd5b 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -434,8 +434,8 @@ class Builder:
 
         reproducible_results = os.path.join(self.outputdir, "results", "reproducible_results")
         # Using only tar images for now
-        build_1_image = os.path.join(self.outputdir, "images-1", "rootfs.tar")
-        build_2_image = os.path.join(self.outputdir, "images", "rootfs.tar")
+        build_1_image = os.path.join(self.outputdir, "images", "rootfs.tar")
+        build_2_image = os.path.join(self.outputdir_1, "images", "rootfs.tar")
 
         with open(reproducible_results, 'w') as diff:
             if self.sysinfo.has("diffoscope"):
@@ -522,16 +522,17 @@ class Builder:
             log_write(self.log, "INFO: build 1 failed, skipping build 2")
             return ret
 
-        # First build has been built, move files and start build 2
-        os.rename(os.path.join(self.outputdir, "images"), os.path.join(self.outputdir, "images-1"))
+        # Create the second output directory if it does not exist
+        if not os.path.exists(self.outputdir_1):
+            os.mkdir(self.outputdir_1)
 
-        # Clean up build 1
-        f = open(os.path.join(self.outputdir, "logfile"), "w+")
-        subprocess.call(["make", "O=%s" % self.outputdir, "-C", self.srcdir, "clean"], stdout=f, stderr=f)
+        # Copy .config to the other output directory
+        shutil.copyfile(os.path.join(self.outputdir, ".config"),
+                        os.path.join(self.outputdir_1, ".config"))
 
         # Start the second build
         log_write(self.log, "INFO: Reproducible Build Test, starting build 2")
-        ret = self.do_build(self.outputdir)
+        ret = self.do_build(self.outputdir_1)
         if ret != 0:
             log_write(self.log, "INFO: build 2 failed")
             return ret
-- 
2.22.0
