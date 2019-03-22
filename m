From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 22 Mar 2019 10:58:17 +0100
Subject: [Buildroot] [PATCH v3 3/4] support/testing: test can use the
 locally generated qemu host tool
In-Reply-To: <20190322095818.19914-1-etienne.carriere@linaro.org>
References: <20190322095818.19914-1-etienne.carriere@linaro.org>
Message-ID: <20190322095818.19914-3-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change adds argument --local-emulator to run-tests to use a
locally built emulator for the runtime test. Target test shall provide
a config_emulator attribute unless what test is inconsistent.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v2 -> v3:
  - Add an argument to run-tests to use locally built emulator.
    Test can still enforce use of locally built emulator from
    boot method argument local=True|False (still defaults to False).

Changes v1 -> v2:
  - No commit not in v1 series.
---
 support/testing/infra/basetest.py |  5 ++++-
 support/testing/infra/emulator.py | 19 ++++++++++++++++---
 support/testing/run-tests         |  4 ++++
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index a176bc328a..c59e0a3443 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -51,6 +51,8 @@ class BRConfigTest(unittest.TestCase):
 
     def setUp(self):
         self.show_msg("Starting")
+        if self.local_emulator:
+            self.config = self.config + self.config_emulator
         self.b = Builder(self.config, self.builddir, self.logtofile)
 
         if not self.keepbuilds:
@@ -78,7 +80,8 @@ class BRTest(BRConfigTest):
             self.show_msg("Building done")
 
         self.emulator = Emulator(self.builddir, self.downloaddir,
-                                 self.logtofile, self.timeout_multiplier)
+                                 self.logtofile, self.timeout_multiplier,
+                                 self.local_emulator)
 
     def tearDown(self):
         if self.emulator:
diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 802e89d4b4..13e19df497 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -1,14 +1,19 @@
 import pexpect
 
+import os
+
 import infra
 
 
 class Emulator(object):
 
-    def __init__(self, builddir, downloaddir, logtofile, timeout_multiplier):
+    def __init__(self, builddir, downloaddir, logtofile, timeout_multiplier,
+                 local_emulator):
         self.qemu = None
         self.downloaddir = downloaddir
         self.logfile = infra.open_log_file(builddir, "run", logtofile)
+        self.builddir = builddir
+        self.local_emulator = local_emulator
         # We use elastic runners on the cloud to runs our tests. Those runners
         # can take a long time to run the emulator. Use a timeout multiplier
         # when running the tests to avoid sporadic failures.
@@ -30,13 +35,21 @@ class Emulator(object):
     #
     # options: array of command line options to pass to Qemu
     #
-    def boot(self, arch, kernel=None, kernel_cmdline=None, options=None):
+    # local: if True, the locally built qemu host tool is used instead of a
+    # qemu host tool found from the PATH.
+    #
+    def boot(self, arch, kernel=None, kernel_cmdline=None, options=None,
+             local=None):
         if arch in ["armv7", "armv5"]:
             qemu_arch = "arm"
         else:
             qemu_arch = arch
 
-        qemu_cmd = ["qemu-system-{}".format(qemu_arch),
+        qemu_bin = "qemu-system-{}".format(qemu_arch)
+        if self.local_emulator or local:
+            qemu_bin = os.path.join(self.builddir, 'host', 'bin', qemu_bin)
+
+        qemu_cmd = [qemu_bin,
                     "-serial", "stdio",
                     "-display", "none"]
 
diff --git a/support/testing/run-tests b/support/testing/run-tests
index 813b927045..c667fc2e4f 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -31,6 +31,8 @@ def main():
                         help='BR2_JLEVEL to use for each testcase')
     parser.add_argument('--timeout-multiplier', type=int, default=1,
                         help='increase timeouts (useful for slow machines)')
+    parser.add_argument('--local-emulator', action='store_true',
+                        help='use a locally built emulator')
 
     args = parser.parse_args()
 
@@ -107,6 +109,8 @@ def main():
         return 1
     BRConfigTest.timeout_multiplier = args.timeout_multiplier
 
+    BRConfigTest.local_emulator = args.local_emulator
+
     nose2_args = ["-v",
                   "-N", str(args.testcases),
                   "-s", test_dir,
-- 
2.17.1
