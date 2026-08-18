Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740B0C5DF81
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 16:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3892405C9;
	Tue, 18 Aug 2026 16:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CxP1anRodSsB; Tue, 18 Aug 2026 16:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3F53405BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787071004;
	bh=+UK519ebzag+3BDrH0rBMeIaAv305zhlpsm4ssUG6SA=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kp13Acoepttgm8w+So7ClYC2uxToQlCEud7S/G7V1r2MKyVuxPznCZgVXk2nssGx+
	 BonEUDhk9HmBlFU0namWBV5K1SQTShe5/DUoIxGAnbPlSGqsSCuBSr3YiaV8kl1dc/
	 zZi6MqKebq79ULD+0iX7Q4Dgkykyf4KFWeped8uCWeEbKH1zcYU6jQ3FvJ0WJFtQLA
	 g0JiWBL7TYSDBR2sYV6pS3NuAY1+3Dv4JiYfB8ikg50LyiNi6BHPU/sx7g5x1/4AQS
	 kNvdP5Ve2WP71FZpTi9RHlYB5l7kHUIC5SANGzmDPIM6d+mKvDxS7kdZdjhlMPzx9w
	 tSDTQP0iRy7WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3F53405BF;
	Tue, 18 Aug 2026 16:36:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C62B939E
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 16:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7814405BF
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 16:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gf1kslCUj0df for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 16:36:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9E22D405AC
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E22D405AC
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=HHjarCin
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E22D405AC
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 16:36:40 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=HHjarCinRfZmua1VCSIf3cFnDVh67n2xL0lxGUNjGKotUkAyRl7I2//b71oIpfTdtuXjVzMVsVrOgU3KaxvhM5oDkfl/TvqNRNKNNmPYEiIpggrublAJRN4gzu9usJ9oGU9kvpjtXOqN9B+TVVvwQmEgcf4NfDefx/VVM5ZKKibvp51eguab1Ut5zsqRBk760lSNV3WMMztuVYlU3HGEsxkqWNPP9wMPSkFnoO4piVMIlrk7NP8aT7ce70yIwkXLjDlP8utBOdamomwBhmLbDfqF5qMIWx1oh8Lnz2WJRtfc01uduM3cIq/8VhYivfVmX/34Zm+YJoHnKGQ6+u8VKQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=eFS6+fcLbFJcRdyZmENKI0Y5/C1RxaQonzzLWyG0Oqg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1629688561; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 18 Aug 2026 16:36:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wwMni-00000003nJE-3drf;
 Tue, 18 Aug 2026 18:36:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260818122544.18514-1-nicolas.cavallari@green-communications.fr>
 (Nicolas Cavallari's message of "Tue, 18 Aug 2026 14:25:16 +0200")
References: <20260818122544.18514-1-nicolas.cavallari@green-communications.fr>
Date: Tue, 18 Aug 2026 18:36:34 +0200
Message-ID: <87tsorqtbh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libgit2: security bump version
 to 1.9.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Nicolas" == Nicolas Cavallari <nicolas.cavallari@green-communications.fr> writes:

 > Fixes CVE-2026-5917 when used with libssh2
 > Release notes:
 > https://github.com/libgit2/libgit2/releases/tag/v1.9.7

 > Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
