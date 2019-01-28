From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 28 Jan 2019 18:22:05 -0500
Subject: [Buildroot] [PATCH v3 1/5] testing/infra/builder: build with target
 and environment
In-Reply-To: <20190128232209.17485-1-aduskett@gmail.com>
References: <20190128232209.17485-1-aduskett@gmail.com>
Message-ID: <20190128232209.17485-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

Make the builder able to call 'VAR1=1 make VAR2=2 target'.

Allow sending extra parameters to be added to the end of make command
line. Uses for these purposes:
 - to configure a br2-external, using the 'BR2_EXTERNAL="dir" variable.
 - to specify a make target, such as 'foo-source.'

Allow adding variables to the environment when calling make.
These added variables allow a user to override default values from BuildRoot,
such as 'BR2_DL_DIR="dl"'.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Daniel J. Leach <dleach@belcan.com>
Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v3:
  - Added this patch to the series.

 support/testing/infra/builder.py | 36 ++++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
index fc318fe26e..018747555d 100644
--- a/support/testing/infra/builder.py
+++ b/support/testing/infra/builder.py
@@ -12,7 +12,17 @@ class Builder(object):
         self.builddir = builddir
         self.logfile = infra.open_log_file(builddir, "build", logtofile)
 
-    def configure(self):
+    def configure(self, make_extra_opts=[], make_extra_env={}):
+        """Configure the build.
+
+        make_extra_opts: a list of arguments to be passed to the make
+        command.
+        e.g. make_extra_opts=["BR2_EXTERNAL=/path"]
+
+        make_extra_env: a dict of variables to be appended (or replaced)
+        in the environment that calls make.
+        e.g. make_extra_env={"BR2_DL_DIR": "/path"}
+        """
         if not os.path.isdir(self.builddir):
             os.makedirs(self.builddir)
 
@@ -25,22 +35,40 @@ class Builder(object):
         self.logfile.flush()
 
         env = {"PATH": os.environ["PATH"]}
+        env.update(make_extra_env)
+
         cmd = ["make",
-               "O={}".format(self.builddir),
-               "olddefconfig"]
+               "O={}".format(self.builddir)]
+        cmd += make_extra_opts
+        cmd += ["olddefconfig"]
+
         ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile,
                               env=env)
         if ret != 0:
             raise SystemError("Cannot olddefconfig")
 
-    def build(self):
+    def build(self, make_extra_opts=[], make_extra_env={}):
+        """Perform the build.
+
+        make_extra_opts: a list of arguments to be passed to the make
+        command. It can include a make target.
+        e.g. make_extra_opts=["foo-source"]
+
+        make_extra_env: a dict of variables to be appended (or replaced)
+        in the environment that calls make.
+        e.g. make_extra_env={"BR2_DL_DIR": "/path"}
+        """
         env = {"PATH": os.environ["PATH"]}
         if "http_proxy" in os.environ:
             self.logfile.write("Using system proxy: " +
                                os.environ["http_proxy"] + "\n")
             env['http_proxy'] = os.environ["http_proxy"]
             env['https_proxy'] = os.environ["http_proxy"]
+        env.update(make_extra_env)
+
         cmd = ["make", "-C", self.builddir]
+        cmd += make_extra_opts
+
         ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile,
                               env=env)
         if ret != 0:
-- 
2.20.1
