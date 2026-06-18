Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554FECD98ED
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 266E741423;
	Thu, 18 Jun 2026 12:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PgnlPUKKs1TB; Thu, 18 Jun 2026 12:50:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE85F40F64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787014;
	bh=iw5v5RtfVdAPeTscXO0IT028FbE/xnjLtSe8KFFmjDc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MjXuJSOiLP7cU8c/aRyuxhLNRbuHgJzWVFmTEKVe6KOBuiQD0P02CbsM/ZbQGNEZR
	 7uyUJh4p+vbFXDKxNJ5g9BNL8/Oahbsms/sXu4Kccyrv7No3dAqP7cbkkI6eMVZVI5
	 PIeCKv2j+/Q/ds23DL/d9PybH1g5M7e2R9lEff1ROgcyA1jMrd6JvPYq562ayenGdE
	 nYYM8HdrvY0j5B/+bmNDIQXPya25o5hNhXN8lzuL0ikBsx7+c7kfAIliRsk3BLNhb3
	 JTey+oL9XG4+VxOx9MJyHSvF+xweXg1AGmTfE+uL1LnGyowGZ+ApC0FxZU8VLqKNYJ
	 ha/d3BKd0/N3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE85F40F64;
	Thu, 18 Jun 2026 12:50:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A4F06358
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9574241402
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aaJADc53BjMt for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7BDC2413FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BDC2413FC
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BDC2413FC
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:09 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 747902089; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBm-0000000CJuI-38J6;
 Thu, 18 Jun 2026 14:49:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:47:58 +0200
Message-ID: <20260618124835.2935850-7-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=gT7L0TFExIGeZAb2T/poHnE8CVi2YZz0y3UNCW3RI/YUXVfNr5H2ZPaat7vgoOk5ufdj3+EwRtpq9rMeLIjHsCuMczqY3ToUoVfdwPF93Dh2zV2qimRnwFeGRHJS8fqGJ8zs9cmb8aEbK2jUX3oPcWIlZaEyA2ilegelx/+nWJHL3Rc4WyupRLnTDu3cFmsHBIdf275rOzjgZCoY+pBQhQ0ScyzH2JsA7oUwLEBpwKkFfZrtm+Wd0ayIwnfTXNkyYPHNkS6tyzRaKDOfENKlIfAz42j13Ibqo6EdxXD5wG1Z2VLOE3IHQEG3QI+t76ZNUULsfaKcQdtWniqWrj2RhA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=kETnKwnqn6ygt3j8yXVEX/5w74QhFFQ4P+yEZcsOOXY=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=gT7L0TFE
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 07/29] support/testing: test_cryptsetup.py: use
 assertRunNotOk()
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_cryptsetup.py | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/support/testing/tests/package/test_cryptsetup.py b/support/testing/tests/package/test_cryptsetup.py
index e409ea93e6..32a65210b5 100644
--- a/support/testing/tests/package/test_cryptsetup.py
+++ b/support/testing/tests/package/test_cryptsetup.py
@@ -65,8 +65,7 @@ class TestCryptSetup(infra.basetest.BRTest):
         # Check the device is NOT detected as a LUKS volume, because
         # it is not formatted yet.
         is_luks_cmd = f"cryptsetup isLuks {dev}"
-        _, ret = self.emulator.run(is_luks_cmd)
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(is_luks_cmd)
 
         # Format the LUKS volume.
         cmd = f"echo {passkey} | cryptsetup luksFormat {dev}"
@@ -110,15 +109,13 @@ class TestCryptSetup(infra.basetest.BRTest):
 
         # We are NOT supposed to find our plain text message on the
         # encrypted storage device.
-        _, ret = self.emulator.run(f"grep -Fq '{msg}' {dev}", timeout=10)
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(f"grep -Fq '{msg}' {dev}", timeout=10)
 
         # Try to open LUKS volume with a wrong password. This is
         # expected to fail.
         cmd = f"echo 'Wrong{passkey}' | "
         cmd += f"cryptsetup open --type luks {dev} {dm_name}"
-        _, ret = self.emulator.run(cmd, timeout=10)
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(cmd, timeout=10)
 
         # Check the device-mapper device was NOT created (since we
         # tried to open it with a wrong password).
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
