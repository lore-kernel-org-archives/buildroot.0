Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF978C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 20:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDCDA41558;
	Tue, 30 Apr 2024 20:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NAq8mv3PFYGf; Tue, 30 Apr 2024 20:47:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CD894155E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CD894155E;
	Tue, 30 Apr 2024 20:47:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D70DB1BF3E1
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 20:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC628402DC
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 20:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z_vdf2tunCyT for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 20:47:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 92318402F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92318402F8
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92318402F8
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 20:47:49 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-418e4cd2196so48564765e9.1
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 13:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714510068; x=1715114868;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5eg6ejHqapp2t2I6Iv04Mbrac0tqogmudYYuP4zvnfs=;
 b=lOJA4mchIEZj2P6jpgr0zD08a1A4hHZXSpbrEbQf4SBBPlcJBDxQhB4Z1QnXEF1ZR5
 eoezuQl2SYXc+FhjlKDaBrCeB62YSvsT7f8eP1xZaQIhFNqe5s04JG2Bz1QuIBDZL9k0
 lMAYwZGT0E5IMAjM6/h3NDNKppGN+IuE0PM7dCGRIzmJ5+rUPKQS/YVO25l1FNdqnNa/
 qEUOnD6cB0liG3R4wSW61ES/gM8XTifRo6YcZMECjVJo21Y6utyvgC2Ssv4pEs/2gjrG
 PKNj9m3Wt2GSRt9H8H5ZovBkxE1JC6jaUovCvSXaWJtwfEVbVSzAyRTy+FB/Ge3qnnID
 RFfw==
X-Gm-Message-State: AOJu0YzesiciJD3eQmPhzwEfqx2kAR538TIEQpD+jf90VkP5eBmX5NCi
 y+2Yn08YH8B5ZGLzH5e+izT0QIhMiXSWq5suoDqYforEglTzr7vQq6vVZUP9q/ukHS6DdHQiQ88
 L
X-Google-Smtp-Source: AGHT+IEJVKlxbijKtCXb5I4+YgpTmFKVMb5AAcenOIbhAhuO61jAsXyQrB9ZJ32kqWKB3dnxfnOapw==
X-Received: by 2002:a05:600c:4f0f:b0:41b:ca45:8263 with SMTP id
 l15-20020a05600c4f0f00b0041bca458263mr517319wmq.12.1714510067794; 
 Tue, 30 Apr 2024 13:47:47 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c308a00b00418f7605249sm47346wmn.24.2024.04.30.13.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 13:47:47 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 30 Apr 2024 22:47:43 +0200
Message-ID: <20240430204744.1014238-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714510068; x=1715114868;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5eg6ejHqapp2t2I6Iv04Mbrac0tqogmudYYuP4zvnfs=;
 b=KNCk4T6yPnlEMnxJEP9LN92m9+9S+ijUC/anBczbJ3vTg6jwHJVDYMlzZje8rzYHNF
 rNWdWL+GyplG7iPxafzwX1l4AyHBHhPWKlSiRfeEg32xhtxYGuzM4ZThSLC0aMGOpuyp
 uCyqLh2AHuvAZqt0yHSJTiy75bYxteDS9Mg4l4jhmoe3VIGyT13sE91v5f7K3sqVdX41
 Bzqy4iBzDfQXoQ3Daarew5ZVcp0Bgj3DFSg1vHDJAEwlA33ggD1ME2To4oMNbL/C7mTS
 dvg83Sjt10V85DxhMpIc8cOeJi1rJMxnLsOjvpvwNNA9jSmZqvKkqkWrUDdDva45TWxp
 HUSw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=KNCk4T6y
Subject: [Buildroot] [PATCH 1/2] support/testing: TestPerlDBDmysql: use ext2
 instead of cpio
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPIO filesystem generated by TestPerlDBDmysql is too large, and
doesn't fit as an initramfs in the 256MB of RAM available in the
versatilepb machine. This causes a failure while running a basic
test "perl -MDBI -e '1'" since "/usr/lib/perl5", and many files
being missing from the root filesystem, ultimately causing the test
to fail.

Can't locate DBI.pm in @INC (you may need to install the DBI module)
(@INC entries checked: /usr/lib/perl5/site_perl/5.38.2/arm-linux
/usr/lib/perl5/site_perl/5.38.2 /usr/lib/perl5/5.38.2/arm-linux
/usr/lib/perl5/5.38.2).

It would make sense to switch all test cases to use ext2 + a
hard-drive, but for now, let's fix the few test cases that are causing
problems.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6735654506

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_perl_dbd_mysql.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/support/testing/tests/package/test_perl_dbd_mysql.py b/support/testing/tests/package/test_perl_dbd_mysql.py
index f8fe832b41..93551b420f 100644
--- a/support/testing/tests/package/test_perl_dbd_mysql.py
+++ b/support/testing/tests/package/test_perl_dbd_mysql.py
@@ -1,4 +1,5 @@
 from tests.package.test_perl import TestPerlBase
+import os
 
 
 class TestPerlDBDmysql(TestPerlBase):
@@ -13,8 +14,18 @@ class TestPerlDBDmysql(TestPerlBase):
         """
         BR2_PACKAGE_PERL=y
         BR2_PACKAGE_PERL_DBD_MYSQL=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
         """
 
+    def login(self):
+        ext2_file = os.path.join(self.builddir, "images", "rootfs.ext2")
+        self.emulator.boot(arch="armv5",
+                           kernel="builtin",
+                           options=["-drive", "file=%s,if=scsi,format=raw" % ext2_file],
+                           kernel_cmdline=["rootwait", "root=/dev/sda"])
+        self.emulator.login()
+
     def test_run(self):
         self.login()
         self.module_test("DBI")
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
