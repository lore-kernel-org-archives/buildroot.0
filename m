From: Romain Naour <romain.naour@smile.fr>
Date: Mon, 30 Mar 2020 18:24:10 +0200
Subject: [Buildroot] [PATCH 1/2] support/testing: add openssh runtime test
Message-ID: <20200330162411.9678-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new runtime test is based on test_dropbear.py. The only required change
is to use "-oStrictHostKeyChecking=no" instead of "-y" to accept the new key.

Since the base test infra only provide a uClibc-ng toolchain, add a second
test using a glibc based internal toolchain.

For example, this allow to trigger the openssh 8.1p bug with glibc 2.31 [1].

[1] https://bugs.archlinux.org/task/65386

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .gitlab-ci.yml                                |  2 +
 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_openssh.py | 78 +++++++++++++++++++
 .../tests/package/test_openssh/post-build.sh  |  4 +
 4 files changed, 85 insertions(+)
 create mode 100644 support/testing/tests/package/test_openssh.py
 create mode 100755 support/testing/tests/package/test_openssh/post-build.sh

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 416ed3c0ca..0fae2e4e53 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -430,6 +430,8 @@ tests.package.test_lxc.TestLxc: { extends: .runtime_test }
 tests.package.test_lzlib.TestLuaLzlib: { extends: .runtime_test }
 tests.package.test_netdata.TestNetdata: { extends: .runtime_test }
 tests.package.test_openjdk.TestOpenJdk: { extends: .runtime_test }
+tests.package.test_openssh.TestOpenSshGlibc: { extends: .runtime_test }
+tests.package.test_openssh.TestOpenSshuClibc: { extends: .runtime_test }
 tests.package.test_opkg.TestOpkg: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
 tests.package.test_perl_class_load.TestPerlClassLoad: { extends: .runtime_test }
diff --git a/DEVELOPERS b/DEVELOPERS
index f1bf5c263c..009063347b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2214,6 +2214,7 @@ F:	package/waffle/
 F:	package/xenomai/
 F:	package/zziplib/
 F:	support/testing/tests/package/test_glxinfo.py
+F:	support/testing/tests/package/test_openssh.py
 F:	toolchain/
 
 N:	Roman Gorbenkov <roman.gorbenkov@ens2m.org>
diff --git a/support/testing/tests/package/test_openssh.py b/support/testing/tests/package/test_openssh.py
new file mode 100644
index 0000000000..6eb58d404d
--- /dev/null
+++ b/support/testing/tests/package/test_openssh.py
@@ -0,0 +1,78 @@
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
+        BR2_x86_64=y
+        BR2_x86_core2=y
+        BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+        BR2_KERNEL_HEADERS_4_19=y
+        BR2_TOOLCHAIN_BUILDROOT_CXX=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
+        BR2_PACKAGE_RNG_TOOLS=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        """
+
+    def test_run(self):
+        kernel = os.path.join(self.builddir, "images", "bzImage")
+        rootfs = os.path.join(self.builddir, "images", "rootfs.ext2")
+        self.emulator.boot(arch="x86_64",
+                           kernel=kernel,
+                           kernel_cmdline=["root=/dev/vda", "console=ttyS0"],
+                           options=["-cpu", "core2duo",
+                                    "-m", "512M",
+                                    "-device", "virtio-rng-pci",
+                                    "-drive", "file={},format=raw,if=virtio".format(rootfs),
+                                    "-net", "nic,model=virtio",
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
2.21.1
