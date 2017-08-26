From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 26 Aug 2017 19:20:51 -0300
Subject: [Buildroot] [next v2 2/7] testing/infra/builder: build with target
	and environment
In-Reply-To: <20170826222056.6119-1-ricardo.martincoski@gmail.com>
References: <20170826222056.6119-1-ricardo.martincoski@gmail.com>
Message-ID: <20170826222056.6119-2-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

Make the builder able to call 'VAR1=1 make VAR2=2 target'.

Allow to send extra parameters to be added to the end of make command
line. It can be used for these purposes:
 - to configure a br2-external, by passing 'BR2_EXTERNAL="dir"';
 - to specify a make target, such as 'foo-source'.

Allow to add variables to the environment in which make runs. It can be
used for these purposes:
 - to override values from environment, such as 'BR2_DL_DIR="dl"';
 - to set variables not set in the .mk files (for testing purpose), as
   FOO_VERSION='1/1', triggering the preprocessing of values.

This change will be needed when adding a common class to test the git
download infra.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
---
Changes v1 -> v2:
  - new patch to adapt the test infra to test git download
---
 support/testing/infra/builder.py | 37 +++++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
index e7c8e0102c..de7c141a76 100644
--- a/support/testing/infra/builder.py
+++ b/support/testing/infra/builder.py
@@ -10,7 +10,12 @@ class Builder(object):
         self.builddir = builddir
         self.logfile = infra.open_log_file(builddir, "build", logtofile)
 
-    def configure(self):
+    # Configure the build
+    #
+    # makecmdline: a list of arguments to be passed to the make command.
+    # e.g. makecmdline=["BR2_EXTERNAL=/path"]
+    #
+    def configure(self, makecmdline=None):
         if not os.path.isdir(self.builddir):
             os.makedirs(self.builddir)
 
@@ -22,16 +27,36 @@ class Builder(object):
                            "> end defconfig\n")
         self.logfile.flush()
 
-        cmd = ["make",
-               "O={}".format(self.builddir),
-               "olddefconfig"]
+        cmd = ["make", "O={}".format(self.builddir)]
+        if makecmdline:
+            cmd += makecmdline
+        cmd += ["olddefconfig"]
+
         ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile)
         if ret != 0:
             raise SystemError("Cannot olddefconfig")
 
-    def build(self):
+    # Perform the build
+    #
+    # makecmdline: a list of arguments to be passed to the make command. It can
+    # include a make target.
+    # e.g. makecmdline=["foo-source"]
+    #
+    # env: a dict of variables to be appended (or replaced) in the environment
+    # that calls make.
+    # e.g. env={"BR2_DL_DIR": "/path"}
+    #
+    def build(self, makecmdline=None, env=None):
+        buildenv = os.environ.copy()
+        if env:
+            buildenv.update(env)
+
         cmd = ["make", "-C", self.builddir]
-        ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile)
+        if makecmdline:
+            cmd += makecmdline
+
+        ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile,
+                              env=buildenv)
         if ret != 0:
             raise SystemError("Build failed")
 
-- 
2.13.0
