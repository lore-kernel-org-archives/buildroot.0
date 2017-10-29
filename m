From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 29 Oct 2017 12:06:01 -0200
Subject: [Buildroot] [PATCH v3 2/9] testing/infra/builder: split configure()
	from build()
In-Reply-To: <20171029140608.26200-1-ricardo.martincoski@datacom.ind.br>
References: <20171029140608.26200-1-ricardo.martincoski@datacom.ind.br>
Message-ID: <20171029140608.26200-3-ricardo.martincoski@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
Changes v2 -> v3:
  - renumber 1 -> 2;
  - rebased after new patch 1 "call make with empty env";
  - removed reviewed tag because the rebase over new patch 1 is not
    trivial (automatic);

Changes v1 -> v2:
  - new patch to adapt the test infra to test git download
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
-- 
2.14.2
