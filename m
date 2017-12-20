From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 20 Dec 2017 22:27:43 +0100
Subject: [Buildroot] [PATCH 2/2] core/tests: add test for compressed iso9660
In-Reply-To: <cover.1513805241.git.yann.morin.1998@free.fr>
References: <cover.1513805241.git.yann.morin.1998@free.fr>
Message-ID: <d9148095910e211f1b38a85f93a10ab88fa1af04.1513805241.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 .gitlab-ci.yml                           |  2 ++
 support/testing/tests/fs/test_iso9660.py | 41 ++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c81697920b..8b35e18003 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -256,8 +256,10 @@ tests.fs.test_ext.TestExt2r1: *runtime_test
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
index 5d945a347a..157105d04b 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -67,6 +67,27 @@ class TestIso9660Grub2External(infra.basetest.BRTest):
         self.assertEqual(exit_code, 1)
 
 
+class TestIso9660Grub2ExternalCompress(infra.basetest.BRTest):
+    config = BASIC_CONFIG + \
+        """
+        BR2_TARGET_ROOTFS_ISO9660=y
+        # BR2_TARGET_ROOTFS_ISO9660_INITRD is not set
+        BR2_TARGET_ROOTFS_ISO9660_TRANSP_COMPRESS
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
+        BR2_TARGET_ROOTFS_ISO9660_TRANSP_COMPRESS
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
-- 
2.11.0
