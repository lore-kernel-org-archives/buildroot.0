From: Atharva Lele <itsatharva@gmail.com>
Date: Fri,  7 Jun 2019 12:16:55 +0530
Subject: [Buildroot] [PATCH v2 1/3] autobuild-run: initial implementation of
 check_reproducibility()
Message-ID: <20190607064657.3571-1-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Find out differences in built images, if any

Add diffoscope to list of optional programs

Signed-off-by: Atharva Lele <itsatharva@gmail.com>

---
Changes v1 -> v2:
  - move diffoscope output to results dir (suggested by arnout)
  - fix make printvars call
  - Add diffoscope to DEFAULT_OPTIONAL_PROGS

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
---
 scripts/autobuild-run | 41 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index ef2f2a5..5d76583 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -204,7 +204,7 @@ def get_branch():
 
 class SystemInfo:
     DEFAULT_NEEDED_PROGS = ["make", "git", "gcc"]
-    DEFAULT_OPTIONAL_PROGS = ["bzr", "java", "javac", "jar"]
+    DEFAULT_OPTIONAL_PROGS = ["bzr", "diffoscope", "java", "javac", "jar"]
 
     def __init__(self):
         self.needed_progs = list(self.__class__.DEFAULT_NEEDED_PROGS)
@@ -394,6 +394,45 @@ def stop_on_build_hang(monitor_thread_hung_build_flag,
                 break
         monitor_thread_stop_flag.wait(30)
 
+def check_reproducibility(**kwargs):
+    """Check reproducibility of builds
+
+    Use diffoscope on the built images, if diffoscope is not
+    installed, fallback to cmp
+    """
+
+    log = kwargs['log']
+    idir = "instance-%d" % kwargs['instance']
+    outputdir = os.path.join(idir, "output")
+    srcdir = os.path.join(idir, "buildroot")
+    diffoscope_output = os.path.join(outputdir, "results", "diffoscope-results.txt")
+    # Using only tar images for now
+    build_1_image = os.path.join(outputdir, "images-1", "rootfs.tar")
+    build_2_image = os.path.join(outputdir, "images", "rootfs.tar")
+
+    # Prefix to point diffoscope towards cross-tools
+    prefix = subprocess.check_output(["make", "O=%s" % outputdir, "-C", srcdir, "printvars", "VARS=TARGET_CROSS"])
+    # Remove TARGET_CROSS= and \n from the string
+    prefix = prefix[13:-1]
+
+    if kwargs['sysinfo'].has("diffoscope"):
+        log_write(log, "INFO: running diffoscope on images")
+        ret = subprocess.call(["diffoscope", build_1_image, build_2_image,
+                            "--tool-prefix-binutils", prefix,
+                            "--text", diffoscope_output])
+    else:
+        if e.errno == errno.ENOENT:
+            log_write(log, "INFO: diffoscope not installed, falling back to cmp")
+        ret = subprocess.call(["cmp", "build_1_image", "build_2_image", "-b", ">", diffoscope_output])
+    
+    if ret != 0:
+        log_write(log, "INFO: Build is non-reproducible.")
+        return -1
+    
+    # rootfs images match byte-for-byte -> reproducible image
+    log_write(log, "INFO: Build is reproducible!")
+    return 0
+
 def do_build(**kwargs):
     """Run the build itself"""
 
-- 
2.20.1
