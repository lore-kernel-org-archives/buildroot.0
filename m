From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 22 Mar 2019 10:58:18 +0100
Subject: [Buildroot] [PATCH v3 4/4] support/testing: test_optee.py: test
 optee boot and testsuite
In-Reply-To: <20190322095818.19914-1-etienne.carriere@linaro.org>
References: <20190322095818.19914-1-etienne.carriere@linaro.org>
Message-ID: <20190322095818.19914-4-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Run a Qemu emulation over qemu_armv7a_tz_virt_defconfig and
run the embedded OP-TEE regression test suite (xtest).

Tool xtest dumps traces that contain '# ' (hash + space) which
corrupts infra/emulator.py sequence which use such traces to
find shell prompt when command is completed. To overcome the issue
the xtest traces are shown only if the test failed.

One can run the test from something like:

  $> support/testing/run-tests \
         -o output/optee-runtest -d output/dwl \
         tests.package.test_optee

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v2 -> v3:
  - Test provides a config_emulator attribute and mandates use of
    the locally built emulator.
  - Update qemu defconfig filename.
  - Remove postprocessing of test image file since driven from the
    selected defconfig

Changes v1 -> v2:
  - Add argument local=True to test emulator to use the qemu host
    built from test configuration.
  - Fix typo in trace "Silent test takes a while, be patient..."
---
 support/testing/tests/package/test_optee.py | 42 +++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 support/testing/tests/package/test_optee.py

diff --git a/support/testing/tests/package/test_optee.py b/support/testing/tests/package/test_optee.py
new file mode 100644
index 0000000000..44cee74fd8
--- /dev/null
+++ b/support/testing/tests/package/test_optee.py
@@ -0,0 +1,42 @@
+import os
+
+import infra.basetest
+
+# This test enforces locally built emulator to prevent old Qemu to
+# dump secure trace to stdio and corrupting trace synchro expected
+# through pexpect.
+
+class TestOptee(infra.basetest.BRTest):
+
+    with open(os.path.join(os.getcwd(), 'configs',
+                           'qemu_arm_vexpress_tz_defconfig'),
+              'r') as config_file:
+        config = "".join(line for line in config_file if line[:1] != '#') + \
+                 """
+                 BR2_PACKAGE_HOST_QEMU=y
+                 BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
+                 BR2_TOOLCHAIN_EXTERNAL=y
+                 """
+    config_emulator = ''
+
+    def test_run(self):
+
+        qemu_options = ['-machine', 'virt,secure=on']
+        qemu_options.extend(['-cpu', 'cortex-a15'])
+        qemu_options.extend(['-m', '1024'])
+        qemu_options.extend(['-semihosting-config', 'enable,target=native'])
+        qemu_options.extend(['-bios', 'bl1.bin'])
+
+        # This test expects Qemu is run from the image direcotry
+        os.chdir(os.path.join(self.builddir, 'images'))
+
+        self.emulator.boot(arch='armv7', options=qemu_options, local=True)
+        self.emulator.login()
+
+        # Trick traces since xtest prints "# " which corrupts emulator run
+        # method. Tests are dumped only if test fails.
+        cmd = 'echo "Silent test takes a while, be patient..."; ' + \
+              'xtest -t regression > /tmp/xtest.log ||' + \
+              '(cat /tmp/xtest.log && false)'
+        output, exit_code = self.emulator.run(cmd, timeout=240)
+        self.assertEqual(exit_code, 0)
-- 
2.17.1
