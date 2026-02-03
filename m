Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B716E8B36D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 22:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26B5F80822;
	Tue,  3 Feb 2026 22:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qAcLxUOvAjqT; Tue,  3 Feb 2026 22:41:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39492816F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770158467;
	bh=9yW0E8grhOnY+asWKZ6RuWCVI/RCCEGJjt2aIFFMbos=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hiQhC3twRoa67MTcKp/pByO+Kf6dzdlyHatSBIUMwYixftJCnXeeG+kF78HoU+Gfg
	 hrxm/rod9/PsaT6lpvLrljKMYYU9octWTGuZDMOzZlK+Z09Zo96GW/xiPcYYbgBRKe
	 X0IGpK3Kh5hyrAOnsIf5ZJp8/Xtps/sEDu4aphUKsip2EqWZDwranjjKntu5rAPp+o
	 PemJIw9/s21rQuhOsNhty5ThaE+mmlrE2Z9NctNMu9IjnB6m78TfgzOj7qlbuHwGwO
	 SoMgfJ9OOSHmOxrDyUm04xn2OJ8INRSZMNdbUki9LSES3LrU75piYJewJ8jLBPPkXt
	 6D9oWNfiY/JHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39492816F1;
	Tue,  3 Feb 2026 22:41:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 767A3F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6373E40B2B
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85psUTFk8Gr0 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 22:41:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5613940B28
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5613940B28
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5613940B28
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:41:04 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1619615572; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Feb 2026 22:41:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vnP4t-00000009Rpg-1gZn;
 Tue, 03 Feb 2026 23:40:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Romain Naour <romain.naour@smile.fr>,
 =?utf-8?Q?Herv=C3=A9?= Codina <herve.codina@bootlin.com>
In-Reply-To: <20260203075731.22481-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Tue, 3 Feb 2026 08:57:31 +0100")
References: <20260203075731.22481-1-bernd@kuhls.net>
Date: Tue, 03 Feb 2026 23:40:59 +0100
Message-ID: <87tsvx8n7o.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=Wt5c8uFvpUSzUdhL1zSZ/lRvDooSj4qem/rDAgiGoXjKuDGAU2khW4HtKVMfFp22ctoMOm4vXWKeGbMKJ/YR2mjdySyFtWo9y6cc+p0Azxff036p1LkGyk7wQht9/Omq+5YURIKF+zYkQscIrs45RQXPV6RdviE9M9EUNN91slOa8nSdhOY0xZdgPyq86t2SFjKHAQeVyofSMOii47GVb8obIuwMOhky4W+QnsapETD5xqHtlRXJmbwR+afKcH/m1jMzjloTX5cMfqBaxsOdi9i2wmBUIfmtwr3KXm8LMXket3n6rXiwtgNVfhCSF0QeAO0URe5DQJah/GPGqReong==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=mvbMtCqNHwxxusACPm50zm2Y1vhN+6n3E4d3RH6t1L0=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Wt5c8uFv
Subject: Re: [Buildroot] [PATCH 1/1] package/php-lua: add comment for lua
 dependency
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

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
