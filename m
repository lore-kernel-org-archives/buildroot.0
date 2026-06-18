Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A79FCD98F3
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E08AE414C5;
	Thu, 18 Jun 2026 12:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7DtSdL1JR8sv; Thu, 18 Jun 2026 12:50:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12CF241497
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787031;
	bh=JAWfio0BXoBW1uAZ1eA0QU4+ydCGL6Lesvl6tQE9nt8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DuA3QnPzJAG0Ujm81lCCbaZAUGVSzH+zBFhV5Vskb51NHA7lYsP0ZaAVS7s6k/MjZ
	 VfoYSbIgVYEig21N1wGYkR01xEbeygnp2ILu4iXfLQdxECuzqye+7OMhOW6BVgFdcZ
	 H6siCAHN9n9leip7+QDfeKi2m2s8ybVg+2D4iBkZid3aJIS8DK4Zz4sX/kEVuWbaqP
	 V1jfysNwl+IJWiuB0J1WZoYarqwpdCYcwQ5pspEMemIOUmxZqGI9PSnK5Wp5Eqvt4L
	 30WhY5V8WRr/pWCc8kgBzY0wq3DI5MTAwBmNeP40Npi/h9f61LwwQvC4eWMrmlfO/B
	 VQFPqeh+SVUkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12CF241497;
	Thu, 18 Jun 2026 12:50:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82B02131
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6917C40DA9
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQBPRxjaxwxU for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 322044063F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 322044063F
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 322044063F
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:26 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2101078205; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBs-0000000CJvi-42eL;
 Thu, 18 Jun 2026 14:49:52 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:48:10 +0200
Message-ID: <20260618124835.2935850-19-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=CiUAPkbAaNZyk2VkUPKqYMN/RVTcNW/6o/qcfWWTDPIQedk6b+p1kKjSkmI1ceewAngK5Jff6R8JoHUWRq+kUHYTxqfGGaTcl5ux6K4Bo5aqijlihlRcd2+Y+qp3j/Ue3haoB0TIPxS3PmTSdqKSiyU1p/RC5Gr16SRzWobMmIFgED3K/D/6iFi/lSH23UoCgSUtHgbPTNXisojWNM3GVx1Z3iUwfFHHVM4avfShh6L/iRRsewIIpib9D0uVre4O5HICN3S3qEIrLgqMec/qkcTitdMvwI+l36/zlIgF2d8lxyBUwY6dLVYI6/5G/Nge3UEzQfPlm1MIOOYxskYxCg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=jyMVnT+jrMxNkqZmGRjPep2YGw0imuTulOZad49ufm8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=CiUAPkbA
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 19/29] support/testing: test_mtools.py: use
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
 support/testing/tests/package/test_mtools.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_mtools.py b/support/testing/tests/package/test_mtools.py
index 23ec08b6d6..8fc8766207 100644
--- a/support/testing/tests/package/test_mtools.py
+++ b/support/testing/tests/package/test_mtools.py
@@ -29,8 +29,7 @@ class TestMtools(infra.basetest.BRTest):
         # Any Mtools command is expected to fail on an unformatted
         # partition.
         cmd = f"minfo {mtools_opts} ::"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(cmd)
 
         # Now, let's format the partition file to FAT
         self.assertRunOk(f"mformat {mtools_opts} ::")
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
