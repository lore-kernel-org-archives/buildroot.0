Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15A8E7717F
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 20:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F66F41615;
	Thu, 12 Dec 2024 20:25:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QRxPWsE7IWfv; Thu, 12 Dec 2024 20:25:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D8594160A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D8594160A;
	Thu, 12 Dec 2024 20:25:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A81F2114A
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 20:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76FC1431FD
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 20:24:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JxpnlzffIrEB for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 20:24:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 29F0F400B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29F0F400B5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29F0F400B5
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 20:24:57 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 86B57B0060D;
 Thu, 12 Dec 2024 21:24:53 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Thu, 12 Dec 2024 21:24:47 +0100
Message-ID: <20241212202447.42524-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734035094;
 bh=gTfGQ+iEFBKJNpZfyv15mKICcLtTf1ULyNAlVye0iLE=;
 h=From:To:Cc:Subject:Date:From;
 b=fQp/NLzsmLJWGcxInLIwbgjLfjzUXIAl5tjy1kAD8JXxUJdItvPW00KkyMd/h5OBL
 1ChKCr4laJB4c7oNFRjZBEXURMesc1360CLa1PyaYoz9ksWS/ZYbQS0kJ9KQgL5HSO
 gSuIdZf1iUlXdnSfFro5Pd1UmIw3g96KvXKN9Dd5gXdxw15BVlUgXapxXYwQooT/28
 xpOosyE8nvgaWbeGMPKqNrJODItaSBNA/l47/+KDPwHin0Vd8jrnHvw8S6H6vUqZqC
 2Qym8aeKWEMgfMyEUdSYmSl0d2Btnh38t9QQewO6dlHuK8t7uAmc3CndSJjHRarMY3
 I6aRkzWW2PtxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fQp/NLzs
Subject: [Buildroot] [PATCH 1/1] support/testing: new wget runtime test
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
https://gitlab.com/jolivain/buildroot/-/jobs/8627864865
---
 DEVELOPERS                                 |  1 +
 support/testing/tests/package/test_wget.py | 57 ++++++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 support/testing/tests/package/test_wget.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 047dc4a88f..b2fea6e0b1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2001,6 +2001,7 @@ F:	support/testing/tests/package/test_usbutils/
 F:	support/testing/tests/package/test_vorbis_tools.py
 F:	support/testing/tests/package/test_weston.py
 F:	support/testing/tests/package/test_weston/
+F:	support/testing/tests/package/test_wget.py
 F:	support/testing/tests/package/test_which.py
 F:	support/testing/tests/package/test_wine.py
 F:	support/testing/tests/package/test_xfsprogs.py
diff --git a/support/testing/tests/package/test_wget.py b/support/testing/tests/package/test_wget.py
new file mode 100644
index 0000000000..c121cbd21c
--- /dev/null
+++ b/support/testing/tests/package/test_wget.py
@@ -0,0 +1,57 @@
+import os
+
+import infra.basetest
+
+
+class TestWget(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+        BR2_PACKAGE_WGET=y
+        BR2_PACKAGE_THTTPD=y
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
+        msg = "Hello Buildroot!"
+        fname = "file.txt"
+        url = f"http://localhost/{fname}"
+
+        # We check the program can execute. This also checks we have
+        # the GNU wget version, rather than the BusyBox version which
+        # does not know the --version option.
+        self.assertRunOk("wget --version")
+
+        # We create a simple file to serve.
+        self.assertRunOk(f"echo '{msg}' > /var/www/data/{fname}")
+
+        # We try to download that file, using our local httpd server.
+        self.assertRunOk(f"wget --progress=dot {url}")
+
+        # We check the downloaded file contains our initial message.
+        out, ret = self.emulator.run(f"cat {fname}")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
+
+        # We download again the file without saving it, but printing
+        # it on stdout this time.
+        out, ret = self.emulator.run(f"wget -q -O - {url}")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
+
+        # We download one last time, showing the server response. We
+        # check we can see the OK status and our thttpd server
+        # identification.
+        cmd = f"wget --no-verbose --server-response -O /dev/null {url}"
+        out, ret = self.emulator.run(cmd)
+        self.assertEqual(ret, 0)
+        out_str = "\n".join(out)
+        self.assertIn("HTTP/1.1 200 OK", out_str)
+        self.assertIn("Server: thttpd/", out_str)
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
