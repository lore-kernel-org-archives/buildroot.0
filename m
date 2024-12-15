Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36EFE7716A
	for <buildroot@archiver.kernel.org>; Sun, 15 Dec 2024 21:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45DD08460B;
	Sun, 15 Dec 2024 21:22:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lxGfEALAR2hM; Sun, 15 Dec 2024 21:22:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4129484821
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4129484821;
	Sun, 15 Dec 2024 21:22:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E17FCDD
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 21:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB5DB8460B
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 21:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ODwRYwe077D for <buildroot@buildroot.org>;
 Sun, 15 Dec 2024 21:22:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8435884821
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8435884821
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8435884821
 for <buildroot@buildroot.org>; Sun, 15 Dec 2024 21:22:04 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 673E3B00585;
 Sun, 15 Dec 2024 22:22:00 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 15 Dec 2024 22:21:53 +0100
Message-ID: <20241215212153.1395727-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734297721;
 bh=BjUkCbv1kmZffo5ZTmcMXxhlkye2orFxNHHZXQNlcU8=;
 h=From:To:Cc:Subject:Date:From;
 b=OVeddTYh22D+rdJ3UeX4auVqEbDnqYK5KxjgwYOCJN2FFy2K5iJbA6x0JYZc5AHDK
 OZv7kDlOUHuoJSIzk2/jtzgeW5apWKVUExALFZIQFZKBEkzgqEte3cI6hPWlQircIA
 auzJKg0EljhjKWsRtK+ESUPCDRcgWEsGZXPnT3XTmVk0zIsMF+Z74HIaXCz7GsXFTO
 bnWhu0zj7mtCEnFYAWtrNu/YfNFaMqLqQCxzXLNkyuNtaiR1vIw557flm250m6nHZ+
 Csbln7quvMf/vk/ImaAXqXKOVTx6mwVGB/TFkfgVS84JypFlXLIcKRAVvLvzDKPjCH
 k5Cf0UCDrDV3A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=OVeddTYh
Subject: [Buildroot] [PATCH 1/1] support/testing: add libcurl runtime test
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
https://gitlab.com/jolivain/buildroot/-/jobs/8648396262
---
 DEVELOPERS                                    |  1 +
 support/testing/tests/package/test_libcurl.py | 55 +++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 support/testing/tests/package/test_libcurl.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 047dc4a88f..ad84a6e21b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1913,6 +1913,7 @@ F:	support/testing/tests/package/test_lame.py
 F:	support/testing/tests/package/test_less.py
 F:	support/testing/tests/package/test_libcamera.py
 F:	support/testing/tests/package/test_libcamera/
+F:	support/testing/tests/package/test_libcurl.py
 F:	support/testing/tests/package/test_libgpgme.py
 F:	support/testing/tests/package/test_libjxl.py
 F:	support/testing/tests/package/test_links.py
diff --git a/support/testing/tests/package/test_libcurl.py b/support/testing/tests/package/test_libcurl.py
new file mode 100644
index 0000000000..b326f9308f
--- /dev/null
+++ b/support/testing/tests/package/test_libcurl.py
@@ -0,0 +1,55 @@
+import os
+
+import infra.basetest
+
+
+class TestLibCurl(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_LIBCURL=y
+        BR2_PACKAGE_LIBCURL_CURL=y
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
+        # We check the program can execute.
+        self.assertRunOk("curl --version")
+
+        # We create a simple file to serve.
+        self.assertRunOk(f"echo '{msg}' > /var/www/data/{fname}")
+
+        # We try to download that file, using our local httpd server.
+        self.assertRunOk(f"curl -o {fname} {url}")
+
+        # We check the downloaded file contains our initial message.
+        out, ret = self.emulator.run(f"cat {fname}")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
+
+        # We download again the file without saving it, but printing
+        # it on stdout this time.
+        out, ret = self.emulator.run(f"curl -q {url}")
+        self.assertEqual(ret, 0)
+        self.assertEqual(out[0], msg)
+
+        # We download one last time, showing the server response. We
+        # check we can see the OK status and our thttpd server
+        # identification.
+        cmd = f"curl --no-progress-meter --dump-header - -o /dev/null {url}"
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
