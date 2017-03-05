From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Mar 2017 16:03:19 +0100
Subject: [Buildroot] [PATCH v2 3/5] support/testing: add fs tests
In-Reply-To: <1488726201-6507-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488726201-6507-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1488726201-6507-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a number of test cases for various filesystem formats:
ext2/3/4, iso9660, jffs2, squashfs, ubi/ubifs and yaffs2. All of them
except yaffs2 are runtime tested. The iso9660 set of test cases is
particularly rich, testing the proper operation of the iso9660 support
with all of grub, grub2 and isolinux.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/conf/grub-menu.lst                 |  20 +++
 support/testing/conf/grub2.cfg                     |   7 +
 support/testing/conf/isolinux.cfg                  |   5 +
 .../testing/conf/minimal-x86-qemu-kernel.config    |  23 +++
 support/testing/tests/fs/__init__.py               |   0
 support/testing/tests/fs/test_ext.py               | 119 +++++++++++++++
 support/testing/tests/fs/test_iso9660.py           | 162 +++++++++++++++++++++
 support/testing/tests/fs/test_jffs2.py             |  45 ++++++
 support/testing/tests/fs/test_squashfs.py          |  37 +++++
 support/testing/tests/fs/test_ubi.py               |  39 +++++
 support/testing/tests/fs/test_yaffs2.py            |  12 ++
 11 files changed, 469 insertions(+)
 create mode 100644 support/testing/conf/grub-menu.lst
 create mode 100644 support/testing/conf/grub2.cfg
 create mode 100644 support/testing/conf/isolinux.cfg
 create mode 100644 support/testing/conf/minimal-x86-qemu-kernel.config
 create mode 100644 support/testing/tests/fs/__init__.py
 create mode 100644 support/testing/tests/fs/test_ext.py
 create mode 100644 support/testing/tests/fs/test_iso9660.py
 create mode 100644 support/testing/tests/fs/test_jffs2.py
 create mode 100644 support/testing/tests/fs/test_squashfs.py
 create mode 100644 support/testing/tests/fs/test_ubi.py
 create mode 100644 support/testing/tests/fs/test_yaffs2.py

