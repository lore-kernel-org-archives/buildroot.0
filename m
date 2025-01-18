Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D326C02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 20:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 653B160793;
	Sat, 18 Jan 2025 20:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6koRdLaMuaF9; Sat, 18 Jan 2025 20:07:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE7A5607A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE7A5607A8;
	Sat, 18 Jan 2025 20:07:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CA3369
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 20:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A9EE848D8
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 20:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9hYsfdjfZnm for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 20:07:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 461DE848C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 461DE848C3
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 461DE848C3
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 20:07:12 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2E715B00539;
 Sat, 18 Jan 2025 21:07:08 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sat, 18 Jan 2025 21:06:59 +0100
Message-ID: <20250118200659.883230-1-ju.o@free.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737230830;
 bh=rgP7jViK9mr1UCQhjCaSBlZjM6in03q5XZ8pOuTv7nI=;
 h=From:To:Cc:Subject:Date:From;
 b=Se2tOWLm88dJt9PFxU6Su1Lhp112z3H7D92QzR38c9ha8G3ZXoJoi46KDYTIwK9/T
 mwDuHIc4ZQuncd7EM6/luLD4yIK0w22LD/YoMiYvQj8IK2bX8DEe5ZcybJpTn+iSiA
 mQvBN4ABWupWFRXuav/Vv/iqVUlBg+wq2SPP7582waC5ce7H20a6m8PTG+xduF+RaL
 JGlOU+LEFKs2nGtxwB3F3OsbxOncM+mdrhcKBGk538Oi0LWc4mRSjQsWUEQ4W8XDP2
 cm6JLbGBacV2JSjA9yIRWtUYaQOdtKOlCqHZz19RA+N3wUABuTyRF7qzNkwgs5nwER
 d2wcVnGd/UEbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Se2tOWLm
Subject: [Buildroot] [PATCH 1/1] support/testing: add lighttpd runtime test
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
 DEVELOPERS                                    |  1 +
 .../testing/tests/package/test_lighttpd.py    | 26 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 support/testing/tests/package/test_lighttpd.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 805b8215ec5..a526afa541c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1847,6 +1847,7 @@ F:	support/testing/tests/package/test_libcamera.py
 F:	support/testing/tests/package/test_libcamera/
 F:	support/testing/tests/package/test_libgpgme.py
 F:	support/testing/tests/package/test_libjxl.py
+F:	support/testing/tests/package/test_lighttpd.py
 F:	support/testing/tests/package/test_links.py
 F:	support/testing/tests/package/test_links/
 F:	support/testing/tests/package/test_lrzip.py
diff --git a/support/testing/tests/package/test_lighttpd.py b/support/testing/tests/package/test_lighttpd.py
new file mode 100644
index 00000000000..54dd68bcdae
--- /dev/null
+++ b/support/testing/tests/package/test_lighttpd.py
@@ -0,0 +1,26 @@
+import os
+
+import infra.basetest
+
+
+class TestLighttpd(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_LIGHTTPD=y
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
+
+        self.assertRunOk("lighttpd -v")
+        self.assertRunOk(f"echo '{msg}' > /var/www/index.html")
+        self.assertRunOk("wget http://localhost/index.html")
+        self.assertRunOk(f"grep -F '{msg}' index.html")
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
