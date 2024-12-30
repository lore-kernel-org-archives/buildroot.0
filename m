Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B26E77194
	for <buildroot@archiver.kernel.org>; Mon, 30 Dec 2024 20:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89CC581150;
	Mon, 30 Dec 2024 20:11:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rU3YrF41sbSa; Mon, 30 Dec 2024 20:11:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A4CB81153
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A4CB81153;
	Mon, 30 Dec 2024 20:11:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 250C3E0F
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 20:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1455D81150
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 20:11:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ktKnML21sJXU for <buildroot@buildroot.org>;
 Mon, 30 Dec 2024 20:11:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 246D181153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 246D181153
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 246D181153
 for <buildroot@buildroot.org>; Mon, 30 Dec 2024 20:11:25 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 35421B0054E;
 Mon, 30 Dec 2024 21:11:22 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Mon, 30 Dec 2024 21:11:03 +0100
Message-ID: <20241230201103.203055-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735589483;
 bh=rgFQFNE9H3wtXr/eUJf49NnNo3rnEpvNyDHu2Noyzxw=;
 h=From:To:Cc:Subject:Date:From;
 b=geu9Y7PUtEIKDYbjcAsrxH6EkCI4JbqBuG3HHuePa7MGWSpRmmWxpRrx6gABKe3mf
 1bba++P8alMOaH9KeUlkeUnaxWVcHKyDpPZLg1eg3ygATkRroC2P8uqcjcvpgsESwI
 iwWiv7vA1oNaIaWtPJA3bWGVkF5m/1vIo3wCZzcij93mDkRStgVPdAwES738+l7yJ2
 /yu+uYHsIwRNW5dkDiqPE5ukJ70FIE370lHIh1zokEvA7/GsvvAPEa8l7J7hVSgcp1
 EAS37tJtp71iyRj14OBvSmZclnD6n27AkChywdqKzI3BfSaKoRLmZos++6qYKKxCKm
 YYd+FNRt/jZag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=geu9Y7PU
Subject: [Buildroot] [PATCH 1/1] support/testing: new xxhash runtime test
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/8743934301
---
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_xxhash.py | 35 ++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 support/testing/tests/package/test_xxhash.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 4fb5ae023d..a5e273056d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2004,6 +2004,7 @@ F:	support/testing/tests/package/test_wine.py
 F:	support/testing/tests/package/test_xfsprogs.py
 F:	support/testing/tests/package/test_xfsprogs/
 F:	support/testing/tests/package/test_xvisor.py
+F:	support/testing/tests/package/test_xxhash.py
 F:	support/testing/tests/package/test_xz.py
 F:	support/testing/tests/package/test_z3.py
 F:	support/testing/tests/package/test_z3/
diff --git a/support/testing/tests/package/test_xxhash.py b/support/testing/tests/package/test_xxhash.py
new file mode 100644
index 0000000000..00e0f245fc
--- /dev/null
+++ b/support/testing/tests/package/test_xxhash.py
@@ -0,0 +1,35 @@
+import os
+
+import infra.basetest
+
+
+class TestXxHash(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_XXHASH=y
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
+        testfile = "data.bin"
+
+        # Check we can run the program.
+        self.assertRunOk("xxhsum --version")
+
+        # We create a test data file with random data.
+        cmd = f"dd if=/dev/urandom of={testfile} bs=1M count=1"
+        self.assertRunOk(cmd)
+
+        # For the three hash sizes, we compute the xxhash and check
+        # the integrity of the file.
+        for hsize in [32, 64, 128]:
+            hashfile = f"{testfile}.xxh{hsize}"
+            self.assertRunOk(f"xxh{hsize}sum {testfile} | tee {hashfile}")
+            self.assertRunOk(f"xxh{hsize}sum -c {hashfile}")
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
