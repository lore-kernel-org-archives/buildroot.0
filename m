Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFACAC46CD2
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 22:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 818AF41BD4;
	Wed, 24 Jan 2024 22:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 818AF41BD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YpuE8-Pm9M8Y; Wed, 24 Jan 2024 22:25:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACC5141BCD;
	Wed, 24 Jan 2024 22:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACC5141BCD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86FFE1BF831
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 22:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D55E83380
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 22:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D55E83380
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uO7FTaydiR2B for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 22:25:37 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF5AC83365
 for <buildroot@buildroot.org>; Wed, 24 Jan 2024 22:25:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF5AC83365
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B254813F838;
 Wed, 24 Jan 2024 23:25:34 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 24 Jan 2024 23:25:23 +0100
Message-ID: <20240124222523.16703-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706135136;
 bh=ZvSIluFqP0iIlGc3AYMadfWuPn6eeUTa8BcD941ohYc=;
 h=From:To:Cc:Subject:Date:From;
 b=rxRsirMn+ZmMuFUaMHL2DIlXWyDABbW25w3rKYxsn8xeOL1tSGz8io6vmNr7NH96d
 efM8CL2I/FOxsiqWP2PgcNb/W8uxMTQvKdZC2HPfXbfU7wHhfFUFTyIFpxoJhhnGsX
 25SMSU6y7Jbp3RagjN7KXkKMtFNgmGvLGLwKlAOptLTAwMGeq41ScduwjdH0GjiEGq
 eU6B3PaE9WEctd8cfJpgEvD1GnL8F8ho67v5y8j9NhtBSf5lsO6/H4fwIGbEqBFwzC
 NGlYe+WdeiyCzUJxy0s69EpYR6GvZbzxwMaN+v1ROBs71laRI5HKYqP9hfLcp5BHvb
 h2OyKhGY3RhUw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rxRsirMn
Subject: [Buildroot] [PATCH 1/1] support/testing: add usbutils runtime test
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 7a59c3a with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_usbutils
    ...
    OK
---
 DEVELOPERS                                    |  2 +
 .../testing/tests/package/test_usbutils.py    | 60 +++++++++++++++++++
 .../test_usbutils/linux-usbutils.fragment     |  2 +
 3 files changed, 64 insertions(+)
 create mode 100644 support/testing/tests/package/test_usbutils.py
 create mode 100644 support/testing/tests/package/test_usbutils/linux-usbutils.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index f5b04937b6..5a5ce47d73 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1814,6 +1814,8 @@ F:	support/testing/tests/package/test_screen.py
 F:	support/testing/tests/package/test_stress_ng.py
 F:	support/testing/tests/package/test_tcl.py
 F:	support/testing/tests/package/test_tcl/
+F:	support/testing/tests/package/test_usbutils.py
+F:	support/testing/tests/package/test_usbutils/
 F:	support/testing/tests/package/test_weston.py
 F:	support/testing/tests/package/test_weston/
 F:	support/testing/tests/package/test_xz.py
diff --git a/support/testing/tests/package/test_usbutils.py b/support/testing/tests/package/test_usbutils.py
new file mode 100644
index 0000000000..9a5484d5e6
--- /dev/null
+++ b/support/testing/tests/package/test_usbutils.py
@@ -0,0 +1,60 @@
+import os
+
+import infra.basetest
+
+
+class TestUsbUtils(infra.basetest.BRTest):
+    # A specific configuration is needed for testing usbutils, to
+    # enable USB 2.0 support in the Kernel.
+    linux_fragment = \
+        infra.filepath("tests/package/test_usbutils/linux-usbutils.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.73"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{linux_fragment}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_EUDEV=y
+        BR2_PACKAGE_USBUTILS=y
+        BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        # We add a USB keyboard and mouse devices for the test.
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
+                                    "-initrd", img,
+                                    "-device", "usb-ehci,id=ehci",
+                                    "-device", "usb-kbd,bus=ehci.0",
+                                    "-device", "usb-mouse,bus=ehci.0"])
+        self.emulator.login()
+
+        # Check the program can execute. We also check the version
+        # string to make sure we have the usbutils version. The
+        # BusyBox lsusb ignores arguments.
+        output, exit_code = self.emulator.run("lsusb --version")
+        self.assertEqual(exit_code, 0)
+        self.assertTrue(output[0].startswith("lsusb (usbutils)"))
+
+        # Test few simple and common invocations
+        self.assertRunOk("lsusb")
+        self.assertRunOk("lsusb --tree")
+        self.assertRunOk("lsusb --verbose")
+        # 1d6b:0002 is Linux Foundation 2.0 root hub
+        # it should be present. lsusb return an error if no device
+        # is found.
+        self.assertRunOk("lsusb -d 1d6b:0002")
+        self.assertRunOk("usbhid-dump")
diff --git a/support/testing/tests/package/test_usbutils/linux-usbutils.fragment b/support/testing/tests/package/test_usbutils/linux-usbutils.fragment
new file mode 100644
index 0000000000..d9abd2821e
--- /dev/null
+++ b/support/testing/tests/package/test_usbutils/linux-usbutils.fragment
@@ -0,0 +1,2 @@
+CONFIG_USB=y
+CONFIG_USB_EHCI_HCD=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
