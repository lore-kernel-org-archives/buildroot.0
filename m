Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5933FC4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 19:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C8E560BD5;
	Fri, 12 Jan 2024 19:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C8E560BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F3f_kWK1RpBW; Fri, 12 Jan 2024 19:46:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C87460B49;
	Fri, 12 Jan 2024 19:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C87460B49
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B7411BF489
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 19:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 646BC83FE1
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 19:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 646BC83FE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZubWOA_92H6V for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 19:46:41 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5443183FB4
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 19:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5443183FB4
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EB81D13F8BA;
 Fri, 12 Jan 2024 20:46:36 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 20:46:26 +0100
Message-ID: <20240112194627.112457-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705088798;
 bh=kiyzzuqpK3AlNw/rOggObSzMEhH+UAdpvSme4xM8FNA=;
 h=From:To:Cc:Subject:Date:From;
 b=B/M+3rUr4BWpO2ZT9+EOA/EwhnmL9DR7pwhbr0Y08bM8XJbXi3cF/mBJ6RLoAdUlu
 03tx7CJZ043aFR2ujGG6PfjQxLxFIqtranHQVX86JqmMha8cwyrbHrOYJjgzNlVAzt
 PBSW0iGKfsQXzXQeN0N7pPd9K74RXiw2/AC1/w4fdT7pcryfwl8Bevh3qh59HtwWGH
 Y96ISW8JAC2IJjPenZATRvVwhTczKx9m0YzMinwl1VcyOGzuWGDlwguLC0y8GLANYx
 NyZG3BeOPnJttgIXPvD4aSM1IA4o4NPZoX5LaR7cguY7CfiSNazae5XTusKRyVzjH9
 mDAA6Kpprikwg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B/M+3rUr
Subject: [Buildroot] [PATCH 1/1] support/testing: new apache runtime test
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
 support/testing/tests/package/test_apache.py | 23 ++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 support/testing/tests/package/test_apache.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 94a89c63d5..11780db285 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1759,6 +1759,7 @@ F:	support/testing/tests/package/sample_python_pyalsa.py
 F:	support/testing/tests/package/sample_python_spake2.py
 F:	support/testing/tests/package/test_acpica.py
 F:	support/testing/tests/package/test_acpica/
+F:	support/testing/tests/package/test_apache.py
 F:	support/testing/tests/package/test_brotli.py
 F:	support/testing/tests/package/test_bzip2.py
 F:	support/testing/tests/package/test_compressor_base.py
diff --git a/support/testing/tests/package/test_apache.py b/support/testing/tests/package/test_apache.py
new file mode 100644
index 0000000000..f29f4e2524
--- /dev/null
+++ b/support/testing/tests/package/test_apache.py
@@ -0,0 +1,23 @@
+import os
+
+import infra.basetest
+
+
+class TestApache(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_APACHE=y
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
+        self.assertRunOk("httpd -V")
+        self.assertRunOk("wget http://localhost/index.html")
+        self.assertRunOk("grep -F 'It works!' index.html")
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
