Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86DEC47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 12:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A7C083C1B;
	Sun,  7 Jan 2024 12:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A7C083C1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VNqLhQ4wZ8Iu; Sun,  7 Jan 2024 12:56:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADB3D83BB0;
	Sun,  7 Jan 2024 12:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADB3D83BB0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1C201BF310
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 12:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C81D883BB0
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 12:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C81D883BB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VZBH037BsWd3 for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 12:56:32 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6152783B94
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 12:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6152783B94
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AC0CC13F846;
 Sun,  7 Jan 2024 13:56:28 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  7 Jan 2024 13:56:21 +0100
Message-ID: <20240107125621.248063-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704632189;
 bh=ghB5/5oKHEG/hkVVfjIoJ4KbfvOHHrrW3zMWgQnBs3A=;
 h=From:To:Cc:Subject:Date:From;
 b=oz2vdaeEyTFImZbjmziUyRtm+qkiNxa22IcwNxdagzg0XHU/LFKiHLulM6vdd8Ly2
 tgOw4ZPTbz4TpigrN4Ey54wUnX0AVB8066UqpFCuDpKP1CLPwRJuOosCMowoHRMxoG
 xVppa2frjWdgJ6D6oeNcz0jqfgn0yKllD12XrhuYyYi0F5fbVZD4v5CuPSJtcfgQE5
 A4o1VY4Q4jJq2m6vWrGFuk31gMUJeDhlElb4w+T+vSp3Jmsx5baxys6aMM3YgVP9Go
 n2xH49T9LHIJdM85pvvtmOhccilBB/85vUF9hLRGSukpn/Yt+rlykPlGbA5MA3SNvB
 1JP+RlLwpIMiQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oz2vdaeE
Subject: [Buildroot] [PATCH 1/1] support/testing: add coremark test
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
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_coremark.py    | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 support/testing/tests/package/test_coremark.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d7543247f2..622986cc98 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1761,6 +1761,7 @@ F:	support/testing/tests/package/test_acpica/
 F:	support/testing/tests/package/test_brotli.py
 F:	support/testing/tests/package/test_bzip2.py
 F:	support/testing/tests/package/test_compressor_base.py
+F:	support/testing/tests/package/test_coremark.py
 F:	support/testing/tests/package/test_ddrescue.py
 F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_dos2unix.py
diff --git a/support/testing/tests/package/test_coremark.py b/support/testing/tests/package/test_coremark.py
new file mode 100644
index 0000000000..8bd2f32143
--- /dev/null
+++ b/support/testing/tests/package/test_coremark.py
@@ -0,0 +1,33 @@
+import os
+
+import infra.basetest
+
+
+class TestCoreMark(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_COREMARK=y
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
+        log_file = "run1.log"
+
+        # Run a CoreMark benchmark.
+        self.assertRunOk(f"coremark > {log_file}", timeout=60)
+
+        # Print the log file on console, for debugging.
+        self.assertRunOk(f"cat {log_file}")
+
+        # The "coremark" program return code is always 0 (success).
+        # So the correct execution is validated from the run log.
+        valid_msg = "Correct operation validated."
+        cmd = f"grep -F '{valid_msg}' {log_file}"
+        self.assertRunOk(cmd)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
