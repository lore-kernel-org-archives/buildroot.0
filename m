Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5378C4345F
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 21:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86CC681272;
	Thu, 11 Apr 2024 21:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OOByTTKiJnTB; Thu, 11 Apr 2024 21:39:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83E70812FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83E70812FA;
	Thu, 11 Apr 2024 21:39:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB8321BF393
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 21:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8638404E7
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 21:39:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3F-QSutTmCS for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 21:39:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9DB364049A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DB364049A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9DB364049A
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 21:39:49 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8B58CB0051B;
 Thu, 11 Apr 2024 23:39:45 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 23:39:40 +0200
Message-ID: <20240411213940.91282-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712871586;
 bh=hZIn/AKcxTS0erEhuf5vRJE+dbQaGB1XSm1EfB4FRsQ=;
 h=From:To:Cc:Subject:Date:From;
 b=p+EMPc7ckAY4wWMUmVspQm2SV6xCgaHx+2PcRYXDHounU6U8nBN+eTXk7ul9H1JLx
 Au7YEFv25j40L8LKrRWDKDDUcRql/0CuAj+NVFBukbVu9VoSOiXo/bvIf9zN+mHred
 podU2HRL//2C0K2N+CEfqnr21a3lZfBzLPZyN9KMzm8Lmy7vj5NABkyweyo5vsXsW4
 2vUPgjd7iGNOmlnzdfbivJ+uH5UNuCfcwxPrYFT3qlouzg497CDKyKtSG/kkBJZ757
 v2fI8i/bztqsEE5rCNSpzMg9FqfTtkSf7gxhKccqR/jpQ9zDS6dWequhAgdsBlooml
 KrlvHwzI0mHTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p+EMPc7c
Subject: [Buildroot] [PATCH 1/1] support/testing: add links runtime test
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
 DEVELOPERS                                    |  2 ++
 support/testing/tests/package/test_links.py   | 33 +++++++++++++++++++
 .../test_links/rootfs-overlay/root/file.html  |  9 +++++
 3 files changed, 44 insertions(+)
 create mode 100644 support/testing/tests/package/test_links.py
 create mode 100644 support/testing/tests/package/test_links/rootfs-overlay/root/file.html

diff --git a/DEVELOPERS b/DEVELOPERS
index 399b2931ff3..9001632cfa3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1815,6 +1815,8 @@ F:	support/testing/tests/package/test_libcamera.py
 F:	support/testing/tests/package/test_libcamera/
 F:	support/testing/tests/package/test_libgpgme.py
 F:	support/testing/tests/package/test_libjxl.py
+F:	support/testing/tests/package/test_links.py
+F:	support/testing/tests/package/test_links/
 F:	support/testing/tests/package/test_lrzip.py
 F:	support/testing/tests/package/test_ltrace.py
 F:	support/testing/tests/package/test_lvm2.py
diff --git a/support/testing/tests/package/test_links.py b/support/testing/tests/package/test_links.py
new file mode 100644
index 00000000000..ed52bb2d5fc
--- /dev/null
+++ b/support/testing/tests/package/test_links.py
@@ -0,0 +1,33 @@
+import os
+
+import infra.basetest
+
+
+class TestLinks(infra.basetest.BRTest):
+    rootfs_overlay = \
+        infra.filepath("tests/package/test_links/rootfs-overlay")
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        f"""
+        BR2_PACKAGE_LINKS=y
+        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
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
+        self.assertRunOk("links -version")
+
+        expected_str = "Hello Buildroot !"
+        html_file = "/root/file.html"
+        url = f"file://{html_file}"
+
+        cmd = f"links -dump {url}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0].strip(), expected_str)
diff --git a/support/testing/tests/package/test_links/rootfs-overlay/root/file.html b/support/testing/tests/package/test_links/rootfs-overlay/root/file.html
new file mode 100644
index 00000000000..65b33cb5a7d
--- /dev/null
+++ b/support/testing/tests/package/test_links/rootfs-overlay/root/file.html
@@ -0,0 +1,9 @@
+<!DOCTYPE html>
+<html lang="en">
+  <head>
+    <title>Buildroot Test Page</title>
+  </head>
+  <body>
+    <p><b>Hello</b> <i>Buildroot</i> &excl;</p>
+  </body>
+</html>
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
