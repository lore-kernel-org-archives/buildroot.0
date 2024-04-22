Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC383C4345F
	for <buildroot@archiver.kernel.org>; Mon, 22 Apr 2024 22:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43766402CA;
	Mon, 22 Apr 2024 22:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9STQe9jYL1Mn; Mon, 22 Apr 2024 22:06:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA7D440543
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA7D440543;
	Mon, 22 Apr 2024 22:06:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 55AFF1BF346
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 22:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F2EB607FF
 for <buildroot@lists.busybox.net>; Mon, 22 Apr 2024 22:06:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id epoFZhpqIlFd for <buildroot@lists.busybox.net>;
 Mon, 22 Apr 2024 22:06:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 11BBD606FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11BBD606FF
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11BBD606FF
 for <buildroot@buildroot.org>; Mon, 22 Apr 2024 22:06:44 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2D726B0054E;
 Tue, 23 Apr 2024 00:06:39 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 23 Apr 2024 00:06:32 +0200
Message-ID: <20240422220632.506366-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1713823601;
 bh=JTkPDmTpPVUVDstEDrCbbMBMckkczCUK2prh0TxxgiI=;
 h=From:To:Cc:Subject:Date:From;
 b=tSXuEkrwsldsZ+ACOy+vHfBsVHGUfbAHCog6e6ioCNorpd8UAN2IXR+CunHdJawYg
 w+4e/31++YAXAbNdn9BPgRkW7mSfwh/4o53HEiCzFcfbGPKJahikD9Bw4PQxjz0aCt
 C5s0kgV2DnZ3W/LqYALb+5VqUw/o+QEMnVp02kAgHwvHBjEju+qIWxseFIHwLN1n3N
 5QTFhMqKvod7FglupRXvtj8f75A9TCTW8OAGU2Rvhzp5Is1BBhFQkBBV7G3W2FF4SJ
 xNz4LF3ORyxwfwCqq1GtiGEbpnncPpd00ERf309NSeZESXbdQCr70en+un51tOE3GB
 XMCA54td+q1RA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tSXuEkrw
Subject: [Buildroot] [PATCH 1/1] support/testing: add lrzsz runtime test
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
 support/testing/tests/package/test_lrzsz.py | 42 +++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 support/testing/tests/package/test_lrzsz.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 399b2931ff3..95842c28285 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1816,6 +1816,7 @@ F:	support/testing/tests/package/test_libcamera/
 F:	support/testing/tests/package/test_libgpgme.py
 F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_lrzip.py
+F:	support/testing/tests/package/test_lrzsz.py
 F:	support/testing/tests/package/test_ltrace.py
 F:	support/testing/tests/package/test_lvm2.py
 F:	support/testing/tests/package/test_lvm2/
diff --git a/support/testing/tests/package/test_lrzsz.py b/support/testing/tests/package/test_lrzsz.py
new file mode 100644
index 00000000000..23b4cdc531f
--- /dev/null
+++ b/support/testing/tests/package/test_lrzsz.py
@@ -0,0 +1,42 @@
+import os
+
+import infra.basetest
+
+
+class TestLrzsz(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_LRZSZ=y
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
+        fifo = "/tmp/return-fifo"
+        data_fname = "data"
+        data_path = f"/tmp/{data_fname}"
+
+        # We check a program can execute.
+        self.assertRunOk("sz --version")
+
+        # We create a data file, to be transferred.
+        cmd = f"dd if=/dev/urandom of={data_path} bs=1M count=1"
+        self.assertRunOk(cmd)
+
+        # We create a fifo, used as a return fifo.
+        self.assertRunOk(f"mkfifo {fifo}")
+
+        # We transfer the test data using ZMODEM over the pipe and our
+        # return fifo.
+        self.assertRunOk(f"sz {data_path} < {fifo} | rz > {fifo}")
+
+        # The rz command is supposed to have created the received file
+        # in the current directory. We expect the received data to be
+        # the same as the original input file.
+        self.assertRunOk(f"cmp {data_path} {data_fname}")
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
