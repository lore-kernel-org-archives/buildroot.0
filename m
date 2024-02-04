Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63A7C48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 19:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BFFA415EC;
	Sun,  4 Feb 2024 19:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BFFA415EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lMeqJX_G-WOo; Sun,  4 Feb 2024 19:19:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29BDE4168D;
	Sun,  4 Feb 2024 19:19:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29BDE4168D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 911531BF429
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 19:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69D6E60A9B
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 19:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69D6E60A9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UiT_4NuU2-AV for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 19:19:33 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A00160A9A
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 19:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A00160A9A
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DC0BF13F846;
 Sun,  4 Feb 2024 20:19:27 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  4 Feb 2024 20:19:22 +0100
Message-ID: <20240204191922.366955-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707074369;
 bh=NJcnwXSykmIQVKtT9ykk2WKzofR6gnAuP50w/Jl61Fk=;
 h=From:To:Cc:Subject:Date:From;
 b=VuTTyywQmVwZla7H+94Ouc3Ku7xP+amRVU8k59qCg0qAqsD+hz5t3skcrwR3EXTzJ
 DQW9jHXQTDYrvmMTsS/hV5P9bX3bAZeTLY8qVnyJWPge90hHJR9BNTEBIzWWpk45Od
 VMiTW9ybGIehulckVz2CydbUrsJhojyn4lZvFQ6H5hD8ZSPiHkMJ0FT+O/LqhYpQgj
 IVsVqE2e+em00aQgWDMTjAElnyZyg6FkPfg4NFrte+7brtZ31hI7+dJXiuoAyb2t1J
 H9UAw0pN2/i48XHEy/sf9WrUozG6LDacw1VPDKW53NvsHMWkk9M4N54uHXc6tKXDtG
 Km0qN5fZQwPrQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VuTTyywQ
Subject: [Buildroot] [PATCH 1/1] support/testing: add libcamera runtime test
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
 DEVELOPERS                                    |  2 +
 .../testing/tests/package/test_libcamera.py   | 79 +++++++++++++++++++
 .../test_libcamera/linux-vimc.fragment        |  4 +
 3 files changed, 85 insertions(+)
 create mode 100644 support/testing/tests/package/test_libcamera.py
 create mode 100644 support/testing/tests/package/test_libcamera/linux-vimc.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index 02b7516a92..0acf49296d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1783,6 +1783,8 @@ F:	support/testing/tests/package/test_kexec/
 F:	support/testing/tests/package/test_kmscube.py
 F:	support/testing/tests/package/test_kmscube/
 F:	support/testing/tests/package/test_less.py
+F:	support/testing/tests/package/test_libcamera.py
+F:	support/testing/tests/package/test_libcamera/
 F:	support/testing/tests/package/test_libgpgme.py
 F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_lrzip.py
diff --git a/support/testing/tests/package/test_libcamera.py b/support/testing/tests/package/test_libcamera.py
new file mode 100644
index 0000000000..8953021b82
--- /dev/null
+++ b/support/testing/tests/package/test_libcamera.py
@@ -0,0 +1,79 @@
+import os
+
+import infra.basetest
+
+
+class TestLibCamera(infra.basetest.BRTest):
+    # A specific configuration is needed for testing libcamera:
+    # a kernel config fragment enables v4l2 vimc driver.
+    # The libevent package is also enabled to have the libcamera "cam"
+    # test application.
+    kernel_fragment = \
+        infra.filepath("tests/package/test_libcamera/linux-vimc.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.76"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_PACKAGE_LIBCAMERA=y
+        BR2_PACKAGE_LIBCAMERA_PIPELINE_VIMC=y
+        BR2_PACKAGE_LIBEVENT=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
+                                    "-initrd", img])
+        self.emulator.login()
+
+        # The Kernel config of this test has only one v4l2 vimc
+        # driver. The camera index is expected to be #1.
+        cam_idx = 1
+
+        # We test libcamera with its simple "cam" application, by
+        # requesting a list of available cameras.
+        cmd = "cam --list"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        # libcamera generates info messages. We filter only the
+        # line(s) starting with our camera index.
+        cam_line = [ln for ln in out if ln.startswith(f"{cam_idx}:")]
+        # We should have the vimc camera in this line.
+        self.assertIn("platform/vimc.0", cam_line[0])
+
+        # List the camera information.
+        cmd = f"cam --camera {cam_idx} --info"
+        self.assertRunOk(cmd)
+
+        # List the camera controls and check we have a brightness
+        # control.
+        cmd = f"cam --camera {cam_idx} --list-controls"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertIn("Control: Brightness:", "\n".join(out))
+
+        # List the camera properties and check we have a camera
+        # "Model" property.
+        cmd = f"cam --camera {cam_idx} --list-properties"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertIn("Property: Model = ", "\n".join(out))
+
+        # Capture few frames.
+        cmd = f"cam --camera {cam_idx} --capture=5"
+        cmd += " --stream width=160,height=120,role=video,pixelformat=RGB888"
+        self.assertRunOk(cmd)
diff --git a/support/testing/tests/package/test_libcamera/linux-vimc.fragment b/support/testing/tests/package/test_libcamera/linux-vimc.fragment
new file mode 100644
index 0000000000..04436e7518
--- /dev/null
+++ b/support/testing/tests/package/test_libcamera/linux-vimc.fragment
@@ -0,0 +1,4 @@
+CONFIG_MEDIA_SUPPORT=y
+CONFIG_MEDIA_TEST_SUPPORT=y
+CONFIG_V4L_TEST_DRIVERS=y
+CONFIG_VIDEO_VIMC=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
