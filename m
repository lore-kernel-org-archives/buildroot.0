From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 18:20:14 +0100
Subject: [Buildroot] [git commit] core/tests: add test for compressed iso9660
Message-ID: <20171231172140.A62A18393B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=290b4cfe17042f1345e45363d1ce09f04e32f12a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: really set the transparent compression option, take into
account the renaming of the option.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml                           |  2 ++
 support/testing/tests/fs/test_iso9660.py | 41 ++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ef2e3a4..bf975fc 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -257,8 +257,10 @@ tests.fs.test_ext.TestExt2r1: *runtime_test
 tests.fs.test_ext.TestExt3: *runtime_test
 tests.fs.test_ext.TestExt4: *runtime_test
 tests.fs.test_iso9660.TestIso9660Grub2External: *runtime_test
+tests.fs.test_iso9660.TestIso9660Grub2ExternalCompress: *runtime_test
 tests.fs.test_iso9660.TestIso9660Grub2Internal: *runtime_test
 tests.fs.test_iso9660.TestIso9660SyslinuxExternal: *runtime_test
+tests.fs.test_iso9660.TestIso9660SyslinuxExternalCompress: *runtime_test
 tests.fs.test_iso9660.TestIso9660SyslinuxInternal: *runtime_test
 tests.fs.test_jffs2.TestJffs2: *runtime_test
 tests.fs.test_squashfs.TestSquashfs: *runtime_test
diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 5d945a3..68f4840 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -67,6 +67,27 @@ class TestIso9660Grub2External(infra.basetest.BRTest):
         self.assertEqual(exit_code, 1)
 
 
+class TestIso9660Grub2ExternalCompress(infra.basetest.BRTest):
+    config = BASIC_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_ISO9660=y
+        # BR2_TARGET_ROOTFS_ISO9660_INITRD is not set
+        BR2_TARGET_ROOTFS_ISO9660_TRANSPARENT_COMPRESSION=y
+        BR2_TARGET_GRUB2=y
+        BR2_TARGET_GRUB2_BOOT_PARTITION="cd"
+        BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
+        BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
+        """.format(infra.filepath("conf/grub2.cfg"))
+
+    def test_run(self):
+        exit_code = test_mount_internal_external(self.emulator,
+                                                 self.builddir, internal=False)
+        self.assertEqual(exit_code, 0)
+
+        exit_code = test_touch_file(self.emulator)
+        self.assertEqual(exit_code, 1)
+
+
 class TestIso9660Grub2Internal(infra.basetest.BRTest):
     config = BASIC_CONFIG + \
         """
@@ -109,6 +130,26 @@ class TestIso9660SyslinuxExternal(infra.basetest.BRTest):
         self.assertEqual(exit_code, 1)
 
 
+class TestIso9660SyslinuxExternalCompress(infra.basetest.BRTest):
+    config = BASIC_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_ISO9660=y
+        # BR2_TARGET_ROOTFS_ISO9660_INITRD is not set
+        BR2_TARGET_ROOTFS_ISO9660_TRANSPARENT_COMPRESSION=y
+        BR2_TARGET_ROOTFS_ISO9660_HYBRID=y
+        BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
+        BR2_TARGET_SYSLINUX=y
+        """.format(infra.filepath("conf/isolinux.cfg"))
+
+    def test_run(self):
+        exit_code = test_mount_internal_external(self.emulator,
+                                                 self.builddir, internal=False)
+        self.assertEqual(exit_code, 0)
+
+        exit_code = test_touch_file(self.emulator)
+        self.assertEqual(exit_code, 1)
+
+
 class TestIso9660SyslinuxInternal(infra.basetest.BRTest):
     config = BASIC_CONFIG + \
         """
