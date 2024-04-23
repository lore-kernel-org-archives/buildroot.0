Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBA6C4345F
	for <buildroot@archiver.kernel.org>; Tue, 23 Apr 2024 17:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2392A40191;
	Tue, 23 Apr 2024 17:11:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jCyZ6yfLrXf3; Tue, 23 Apr 2024 17:11:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEA15401E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEA15401E4;
	Tue, 23 Apr 2024 17:11:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C7B441BF3AA
 for <buildroot@lists.busybox.net>; Tue, 23 Apr 2024 17:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4224401E4
 for <buildroot@lists.busybox.net>; Tue, 23 Apr 2024 17:11:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ngJU5UKUoEnf for <buildroot@lists.busybox.net>;
 Tue, 23 Apr 2024 17:11:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6CEB140191
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CEB140191
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CEB140191
 for <buildroot@buildroot.org>; Tue, 23 Apr 2024 17:11:34 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C465DB0054E;
 Tue, 23 Apr 2024 19:11:26 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 23 Apr 2024 19:11:18 +0200
Message-ID: <20240423171118.230359-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1713892287;
 bh=E6ATcMt4jKvUJ2Z00xvQcYJv80vMebSL8yALFclgwrE=;
 h=From:To:Cc:Subject:Date:From;
 b=H/G4U5m12v7LxBmN6QHtCX8PVEOpup+8dPRiSsl53+x/18/sr1x73+ZsmGMQdtwZi
 vBl6KOv/QuiajnCR+3EFxz5sYghXjTmksBP5mWuFLTbMsVIIRJaiJFp5c231KF3vh7
 lo4YLWT1rHD487YHmvzkgxaF2S5JfV1QenSOmpkR2Fd01uCDT7Y29PO4RY69HLuWa/
 yHe8anP27TgYwuwPGJdtZ7tc3wwrOvpwdVdatt6CS1Zh2fUQX1Te87FJFR0UyUJWd7
 yXjyGsl6tPQ4/bxm9icvoDlY0jMsAXDn/cr2i0JO6US92pU3IarCO2kgvNjSTqKqmj
 v3lot7aVJV4aA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=H/G4U5m1
Subject: [Buildroot] [PATCH 1/1] support/testing: add socat runtime test
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
 DEVELOPERS                                  |  1 +
 support/testing/tests/package/test_socat.py | 56 +++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 support/testing/tests/package/test_socat.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 399b2931ff3..104588136f2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1857,6 +1857,7 @@ F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
 F:	support/testing/tests/package/test_screen.py
 F:	support/testing/tests/package/test_sed.py
+F:	support/testing/tests/package/test_socat.py
 F:	support/testing/tests/package/test_sox.py
 F:	support/testing/tests/package/test_sqlite.py
 F:	support/testing/tests/package/test_strace.py
diff --git a/support/testing/tests/package/test_socat.py b/support/testing/tests/package/test_socat.py
new file mode 100644
index 00000000000..67b32448435
--- /dev/null
+++ b/support/testing/tests/package/test_socat.py
@@ -0,0 +1,56 @@
+import os
+import time
+
+import infra.basetest
+
+
+class TestSoCat(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_NETCAT=y
+        BR2_PACKAGE_SOCAT=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        # Some values, for the test.
+        msg = "Hello Buildroot!"
+        out_file = "output.txt"
+        port1 = 11111
+        port2 = 22222
+
+        # Check the program can execute.
+        self.assertRunOk("socat -V")
+
+        # We start the receiver netcat on tcp/port2.
+        cmd = f"nc -n -l -p {port2} > {out_file} 2> /dev/null &"
+        self.assertRunOk(cmd)
+
+        time.sleep(2 * self.timeout_multiplier)
+
+        # We start socat in background to listen on tcp/port1 and
+        # forward to tcp/port2.
+        cmd = f"socat TCP4-LISTEN:{port1} TCP4:127.0.0.1:{port2} &"
+        self.assertRunOk(cmd)
+
+        time.sleep(2 * self.timeout_multiplier)
+
+        # We write a message on tcp/port1. Socat is expected to
+        # forward the message to the receiver on tcp/port2, and write
+        # our message in a file.
+        cmd = f"echo '{msg}' | nc -n -c 127.0.0.1 {port1}"
+        self.assertRunOk(cmd)
+
+        # We check the output file contains our message.
+        cmd = f"cat {out_file}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
