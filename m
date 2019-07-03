From: Atharva Lele <itsatharva@gmail.com>
Date: Thu,  4 Jul 2019 00:01:46 +0530
Subject: [Buildroot] [PATCH v2 14/27] autobuild-run: define instance
 directory as a part of Builder class
In-Reply-To: <20190703183159.3415-1-itsatharva@gmail.com>
References: <20190703183159.3415-1-itsatharva@gmail.com>
Message-ID: <20190703183159.3415-14-itsatharva@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need idir as a class member before moving log out of kwargs.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 scripts/autobuild-run | 49 +++++++++++++++++++------------------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 923652c..d1ecbb3 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -290,6 +290,9 @@ class Builder:
         self.buildpid = buildpid
         self.debug = debug
 
+        # frequently needed directories
+        self.idir = "instance-%d" % self.instance
+
     def prepare_build(self, **kwargs):
         """Prepare for the next build of the specified instance
 
@@ -298,13 +301,12 @@ class Builder:
         code, and cleaning up remaining stuff from previous builds.
         """
 
-        idir = "instance-%d" % self.instance
         log = kwargs['log']
 
         log_write(log, "INFO: preparing a new build")
 
         # Create the download directory if it doesn't exist
-        dldir = os.path.join(idir, "dl")
+        dldir = os.path.join(self.idir, "dl")
         if not os.path.exists(dldir):
             os.mkdir(dldir)
 
@@ -339,7 +341,7 @@ class Builder:
 
         # Clone Buildroot. This only happens if the source directory
         # didn't exist already.
-        srcdir = os.path.join(idir, "buildroot")
+        srcdir = os.path.join(self.idir, "buildroot")
         if not os.path.exists(srcdir):
             ret = subprocess.call(["git", "clone", self.repo, srcdir],
                                   stdout=log, stderr=log)
@@ -360,7 +362,7 @@ class Builder:
             return -1
 
         # Create an empty output directory. We remove it first, in case a previous build was aborted.
-        outputdir = os.path.join(idir, "output")
+        outputdir = os.path.join(self.idir, "output")
         if os.path.exists(outputdir):
             # shutil.rmtree doesn't remove write-protected files
             subprocess.call(["rm", "-rf", outputdir])
@@ -372,10 +374,9 @@ class Builder:
 
     def gen_config(self, **kwargs):
         """Generate a new random configuration."""
-        idir = "instance-%d" % self.instance
         log = kwargs['log']
-        outputdir = os.path.abspath(os.path.join(idir, "output"))
-        srcdir = os.path.join(idir, "buildroot")
+        outputdir = os.path.abspath(os.path.join(self.idir, "output"))
+        srcdir = os.path.join(self.idir, "buildroot")
 
         log_write(log, "INFO: generate the configuration")
 
@@ -422,9 +423,8 @@ class Builder:
         """
 
         log = kwargs['log']
-        idir = "instance-%d" % self.instance
-        outputdir = os.path.join(idir, "output")
-        srcdir = os.path.join(idir, "buildroot")
+        outputdir = os.path.join(self.idir, "output")
+        srcdir = os.path.join(self.idir, "buildroot")
         reproducible_results = os.path.join(outputdir, "results", "reproducible_results")
         # Using only tar images for now
         build_1_image = os.path.join(outputdir, "images-1", "rootfs.tar")
@@ -454,16 +454,15 @@ class Builder:
     def do_build(self, **kwargs):
         """Run the build itself"""
 
-        idir = "instance-%d" % self.instance
         log = kwargs['log']
 
         # We need the absolute path to use with O=, because the relative
         # path to the output directory here is not relative to the
         # Buildroot sources, but to the location of the autobuilder
         # script.
-        dldir = os.path.abspath(os.path.join(idir, "dl"))
-        outputdir = os.path.abspath(os.path.join(idir, "output"))
-        srcdir = os.path.join(idir, "buildroot")
+        dldir = os.path.abspath(os.path.join(self.idir, "dl"))
+        outputdir = os.path.abspath(os.path.join(self.idir, "output"))
+        srcdir = os.path.join(self.idir, "buildroot")
         f = open(os.path.join(outputdir, "logfile"), "w+")
         log_write(log, "INFO: build started")
 
@@ -518,9 +517,8 @@ class Builder:
         perform the actual build.
         """
 
-        idir = "instance-%d" % self.instance
-        outputdir = os.path.abspath(os.path.join(idir, "output"))
-        srcdir = os.path.join(idir, "buildroot")
+        outputdir = os.path.abspath(os.path.join(self.idir, "output"))
+        srcdir = os.path.join(self.idir, "buildroot")
         log = kwargs['log']
 
         # Start the first build
@@ -556,11 +554,10 @@ class Builder:
         are available) or stores them locally as tarballs.
         """
 
-        idir = "instance-%d" % self.instance
         log = kwargs['log']
 
-        outputdir = os.path.abspath(os.path.join(idir, "output"))
-        srcdir = os.path.join(idir, "buildroot")
+        outputdir = os.path.abspath(os.path.join(self.idir, "output"))
+        srcdir = os.path.join(self.idir, "buildroot")
         resultdir = os.path.join(outputdir, "results")
 
         shutil.copyfile(os.path.join(outputdir, ".config"),
@@ -719,16 +716,14 @@ class Builder:
         results.
         """
 
-        idir = "instance-%d" % self.instance
-
         # If it doesn't exist, create the instance directory
-        if not os.path.exists(idir):
-            os.mkdir(idir)
+        if not os.path.exists(self.idir):
+            os.mkdir(self.idir)
 
         if self.debug:
             kwargs['log'] = sys.stdout
         else:
-            kwargs['log'] = open(os.path.join(idir, "instance.log"), "a+")
+            kwargs['log'] = open(os.path.join(self.idir, "instance.log"), "a+")
         log_write(kwargs['log'], "INFO: instance started")
 
         while True:
@@ -738,7 +733,7 @@ class Builder:
             if ret != 0:
                 continue
 
-            resultdir = os.path.join(idir, "output", "results")
+            resultdir = os.path.join(self.idir, "output", "results")
             os.mkdir(resultdir)
 
             ret = self.gen_config(**kwargs)
@@ -747,7 +742,7 @@ class Builder:
                 continue
 
             # Check if the build test is supposed to be a reproducible test
-            outputdir = os.path.abspath(os.path.join(idir, "output"))
+            outputdir = os.path.abspath(os.path.join(self.idir, "output"))
             with open(os.path.join(outputdir, ".config"), "r") as fconf:
                 reproducible = "BR2_REPRODUCIBLE=y\n" in fconf.read()
             if reproducible:
-- 
2.22.0
