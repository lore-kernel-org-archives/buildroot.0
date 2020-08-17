From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 17 Aug 2020 23:55:45 +0200
Subject: [Buildroot] [PATCH] support/testing: add openssh runtime test
Message-ID: <20200817215545.8271-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Romain Naour <romain.naour@smile.fr>

This new runtime test is based on test_dropbear.py. The only required change
is to use "-oStrictHostKeyChecking=no" instead of "-y" to accept the new key.

Since the base test infra only provide a uClibc-ng toolchain, add a second
test using a glibc based internal toolchain.

For example, this allow to trigger the openssh 8.1p bug with glibc 2.31 [1].

[1] https://bugs.archlinux.org/task/65386

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_openssh.py | 67 +++++++++++++++++++
 .../tests/package/test_openssh/post-build.sh  |  4 ++
 3 files changed, 72 insertions(+)
 create mode 100644 support/testing/tests/package/test_openssh.py
 create mode 100755 support/testing/tests/package/test_openssh/post-build.sh

diff --git a/DEVELOPERS b/DEVELOPERS
index 35840ec9a8..bba3fd6029 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2244,6 +2244,7 @@ F:	package/waffle/
 F:	package/xenomai/
 F:	package/zziplib/
 F:	support/testing/tests/package/test_glxinfo.py
+F:	support/testing/tests/package/test_openssh.py
 F:	toolchain/
 
 N:	Roman Gorbenkov <roman.gorbenkov@ens2m.org>
diff --git a/support/testing/tests/package/test_openssh.py b/support/testing/tests/package/test_openssh.py
new file mode 100644
index 0000000000..a231071c44
--- /dev/null
+++ b/support/testing/tests/package/test_openssh.py
@@ -0,0 +1,67 @@
+import os
+
+import infra.basetest
+
+
+class TestOpensshBase(infra.basetest.BRTest):
+    passwd = "testpwd"
+    opensshconfig = \
+        """
+        BR2_TARGET_GENERIC_ROOT_PASSWD="{}"
+        BR2_SYSTEM_DHCP="eth0"
+        BR2_PACKAGE_OPENSSH=y
+        BR2_PACKAGE_SSHPASS=y
+        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+            passwd,
+            infra.filepath("tests/package/test_openssh/post-build.sh"))
+
+    def openssh_test(self):
+        self.emulator.login(self.passwd)
+        cmd = "netstat -ltn 2>/dev/null | grep 0.0.0.0:22"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+        cmd = "sshpass -p {} ssh -oStrictHostKeyChecking=no localhost /bin/true".format(self.passwd)
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+
+
+class TestOpenSshuClibc(TestOpensshBase):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        TestOpensshBase.opensshconfig + \
+        """
+        BR2_TARGET_ROOTFS_CPIO=y
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", img,
+                                    "-net", "nic",
+                                    "-net", "user"])
+        self.openssh_test()
+
+
+class TestOpenSshGlibc(TestOpensshBase):
+    config = \
+        TestOpensshBase.opensshconfig + \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+        BR2_KERNEL_HEADERS_4_19=y
+        BR2_TOOLCHAIN_BUILDROOT_CXX=y
+        BR2_PACKAGE_RNG_TOOLS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", img,
+                                    "-net", "nic",
+                                    "-net", "user"])
+        self.openssh_test()
diff --git a/support/testing/tests/package/test_openssh/post-build.sh b/support/testing/tests/package/test_openssh/post-build.sh
new file mode 100755
index 0000000000..4c876ce554
--- /dev/null
+++ b/support/testing/tests/package/test_openssh/post-build.sh
@@ -0,0 +1,4 @@
+#!/usr/bin/env bash
+
+sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g'  ${TARGET_DIR}/etc/ssh/sshd_config
+sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g'  ${TARGET_DIR}/etc/ssh/sshd_config
-- 
2.25.4
