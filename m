From: Atharva Lele <itsatharva@gmail.com>
Date: Sun,  7 Jul 2019 10:58:16 +0530
Subject: [Buildroot] [PATCH v3 16/31] autobuild-run: remove kwargs argument
 from function calls and definitions
In-Reply-To: <20190707052831.9469-1-itsatharva@gmail.com>
References: <20190707052831.9469-1-itsatharva@gmail.com>
Message-ID: <20190707052831.9469-16-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 scripts/autobuild-run | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index cb00745..adc8795 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -298,7 +298,7 @@ class Builder:
         else:
             self.log = open(os.path.join(self.idir, "instance.log"), "a+")
 
-    def prepare_build(self, **kwargs):
+    def prepare_build(self):
         """Prepare for the next build of the specified instance
 
         This function prepares the build by making sure all the needed
@@ -375,7 +375,7 @@ class Builder:
 
         return 0
 
-    def gen_config(self, **kwargs):
+    def gen_config(self):
         """Generate a new random configuration."""
         outputdir = os.path.abspath(os.path.join(self.idir, "output"))
         srcdir = os.path.join(self.idir, "buildroot")
@@ -417,7 +417,7 @@ class Builder:
                     break
             monitor_thread_stop_flag.wait(30)
 
-    def check_reproducibility(self, **kwargs):
+    def check_reproducibility(self):
         """Check reproducibility of builds
 
         Use diffoscope on the built images, if diffoscope is not
@@ -452,7 +452,7 @@ class Builder:
         log_write(self.log, "INFO: Build is reproducible!")
         return 0
 
-    def do_build(self, **kwargs):
+    def do_build(self):
         """Run the build itself"""
 
         # We need the absolute path to use with O=, because the relative
@@ -509,7 +509,7 @@ class Builder:
         log_write(self.log, "INFO: build successful")
         return 0
 
-    def do_reproducible_build(self, **kwargs):
+    def do_reproducible_build(self):
         """Run the builds for reproducibility testing
 
         Build twice with the same configuration. Calls do_build() to
@@ -521,7 +521,7 @@ class Builder:
 
         # Start the first build
         log_write(self.log, "INFO: Reproducible Build Test, starting build 1")
-        ret = self.do_build(**kwargs)
+        ret = self.do_build()
         if ret != 0:
             log_write(self.log, "INFO: build 1 failed, skipping build 2")
             return ret
@@ -535,16 +535,16 @@ class Builder:
 
         # Start the second build
         log_write(self.log, "INFO: Reproducible Build Test, starting build 2")
-        ret = self.do_build(**kwargs)
+        ret = self.do_build()
         if ret != 0:
             log_write(self.log, "INFO: build 2 failed")
             return ret
 
         # Assuming both have built successfully
-        ret = self.check_reproducibility(**kwargs)
+        ret = self.check_reproducibility()
         return ret
 
-    def send_results(self, result, **kwargs):
+    def send_results(self, result):
         """Prepare and store/send tarball with results
 
         This function prepares the tarball with the results, and either
@@ -705,7 +705,7 @@ class Builder:
             os.rename(os.path.join(outputdir, "results.tar.bz2"), resultfilename)
             log_write(self.log, "INFO: results saved as %s" % resultfilename)
 
-    def run_instance(self, **kwargs):
+    def run_instance(self):
         """Main per-instance loop
 
         Prepare the build, generate a configuration, run the build, and submit the
@@ -721,14 +721,14 @@ class Builder:
         while True:
             check_version()
 
-            ret = self.prepare_build(**kwargs)
+            ret = self.prepare_build()
             if ret != 0:
                 continue
 
             resultdir = os.path.join(self.idir, "output", "results")
             os.mkdir(resultdir)
 
-            ret = self.gen_config(**kwargs)
+            ret = self.gen_config()
             if ret != 0:
                 log_write(self.log, "WARN: failed to generate configuration")
                 continue
@@ -738,11 +738,11 @@ class Builder:
             with open(os.path.join(outputdir, ".config"), "r") as fconf:
                 reproducible = "BR2_REPRODUCIBLE=y\n" in fconf.read()
             if reproducible:
-                ret = self.do_reproducible_build(**kwargs)
+                ret = self.do_reproducible_build()
             else:
-                ret = self.do_build(**kwargs)
+                ret = self.do_build()
 
-            self.send_results(ret, **kwargs)
+            self.send_results(ret)
 
 # args / config file merging inspired by:
 # https://github.com/docopt/docopt/blob/master/examples/config_file_example.py
-- 
2.22.0
