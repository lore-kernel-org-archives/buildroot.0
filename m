From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Feb 2018 14:57:48 +0100
Subject: [Buildroot] [git commit] support/testing: add tests for Rust
Message-ID: <20180205140233.CE756821B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9429539ec819ab32f73414deb05af632a9405cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To test the support for the Rust language, the following tests are added:

- building Rust compiler and Cargo from source.
- installing a pre-built Rust compiler and building Cargo from source.

For each test, a Rust test program is built and installed in the root file
system of a ARM vexpress QEMU system. The test is declared OK if the program can
be run properly from the test system.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_rust.py | 107 +++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
new file mode 100644
index 0000000000..8035f8b83a
--- /dev/null
+++ b/support/testing/tests/package/test_rust.py
@@ -0,0 +1,107 @@
+import os
+import tempfile
+import subprocess
+import shutil
+
+import infra.basetest
+
+
+class TestRustBase(infra.basetest.BRTest):
+
+    target = 'armv7-unknown-linux-gnueabihf'
+    crate = 'hello-world'
+
+    def login(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", img])
+        self.emulator.login()
+
+    def build_test_prog(self):
+        hostdir = os.path.join(self.builddir, 'host')
+        env = os.environ.copy()
+        env["PATH"] = "{}:".format(os.path.join(hostdir, 'bin')) + env["PATH"]
+        env["CARGO_HOME"] = os.path.join(hostdir, 'usr', 'share', 'cargo')
+        env["RUST_TARGET_PATH"] = os.path.join(hostdir, 'etc', 'rustc')
+        cargo = os.path.join(hostdir, 'bin', 'cargo')
+        workdir = os.path.join(tempfile.mkdtemp(suffix='-br2-testing-rust'),
+                               self.crate)
+        manifest = os.path.join(workdir, 'Cargo.toml')
+        prog = os.path.join(workdir, 'target', self.target, 'debug', self.crate)
+
+        cmd = [cargo, 'init', '--bin', '--vcs', 'none', '-vv', workdir]
+        ret = subprocess.call(cmd,
+                              stdout=self.b.logfile,
+                              stderr=self.b.logfile,
+                              env=env)
+        if ret != 0:
+            raise SystemError("Cargo init failed")
+
+        cmd = [
+            cargo, 'build', '-vv', '--target', self.target,
+            '--manifest-path', manifest
+        ]
+        ret = subprocess.call(cmd,
+                              stdout=self.b.logfile,
+                              stderr=self.b.logfile,
+                              env=env)
+        if ret != 0:
+            raise SystemError("Cargo build failed")
+
+        shutil.copy(prog, os.path.join(self.builddir, 'target', 'usr', 'bin'))
+        self.b.build()
+        shutil.rmtree(workdir)
+
+    def test_run(self):
+        self.build_test_prog()
+        self.login()
+        _, exit_code = self.emulator.run(self.crate)
+        self.assertEqual(exit_code, 0)
+
+
+class TestRustBin(TestRustBase):
+    config = \
+             """
+             BR2_arm=y
+             BR2_cortex_a9=y
+             BR2_ARM_ENABLE_NEON=y
+             BR2_ARM_ENABLE_VFP=y
+             BR2_TOOLCHAIN_EXTERNAL=y
+             BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+             BR2_SYSTEM_DHCP="eth0"
+             BR2_LINUX_KERNEL=y
+             BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+             BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+             BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+             BR2_LINUX_KERNEL_DTS_SUPPORT=y
+             BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+             BR2_TARGET_ROOTFS_CPIO=y
+             # BR2_TARGET_ROOTFS_TAR is not set
+             BR2_PACKAGE_HOST_CARGO=y
+             BR2_PACKAGE_HOST_RUSTC=y
+             """
+
+
+class TestRust(TestRustBase):
+    config = \
+             """
+             BR2_arm=y
+             BR2_cortex_a9=y
+             BR2_ARM_ENABLE_NEON=y
+             BR2_ARM_ENABLE_VFP=y
+             BR2_TOOLCHAIN_EXTERNAL=y
+             BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+             BR2_SYSTEM_DHCP="eth0"
+             BR2_LINUX_KERNEL=y
+             BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+             BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.3"
+             BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+             BR2_LINUX_KERNEL_DTS_SUPPORT=y
+             BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
+             BR2_TARGET_ROOTFS_CPIO=y
+             # BR2_TARGET_ROOTFS_TAR is not set
+             BR2_PACKAGE_HOST_CARGO=y
+             BR2_PACKAGE_HOST_RUSTC=y
+             BR2_PACKAGE_HOST_RUST=y
+             """
