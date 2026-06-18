Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAD9CD98F3
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D43F14142C;
	Thu, 18 Jun 2026 12:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rKSBvvhXMo-P; Thu, 18 Jun 2026 12:50:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 586FE4141C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787015;
	bh=j0nG/9W5vkY2hISpS7TQV8mq64dyfIHq8zQaosp4n+Q=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oy/l8Y9FlKVjl6DUF55E5/zQllhnMoiYJ2fIREJ7qpA8AT4Ze9iELMwv8xo0w8+AM
	 k9SjH2JTyCm2AzRurwlsNjCPK+28dCflecVOsMvy+dtYdbyaxTD4kcw/kBNXioIdEc
	 AP+griAyVO/JUvuj75q+cvysoE1YyZpKAyIDs0DAhlYCOTwGYuxV/lnrPoFDO2M1tH
	 H681i6i9lvblD6i+Akf2N/Ex4SJg7I7w4WPjFMADr9fGvTArA7QIno06v5NaYWySjW
	 IeFjA4962ZwvQjaWG+SqdazufWjnPaCtsMhqfey4y9ajW0+SxdmlLnrQhwtL+2LyVw
	 OdYfy8LdgoTQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 586FE4141C;
	Thu, 18 Jun 2026 12:50:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EDC341F3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4639413E0
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ekKg3sOhZOyT for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AC4B541405
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC4B541405
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC4B541405
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:10 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 177130308; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBn-0000000CJuW-3HBD;
 Thu, 18 Jun 2026 14:49:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:48:00 +0200
Message-ID: <20260618124835.2935850-9-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=ZOTpV/tpE4Ht26NqymWXRlsaSM/Ppfm1b9FkUZc6YcwnWXLNqMiRpDExLBdM0wy1vF2ad6SpBOhMpfU9kUly9cBw4vRekPcXeTAsV9n/mISLlylUBztDe86r97Upnihrj76rzpOmekPCgitXckjAKwjqYqDfedmL0xxXQKEljzCERkNmASbyFSU/1V+1vhczRUeuIffSpwM41LsBdXT7oHYu4tyLwk30yIlZCIuoeZJtewq54N6grdvGwNmcvlbklxnmBkGO833OSlNP6B3vW+PQ7sr2WfewC8uef4B4nCoVQyFgPF+p2tZJPT+QWbst+Qj878ZtAJJzX5Ril4Mitg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=//Kjuu9ccHhmTOFAfvrHQXXO724q5/9bvIIHrt6lROk=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=ZOTpV/tp
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 09/29] support/testing: test_dos2unix.py: use
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
 support/testing/tests/package/test_dos2unix.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_dos2unix.py b/support/testing/tests/package/test_dos2unix.py
index af5850ae3e..1c0ecf5967 100644
--- a/support/testing/tests/package/test_dos2unix.py
+++ b/support/testing/tests/package/test_dos2unix.py
@@ -32,8 +32,7 @@ class TestDos2Unix(infra.basetest.BRTest):
         self.assertRunOk("unix2dos -n original.txt dos.txt")
 
         # DOS file is expected to be different than the UNIX file
-        _, exit_code = self.emulator.run("cmp original.txt dos.txt")
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk("cmp original.txt dos.txt")
 
         # The "cat -A" command should print '^M$' for CR-LF
         self.assertRunOk("cat -A dos.txt | grep -Fq '^M$'")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
