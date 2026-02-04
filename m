Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DB7E9538F
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 12:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E712460AC6;
	Wed,  4 Feb 2026 12:30:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wqRNKApUTUsO; Wed,  4 Feb 2026 12:30:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08BFC60ACB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770208253;
	bh=uZ/FPV3ep3RSeTA7M0C6kZDG1t+oQ4xZ5aFBcLFBfxk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=FOQbdMJPfX0cwI4cMKDWEPTIglLk1ypKUMwshNeHYAPH9e0PzJkXooB96R2/NEQJC
	 ud+AZRI3jxnsiYQc0ri+xavge0+Jd5wWrXzeC4vAer9svTGEBPD3V9FiFgcmS+2eIa
	 apcNbHSAMWrq/2QHNnVjUlhEE8jvjQB2EQ1RiEKt0dcksNShYiGGzZ7wVQwOj3k3ZX
	 0wl46Eu/j1jHV0VxWIlgpQs08i/24HMgNyEv6tyGtFaqrD6B8I41if725Sf9CPxR2x
	 +YEQNTdXuD72JjuVPKSpAPCYOjoxb+H0C5veW3V1GVW2A+aQZqQwwvyeqaOK8/upiM
	 fTbloBnbGMtBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08BFC60ACB;
	Wed,  4 Feb 2026 12:30:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D74C173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFE8E400FB
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:30:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xq-C1ySC7xe3 for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 12:30:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B8C54007D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B8C54007D
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B8C54007D
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:30:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D96B81814B9; Wed,  4 Feb 2026 13:30:45 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 13:30:10 +0100
Message-ID: <20260204123024.1942659-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1770208246; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=k8N/V4J7EsXDIh5ESqJ6GEFtyqhrZ8z2UlAbOr3PTu8=;
 b=aH9WX8Xyau4YUOIzd41f3skPhz9fHWdVvZ+KOg+THfixsiwi149oCzov/UoCknCXH1D9vT
 kD40DnQoeLd+wga/gFT/f4eamqJDeEoqJ9+BChM+nbAZhIQ9xL+SoMP58oToylgDwZW4t9
 yoZwFMtYtatBG2r+++RQFYIRy9ivOw0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=aH9WX8Xy
Subject: [Buildroot] [PATCH] package/uhd: drop dependency on Boost.System
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When bumping to 4.9.0.1 in 7dd31d302133dd8fc5d6f44a42209fdb3573c51f
it was missed that uhd dropped the dependency on the
Boost.System stub library.

See https://github.com/EttusResearch/uhd/commit/d8ae7867ab452eaecc28f06dcafae83f941be579

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/uhd/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/uhd/Config.in b/package/uhd/Config.in
index 58bf91c1df..4eb5ae3e8f 100644
--- a/package/uhd/Config.in
+++ b/package/uhd/Config.in
@@ -26,7 +26,6 @@ config BR2_PACKAGE_UHD
 	select BR2_PACKAGE_BOOST_MATH
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	select BR2_PACKAGE_BOOST_SERIALIZATION
-	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Universal Software Radio Peripheral (USRP) Hardware Driver
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
