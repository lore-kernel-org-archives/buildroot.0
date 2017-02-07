From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  7 Feb 2017 12:36:03 +0100
Subject: [Buildroot] [PATCH 5/5] support/testing: add toolchain tests
In-Reply-To: <1486467363-19881-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1486467363-19881-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1486467363-19881-6-git-send-email-thomas.petazzoni@free-electrons.com>
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
 support/testing/tests/toolchain/__init__.py      |  0
 support/testing/tests/toolchain/test_external.py | 77 ++++++++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 support/testing/tests/toolchain/__init__.py
 create mode 100644 support/testing/tests/toolchain/test_external.py

diff --git a/support/testing/tests/toolchain/__init__.py b/support/testing/tests/toolchain/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
new file mode 100644
index 0000000..5d55d38
--- /dev/null
+++ b/support/testing/tests/toolchain/test_external.py
@@ -0,0 +1,77 @@
+import os
+
+import infra
+
+class TestExternalToolchainSourceryArmv4(infra.basetest.BRTest):
+    config = \
+"""
+BR2_arm=y
+BR2_arm920t=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
+BR2_TARGET_ROOTFS_CPIO=y
+# BR2_TARGET_ROOTFS_TAR is not set
+"""
+
+    def test_run(self):
+        arch = infra.get_file_arch(self.builddir,
+                                   "arm-none-linux-gnueabi", "lib/libc.so.6")
+        self.assertEqual(arch, "v4T")
+        symlink = os.path.join(self.builddir, "staging", "armv4t")
+        self.assertTrue(os.path.exists(symlink))
+        self.assertEqual(os.readlink(symlink), "./")
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", img])
+        self.emulator.login("root")
+
+class TestExternalToolchainSourceryArmv5(infra.basetest.BRTest):
+    config = \
+"""
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
+BR2_TARGET_ROOTFS_CPIO=y
+# BR2_TARGET_ROOTFS_TAR is not set
+"""
+
+    def test_run(self):
+        arch = infra.get_file_arch(self.builddir,
+                                   "arm-none-linux-gnueabi", "lib/libc.so.6")
+        self.assertEqual(arch, "v5TE")
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", img])
+        self.emulator.login("root")
+
+class TestExternalToolchainSourceryArmv7(infra.basetest.BRTest):
+    config = \
+"""
+BR2_arm=y
+BR2_cortex_a8=y
+BR2_ARM_EABI=y
+BR2_ARM_INSTRUCTIONS_THUMB2=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
+BR2_TARGET_ROOTFS_CPIO=y
+# BR2_TARGET_ROOTFS_TAR is not set
+"""
+
+    def test_run(self):
+        arch = infra.get_file_arch(self.builddir,
+                                   "arm-none-linux-gnueabi", "lib/libc.so.6")
+        self.assertEqual(arch, "v7")
+        isa = infra.get_elf_arch_tag(self.builddir,
+                                     "arm-none-linux-gnueabi", "lib/libc.so.6",
+                                     "Tag_THUMB_ISA_use")
+        self.assertEqual(isa, "Thumb-2")
+        symlink = os.path.join(self.builddir, "staging", "thumb2")
+        self.assertTrue(os.path.exists(symlink))
+        self.assertEqual(os.readlink(symlink), "./")
+        img = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", img])
+        self.emulator.login("root")
-- 
2.7.4
