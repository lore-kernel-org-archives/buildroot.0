Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB57CD98F2
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C8274140D;
	Thu, 18 Jun 2026 12:50:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kREio0xPLGST; Thu, 18 Jun 2026 12:50:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5171C413F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787010;
	bh=BivPEzHgVX7c7MoT6st3vFSG8mMHr/RRQtGdoBOp0tM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ssDu7li9LYVs2VDDPk2Ti4UIJN+nHBwY9B3b0GpNykjCkrwr4H3XU1OFCnYMEdtK3
	 Ya5dUqXXfir2gyKTklbWzVzT4m+qEs/qkhzX6st7mhs+PIqeqfYgA2s2P/iur4lWsH
	 W3r5iqkcKkmb08LrZ91CpKDnPDqUXrGqjFLI63Ja4tfVE+dbg7MrQsZDtuSTTEhWhU
	 kJQV7ePLF8g9t/w/jGOMkNf7z719sa22y9m7/CAmnnqzQ8Z5dHTy6XQn7fp03lTheP
	 aPzQTU0M53zmjumvV0QVp+4jWfJSZbTj6StzJlOW/wITEsN7MAosu+8mEeBjciCDiM
	 KNKrISZp5LqWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5171C413F4;
	Thu, 18 Jun 2026 12:50:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 992D7358
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F721413E9
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2hOjt93CeDGg for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6C867413E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C867413E5
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C867413E5
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:06 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1297506266; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBl-0000000CJu3-310r;
 Thu, 18 Jun 2026 14:49:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:47:56 +0200
Message-ID: <20260618124835.2935850-5-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=fyKF49hEm8Or6bnD3hnYdSVtY/UNk5xAdHIu7TlqbSfoXwmsrnfjCMapCbpVC0opo8CM1/Aej/6OOLlo4sF7234LNOQbtqPAZ4G0w7hELc4JvTv7aI1dJWgAxSfNW3Hw4S8edk+1jRmKBfYazNq4U68ouFUiESv1jNG3JJNGrf55EYM3FYSyRKmYVo0PXeedo6U1byZgkBWucpUIzyqsdW8hfGYjl9Gg6cHrn8jLpVJisoUx/QhLpaTTowwXn5Z9CNsB+paAn++SctTX1HrjFy/twxYInPd7YCNM2TZJ5ezKkT0XyKRwaJtlF8noHmKBVxTWpyRM9f81HAURTW1uMA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=eaHRse1FwGn7RwsBz4tjY/t8zyhXIfLAWBwCo24lKVQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=fyKF49hE
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 05/29] support/testing: test_bitcoin.py: use
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
 support/testing/tests/package/test_bitcoin.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_bitcoin.py b/support/testing/tests/package/test_bitcoin.py
index 186240b280..9a7d78e5e8 100644
--- a/support/testing/tests/package/test_bitcoin.py
+++ b/support/testing/tests/package/test_bitcoin.py
@@ -108,8 +108,7 @@ class TestBitcoin(infra.basetest.BRTest):
         # The bitcoin daemon is not started. A client ping is expected
         # to fail.
         ping_cmd = f"{self.cli_cmd} ping"
-        _, ret = self.emulator.run(ping_cmd)
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(ping_cmd)
 
         # Start the daemon.
         cmd = f"bitcoind -regtest -daemonwait -fallbackfee={btc_fee:f}"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
