From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Thu,  7 Jan 2021 14:53:07 +0100
Subject: [Buildroot] [PATCH 3/3] support/testing: improve SELinux test
In-Reply-To: <20210107135307.1762186-1-maxime.chevallier@bootlin.com>
References: <20210107135307.1762186-1-maxime.chevallier@bootlin.com>
Message-ID: <20210107135307.1762186-4-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we have support for the refpolicy in buildroot with the latest
pending patches and the buildroot module, we are able to boot a system
without any denied actions.

Make the test check for the number of denied actions, making sure it's
0.

For ow, we don't switch to "Enforcing" mode yet due to some issues still
being present, although not reported as denied actions, possibly because
of "dontaudit" rules.

Suggested-by: Antoine Tenart <atenart@kernel.org>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 support/testing/tests/init/test_systemd_selinux.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/testing/tests/init/test_systemd_selinux.py b/support/testing/tests/init/test_systemd_selinux.py
index 73604cfc32..dd8ee6e9b0 100644
--- a/support/testing/tests/init/test_systemd_selinux.py
+++ b/support/testing/tests/init/test_systemd_selinux.py
@@ -17,6 +17,8 @@ class TestSELinuxSystemd(infra.basetest.BRTest):
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
         BR2_PACKAGE_LIBSELINUX=y
         BR2_PACKAGE_REFPOLICY=y
+        BR2_REFPOLICY_EXTRA_MODULES_DIRS="package/refpolicy/selinux-modules"
+        BR2_REFPOLICY_EXTRA_MODULES="buildroot"
         """
 
     def wait_boot(self):
@@ -50,6 +52,10 @@ class TestSELinuxSystemd(infra.basetest.BRTest):
         self.assertEqual(ret, 0)
         self.assertEqual(out[0], "system_u:system_r:init_t\0")
 
+        # Check no action was denied by the policy while booting.
+        out, ret = self.emulator.run("journalctl -e | grep audit | grep denied | wc -l")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], "0")
 
 class TestSELinuxSystemdExt4(TestSELinuxSystemd):
     config = TestSELinuxSystemd.config + \
-- 
2.25.4
