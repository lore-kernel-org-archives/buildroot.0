Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102C1C4345F
	for <buildroot@archiver.kernel.org>; Sun, 14 Apr 2024 21:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8447B81854;
	Sun, 14 Apr 2024 21:42:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JHavNpMdVlaS; Sun, 14 Apr 2024 21:42:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62E9781858
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62E9781858;
	Sun, 14 Apr 2024 21:42:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 34E6D1BF2BF
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 21:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21A2B60655
 for <buildroot@lists.busybox.net>; Sun, 14 Apr 2024 21:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IYd_Y9Hh5nDN for <buildroot@lists.busybox.net>;
 Sun, 14 Apr 2024 21:42:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8F3416061F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F3416061F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F3416061F
 for <buildroot@buildroot.org>; Sun, 14 Apr 2024 21:42:20 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D1768B00579;
 Sun, 14 Apr 2024 23:42:15 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Apr 2024 23:42:04 +0200
Message-ID: <20240414214204.1038212-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1713130937;
 bh=TuPQA1S21FepEOwWdGjWYqiJMBoj93Shvft1OHY4+Ok=;
 h=From:To:Cc:Subject:Date:From;
 b=rafX/EZZlrx3mdri1BGS5t4AkctFkdDjmCzqDOFyiNIWDIBIEa5q64gct2NUimBRF
 n5ObOQHfSUELUz/msdWEqUGvx+gtfyYGVKQHzF4+/gMsavISDCpdVMNhtQlOIab/E1
 xWjw6l7ra+cJMVPxaGcXmwp/+gqCP6qM1fxChyRQiUZQPl98YsGxH8VHaQgcZuh70H
 GKhrnDUjpBZ8WtFeNwQXTk9qTdtOig1r3T7LJ8/cL2E3Mrp1V+glQ9iyshwclKKGUy
 VwkKm69KT/VNh9vy8Wuf5EoCumXWGJJQDyVlIpkH5kW2JlGsl9kAawR0ohTSjT5VFj
 ftG1Sd5AFSs3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=rafX/EZZ
Subject: [Buildroot] [PATCH 1/1] support/testing: add wine runtime test
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
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_wine.py | 88 ++++++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 support/testing/tests/package/test_wine.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 399b2931ff3..b8beb1bd565 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1872,6 +1872,7 @@ F:	support/testing/tests/package/test_usbutils.py
 F:	support/testing/tests/package/test_usbutils/
 F:	support/testing/tests/package/test_weston.py
 F:	support/testing/tests/package/test_weston/
+F:	support/testing/tests/package/test_wine.py
 F:	support/testing/tests/package/test_xz.py
 F:	support/testing/tests/package/test_z3.py
 F:	support/testing/tests/package/test_z3/
diff --git a/support/testing/tests/package/test_wine.py b/support/testing/tests/package/test_wine.py
new file mode 100644
index 00000000000..4e5b4a8b111
--- /dev/null
+++ b/support/testing/tests/package/test_wine.py
@@ -0,0 +1,88 @@
+import os
+
+import infra.basetest
+
+
+class TestWine(infra.basetest.BRTest):
+    # Wine depends on i386 architecture. The pre-build runtime test
+    # Kernel (for armv5) cannot be used. The config also uses a ext4
+    # rootfs due to the larger Wine footprint. We also enable NLS,
+    # which is required for cmd.exe shell to work.
+    config = \
+        """
+        BR2_i386=y
+        BR2_x86_pentium4=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.27"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux.config"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
+        BR2_PACKAGE_WINE=y
+        BR2_SYSTEM_ENABLE_NLS=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        drive = os.path.join(self.builddir, "images", "rootfs.ext4")
+        kern = os.path.join(self.builddir, "images", "bzImage")
+        self.emulator.boot(arch="i386",
+                           kernel=kern,
+                           kernel_cmdline=["root=/dev/vda console=ttyS0"],
+                           options=["-M", "pc", "-m", "256M",
+                                    "-drive", f"file={drive},if=virtio,format=raw"])
+        self.emulator.login()
+
+        # Check the program can run.
+        self.assertRunOk("wine --version")
+
+        # Remove the Wine directory to make this test idempotent. This
+        # is because we use a persistent storage. This is useful only
+        # when the run-tests script is used with the "-k" option.
+        self.assertRunOk("rm -rf ~/.wine")
+
+        # Wine usually prints lots of debug messages. We disable all
+        # logs for this test. For debugging, this line can be
+        # commented, or extra log can also be added. "WINEDEBUG=+all"
+        # enable all logs and generates a lot of messages.
+        # See: https://wiki.winehq.org/Debug_Channels
+        self.assertRunOk("export WINEDEBUG=-all")
+
+        # We force the initialization of the WINEPREFIX
+        # directory. This operation can take some time. This will make
+        # subsequent wine invocation execution time more stable.
+        self.assertRunOk("wineboot --init", timeout=45)
+
+        # We check we can list files in the Windows OS directory.
+        cmd = "wine cmd.exe /C 'DIR C:\\WINDOWS\\'"
+        self.assertRunOk(cmd, timeout=10)
+
+        # We check we can read a Windows OS specific environment
+        # variable. We use "assertIn" rather than "assertEqual"
+        # because the cmd.exe shell write extra control characters.
+        cmd = "wine cmd.exe /C 'ECHO %OS%'"
+        out, ret = self.emulator.run(cmd, timeout=10)
+        self.assertEqual(ret, 0)
+        self.assertIn("Windows_NT", out[0])
+
+        # We check we can print an arbitrary string with the
+        # cmd.exe shell.
+        string = "Hello Buildroot !"
+        cmd = f"wine cmd.exe /C 'ECHO {string}'"
+        out, ret = self.emulator.run(cmd, timeout=10)
+        self.assertEqual(ret, 0)
+        self.assertIn(string, out[0])
+
+        # We check the VER command reports a Windows OS version.
+        cmd = "wine cmd.exe /C 'VER'"
+        out, ret = self.emulator.run(cmd, timeout=10)
+        self.assertEqual(ret, 0)
+        self.assertIn("Microsoft Windows", "\n".join(out))
+
+        # We run the ping.exe command.
+        self.assertRunOk("wine ping.exe 127.0.0.1", timeout=10)
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
