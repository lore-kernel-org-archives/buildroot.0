Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55133C43602
	for <buildroot@archiver.kernel.org>; Sun, 28 Jun 2026 13:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24CA940C7A;
	Sun, 28 Jun 2026 13:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ke8U9xghpF2k; Sun, 28 Jun 2026 13:33:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD45140C60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782653610;
	bh=lM01H7cHZQ+i/s3n0RQOOjewEX7JDAGB+HNG7/rsgJw=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qVWGkfJxm90LgP0Giud2c60Lt+RK4JLxgaTI1N6M4BM0jIMvtyGpbqG7H9faYoh+j
	 plU8BCZPfaBWzaQuZT6HJ0Rj6+v9z+IQ+wxtJfc/Hlq7IMqG1NDKDfSXIjD0va3bZz
	 O4VwSf3tETZNBH6RSl9ck6bb5MOJluDga2p0v12kNz1uioUc9E+T4zq+euoGdJEIsg
	 MavsQMX+Q0HmMrbY3JdEIDqmbPZSSLqVkDh/0wFBite76N7ULcGVaU2XH6dCgqd5Bd
	 QIL/ZeuxRno1/yIM79Y84p3lejkdzjDNG5Z5AGx/YhwCa9SP38zgw9pf6ljTPKl0ll
	 8hnFtiPApms9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD45140C60;
	Sun, 28 Jun 2026 13:33:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 118CF2F3
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 13:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F4888156D
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 13:33:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NsVxp-FLYDG7 for <buildroot@buildroot.org>;
 Sun, 28 Jun 2026 13:33:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DFFB28156A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFFB28156A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFFB28156A
 for <buildroot@buildroot.org>; Sun, 28 Jun 2026 13:33:27 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 738964680; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 28 Jun 2026 13:33:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wdpdS-0000000151d-1b1J;
 Sun, 28 Jun 2026 15:33:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260628113941.8068-2-bernd@kuhls.net> (Bernd Kuhls's message of
 "Sun, 28 Jun 2026 13:39:41 +0200")
References: <20260628113941.8068-1-bernd@kuhls.net>
 <20260628113941.8068-2-bernd@kuhls.net>
Date: Sun, 28 Jun 2026 15:33:22 +0200
Message-ID: <8733y6x00t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=rjkCB0tKPmC1YDVHlvRYHzDnEJjrHg6H0DA4oor4kQ6hjieIVcRy4T74/YpGOi6fQFrOtcbYNKKXqCLWa23htWVm/D6g8kPTuzySe/lDgIZSkWFc7r1kXBpR2gcOkdRGLW9A6W2TLpm342p58JDurhi4IEvM8Vb9fZ0XG0YE1uqWK/Ubo+zmaOB+bey/EYy+DMzBtMu2jdNGY9r4HrMSJf/hJ9h09EBwWJ3EP7ZztmumKyQch2KtfJSD0y8SOkRgvvgPJCNe9H7XoOu7Sqco9otIzIk8nfTyfm9l17vLUCioZAzPdLBSFS1JNQfiyIK1LwBXGM4UR8cVNPmnbzmVJQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=qqjxv5ghl3uHSz6CLk8S7TdrlKKa7KUMl3jaCHhb04s=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=rjkCB0tK
Subject: Re: [Buildroot] [PATCH 2/2] package/linux-headers: drop 7.0.x option
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

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > The 7.0.x series is now EOL upstream, so drop the linux-headers
 > option and add legacy handling for it.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipeline passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/b174887ea602d2920b94cc8deaf3debb87905826

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
