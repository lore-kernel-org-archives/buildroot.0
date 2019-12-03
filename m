From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  3 Dec 2019 17:54:50 +0100
Subject: [Buildroot] [PATCH buildroot-test] scripts/autobuild-run: add
 support for running parallel builds
Message-ID: <20191203165450.1100336-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_PER_PACKAGE_DIRECTORIES=y in the generated configuration, we
then use top-level parallel build on 50% of the builds. This will
allow to give some testing exposure to this new functionality.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 scripts/autobuild-run | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 7e3c7a0..5921edd 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -266,6 +266,7 @@ class Builder:
         self.upload = upload
         self.buildpid = buildpid
         self.debug = debug
+        self.build_parallel = False
 
         # frequently needed directories
         self.idir = "instance-%d" % self.instance
@@ -480,6 +481,13 @@ class Builder:
                "-C", self.srcdir, "BR2_DL_DIR=%s" % self.dldir,
                "BR2_JLEVEL=%s" % self.njobs] \
             + self.make_opts.split()
+
+        # when building in parallel, we use both -jX and BR2_JLEVEL=X,
+        # trusting the make job server to properly throttle the total
+        # number of processes.
+        if self.build_parallel:
+            cmd.append("-j%s" % self.njobs)
+
         sub = subprocess.Popen(cmd, stdout=f, stderr=f)
 
         # Setup hung build monitoring thread
@@ -741,7 +749,12 @@ class Builder:
 
             # Check if the build test is supposed to be a reproducible test
             with open(os.path.join(self.outputdir, ".config"), "r") as fconf:
-                reproducible = "BR2_REPRODUCIBLE=y\n" in fconf.read()
+                conf = fconf.read()
+                reproducible = "BR2_REPRODUCIBLE=y\n" in conf
+                per_package = "BR2_PER_PACKAGE_DIRECTORIES=y\n" in conf
+
+            self.build_parallel = per_package and randint(0, 1) == 0
+
             if reproducible:
                 ret = self.do_reproducible_build()
             else:
-- 
2.23.0
