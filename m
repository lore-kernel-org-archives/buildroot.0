Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27577C001E0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 17:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1797417BF;
	Thu, 10 Aug 2023 17:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1797417BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tGnr9rBNlvwd; Thu, 10 Aug 2023 17:53:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1DC441769;
	Thu, 10 Aug 2023 17:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1DC441769
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45DFA1BF4D6
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 17:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A99B415D5
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 17:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A99B415D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cWNjKnUB2_fe for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 17:53:34 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7D2A40286
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 17:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7D2A40286
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1AA1B13F854;
 Thu, 10 Aug 2023 19:53:30 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 10 Aug 2023 19:53:19 +0200
Message-ID: <20230810175319.1071011-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691690011;
 bh=hi74NABgr/y/REBKpFnhjXzNmUgnPcbHYVYJEoKmaII=;
 h=From:To:Cc:Subject:Date:From;
 b=YrItGJ4OKWDoogy/ZywglKwWNCJIfQ+8jqjlcZJsSiVHZK+OkViIIKQvF8+zU3wj9
 KJL5PTppIXmXLbUZMqOn3alm4Id5NC5i6/01zCUa7+Wu9L2eBKEiucdkDLJ39hzx5m
 D0w0OxYFKks83ylKkDyl5p6C5vGQ8qTWy9Fip0HlAPszNcnB/GohmEuvwqiJZP3P8i
 MfHaldB3i2dHqt8ZlpQpZRhMGk/HQL9avKwH5N/HQKqCLPraYqbfv9m5Ow3uhLvxpi
 4D9MyitZR2NFDClDneAUI15kQLV9FaHstdGJXN7rseFPE4mjZp9N9LdxCGltFtNWcp
 0NKK5ATRIiCFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YrItGJ4O
Subject: [Buildroot] [PATCH next 1/1]
 support/testing/tests/package/test_kmscube: new runtime test
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
Note:
This runtime test needs the kmscube update proposed in [1] to succeed.

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20230809205434.312601-1-ju.o@free.fr/
---
 DEVELOPERS                                    |  2 +
 support/testing/tests/package/test_kmscube.py | 45 +++++++++++++++++++
 .../package/test_kmscube/linux-vkms.fragment  |  1 +
 3 files changed, 48 insertions(+)
 create mode 100644 support/testing/tests/package/test_kmscube.py
 create mode 100644 support/testing/tests/package/test_kmscube/linux-vkms.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index d41e717b45..0bed35fd8e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1787,6 +1787,8 @@ F:	support/testing/tests/package/test_hwloc.py
 F:	support/testing/tests/package/test_iperf3.py
 F:	support/testing/tests/package/test_kexec.py
 F:	support/testing/tests/package/test_kexec/
+F:	support/testing/tests/package/test_kmscube.py
+F:	support/testing/tests/package/test_kmscube/
 F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_lrzip.py
 F:	support/testing/tests/package/test_lzip.py
diff --git a/support/testing/tests/package/test_kmscube.py b/support/testing/tests/package/test_kmscube.py
new file mode 100644
index 0000000000..0ddeb67939
--- /dev/null
+++ b/support/testing/tests/package/test_kmscube.py
@@ -0,0 +1,45 @@
+import os
+
+import infra.basetest
+
+
+class TestKmsCube(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.44"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
+        BR2_PACKAGE_KMSCUBE=y
+        BR2_PACKAGE_LIBDRM=y
+        BR2_PACKAGE_MESA3D=y
+        BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
+        BR2_PACKAGE_MESA3D_LLVM=y
+        BR2_PACKAGE_MESA3D_OPENGL_EGL=y
+        BR2_PACKAGE_MESA3D_OPENGL_ES=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_GZIP=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+            infra.filepath("tests/package/test_kmscube/linux-vkms.fragment"))
+
+    def test_run(self):
+        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(arch="aarch64",
+                           kernel=kern,
+                           kernel_cmdline=["console=ttyAMA0"],
+                           options=["-M", "virt",
+                                    "-cpu", "cortex-a57",
+                                    "-smp", "4",
+                                    "-m", "256M",
+                                    "-initrd", img])
+        self.emulator.login()
+
+        cmd = "kmscube --vmode=640x480 --count=10"
+        self.assertRunOk(cmd, timeout=30)
diff --git a/support/testing/tests/package/test_kmscube/linux-vkms.fragment b/support/testing/tests/package/test_kmscube/linux-vkms.fragment
new file mode 100644
index 0000000000..ec2ed4460c
--- /dev/null
+++ b/support/testing/tests/package/test_kmscube/linux-vkms.fragment
@@ -0,0 +1 @@
+CONFIG_DRM_VKMS=y
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
