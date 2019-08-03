From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat,  3 Aug 2019 02:22:14 -0300
Subject: [Buildroot] [PATCH 2/4] support/testing: test syslog-ng with
 builtin kernel
In-Reply-To: <20190803052216.22292-1-ricardo.martincoski@gmail.com>
References: <20190803052216.22292-1-ricardo.martincoski@gmail.com>
Message-ID: <20190803052216.22292-3-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the new builtin kernel 4.19 with VirtIORNG to provide entropy to
test syslog-ng.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 .../conf/syslog-ng-kernel-fragment.config     |  3 ---
 .../testing/tests/package/test_syslog_ng.py   | 20 ++++---------------
 2 files changed, 4 insertions(+), 19 deletions(-)
 delete mode 100644 support/testing/conf/syslog-ng-kernel-fragment.config

diff --git a/support/testing/conf/syslog-ng-kernel-fragment.config b/support/testing/conf/syslog-ng-kernel-fragment.config
deleted file mode 100644
index 5b96e418be..0000000000
--- a/support/testing/conf/syslog-ng-kernel-fragment.config
+++ /dev/null
@@ -1,3 +0,0 @@
-CONFIG_HW_RANDOM=y
-CONFIG_HW_RANDOM_VIRTIO=y
-CONFIG_VIRTIO_PCI=y
diff --git a/support/testing/tests/package/test_syslog_ng.py b/support/testing/tests/package/test_syslog_ng.py
index d1444d3d0d..9a82ba91da 100644
--- a/support/testing/tests/package/test_syslog_ng.py
+++ b/support/testing/tests/package/test_syslog_ng.py
@@ -6,29 +6,17 @@ import infra.basetest
 class TestSyslogNg(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
-        BR2_LINUX_KERNEL=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
-        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux.config"
-        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
-        BR2_LINUX_KERNEL_DTS_SUPPORT=y
-        BR2_LINUX_KERNEL_INTREE_DTS_NAME="versatile-pb"
         BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
         BR2_PACKAGE_SYSLOG_NG=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
-        """.format(infra.filepath("conf/syslog-ng-kernel-fragment.config"))
+        """
 
     def test_run(self):
-        kernel = os.path.join(self.builddir, "images", "zImage")
         cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
-        dtb = os.path.join(self.builddir, "images", "versatile-pb.dtb")
-        options = ["-M", "versatilepb",
-                   "-dtb", dtb,
-                   "-initrd", cpio_file,
-                   "-device", "virtio-rng-pci"]
-        self.emulator.boot(arch="armv5", kernel=kernel, options=options)
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin-4.19",
+                           options=["-initrd", cpio_file])
         self.emulator.login()
 
         cmd = "grep syslog-ng /var/log/messages | grep starting"
-- 
2.17.1
