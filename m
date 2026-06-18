Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED36CD98F2
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB7C6414BE;
	Thu, 18 Jun 2026 12:50:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fv_mnRzpZT8n; Thu, 18 Jun 2026 12:50:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB5B14157B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787032;
	bh=FCIpBNCRl3zuf+Cr5Y3Ak98PLvOeRiAyGHfnX7rPkGk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hK7rzvy3j+HmTBXDuXfvjDBhk846VAleR/JMwYXPd9FOG6bedhJNr5hkk5Z2i1zbA
	 o+kNeSieHhT7GuWmDb/6wDLDePCfbeISWmUMGfKMTWtforxh6h2nkxgOT3ap4X/CWp
	 sRwV68gOQFcbCKQH0PapVHBgPZp5QYJv+yLhCwCDjXk5Ojelp7YLrFq0rCUCGppnk+
	 /3p0wSVh7pMtCstQyCCd6VQWutlLDWidDp6Lgq7JTBsNAXlv3ninqrAyEMbvM3e6rW
	 Z4m2Mt5U2HhovAczMY9i+KcC0lR7cet0iq5J8bPHHWuayY9Sk7P24wMAg1eqQc2IdG
	 BD7sYA6BtVfbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB5B14157B;
	Thu, 18 Jun 2026 12:50:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11CE41F3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 043724063F
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OMHsZq3pFSmf for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4F72340DA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F72340DA7
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F72340DA7
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:27 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -668223858; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBt-0000000CJvp-21iz;
 Thu, 18 Jun 2026 14:49:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:48:11 +0200
Message-ID: <20260618124835.2935850-20-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=m/u/vvNNTXpZxPxVVGlwBq0nxqeunX3+O5jGKUgXfosATXnYL1mhiL/226LuClFe9bGmgMxlEjFpnb7eBnz8c8rCmhEOiuMjw2KxHsJJy57WfWt39ajV8p3vn/3hhEPXuGO4pzlRMhSm/IxyVT4NwvZqAjOkjDAAu9x1e3blhcf86/J1vIa2O3htItLapEDdJfo+nZ1VR0rhSN8aqY8XUMOszm/WyG7m7SjGq1dQnqC64JfzagGBetPK8k31UvKiZnm51/ao1k+BmCV7JTMWa59jIYKZKBCTNqUK8K/VXiQlVqxniuEsNi6L8yrBAWkYAK3+jt2bqOGHIobyZrEnXA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=wGpNnTUmboBCFrjqKKLLdZob7aKNb5SgQ67bS04SO9I=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=m/u/vvNN
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 20/29] support/testing: test_nftables.py: use
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
Cc: Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_nftables.py | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/support/testing/tests/package/test_nftables.py b/support/testing/tests/package/test_nftables.py
index 2622c7e822..62e14d5d35 100644
--- a/support/testing/tests/package/test_nftables.py
+++ b/support/testing/tests/package/test_nftables.py
@@ -69,8 +69,7 @@ class TestNftables(infra.basetest.BRTest):
         # A ping to 127.0.0.2 is expected to fail, because our rule is
         # supposed to drop it.
         ping_test_cmd = ping_cmd_prefix + "127.0.0.2"
-        _, exit_code = self.emulator.run(ping_test_cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(ping_test_cmd)
 
         # We completely delete the table. This should also delete the
         # chain and the rule.
@@ -128,8 +127,7 @@ class TestNftablesInit(TestNftables):
         # should allow ping to 127.0.0.1, but not 127.0.0.2.
         ping_cmd_prefix = "ping -c 3 -i 0.5 -W 2 "
         self.assertRunOk(ping_cmd_prefix + "127.0.0.1")
-        _, exit_code = self.emulator.run(ping_cmd_prefix + "127.0.0.2")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(ping_cmd_prefix + "127.0.0.2")
 
         # Stop should flush the rules, ping to both addresses should
         # work now.
@@ -140,5 +138,4 @@ class TestNftablesInit(TestNftables):
         # Start is essentially the same as reload, check that
         # 127.0.0.2 gets blocked again.
         self.assertRunOk("/etc/init.d/S35nftables start")
-        _, exit_code = self.emulator.run(ping_cmd_prefix + "127.0.0.2")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(ping_cmd_prefix + "127.0.0.2")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
