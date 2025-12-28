Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C92E8FDBE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41F374056F;
	Sun, 28 Dec 2025 21:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QT88cEL7-z4H; Sun, 28 Dec 2025 21:57:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4795F40596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766959056;
	bh=I2zn6EX8I+N2pxnYtQcmSrjCsraLCMp43qoxhJyV1UI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ipD/64XaaiVQURo3APTDofyxu4kh2yOtMMArE1pe9x7ABMfhsSUrpaKD9O62PyI12
	 tOTi414wxVnMG7a6GeR9feID8D051Hbpu9kNO9tntQw1RZSaff/nlvh+auDIWebgTW
	 LD30Mk7nldP50oXtmPGwyzqSZzCTqAjQ5tFjXwKaes2qO+ajCef5vOv1k5f7bozYnj
	 1x/jZa3kijUrnV/AyLhkvjdqq/N1Mg+eLQQXlF5IKvM36wkyY1BoPYPTkwttM3yDWq
	 882sh2YtIuNdLrFWUMQw000zihc2pFWuXQI/YuORBHafUNSHjRajf5prnm/At6Y8VY
	 NMQiWMV3QRekQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4795F40596;
	Sun, 28 Dec 2025 21:57:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CB58E1E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C713E60905
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVjM7yjvw4jC for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:57:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02F4460A4F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02F4460A4F
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:57:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB75085D62; Sun, 28 Dec 2025 21:57:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 22:57:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8adea9f9f9409fc9b5d408a2cfdde48718e54814
X-Git-Newrev: 7c8c8e01fa4ea1eb0fc1370e1e52f8dcec12e1f5
X-Patchwork-Hint: ignore
Message-Id: <20251228215731.DB75085D62@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: add tio runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7c8c8e01fa4ea1eb0fc1370e1e52f8dcec12e1f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                |  1 +
 support/testing/tests/package/test_tio.py | 74 +++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c876be2cb6..34dee3fc7a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2021,6 +2021,7 @@ F:	support/testing/tests/package/test_tcl.py
 F:	support/testing/tests/package/test_tcl/
 F:	support/testing/tests/package/test_tcpdump.py
 F:	support/testing/tests/package/test_tesseract_ocr.py
+F:	support/testing/tests/package/test_tio.py
 F:	support/testing/tests/package/test_trace_cmd.py
 F:	support/testing/tests/package/test_trace_cmd/
 F:	support/testing/tests/package/test_tree.py
diff --git a/support/testing/tests/package/test_tio.py b/support/testing/tests/package/test_tio.py
new file mode 100644
index 0000000000..f7d612b9dd
--- /dev/null
+++ b/support/testing/tests/package/test_tio.py
@@ -0,0 +1,74 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestTio(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_SOCAT=y
+        BR2_PACKAGE_TIO=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def get_tty_name(self):
+        out, ret = self.emulator.run("tty")
+        self.assertEqual(ret, 0)
+        return out[0]
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # We check the program can run
+        self.assertRunOk("tio --version")
+
+        # We save our tty name for later.
+        initial_tty = self.get_tty_name()
+
+        # We define two arbitrary pseudo-terminals, for our test.
+        pty1 = "pty1_getty"
+        pty2 = "pty2_tio"
+
+        # We create our 2 PTYs with socat and connect them together.
+        cmd = "( socat"
+        for pty in [pty1, pty2]:
+            cmd += f" PTY,link=/dev/{pty},rawer,b115200"
+        cmd += " &> /dev/null & )"
+        self.assertRunOk(cmd)
+
+        # We wait for socat to be ready...
+        for attempt in range(3 * self.timeout_multiplier):
+            time.sleep(1)
+            cmd = f"test -e /dev/{pty1} -a -e /dev/{pty2}"
+            _, ret = self.emulator.run(cmd)
+            if ret == 0:
+                break
+        else:
+            self.fail("Timeout while waiting for socat.")
+
+        # We start getty on our first PTY.
+        self.assertRunOk(f"setsid getty {pty1} 115200 vt100")
+
+        # We start tio on our second PTY and send a new line.
+        # We wait for tio to be ready then send a new line.
+        # After that, we expect to see a new login.
+        self.emulator.qemu.sendline(f"tio /dev/{pty2}")
+        self.emulator.qemu.expect(f"Connected to /dev/{pty2}")
+        self.emulator.qemu.sendline()
+
+        # We try to re-login, in tio this time.
+        self.emulator.login()
+
+        # We get again our tty name.
+        tio_tty = self.get_tty_name()
+
+        # We check our second login TTY name is different from the one
+        # in the first login.
+        self.assertNotEqual(initial_tty, tio_tty)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
