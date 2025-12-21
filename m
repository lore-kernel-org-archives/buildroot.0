Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8C6E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 11:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C1AA8136A;
	Sun, 21 Dec 2025 11:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X58JQZvJLgQG; Sun, 21 Dec 2025 11:57:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 402FF8144E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766318256;
	bh=JiQqV25XlEPCGcFS58itMHySCN9cNofvEILMkYxIvM4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=scZf/PP+kGYZbr0txsLCQ6/2IFw+JALWZ1onXnxKVSAx3yVS9Bxy9Nd9zWPKzpRkl
	 O0l2CRdoKhUy4MWqLmBwOy7uODZ8SOMx/75zZ0Mu+FLjvYYvBoL7hCphGMy8llLWTP
	 JzJAZ5wKJmsLUobAepXM87wQVHMJ7fNqFzJ2rIsTgfrAFKOZjP0KCSEgYQLdlQLAfG
	 BLnFlvHNtFqtv+fC3n2VJUBxTDCPp1jHVL0cFd3yE9MRNP2i19LA1Yi5BXKDG6FSXa
	 tJecFCqrMKGEUN8QMaxlyb66w7u0cHUyVEcfMQTrS9m/7WUXos7CEb3Ox19Oo1Mlgv
	 jj9Y+d7YEsF2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 402FF8144E;
	Sun, 21 Dec 2025 11:57:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C5002195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 11:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7AC98136A
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 11:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id efWub344v9Fn for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 11:57:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B3416813AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3416813AD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B3416813AD
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 11:57:33 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a0d:e487:412e:ace1:8cb:5573:7181:a54f])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 0CA275FFBA;
 Sun, 21 Dec 2025 12:57:27 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 21 Dec 2025 12:57:08 +0100
Message-ID: <20251221115708.256386-3-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251221115708.256386-1-ju.o@free.fr>
References: <20251221115708.256386-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766318252;
 bh=iGRimv9+Mo+3M952jUqIuUcfS9hWLYaTZQyQVG1qqrY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b5CIJ9b5gBx/3iSAr7l8j+kn9FnLus/9o2G5P9kVzHRsK1I6q6s/TcSaMkeMBbSke
 SAfsyLp17XqGTTFO14R4XpiggQtvRSalYb+z8Dpe2y2T5u9kUYk06G9rTKzHxmtm92
 Zh6XFELZrk6RyiJtvXWzI032xhqEvfygY1zsoRb/YhqBJtS0lvD8TKucANEk/yzOyd
 Icnic8DLgfVRNxjbXg399mR32+jlHwpPAqs4sfrJ4NCWOZjmJi8l6w+eASG/rZEdED
 kG8g8pfcoDPbnwMU9vgGqzc7Q4uqO3V7UtMkS5WJsk2rDnkcv4wdTeTciaBJ9/9VzS
 hXlxB7Fz/Gaog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b5CIJ9b5
Subject: [Buildroot] [PATCH 3/3] support/testing: add tio runtime test
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch series tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/12509867607
---
 DEVELOPERS                                |  1 +
 support/testing/tests/package/test_tio.py | 74 +++++++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 support/testing/tests/package/test_tio.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 1b27df9beb..fe9fbf5154 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2014,6 +2014,7 @@ F:	support/testing/tests/package/test_tcl.py
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
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
