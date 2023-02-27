Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5881EC64ED8
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 20:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7B286108C;
	Mon, 27 Feb 2023 20:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7B286108C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6wB6TOh9OfAW; Mon, 27 Feb 2023 20:53:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14A2561084;
	Mon, 27 Feb 2023 20:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14A2561084
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6BFEC1BF36F
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 20:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45F1261084
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 20:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45F1261084
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sXLV9shmAbj8 for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 20:53:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 042A760EA7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 042A760EA7
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 20:53:46 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.130.14])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id AE7D419F576;
 Mon, 27 Feb 2023 21:53:41 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 21:53:33 +0100
Message-Id: <20230227205334.497405-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1677531224;
 bh=593TepdZFzD0vJQzlfRN5RgI/LEOKacUVCXygQmonFs=;
 h=From:To:Cc:Subject:Date:From;
 b=MUr8Wzgu6N+lmyVY/lVRcXkBSzD2KipJbuguqBb+Nje6N7zBUnRn+6zs40gyeJB0w
 AeF1LsMtAUPTxqQ2a2Ft9Yp17IueZ7TXb1hSuQBK1wPBDEwx2z+Nz0zizUwq3fwBC3
 3Ne6gH4KDIFP0l5k4g8Zdbh5rD5Xw6OdWoQmYYqVIb4Y/gLVsDQnjElCwCFJQf1Da8
 Fu8zka3ko0l9QAJyprgwrJwg+K0GPZpBcgfkhgqYetmFP6M7X+3yvB9O/Bi+lk96Yt
 lECTfFNfE6QFcjwb+nMb5NVvz6+NbS1Im8S/lt2r1T/NDQr7/yQ3phNZQE9b1L0RU3
 rztJbZqNEK4vQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MUr8Wzgu
Subject: [Buildroot] [PATCH next 1/2]
 support/testing/tests/package/test_stress_ng.py: new runtime test
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
Cc: Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on top of branch next at commit b793f3a with command:

    python3 -m flake8 support/testing/tests/package/test_stress_ng.py
    [no-output]
---
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_stress_ng.py   | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 support/testing/tests/package/test_stress_ng.py

diff --git a/DEVELOPERS b/DEVELOPERS
index d052e59122..f00614468f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1732,6 +1732,7 @@ F:	support/testing/tests/package/test_python_pyalsa.py
 F:	support/testing/tests/package/test_python_spake2.py
 F:	support/testing/tests/package/test_rdma_core.py
 F:	support/testing/tests/package/test_rdma_core/
+F:	support/testing/tests/package/test_stress_ng.py
 F:	support/testing/tests/package/test_z3.py
 F:	support/testing/tests/package/test_z3/
 
diff --git a/support/testing/tests/package/test_stress_ng.py b/support/testing/tests/package/test_stress_ng.py
new file mode 100644
index 0000000000..12fd6ec9e6
--- /dev/null
+++ b/support/testing/tests/package/test_stress_ng.py
@@ -0,0 +1,22 @@
+import os
+
+import infra.basetest
+
+
+class TestStressNG(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_STRESS_NG=y
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
+        self.assertRunOk("stress-ng --version")
+        self.assertRunOk("stress-ng --cpu 1 --timeout 3")
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
