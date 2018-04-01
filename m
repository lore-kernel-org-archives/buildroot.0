From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 19:59:36 +0200
Subject: [Buildroot] [git commit] testing/infra/builder: call make with
 empty env
Message-ID: <20180401175938.3EA4E83524@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b19cb8143b0c1337d370010550532c4fc23124d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use an empty environment when calling make, but import PATH so the
buildroot tree under test can find binaries from the host machine.

Since environment variables are now ignored, move the handling of
BR2_DL_DIR to the defconfig to keep the current precedence of -d:

    BR2_DL_DIR  | -d DIR   | test downloads   | BR downloads
    ------------+----------+------------------+--------------
    unset       | unset    | [error]          | [error]
    unset       | set      | in $(DIR)        | in $(DIR)
    set         | unset    | in $(BR2_DL_DIR) | in $(BR2_DL_DIR)
    set         | set      | in $(DIR)        | in $(DIR)

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/infra/basetest.py | 1 +
 support/testing/infra/builder.py  | 7 +++++--
 support/testing/run-tests         | 1 -
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 754922692c..b85e8627fd 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -42,6 +42,7 @@ class BRTest(unittest.TestCase):
         self.testname = self.__class__.__name__
         self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
         self.emulator = None
+        self.config += '\nBR2_DL_DIR="{}"\n'.format(self.downloaddir)
         self.config += "\nBR2_JLEVEL={}\n".format(self.jlevel)
 
     def show_msg(self, msg):
diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
index 7512339ae1..36f4801a2d 100644
--- a/support/testing/infra/builder.py
+++ b/support/testing/infra/builder.py
@@ -24,15 +24,18 @@ class Builder(object):
                            "> end defconfig\n")
         self.logfile.flush()
 
+        env = {"PATH": os.environ["PATH"]}
         cmd = ["make",
                "O={}".format(self.builddir),
                "olddefconfig"]
-        ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile)
+        ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile,
+                              env=env)
         if ret != 0:
             raise SystemError("Cannot olddefconfig")
 
         cmd = ["make", "-C", self.builddir]
-        ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile)
+        ret = subprocess.call(cmd, stdout=self.logfile, stderr=self.logfile,
+                              env=env)
         if ret != 0:
             raise SystemError("Build failed")
 
diff --git a/support/testing/run-tests b/support/testing/run-tests
index f8cee09ed1..270e78cff7 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -58,7 +58,6 @@ def main():
             return 1
 
     BRTest.downloaddir = os.path.abspath(args.download)
-    os.putenv("BR2_DL_DIR", BRTest.downloaddir)
 
     if args.output is None:
         print "Missing output directory, please use -o/--output"
