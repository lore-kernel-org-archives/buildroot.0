Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98932CFB43F
	for <buildroot@archiver.kernel.org>; Sat,  5 Oct 2024 22:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E1198126D;
	Sat,  5 Oct 2024 22:58:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ucdi9g4ey313; Sat,  5 Oct 2024 22:58:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39C2081274
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39C2081274;
	Sat,  5 Oct 2024 22:58:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 590C61BF5A7
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 22:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 541734050A
 for <buildroot@lists.busybox.net>; Sat,  5 Oct 2024 22:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y3qRT1YS3kbD for <buildroot@lists.busybox.net>;
 Sat,  5 Oct 2024 22:58:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BD8F94018A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD8F94018A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BD8F94018A
 for <buildroot@buildroot.org>; Sat,  5 Oct 2024 22:58:39 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 44FBBB00548;
 Sun,  6 Oct 2024 00:58:32 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  6 Oct 2024 00:58:08 +0200
Message-ID: <20241005225808.903365-2-ju.o@free.fr>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241005225808.903365-1-ju.o@free.fr>
References: <20241005225808.903365-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1728169117;
 bh=3KPePN/0vljq89mKG+HOYLz/OmckVZdnPEKSxsA7rs0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ik1vAwfBzIeNsmteoVf+aBNV07/buwzSNPf4SS48bRP3GFhz0j8dpoWyu0ScnQiSt
 ZWQTeNBtVQ788BbUeMY+i8nlkPMaRC7g56+cIyal0UG7je7NV8ldQ+iRECa/wB6Why
 EY2oIENF7TI/SS+Uknh0iT+KqxfrFvkF1ALnzaqyxHyGr5JZAGy9oQrw3cuLLuZNQM
 TqNzGUp9mUwbxvuEQZzDuPE0xCgwVlTEBWq/s2x5Z7YmimKtuwlxfpgAqQu9DZFSNX
 E+e2JPiEjdO0JeuofhCyx9VnNPgipRtdFyLPGt9S1LPieGYJ9PuEysQvldAnnGoJH5
 D7B31EY+6WcMw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ik1vAwfB
Subject: [Buildroot] [PATCH v2 2/2] support/testing: add oath-toolkit
 runtime test
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
Cc: Julien Olivain <ju.o@free.fr>, Gilles Talis <gilles.talis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                    |  1 +
 .../tests/package/test_oath_toolkit.py        | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 support/testing/tests/package/test_oath_toolkit.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 8c20c329ea..ac19704923 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1959,6 +1959,7 @@ F:	support/testing/tests/package/test_ntp.py
 F:	support/testing/tests/package/test_ntp/
 F:	support/testing/tests/package/test_numactl.py
 F:	support/testing/tests/package/test_numactl/
+F:	support/testing/tests/package/test_oath_toolkit.py
 F:	support/testing/tests/package/test_octave.py
 F:	support/testing/tests/package/test_ola.py
 F:	support/testing/tests/package/test_ola/
diff --git a/support/testing/tests/package/test_oath_toolkit.py b/support/testing/tests/package/test_oath_toolkit.py
new file mode 100644
index 0000000000..92c0845614
--- /dev/null
+++ b/support/testing/tests/package/test_oath_toolkit.py
@@ -0,0 +1,38 @@
+import os
+
+import infra.basetest
+
+
+class TestOathToolKit(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_OATH_TOOLKIT=y
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
+        self.assertRunOk("oathtool --version")
+
+        # Test commands and expected results are coming from examples
+        # producing stable/reproducible outputs given in the oathtool
+        # manual page. See:
+        # https://www.nongnu.org/oath-toolkit/oathtool.1.html
+
+        tests = [
+            ("echo 00 | oathtool -", "328482"),
+            ("oathtool -c 5 3132333435363738393031323334353637383930", "254676"),
+            ("oathtool -w 10 3132333435363738393031323334353637383930 969429", "3"),
+            ("oathtool --totp --now \"2008-04-23 17:42:17 UTC\" 00", "974945")
+        ]
+
+        for cmd, expected_out in tests:
+            out, ret = self.emulator.run(cmd)
+            self.assertEqual(ret, 0, f"Failed to run '{cmd}'")
+            self.assertEqual(expected_out, out[0])
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
