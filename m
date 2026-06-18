Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722A3CD98ED
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 12:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26F3B41673;
	Thu, 18 Jun 2026 12:50:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hh9iRoEo2Fb3; Thu, 18 Jun 2026 12:50:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37A4E4157B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781787034;
	bh=PnLUAu3ZVbksFp83VG54UqX4Y3Awhr3QJjzLX3ZyS64=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SHUhKte12X01Hdlw8EvKv6FbF7V3/EMBwOIp5HC+El1S07J4eggc6eHIyZaJ0Lvi4
	 T7QQNkpaOfLiWwTPr7WjLKpnYu4NX0mH7UTPK5PGzG4HXZ/GzqErrSMzK/2Rt041eT
	 TjsPnU/PT7/mnH6UXrCMqs44TIrinJM30kFesZomiYVWNqS/ySPZgHrRFsMXEOuI6L
	 XhL/JAgOdyUIzcMzlozHNyNwDNFvzkeAnFzW9qxRdvTh3WVtkBW02PNMVTrLiRfxn4
	 B+J4yaYuGdd4MOzX4J8Phn1xtfr+aUvNnVnICm80sDEtGNv70nDzcWKbrNVbPp6P3A
	 WRRJku1dQacYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37A4E4157B;
	Thu, 18 Jun 2026 12:50:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C9E31131
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC53F610D3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94W4YSLX9xq4 for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 12:50:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A62E160A97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A62E160A97
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A62E160A97
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 12:50:29 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1781169358; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 18 Jun 2026 12:49:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1waCBt-0000000CJvw-4C1j;
 Thu, 18 Jun 2026 14:49:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:48:12 +0200
Message-ID: <20260618124835.2935850-21-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260618124835.2935850-1-peter@korsgaard.com>
References: <20260618124835.2935850-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=gVXUu8so8aShBWRVQh+qEsUyxqg4QiOXXjGo73Jw1OBGKnGMJZKTBJPpk7YhvBu9yJp5myc+sLdqfafs6UKcLybYiydnk2YlG8P0LMs+trIQv1wqDtDqwuAdcw1bltAagDplv9nUkiSH3dSwMWdYrJHHnKwgVh8zfdBY9Fa5A3jVZJCQA0bKe7skXRvjXUcy6U0RoDE4pI3tZj7mxWrSfH3KqNj1+j/IWggehcqHHDbxUSwifjtKVgVO068vKt/I3M/rsalykFvabSX/oz8DEnKnAGRc/VymiEjVXuZC55A5ZMemlWWFSf9LaZ7114iig18GDcKG6FopX2Y81r4gQg==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=YrMngqMdACjovOX8aMo5+sS0v5c4RNje4gje2CsQYC0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=gVXUu8so
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 21/29] support/testing: test_octave.py: use
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
 support/testing/tests/package/test_octave.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_octave.py b/support/testing/tests/package/test_octave.py
index 5c0b26a5fd..ef6516939e 100644
--- a/support/testing/tests/package/test_octave.py
+++ b/support/testing/tests/package/test_octave.py
@@ -51,8 +51,7 @@ class TestOctave(infra.basetest.BRTest):
 
         # Check octave can fail
         cmd = self.octave_cmd("assert(false)")
-        _, exit_code = self.emulator.run(cmd)
-        self.assertNotEqual(exit_code, 0)
+        self.assertRunNotOk(cmd)
 
         # Check string output
         string = "Hello World"
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
