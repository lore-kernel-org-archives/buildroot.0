From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 26 Aug 2017 19:20:52 -0300
Subject: [Buildroot] [next v2 3/7] testing/infra/builder: allow to override
	logfile
In-Reply-To: <20170826222056.6119-1-ricardo.martincoski@gmail.com>
References: <20170826222056.6119-1-ricardo.martincoski@gmail.com>
Message-ID: <20170826222056.6119-3-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

Some test cases can use only the configure step as setup, while the
build is part of the test itself.
Allow the caller to build() to override the logfile used. This way all
the log for the actual test can be directed to *-run.log.

This change will be needed to make nice logs for git downloader test
cases.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
---
Changes v1 -> v2:
  - new patch to adapt the test infra to test git download
---
 support/testing/infra/builder.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
index de7c141a76..d634c211ac 100644
--- a/support/testing/infra/builder.py
+++ b/support/testing/infra/builder.py
@@ -46,7 +46,13 @@ class Builder(object):
     # that calls make.
     # e.g. env={"BR2_DL_DIR": "/path"}
     #
-    def build(self, makecmdline=None, env=None):
+    # ovrdlogfile: when the build is part of the actual test case instead of
+    # the setup, this parameter can be used to override the logfile used.
+    # e.g. ovrdlogfile=handler_for_the_run_log
+    #
+    def build(self, makecmdline=None, env=None, ovrdlogfile=None):
+        logfile = ovrdlogfile or self.logfile
+
         buildenv = os.environ.copy()
         if env:
             buildenv.update(env)
@@ -55,7 +61,7 @@ class Builder(object):
         if makecmdline:
             cmd += makecmdline
 
-        ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile,
+        ret = subprocess.call(cmd, stdout=logfile, stderr=logfile,
                               env=buildenv)
         if ret != 0:
             raise SystemError("Build failed")
-- 
2.13.0
