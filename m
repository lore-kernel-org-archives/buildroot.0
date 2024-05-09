Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C7AC25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 19:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D419241FB2;
	Thu,  9 May 2024 19:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OVgy38Z9NS2g; Thu,  9 May 2024 19:38:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B220741F9B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B220741F9B;
	Thu,  9 May 2024 19:38:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4398B1BF2EC
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 19:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38DAB83F97
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 19:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WSDwLh9Mk7J6 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 19:38:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6521B83F44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6521B83F44
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6521B83F44
 for <buildroot@buildroot.org>; Thu,  9 May 2024 19:38:06 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0E557B0051E;
 Thu,  9 May 2024 21:38:01 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu,  9 May 2024 21:37:37 +0200
Message-ID: <20240509193737.168634-2-ju.o@free.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240509193737.168634-1-ju.o@free.fr>
References: <20240509193737.168634-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715283484;
 bh=yX0e6f0UUnZ4PaOo07NXDPjhlzcH5c22YaGSpdJENm0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T/WbokPIPdKxDH83GPmkpV9YOrrf8jrR7ehfDjRZ0QK9wiWd/g8gIXMLzSLvP/XMj
 nEM2uocbXQ4cymeglF92nnURKaeGAkyFC2zKPOGLMIvl4qETEyiHNNK0KX3utIURLZ
 5074AH4CiSjS2bvDcOvUqFYZMwDclCnlBdzH9lpJAt+Xwlao/EvZfaJDM6qfYnz+1d
 dura7oBOA2cOBBeKrb83Wgh8hZLbvJfh6idrNsC5HbpbipfsCg0B2mnzVcUqbcRkX1
 W3S44wzOf7jVhumD8ZmMMqCAGtokgq56LptDx7o0tXesTIGuVEXlv/3nL39BfQNJbV
 mkUSf0otdT8AA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T/WbokPI
Subject: [Buildroot] [PATCH 2/2] support/testing: add zbar runtime test
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
Cc: Julien Olivain <ju.o@free.fr>, Volkov Viacheslav <sv99@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 1223c11 with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_zbar
    ...
    OK
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_zbar.py | 37 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 support/testing/tests/package/test_zbar.py

diff --git a/DEVELOPERS b/DEVELOPERS
index ce0c7d62ded..b60321f01fa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1900,6 +1900,7 @@ F:	support/testing/tests/package/test_wine.py
 F:	support/testing/tests/package/test_xz.py
 F:	support/testing/tests/package/test_z3.py
 F:	support/testing/tests/package/test_z3/
+F:	support/testing/tests/package/test_zbar.py
 F:	support/testing/tests/package/test_zchunk.py
 F:	support/testing/tests/package/test_zstd.py
 
diff --git a/support/testing/tests/package/test_zbar.py b/support/testing/tests/package/test_zbar.py
new file mode 100644
index 00000000000..b840df089af
--- /dev/null
+++ b/support/testing/tests/package/test_zbar.py
@@ -0,0 +1,37 @@
+import os
+
+import infra.basetest
+
+
+class TestZbar(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_IMAGEMAGICK=y
+        BR2_PACKAGE_LIBQRENCODE=y
+        BR2_PACKAGE_LIBQRENCODE_TOOLS=y
+        BR2_PACKAGE_ZBAR=y
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
+        txt_msg = "Hello Buildroot!"
+        qr_img = "qr.png"
+
+        # We check the program can execute.
+        self.assertRunOk("zbarimg --version")
+
+        # We generate a QR code image containing a message.
+        self.assertRunOk(f"qrencode -o '{qr_img}' '{txt_msg}'")
+
+        # We decode the QR code image and check the extracted message
+        # is the expected one.
+        out, ret = self.emulator.run(f"zbarimg -q --raw {qr_img}")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], txt_msg)
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
