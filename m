From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Wed,  6 Mar 2019 11:11:40 +0100
Subject: [Buildroot] [PATCH 6/6] support/testing: test_optee.py: test optee
 boot and testsuite
In-Reply-To: <7f15bfd5388e2171b13b44722b84149d9f361551.1551866509.git.etienne.carriere@linaro.org>
References: <7f15bfd5388e2171b13b44722b84149d9f361551.1551866509.git.etienne.carriere@linaro.org>
Message-ID: <c9b74ed5df6d845156d486a9bfc6fdb57d83fa61.1551866509.git.etienne.carriere@linaro.org>
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

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 support/testing/tests/package/test_optee.py | 40 +++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 support/testing/tests/package/test_optee.py

diff --git a/support/testing/tests/package/test_optee.py b/support/testing/tests/package/test_optee.py
new file mode 100644
index 0000000..b633cb5
--- /dev/null
+++ b/support/testing/tests/package/test_optee.py
@@ -0,0 +1,40 @@
+import os
+
+import infra.basetest
+
+
+class TestOptee(infra.basetest.BRTest):
+
+    with open(os.path.join(os.getcwd(), 'configs/qemu_armv7a_tz_virt_defconfig'), 'r') as config_file:
+        config = "".join(line for line in config_file if line[:1]!='#') + \
+                """
+                BR2_TOOLCHAIN_EXTERNAL=y
+                """
+
+    def test_run(self):
+        qemu_options = ['-machine', 'virt,secure=on']
+        qemu_options.extend(['-cpu', 'cortex-a15'])
+        qemu_options.extend(['-m', '1024'])
+        qemu_options.extend(['-semihosting-config', 'enable,target=native'])
+        qemu_options.extend(['-bios', 'bl1.bin'])
+
+        # Prepare env for Qemu/armv7a to find the boot images
+        os.chdir(os.path.join(self.builddir, 'images'))
+        if not os.path.exists('bl33.bin'):
+            os.symlink('u-boot.bin', 'bl33.bin')
+        if not os.path.exists('bl32.bin'):
+            os.symlink('tee-header_v2.bin', 'bl32.bin')
+        if not os.path.exists('bl32_extra1.bin'):
+            os.symlink('tee-pager_v2.bin', 'bl32_extra1.bin')
+        if not os.path.exists('bl32_extra2.bin'):
+            os.symlink('tee-pageable_v2.bin', 'bl32_extra2.bin')
+
+        self.emulator.boot(arch='armv7', options=qemu_options)
+        self.emulator.login()
+
+        # Trick test trace since it prints "# " and corrupts emulator run method
+        # Print test trace only if test fails.
+        cmd = 'echo "Silent test while a while, be patient..."; ' + \
+              'xtest -t regression > /tmp/xtest.log || (cat /tmp/xtest.log && false)'
+        output, exit_code = self.emulator.run(cmd, timeout=240)
+        self.assertEqual(exit_code, 0)
-- 
1.9.1
