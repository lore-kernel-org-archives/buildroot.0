Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2097ED10F20
	for <buildroot@archiver.kernel.org>; Wed, 26 Nov 2025 10:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3AA06136F;
	Wed, 26 Nov 2025 10:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RuoYRjdjfvng; Wed, 26 Nov 2025 10:20:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0512B60667
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0512B60667;
	Wed, 26 Nov 2025 10:20:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2BAC23F
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1ECC4071E
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z1YLx_OyZi08 for <buildroot@buildroot.org>;
 Wed, 26 Nov 2025 10:20:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=bastien.curutchet@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7329040711
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7329040711
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7329040711
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:20:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5E4C24E418E8
 for <buildroot@buildroot.org>; Wed, 26 Nov 2025 10:20:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 34F3760721;
 Wed, 26 Nov 2025 10:20:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6CF8C102F08DA; Wed, 26 Nov 2025 11:20:13 +0100 (CET)
Date: Wed, 26 Nov 2025 11:20:10 +0100
MIME-Version: 1.0
Message-Id: <20251126-rasdaemon-v1-2-38c590f3e591@bootlin.com>
References: <20251126-rasdaemon-v1-0-38c590f3e591@bootlin.com>
In-Reply-To: <20251126-rasdaemon-v1-0-38c590f3e591@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Fiona Klute <fiona.klute@gmx.de>, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1764152413; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=mAkN4YbgclbdaAavsrcXtVk5WYSinCMofCMWT9a7f64=;
 b=eD+KySkuIgrQNz1TeG4RkDw/JbgApVvm1SnXjh4w5Ht6mtK4HptCgpD0nYZiYuYny5CYNf
 jZ9o+fG/9i6ngIazCCkBFc9qyiLL4zukurEeIOE+XjUO5DRSOZYxlX3r4M8O7xJ5xj4rGI
 3rdNs5k4KMiPssple4fOPuve5Ur+BudEYM6NpTjasGUsc2H2eiUkpbZ4w662qprLjhmwJN
 4cJuWXYUuUawxPXu4C9EFpaogKdnXd3l83yr952tgHBmnc9wyGD96NK/ekFbrS3ul9tji8
 DIw6Btdvz9Hh2cKpjvyvyJRLw/wUtgwJFwWQ17J1AdjTrf3bfmns5bzyRl5E6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=eD+KySku
Subject: [Buildroot] [PATCH 2/2] support/testing: add rasdaemon tests
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
From: Bastien Curutchet via buildroot <buildroot@buildroot.org>
Reply-To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rasdaemon was added in previous patch.

Add a test_rasdaemon that allows to build-test it. The test only
consists of getting rasdaemon's version.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 DEVELOPERS                                      |  1 +
 support/testing/tests/package/test_rasdaemon.py | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b1ead6d26c4e8ff160bcc7ed85b0945ac5e551dc..c9aaa8c9c8aa3d54c930476d9d450e7f990d9aac 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -343,6 +343,7 @@ F:	package/uhubctl/
 
 N:	Bastien Curutchet <bastien.curutchet@bootlin.com>
 F:	package/rasdaemon/
+F:	support/testing/tests/package/test_rasdaemon.py
 
 N:	Baxiche Su <baxiche@gmail.com>
 F:	package/qt6/qt6multimedia/
diff --git a/support/testing/tests/package/test_rasdaemon.py b/support/testing/tests/package/test_rasdaemon.py
new file mode 100644
index 0000000000000000000000000000000000000000..ccc3fcf1cbf3821d2408e2692769166e838088dd
--- /dev/null
+++ b/support/testing/tests/package/test_rasdaemon.py
@@ -0,0 +1,25 @@
+import os
+
+import infra.basetest
+
+
+class TestRasdaemon(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+        """
+        BR2_PACKAGE_RASDAEMON=y
+        BR2_PACKAGE_RASDAEMON_AER=y
+        BR2_PACKAGE_LIBTRACEEVENT=y
+        BR2_PACKAGE_SQLITE=y
+        BR2_PACKAGE_PCIUTILS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self):
+        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
+        self.emulator.boot(arch="armv7",
+                           kernel="builtin",
+                           options=["-initrd", cpio_file])
+        self.emulator.login()
+
+        self.assertRunOk("/usr/sbin/rasdaemon --version")

-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
