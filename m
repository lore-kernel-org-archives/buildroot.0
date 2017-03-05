From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Mar 2017 16:03:21 +0100
Subject: [Buildroot] [PATCH v2 5/5] support/testing: add toolchain tests
In-Reply-To: <1488726201-6507-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488726201-6507-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1488726201-6507-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds an initial toolchain test case, testing the ARM
CodeSourcery toolchain, just checking that the proper sysroot is used,
and that a minimal Linux system boots fine under Qemu.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/tests/toolchain/__init__.py      |   0
 support/testing/tests/toolchain/test_external.py | 156 +++++++++++++++++++++++
 2 files changed, 156 insertions(+)
 create mode 100644 support/testing/tests/toolchain/__init__.py
 create mode 100644 support/testing/tests/toolchain/test_external.py

diff --git a/support/testing/tests/toolchain/__init__.py b/support/testing/tests/toolchain/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
new file mode 100644
index 0000000..3ac9c95
--- /dev/null
+++ b/support/testing/tests/toolchain/test_external.py
@@ -0,0 +1,156 @@
+import os
+import infra
+
+BASIC_CONFIG = \
+"""
+BR2_TARGET_ROOTFS_CPIO=y
+# BR2_TARGET_ROOTFS_TAR is not set
+"""
+
+def check_broken_links(path):
+    for root, dirs, files in os.walk(path):
+        for f in files:
+            fpath = os.path.join(root, f)
+            if not os.path.exists(fpath):
+                return True
+    return False
+
+class TestExternalToolchain(infra.basetest.BRTest):
+    def test_run(self):
+        # Check for broken symlinks
+        for d in ["lib", "usr/lib"]:
+            path = os.path.join(self.builddir, "staging", d)
+            self.assertFalse(check_broken_links(path))
+            path = os.path.join(self.builddir, "target", d)
+            self.assertFalse(check_broken_links(path))
+
+        interp = infra.get_elf_prog_interpreter(self.builddir,
+                                                self.toolchain_prefix,
+                                                "bin/busybox")
+        interp_path = os.path.join(self.builddir, "target", interp[1:])
+        self.assertTrue(os.path.exists(interp_path))
+
+class TestExternalToolchainSourceryArmv4(TestExternalToolchain):
+    config = BASIC_CONFIG + \
+"""
+BR2_arm=y
+BR2_arm920t=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
+"""
+    toolchain_prefix = "arm-none-linux-gnueabi"
+
+    def test_run(self):
+        TestExternalToolchain.test_run(self)
+
+        # Check the architecture variant
+        arch = infra.get_file_arch(self.builddir,
+                                   self.toolchain_prefix,
+                                   "lib/libc.so.6")
+        self.assertEqual(arch, "v4T")
+
+        # Check the sysroot symlink
+        symlink = os.path.join(self.builddir, "staging", "armv4t")
+        self.assertTrue(os.path.exists(symlink))
+        self.assertEqual(os.readlink(symlink), "./")
+
+        # Boot the system
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", img])
+        self.emulator.login()
+
+class TestExternalToolchainSourceryArmv5(TestExternalToolchain):
+    config = BASIC_CONFIG + \
+"""
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
+"""
+    toolchain_prefix = "arm-none-linux-gnueabi"
+
+    def test_run(self):
+        TestExternalToolchain.test_run(self)
+
+        # Check the architecture variant
+        arch = infra.get_file_arch(self.builddir,
+                                   self.toolchain_prefix,
+                                   "lib/libc.so.6")
+        self.assertEqual(arch, "v5TE")
+
+        # Boot the system
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", img])
+        self.emulator.login()
+
+class TestExternalToolchainSourceryArmv7(TestExternalToolchain):
+    config = BASIC_CONFIG + \
+"""
+BR2_arm=y
+BR2_cortex_a8=y
+BR2_ARM_EABI=y
+BR2_ARM_INSTRUCTIONS_THUMB2=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
+"""
+    toolchain_prefix = "arm-none-linux-gnueabi"
+
+    def test_run(self):
+        TestExternalToolchain.test_run(self)
+
+        # Check the architecture variant
+        arch = infra.get_file_arch(self.builddir,
+                                   self.toolchain_prefix,
+                                   "lib/libc.so.6")
+        self.assertEqual(arch, "v7")
+        isa = infra.get_elf_arch_tag(self.builddir,
+                                     self.toolchain_prefix,
+                                     "lib/libc.so.6",
+                                     "Tag_THUMB_ISA_use")
+        self.assertEqual(isa, "Thumb-2")
+
+        # Check we have the sysroot symlink
+        symlink = os.path.join(self.builddir, "staging", "thumb2")
+        self.assertTrue(os.path.exists(symlink))
+        self.assertEqual(os.readlink(symlink), "./")
+
+        # Boot the system
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", img])
+        self.emulator.login()
+
+class TestExternalToolchainLinaroArm(TestExternalToolchain):
+    config = BASIC_CONFIG + \
+"""
+BR2_arm=y
+BR2_cortex_a8=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
+"""
+    toolchain_prefix = "arm-linux-gnueabihf"
+
+    def test_run(self):
+        TestExternalToolchain.test_run(self)
+
+        # Check the architecture variant
+        arch = infra.get_file_arch(self.builddir,
+                                   self.toolchain_prefix,
+                                   "lib/libc.so.6")
+        self.assertEqual(arch, "v7")
+        isa = infra.get_elf_arch_tag(self.builddir,
+                                     self.toolchain_prefix,
+                                     "lib/libc.so.6",
+                                     "Tag_THUMB_ISA_use")
+        self.assertEqual(isa, "Thumb-2")
+
+        # Boot the system
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", img])
+        self.emulator.login()
-- 
2.7.4
