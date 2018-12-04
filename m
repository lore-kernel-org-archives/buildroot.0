From: Matt Weber <Matthew.Weber@collins.com>
Date: Mon,  3 Dec 2018 22:08:46 -0600
Subject: [Buildroot] [PATCH v5 3/7] testing/infra/builder: build with target
 and environment
In-Reply-To: <1543896530-33550-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1543896530-33550-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1543896530-33550-3-git-send-email-matthew.weber@rockwellcollins.com>
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
used to override values from environment, such as 'BR2_DL_DIR="dl"'.

This change will be needed when adding support for br2-externals to the
test infra.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Changes
v2
 - New from: http://patchwork.ozlabs.org/patch/912351/

v2 -> v3
[Ricardo
 - Updated patch commit description context.

v4
 - None

v5
 - Rebased post 2018.11 on master
---
 support/testing/infra/builder.py | 38 ++++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
index fc318fe..4d9c512 100644
--- a/support/testing/infra/builder.py
+++ b/support/testing/infra/builder.py
@@ -12,7 +12,18 @@ class Builder(object):
         self.builddir = builddir
         self.logfile = infra.open_log_file(builddir, "build", logtofile)
 
-    def configure(self):
+    def configure(self, make_extra_opts=[], make_extra_env={}):
+        """
+        Configure the build.
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
 
@@ -25,22 +36,41 @@ class Builder(object):
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
+        """
+        Perform the build.
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
1.9.1
