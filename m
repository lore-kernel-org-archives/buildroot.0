From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri,  4 Aug 2017 23:05:19 -0300
Subject: [Buildroot] [PATCH v2 1/2] support/testing: allow to use a
	multiplier for timeouts
In-Reply-To: <20170730044946.11999-2-ricardo.martincoski@gmail.com>
References: <20170730044946.11999-2-ricardo.martincoski@gmail.com>
Message-ID: <20170805020520.4925-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a parameter to run-tests to act as a multiplier for all timeouts of
emulator.
It can be used to avoid sporadic failures on slow host machines as well
in elastic runners on the cloud.

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - use clearer parameter name (elastic-timeout -> timeout-multiplier)
    (Thomas);
  - adapt commit message;
---
 support/testing/infra/basetest.py |  4 +++-
 support/testing/infra/emulator.py | 13 ++++++++++---
 support/testing/run-tests         |  9 +++++++++
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 431605b23f..493dea5125 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -35,6 +35,7 @@ class BRTest(unittest.TestCase):
     logtofile = True
     keepbuilds = False
     jlevel = 0
+    timeout_multiplier = 1
 
     def __init__(self, names):
         super(BRTest, self).__init__(names)
@@ -60,7 +61,8 @@ class BRTest(unittest.TestCase):
             self.b.build()
             self.show_msg("Building done")
 
-        self.emulator = Emulator(self.builddir, self.downloaddir, self.logtofile)
+        self.emulator = Emulator(self.builddir, self.downloaddir,
+                                 self.logtofile, self.timeout_multiplier)
 
     def tearDown(self):
         self.show_msg("Cleaning up")
diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 588a92f6a2..214a1067e9 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -5,10 +5,14 @@ import infra
 
 class Emulator(object):
 
-    def __init__(self, builddir, downloaddir, logtofile):
+    def __init__(self, builddir, downloaddir, logtofile, multiplier):
         self.qemu = None
         self.downloaddir = downloaddir
         self.logfile = infra.open_log_file(builddir, "run", logtofile)
+        # We use elastic runners on the cloud to runs our tests. Those runners
+        # can take a long time to run the emulator. Use a timeout multiplier
+        # when running the tests to avoid sporadic failures.
+        self.multiplier = multiplier
 
     # Start Qemu to boot the system
     #
@@ -65,7 +69,8 @@ class Emulator(object):
             qemu_cmd += ["-append", " ".join(kernel_cmdline)]
 
         self.logfile.write("> starting qemu with '%s'\n" % " ".join(qemu_cmd))
-        self.qemu = pexpect.spawn(qemu_cmd[0], qemu_cmd[1:], timeout=5,
+        self.qemu = pexpect.spawn(qemu_cmd[0], qemu_cmd[1:],
+                                  timeout=5 * self.multiplier,
                                   env={"QEMU_AUDIO_DRV": "none"})
         # We want only stdout into the log to avoid double echo
         self.qemu.logfile_read = self.logfile
@@ -76,7 +81,7 @@ class Emulator(object):
         # The login prompt can take some time to appear when running multiple
         # instances in parallel, so set the timeout to a large value
         index = self.qemu.expect(["buildroot login:", pexpect.TIMEOUT],
-                                 timeout=60)
+                                 timeout=60 * self.multiplier)
         if index != 0:
             self.logfile.write("==> System does not boot")
             raise SystemError("System does not boot")
@@ -94,6 +99,8 @@ class Emulator(object):
     # return a tuple (output, exit_code)
     def run(self, cmd, timeout=-1):
         self.qemu.sendline(cmd)
+        if timeout != -1:
+            timeout *= self.multiplier
         self.qemu.expect("# ", timeout=timeout)
         # Remove double carriage return from qemu stdout so str.splitlines()
         # works as expected.
diff --git a/support/testing/run-tests b/support/testing/run-tests
index 0cb673c61f..95c1565f72 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -28,6 +28,8 @@ def main():
                         help='number of testcases to run simultaneously')
     parser.add_argument('-j', '--jlevel', type=int,
                         help='BR2_JLEVEL to use for each testcase')
+    parser.add_argument('--timeout-multiplier', type=int, default=1,
+                        help='increase timeouts (useful for slow machines)')
 
     args = parser.parse_args()
 
@@ -97,6 +99,13 @@ def main():
         # the user can override the auto calculated value
         BRTest.jlevel = args.jlevel
 
+    if args.timeout_multiplier < 1:
+        print "Invalid multiplier for timeout values"
+        print ""
+        parser.print_help()
+        return 1
+    BRTest.timeout_multiplier = args.timeout_multiplier
+
     nose2_args = ["-v",
                   "-N", str(args.testcases),
                   "-s", "support/testing",
-- 
2.13.0
