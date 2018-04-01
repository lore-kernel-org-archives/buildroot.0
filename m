From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 19:59:36 +0200
Subject: [Buildroot] [git commit] testing/infra/builder: split configure()
 from build()
Message-ID: <20180401175938.5720B83524@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=998300c5f55f61e928acfd352bc4cc24f36f8f7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some test cases don't use a full build as setup, so split the build()
method into configure() and build().
It allows a test case to perform configuration at the setup stage and
the build inside the test itself.

Call this new method just before build in the BRTest base class, to keep
the current behavior for existing test cases.

This change will be needed when adding a common class to test the git
download infra.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/infra/basetest.py | 1 +
 support/testing/infra/builder.py  | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index b85e8627fd..f3f13ad97f 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -58,6 +58,7 @@ class BRTest(unittest.TestCase):
 
         if not self.b.is_finished():
             self.show_msg("Building")
+            self.b.configure()
             self.b.build()
             self.show_msg("Building done")
 
diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
index 36f4801a2d..faf1eb1494 100644
--- a/support/testing/infra/builder.py
+++ b/support/testing/infra/builder.py
@@ -12,7 +12,7 @@ class Builder(object):
         self.builddir = builddir
         self.logfile = infra.open_log_file(builddir, "build", logtofile)
 
-    def build(self):
+    def configure(self):
         if not os.path.isdir(self.builddir):
             os.makedirs(self.builddir)
 
@@ -33,6 +33,8 @@ class Builder(object):
         if ret != 0:
             raise SystemError("Cannot olddefconfig")
 
+    def build(self):
+        env = {"PATH": os.environ["PATH"]}
         cmd = ["make", "-C", self.builddir]
         ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile,
                               env=env)
