Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CC8C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 20:13:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C369981F17;
	Tue,  6 Feb 2024 20:13:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SfrM-GlyMbNf; Tue,  6 Feb 2024 20:13:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B12D82C8E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B12D82C8E;
	Tue,  6 Feb 2024 20:13:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C23C21BF2B7
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 20:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFF5160FD6
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 20:13:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4OPrVNEXkikp for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 20:13:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CD82C60BEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD82C60BEE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD82C60BEE
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 20:13:17 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E899B13F879;
 Tue,  6 Feb 2024 21:13:14 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 21:13:10 +0100
Message-ID: <20240206201310.188097-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707250396;
 bh=ztAJ8pUubyb02iQozwMYZmd7FG0jqVY++MDM7PyteS4=;
 h=From:To:Cc:Subject:Date:From;
 b=URIbvSJU0wAlah7l0qXkEg44Wv2BAagI0Aqr/setLVLqtCquyQB8rPNntmOZWyuai
 TSi7ITpkr016dcsTHs3RQP/SV3C4SYYonEPHKk9cSBdzsOsC8NhdYsNHF/uqvCigJ4
 a6k7nUuYWiLXwegRSNDsT1x4/YJJJKATI3qpBEKsRkjCLYowJ4tgS5UIaNfeAwQDBE
 kalh3zQNVm9jqFT5cpprbKSdYQTk7OBgVonvSKWhPSEiWWL2/7GLVMebHepTDuK7xM
 XMTPrQoBheEt7o8L/Gad8qAlcKQtmoastYp2lIzA1ARz6XWPlRV677/fbdUMN5y6z5
 JAaWAckFvyS/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=URIbvSJU
Subject: [Buildroot] [PATCH 1/1] support/testing: add thttpd runtime test
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
 DEVELOPERS                                   |  1 +
 support/testing/tests/package/test_thttpd.py | 26 ++++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 support/testing/tests/package/test_thttpd.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 94a89c63d5..72add029b5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1814,6 +1814,7 @@ F:	support/testing/tests/package/test_screen.py
 F:	support/testing/tests/package/test_stress_ng.py
 F:	support/testing/tests/package/test_tcl.py
 F:	support/testing/tests/package/test_tcl/
+F:	support/testing/tests/package/test_thttpd.py
 F:	support/testing/tests/package/test_weston.py
 F:	support/testing/tests/package/test_weston/
 F:	support/testing/tests/package/test_xz.py
diff --git a/support/testing/tests/package/test_thttpd.py b/support/testing/tests/package/test_thttpd.py
new file mode 100644
index 0000000000..007bc91f2d
--- /dev/null
+++ b/support/testing/tests/package/test_thttpd.py
@@ -0,0 +1,26 @@
+import os
+
+import infra.basetest
+
+
+class TestThttpd(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
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
+
+        self.assertRunOk("thttpd -V")
+        self.assertRunOk(f"echo '{msg}' > /var/www/data/index.html")
+        self.assertRunOk("wget http://localhost/index.html")
+        self.assertRunOk(f"grep -F '{msg}' index.html")
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
