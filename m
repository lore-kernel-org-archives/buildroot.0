Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45C1C47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 23:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59FD3400A6;
	Sat, 20 Jan 2024 23:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59FD3400A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nw3L7i-XZfel; Sat, 20 Jan 2024 23:29:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38FC5400F9;
	Sat, 20 Jan 2024 23:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38FC5400F9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CFE461BF27E
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B42AA400F9
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 23:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B42AA400F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8NFv64svB-2W for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 23:29:11 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99FFC400A6
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 23:29:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99FFC400A6
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6DB9D13F88D;
 Sun, 21 Jan 2024 00:29:07 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 21 Jan 2024 00:28:54 +0100
Message-ID: <20240120232854.1938582-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705793349;
 bh=Ct0l0eEbUuk43rRKkQEHZTyJWBYe/3V+Hp0/qNzn3wk=;
 h=From:To:Cc:Subject:Date:From;
 b=BSVG0GABaC4zHhBP1y1JDHV3b51y+cnjsUV1dI6hpMT++mPoU2Vc/gl1dhk8E36XH
 qBm7+fEL7ZsAl3j4JAyjmL/NnYfl6aYtW571h21Y/jcli//EWqVVJNNwcKls3da2WN
 MZzZYDcwIoo7Hr7LIqHOQAovHkdUDR8hft8m6IavOGS7Hrpx5fxQIYCF5zfnSYVOTH
 3pZ5rmQ7YYt2dS4B0O7qhmuRjrsHVh19CQZMQB/kjENDC0JviXnHyZVYhUE2tEeC3L
 lT8ynKFf2qCihRZcmucs8oTCgLvhdW12iqKdOCqRNsNZL/efzc7Us1o16zwjzmIoKN
 jewagVTuX3hYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BSVG0GAB
Subject: [Buildroot] [PATCH 1/1] support/testing: add optee-os runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cc: Etienne Carriere <etienne.carriere@foss.st.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 3780925 with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.boot.test_optee_os
    ...
    OK
---
 DEVELOPERS                                    |  2 +
 support/testing/tests/boot/test_optee_os.py   | 74 +++++++++++++++++++
 .../tests/boot/test_optee_os/u-boot.fragment  |  8 ++
 3 files changed, 84 insertions(+)
 create mode 100644 support/testing/tests/boot/test_optee_os.py
 create mode 100644 support/testing/tests/boot/test_optee_os/u-boot.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index f5b04937b6..d4a1d55758 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1750,6 +1750,8 @@ F:	package/riscv-isa-sim/
 F:	package/tinycompress/
 F:	package/z3/
 F:	package/zynaddsubfx/
+F:	support/testing/tests/boot/test_optee_os.py
+F:	support/testing/tests/boot/test_optee_os/
 F:	support/testing/tests/package/sample_python_distro.py
 F:	support/testing/tests/package/sample_python_gnupg.py
 F:	support/testing/tests/package/sample_python_hwdata.py
diff --git a/support/testing/tests/boot/test_optee_os.py b/support/testing/tests/boot/test_optee_os.py
new file mode 100644
index 0000000000..5f5cd17464
--- /dev/null
+++ b/support/testing/tests/boot/test_optee_os.py
@@ -0,0 +1,74 @@
+import os
+
+import infra.basetest
+
+
+class TestOptee(infra.basetest.BRTest):
+    # A custom configuration is needed to enable OP-TEE support in the
+    # Kernel. This config is inspired from:
+    # configs/qemu_arm_vexpress_tz_defconfig
+    uboot_fragment = \
+        infra.filepath("tests/boot/test_optee_os/u-boot.fragment")
+    config = \
+        f"""
+        BR2_arm=y
+        BR2_cortex_a15=y
+        BR2_ARM_FPU_VFPV3D16=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_ROOTFS_POST_BUILD_SCRIPT="board/qemu/arm-vexpress-tz/post-build.sh"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.73"
+        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/arm-vexpress-tz/linux.fragment"
+        BR2_PACKAGE_OPTEE_EXAMPLES=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu"
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BL32_RAM_LOCATION=tdram"
+        BR2_TARGET_OPTEE_OS=y
+        BR2_TARGET_OPTEE_OS_NEEDS_DTC=y
+        BR2_TARGET_OPTEE_OS_PLATFORM="vexpress-qemu_virt"
+        BR2_TARGET_UBOOT=y
+        BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+        BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+        BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
+        BR2_TARGET_UBOOT_BOARD_DEFCONFIG="qemu_arm"
+        BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="{uboot_fragment}"
+        """
+
+    def test_run(self):
+        # There is no Kernel nor rootfs image here. They will be
+        # loaded by TFTP through the emulated network interface in
+        # u-boot.
+        bios = os.path.join(self.builddir, "images", "flash.bin")
+        tftp_dir = os.path.join(self.builddir, "images")
+        self.emulator.boot(arch="arm",
+                           options=["-M", "virt,secure=on",
+                                    "-d", "unimp",
+                                    "-cpu", "cortex-a15",
+                                    "-m", "1024M",
+                                    "-netdev", f"user,id=vmnic,tftp={tftp_dir}",
+                                    "-device", "virtio-net-device,netdev=vmnic",
+                                    "-bios", bios])
+        self.emulator.login()
+
+        # Check the Kernel has OP-TEE messages
+        self.assertRunOk("dmesg | grep -F optee:")
+
+        # Check we have OP-TEE devices
+        self.assertRunOk("ls -al /dev/tee*")
+
+        # Run some OP-TEE examples
+        examples = ["aes", "hello_world", "hotp", "random", "secure_storage"]
+        for ex in examples:
+            self.assertRunOk(f"optee_example_{ex}")
diff --git a/support/testing/tests/boot/test_optee_os/u-boot.fragment b/support/testing/tests/boot/test_optee_os/u-boot.fragment
new file mode 100644
index 0000000000..b9505a1ff8
--- /dev/null
+++ b/support/testing/tests/boot/test_optee_os/u-boot.fragment
@@ -0,0 +1,8 @@
+CONFIG_SYS_TEXT_BASE=0x60000000
+CONFIG_BOOTCOMMAND="setenv ipaddr 10.0.2.15 && setenv serverip 10.0.2.2 && tftp ${kernel_addr_r} zImage && tftp ${ramdisk_addr_r} rootfs.cpio.uboot && setenv bootargs console=ttyAMA0,115200 earlyprintk=serial,ttyAMA0,115200 && bootz ${kernel_addr_r} ${ramdisk_addr_r} ${fdt_addr}"
+CONFIG_SEMIHOSTING=y
+# Drop flash accesses
+CONFIG_ENV_IS_IN_FLASH=n
+CONFIG_MTD=n
+CONFIG_MTD_NOR_FLASH=n
+CONFIG_ENV_IS_NOWHERE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