diff --git a/support/testing/conf/grub-menu.lst b/support/testing/conf/grub-menu.lst
new file mode 100644
index 0000000..6143d80
--- /dev/null
+++ b/support/testing/conf/grub-menu.lst
@@ -0,0 +1,20 @@
+default		0
+timeout		1
+
+# Used when no splashimage is used
+color 		cyan/blue white/blue
+
+# Gets enabled/disabled depending on Grub support for splashimage
+splashimage	/boot/grub/splash.xpm.gz
+
+# Used when a splashimage is enabled
+foreground 	000000
+background 	cccccc
+
+title		Buildroot ISO9660 image
+kernel		__KERNEL_PATH__ root=/dev/sr0 console=ttyS0,115200
+initrd		__INITRD_PATH__
+
+title		Hard Drive (first partition)
+rootnoverify	(hd0)
+chainloader	+1
diff --git a/support/testing/conf/grub2.cfg b/support/testing/conf/grub2.cfg
new file mode 100644
index 0000000..a982d0b
--- /dev/null
+++ b/support/testing/conf/grub2.cfg
@@ -0,0 +1,7 @@
+set default="0"
+set timeout="1"
+
+menuentry "Buildroot" {
+	linux __KERNEL_PATH__ root=/dev/sr0 console=ttyS0,115200
+	initrd __INITRD_PATH__
+}
diff --git a/support/testing/conf/isolinux.cfg b/support/testing/conf/isolinux.cfg
new file mode 100644
index 0000000..ba031a6
--- /dev/null
+++ b/support/testing/conf/isolinux.cfg
@@ -0,0 +1,5 @@
+default 1
+label 1
+      kernel __KERNEL_PATH__
+      initrd __INITRD_PATH__
+      append root=/dev/sr0 console=ttyS0,115200
diff --git a/support/testing/conf/minimal-x86-qemu-kernel.config b/support/testing/conf/minimal-x86-qemu-kernel.config
new file mode 100644
index 0000000..8f6ceef
--- /dev/null
+++ b/support/testing/conf/minimal-x86-qemu-kernel.config
@@ -0,0 +1,23 @@
+# CONFIG_64BIT is not set
+CONFIG_SYSVIPC=y
+CONFIG_BLK_DEV_INITRD=y
+# CONFIG_SUSPEND is not set
+# CONFIG_ACPI is not set
+CONFIG_CPU_IDLE=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_BLK_DEV_SR=y
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_POWER_SUPPLY=y
+CONFIG_THERMAL=y
+CONFIG_EXT4_FS=y
+CONFIG_ISO9660_FS=y
+CONFIG_JOLIET=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+# CONFIG_VIRTUALIZATION is not set
diff --git a/support/testing/tests/fs/__init__.py b/support/testing/tests/fs/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/support/testing/tests/fs/test_ext.py b/support/testing/tests/fs/test_ext.py
new file mode 100644
index 0000000..f7e2e85
--- /dev/null
+++ b/support/testing/tests/fs/test_ext.py
@@ -0,0 +1,119 @@
+import os
+import subprocess
+
+import infra.basetest
+
+VOLNAME_PROP = "Filesystem volume name"
+REVISION_PROP = "Filesystem revision #"
+FEATURES_PROP = "Filesystem features"
+BLOCKCNT_PROP = "Block count"
+INODECNT_PROP = "Inode count"
+RESBLKCNT_PROP = "Reserved block count"
+
+CHECK_FS_TYPE_CMD = "mount | grep '/dev/root on / type {}'"
+
+def dumpe2fs_run(builddir, image):
+    cmd = ["host/usr/sbin/dumpe2fs", os.path.join("images", image)]
+    ret = subprocess.check_output(cmd,
+                                  stderr=open(os.devnull, "w"),
+                                  cwd=builddir,
+                                  env={"LANG": "C"})
+    return ret.strip().splitlines()
+
+def dumpe2fs_getprop(out, prop):
+    for lines in out:
+        lines = lines.split(": ")
+        if lines[0] == prop:
+            return lines[1].strip()
+
+def boot_img_and_check_fs_type(emulator, builddir, fs_type):
+    img = os.path.join(builddir, "images", "rootfs.{}".format(fs_type))
+    emulator.boot(arch="armv7",
+                  kernel="builtin",
+                  kernel_cmdline=["root=/dev/mmcblk0",
+                                  "rootfstype={}".format(fs_type)],
+                  options=["-drive", "file={},if=sd".format(img)])
+    emulator.login()
+    _, exit_code = emulator.run(CHECK_FS_TYPE_CMD.format(fs_type))
+    return exit_code
+
+class TestExt2(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+"""
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_2r0=y
+BR2_TARGET_ROOTFS_EXT2_LABEL="foobaz"
+# BR2_TARGET_ROOTFS_TAR is not set
+"""
+
+    def test_run(self):
+        out = dumpe2fs_run(self.builddir, "rootfs.ext2")
+        self.assertEqual(dumpe2fs_getprop(out, VOLNAME_PROP), "foobaz")
+        self.assertEqual(dumpe2fs_getprop(out, REVISION_PROP), "0 (original)")
+
+        exit_code = boot_img_and_check_fs_type(self.emulator,
+                                               self.builddir, "ext2")
+        self.assertEqual(exit_code, 0)
+
+class TestExt2r1(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+"""
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_2r1=y
+BR2_TARGET_ROOTFS_EXT2_LABEL="foobar"
+# BR2_TARGET_ROOTFS_TAR is not set
+"""
+
+    def test_run(self):
+        out = dumpe2fs_run(self.builddir, "rootfs.ext2")
+        self.assertEqual(dumpe2fs_getprop(out, VOLNAME_PROP), "foobar")
+        self.assertEqual(dumpe2fs_getprop(out, REVISION_PROP), "1 (dynamic)")
+        self.assertNotIn("has_journal", dumpe2fs_getprop(out, FEATURES_PROP))
+
+        exit_code = boot_img_and_check_fs_type(self.emulator,
+                                               self.builddir, "ext2")
+        self.assertEqual(exit_code, 0)
+
+class TestExt3(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+"""
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_3=y
+# BR2_TARGET_ROOTFS_TAR is not set
+"""
+
+    def test_run(self):
+        out = dumpe2fs_run(self.builddir, "rootfs.ext3")
+        self.assertEqual(dumpe2fs_getprop(out, REVISION_PROP), "1 (dynamic)")
+        self.assertIn("has_journal", dumpe2fs_getprop(out, FEATURES_PROP))
+
+        exit_code = boot_img_and_check_fs_type(self.emulator,
+                                               self.builddir, "ext3")
+        self.assertEqual(exit_code, 0)
+
+class TestExt4(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+"""
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_BLOCKS=16384
+BR2_TARGET_ROOTFS_EXT2_INODES=3000
+BR2_TARGET_ROOTFS_EXT2_RESBLKS=10
+# BR2_TARGET_ROOTFS_TAR is not set
+"""
+
+    def test_run(self):
+        out = dumpe2fs_run(self.builddir, "rootfs.ext4")
+        self.assertEqual(dumpe2fs_getprop(out, REVISION_PROP), "1 (dynamic)")
+        self.assertEqual(dumpe2fs_getprop(out, BLOCKCNT_PROP), "16384")
+        # Yes there are 8 more inodes than requested
+        self.assertEqual(dumpe2fs_getprop(out, INODECNT_PROP), "3008")
+        self.assertEqual(dumpe2fs_getprop(out, RESBLKCNT_PROP), "1638")
+        self.assertIn("has_journal", dumpe2fs_getprop(out, FEATURES_PROP))
+        self.assertIn("extent", dumpe2fs_getprop(out, FEATURES_PROP))
+
+        exit_code = boot_img_and_check_fs_type(self.emulator,
+                                               self.builddir, "ext4")
+        self.assertEqual(exit_code, 0)
+
+
diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
new file mode 100644
index 0000000..eec6e89
--- /dev/null
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -0,0 +1,162 @@
+import os
+
+import infra.basetest
+
+BASIC_CONFIG = \
+"""
+BR2_x86_pentium4=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2015.05-496-g85945aa.tar.bz2"
+BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
+BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2=y
+BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
+# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
+BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
+BR2_TOOLCHAIN_EXTERNAL_CXX=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="{}"
+# BR2_TARGET_ROOTFS_TAR is not set
+""".format(infra.filepath("conf/minimal-x86-qemu-kernel.config"))
+
+def test_mount_internal_external(emulator, builddir, internal=True):
+    img = os.path.join(builddir, "images", "rootfs.iso9660")
+    emulator.boot(arch="i386", options=["-cdrom", img])
+    emulator.login()
+
+    if internal:
+        cmd = "mount | grep 'rootfs on / type rootfs'"
+    else:
+        cmd = "mount | grep '/dev/root on / type iso9660'"
+
+    _, exit_code = emulator.run(cmd)
+    return exit_code
+
+def test_touch_file(emulator):
+    _, exit_code = emulator.run("touch test")
+    return exit_code
+
+#
+# Grub 2
+#
+
+class TestIso9660Grub2External(infra.basetest.BRTest):
+    config = BASIC_CONFIG + \
+"""
+BR2_TARGET_ROOTFS_ISO9660=y
+# BR2_TARGET_ROOTFS_ISO9660_INITRD is not set
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_BOOT_PARTITION="cd"
+BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
+BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
+""".format(infra.filepath("conf/grub2.cfg"))
+
+    def test_run(self):
+        exit_code = test_mount_internal_external(self.emulator,
+                                                 self.builddir, internal=False)
+        self.assertEqual(exit_code, 0)
+
+        exit_code = test_touch_file(self.emulator)
+        self.assertEqual(exit_code, 1)
+
+class TestIso9660Grub2Internal(infra.basetest.BRTest):
+    config = BASIC_CONFIG + \
+"""
+BR2_TARGET_ROOTFS_ISO9660=y
+BR2_TARGET_ROOTFS_ISO9660_INITRD=y
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_BOOT_PARTITION="cd"
+BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
+BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
+""".format(infra.filepath("conf/grub2.cfg"))
+
+    def test_run(self):
+        exit_code = test_mount_internal_external(self.emulator,
+                                                 self.builddir, internal=True)
+        self.assertEqual(exit_code, 0)
+
+        exit_code = test_touch_file(self.emulator)
+        self.assertEqual(exit_code, 0)
+
+#
+# Grub
+#
+
+class TestIso9660GrubExternal(infra.basetest.BRTest):
+    config = BASIC_CONFIG + \
+"""
+BR2_TARGET_ROOTFS_ISO9660=y
+# BR2_TARGET_ROOTFS_ISO9660_INITRD is not set
+BR2_TARGET_GRUB=y
+BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
+""".format(infra.filepath("conf/grub-menu.lst"))
+
+    def test_run(self):
+        exit_code = test_mount_internal_external(self.emulator,
+                                                 self.builddir, internal=False)
+        self.assertEqual(exit_code, 0)
+
+        exit_code = test_touch_file(self.emulator)
+        self.assertEqual(exit_code, 1)
+
+class TestIso9660GrubInternal(infra.basetest.BRTest):
+    config = BASIC_CONFIG + \
+"""
+BR2_TARGET_ROOTFS_ISO9660=y
+BR2_TARGET_GRUB=y
+BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
+""".format(infra.filepath("conf/grub-menu.lst"))
+
+    def test_run(self):
+        exit_code = test_mount_internal_external(self.emulator,
+                                                 self.builddir, internal=True)
+        self.assertEqual(exit_code, 0)
+
+        exit_code = test_touch_file(self.emulator)
+        self.assertEqual(exit_code, 0)
+
+#
+# Syslinux
+#
+
+class TestIso9660SyslinuxExternal(infra.basetest.BRTest):
+    config = BASIC_CONFIG + \
+"""
+BR2_TARGET_ROOTFS_ISO9660=y
+# BR2_TARGET_ROOTFS_ISO9660_INITRD is not set
+BR2_TARGET_ROOTFS_ISO9660_HYBRID=y
+BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
+BR2_TARGET_SYSLINUX=y
+""".format(infra.filepath("conf/isolinux.cfg"))
+
+    def test_run(self):
+        exit_code = test_mount_internal_external(self.emulator,
+                                                 self.builddir, internal=False)
+        self.assertEqual(exit_code, 0)
+
+        exit_code = test_touch_file(self.emulator)
+        self.assertEqual(exit_code, 1)
+
+class TestIso9660SyslinuxInternal(infra.basetest.BRTest):
+    config = BASIC_CONFIG + \
+"""
+BR2_TARGET_ROOTFS_ISO9660=y
+BR2_TARGET_ROOTFS_ISO9660_INITRD=y
+BR2_TARGET_ROOTFS_ISO9660_HYBRID=y
+BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
+BR2_TARGET_SYSLINUX=y
+""".format(infra.filepath("conf/isolinux.cfg"))
+
+    def test_run(self):
+        exit_code = test_mount_internal_external(self.emulator,
+                                                 self.builddir, internal=True)
+        self.assertEqual(exit_code, 0)
+
+        exit_code = test_touch_file(self.emulator)
+        self.assertEqual(exit_code, 0)
diff --git a/support/testing/tests/fs/test_jffs2.py b/support/testing/tests/fs/test_jffs2.py
new file mode 100644
index 0000000..0d45af2
--- /dev/null
+++ b/support/testing/tests/fs/test_jffs2.py
@@ -0,0 +1,45 @@
+import os
+import subprocess
+
+import infra.basetest
+
+def jffs2dump_find_file(files_list, fname):
+    for file_name in files_list:
+        file_name = file_name.strip()
+        if file_name.startswith("Dirent") and file_name.endswith(fname):
+            return True
+    return False
+
+class TestJffs2(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+"""
+BR2_TARGET_ROOTFS_JFFS2=y
+BR2_TARGET_ROOTFS_JFFS2_CUSTOM=y
+BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x80000
+BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
+BR2_TARGET_ROOTFS_JFFS2_PAD=y
+BR2_TARGET_ROOTFS_JFFS2_PADSIZE=0x4000000
+# BR2_TARGET_ROOTFS_TAR is not set
+"""
+
+    # TODO: there are some scary JFFS2 messages when one starts to
+    # write files in the rootfs: "jffs2: Newly-erased block contained
+    # word 0x0 at offset 0x046c0000". To be investigated.
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.jffs2")
+        out = subprocess.check_output(["host/usr/sbin/jffs2dump", "-c", img],
+                                      cwd=self.builddir,
+                                      env={"LANG": "C"})
+        out = out.splitlines()
+        self.assertTrue(jffs2dump_find_file(out, "busybox"))
+
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           kernel_cmdline=["root=/dev/mtdblock0",
+                                           "rootfstype=jffs2"],
+                           options=["-drive", "file={},if=pflash".format(img)])
+        self.emulator.login()
+        cmd = "mount | grep '/dev/root on / type jffs2'"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
new file mode 100644
index 0000000..edaa087
--- /dev/null
+++ b/support/testing/tests/fs/test_squashfs.py
@@ -0,0 +1,37 @@
+import os
+import subprocess
+
+import infra.basetest
+
+class TestSquashfs(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+"""
+BR2_TARGET_ROOTFS_SQUASHFS=y
+# BR2_TARGET_ROOTFS_SQUASHFS4_GZIP is not set
+BR2_TARGET_ROOTFS_SQUASHFS4_LZ4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+"""
+
+    def test_run(self):
+        unsquashfs_cmd = ["host/usr/bin/unsquashfs", "-s", "images/rootfs.squashfs"]
+        out = subprocess.check_output(unsquashfs_cmd,
+                                      cwd=self.builddir,
+                                      env={"LANG": "C"})
+        out = out.splitlines()
+        self.assertEqual(out[0],
+                         "Found a valid SQUASHFS 4:0 superblock on images/rootfs.squashfs.")
+        self.assertEqual(out[3], "Compression lz4")
+
+        img = os.path.join(self.builddir, "images", "rootfs.squashfs")
+        subprocess.call(["truncate", "-s", "%1M", img])
+
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           kernel_cmdline=["root=/dev/mmcblk0",
+                                           "rootfstype=squashfs"],
+                           options=["-drive", "file={},if=sd,format=raw".format(img)])
+        self.emulator.login()
+
+        cmd = "mount | grep '/dev/root on / type squashfs'"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
diff --git a/support/testing/tests/fs/test_ubi.py b/support/testing/tests/fs/test_ubi.py
new file mode 100644
index 0000000..ede4999
--- /dev/null
+++ b/support/testing/tests/fs/test_ubi.py
@@ -0,0 +1,39 @@
+import subprocess
+import os
+
+import infra.basetest
+
+class TestUbi(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+"""
+BR2_TARGET_ROOTFS_UBIFS=y
+BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x7ff80
+BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x1
+BR2_TARGET_ROOTFS_UBI=y
+BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x80000
+BR2_TARGET_ROOTFS_UBI_SUBSIZE=1
+"""
+
+    # TODO: if you boot Qemu twice on the same UBI image, it fails to
+    # attach the image the second time, with "ubi0 error:
+    # ubi_read_volume_table: the layout volume was not found".
+    # To be investigated.
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.ubi")
+        out = subprocess.check_output(["file", img],
+                                      cwd=self.builddir,
+                                      env={"LANG": "C"})
+        out = out.splitlines()
+
+        subprocess.call(["truncate", "-s 128M", img])
+
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           kernel_cmdline=["root=ubi0:rootfs",
+                                           "ubi.mtd=0",
+                                           "rootfstype=ubifs"],
+                           options=["-drive", "file={},if=pflash".format(img)])
+        self.emulator.login()
+        cmd = "mount | grep 'ubi0:rootfs on / type ubifs'"
+        _, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
diff --git a/support/testing/tests/fs/test_yaffs2.py b/support/testing/tests/fs/test_yaffs2.py
new file mode 100644
index 0000000..0ffb758
--- /dev/null
+++ b/support/testing/tests/fs/test_yaffs2.py
@@ -0,0 +1,12 @@
+import os
+
+import infra.basetest
+
+class TestYaffs2(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+            infra.basetest.MINIMAL_CONFIG + \
+            "BR2_TARGET_ROOTFS_YAFFS2=y"
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.yaffs2")
+        self.assertTrue(os.path.exists(img))
-- 
2.7.4
