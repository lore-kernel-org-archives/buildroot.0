From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 10:40:15 +0100
Subject: [Buildroot] [git commit] testing/infra: Add BRConfigTest as
 superclass of BRTest
Message-ID: <20190206093859.903D883F76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0461ef4dea3d39a53894bf68697c266db2d33f5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The git tests don't need to do a full build, they only need to do a
configure and download and/or legal-info. More tests of that type will
be added in the future. Therefore, we want to have a test base class
that doesn't automatically do a full build in the setUp().

Add this new class as a superclass of the existing BRTest class, so we
don't need to update existing tests. Only the code in run-tests that
iterates over all subclasses of BRTest has to be adapted to use
BRConfigTest instead.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/infra/basetest.py | 26 +++++++++++++++++++-------
 support/testing/run-tests         | 16 ++++++++--------
 2 files changed, 27 insertions(+), 15 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index e67bf1af23..a176bc328a 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -28,7 +28,7 @@ MINIMAL_CONFIG = \
     """
 
 
-class BRTest(unittest.TestCase):
+class BRConfigTest(unittest.TestCase):
     config = None
     br2_external = list()
     downloaddir = None
@@ -39,10 +39,9 @@ class BRTest(unittest.TestCase):
     timeout_multiplier = 1
 
     def __init__(self, names):
-        super(BRTest, self).__init__(names)
+        super(BRConfigTest, self).__init__(names)
         self.testname = self.__class__.__name__
         self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
-        self.emulator = None
         self.config += '\nBR2_DL_DIR="{}"\n'.format(self.downloaddir)
         self.config += "\nBR2_JLEVEL={}\n".format(self.jlevel)
 
@@ -58,8 +57,23 @@ class BRTest(unittest.TestCase):
             self.b.delete()
 
         if not self.b.is_finished():
-            self.show_msg("Building")
             self.b.configure(make_extra_opts=["BR2_EXTERNAL={}".format(":".join(self.br2_external))])
+
+    def tearDown(self):
+        self.show_msg("Cleaning up")
+        if self.b and not self.keepbuilds:
+            self.b.delete()
+
+
+class BRTest(BRConfigTest):
+    def __init__(self, names):
+        super(BRTest, self).__init__(names)
+        self.emulator = None
+
+    def setUp(self):
+        super(BRTest, self).setUp()
+        if not self.b.is_finished():
+            self.show_msg("Building")
             self.b.build()
             self.show_msg("Building done")
 
@@ -67,8 +81,6 @@ class BRTest(unittest.TestCase):
                                  self.logtofile, self.timeout_multiplier)
 
     def tearDown(self):
-        self.show_msg("Cleaning up")
         if self.emulator:
             self.emulator.stop()
-        if self.b and not self.keepbuilds:
-            self.b.delete()
+        super(BRTest, self).tearDown()
diff --git a/support/testing/run-tests b/support/testing/run-tests
index 76dd15e9f0..813b927045 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -5,7 +5,7 @@ import os
 import nose2
 import multiprocessing
 
-from infra.basetest import BRTest
+from infra.basetest import BRConfigTest
 
 
 def main():
@@ -38,7 +38,7 @@ def main():
     test_dir = os.path.dirname(script_path)
 
     if args.stdout:
-        BRTest.logtofile = False
+        BRConfigTest.logtofile = False
 
     if args.list:
         print("List of tests")
@@ -57,7 +57,7 @@ def main():
             parser.print_help()
             return 1
 
-    BRTest.downloaddir = os.path.abspath(args.download)
+    BRConfigTest.downloaddir = os.path.abspath(args.download)
 
     if args.output is None:
         print("Missing output directory, please use -o/--output")
@@ -68,7 +68,7 @@ def main():
     if not os.path.exists(args.output):
         os.mkdir(args.output)
 
-    BRTest.outputdir = os.path.abspath(args.output)
+    BRConfigTest.outputdir = os.path.abspath(args.output)
 
     if args.all is False and len(args.testname) == 0:
         print("No test selected")
@@ -76,7 +76,7 @@ def main():
         parser.print_help()
         return 1
 
-    BRTest.keepbuilds = args.keep
+    BRConfigTest.keepbuilds = args.keep
 
     if args.testcases != 1:
         if args.testcases < 1:
@@ -89,7 +89,7 @@ def main():
         each_testcase = br2_jlevel / args.testcases
         if each_testcase < 1:
             each_testcase = 1
-        BRTest.jlevel = each_testcase
+        BRConfigTest.jlevel = each_testcase
 
     if args.jlevel:
         if args.jlevel < 0:
@@ -98,14 +98,14 @@ def main():
             parser.print_help()
             return 1
         # the user can override the auto calculated value
-        BRTest.jlevel = args.jlevel
+        BRConfigTest.jlevel = args.jlevel
 
     if args.timeout_multiplier < 1:
         print("Invalid multiplier for timeout values")
         print("")
         parser.print_help()
         return 1
-    BRTest.timeout_multiplier = args.timeout_multiplier
+    BRConfigTest.timeout_multiplier = args.timeout_multiplier
 
     nose2_args = ["-v",
                   "-N", str(args.testcases),
