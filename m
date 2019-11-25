From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 21:40:41 +0100
Subject: [Buildroot] [git commit] support/testing: test_lxc.py: fix code
 style
Message-ID: <20191202083935.64AC97FA91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd18e74eeb734994c91e19f830e4c700b8aaba2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix these warnings:

E122 continuation line missing indentation or outdented
E127 continuation line over-indented for visual indent
E265 block comment should start with '# '
E302 expected 2 blank lines, found 1
F401 'pexpect' imported but unused

Fixes:
 - https://gitlab.com/buildroot.org/buildroot/-/jobs/360824861

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_lxc.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/support/testing/tests/package/test_lxc.py b/support/testing/tests/package/test_lxc.py
index 151bcf100b..346247da08 100644
--- a/support/testing/tests/package/test_lxc.py
+++ b/support/testing/tests/package/test_lxc.py
@@ -1,7 +1,7 @@
 import os
 
 import infra.basetest
-import pexpect
+
 
 class TestLxc(infra.basetest.BRTest):
     config = \
@@ -23,24 +23,24 @@ class TestLxc(infra.basetest.BRTest):
             BR2_ROOTFS_OVERLAY="{}"
             BR2_TARGET_ROOTFS_CPIO=y
             """.format(
-            infra.filepath("tests/package/test_lxc/lxc-kernel.config"),
-            infra.filepath("tests/package/test_lxc/rootfs-overlay"))
+              infra.filepath("tests/package/test_lxc/lxc-kernel.config"),
+              infra.filepath("tests/package/test_lxc/rootfs-overlay"))
 
     def run_ok(self, cmd):
         self.assertRunOk(cmd, 120)
 
     def wait_boot(self):
-        #the complete boot with systemd takes more time than what the default multipler permits
+        # the complete boot with systemd takes more time than what the default multipler permits
         self.emulator.timeout_multiplier *= 10
         self.emulator.login()
 
     def setup_run_test_container(self):
         self.run_ok("lxc-create -n lxc_iperf3 -t none -f /usr/share/lxc/config/minimal-iperf3.conf")
         self.run_ok("lxc-start -l trace -n lxc_iperf3 -o /tmp/lxc.log -L /tmp/lxc.console.log")
-        #need to wait for the container to be fully started
+        # need to wait for the container to be fully started
         self.run_ok("sleep 2")
         self.run_ok("iperf3 -c 192.168.1.2 -t 2")
-        #if the test fails, just cat /tmp/*.log
+        # if the test fails, just cat /tmp/*.log
 
     def test_run(self):
         cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
@@ -50,7 +50,7 @@ class TestLxc(infra.basetest.BRTest):
                            kernel_cmdline=[
                                         "console=ttyAMA0,115200"],
                            options=["-initrd", cpio_file,
-                                        "-dtb", dtb_file,
-                                        "-M", "vexpress-a9"])
+                                    "-dtb", dtb_file,
+                                    "-M", "vexpress-a9"])
         self.wait_boot()
         self.setup_run_test_container()
