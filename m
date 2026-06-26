Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA65CDE008
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 09:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A0E460A52;
	Fri, 26 Jun 2026 09:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gB4WgBI8CBpH; Fri, 26 Jun 2026 09:35:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DFD26070A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782466534;
	bh=f46m6gQGO24w+v6+Zmlwjm2s86XO3mMKYEwlS1piFAU=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aK8pPo96UQIzqWZlDYQ7Ik7N8WqPwYmmfSxzllzsIGmhNexOPSSC/89wgHzhdkdNh
	 Z4YK7Ct5b52OFJDNdOeyvbqcs5U/IGbf7TaJxUr9Y8Kn8X9nqmSo9c+ZuyC/Kyt82b
	 N+ZS+91c2Lht1s1pQckN8VFDi0D8RkCIXneO9PgArGVxn3czlx/WO9oze7UdJFlHfC
	 RriJWldem+yfyWbf6Zdwd3pzkm11QBpPHgSFtHnygIIDtP355/9kmT3YSKHzwXxHJZ
	 9OBvKIMkIukRjhd74h1vFDymRPjRvmnzSf/JXfAMPUu0R4gytvjmJ+AxNmIlj5YYcT
	 i+0wS5ah1GMlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DFD26070A;
	Fri, 26 Jun 2026 09:35:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A207B231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 09:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BEB2406FB
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 09:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t2ImbJ_oS0hI for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 09:35:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7494C406F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7494C406F3
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7494C406F3
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 09:35:31 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -522775153; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 26 Jun 2026 09:35:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wd2y5-0000000HIOL-20mr;
 Fri, 26 Jun 2026 11:35:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Perale <thomas.perale@mind.be>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,  Quentin Schulz via buildroot
 <buildroot@buildroot.org>,  Quentin Schulz <foss+buildroot@0leil.net>,
 Martin Bark <martin@barkynet.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260626070140.4195-1-thomas.perale@mind.be> (Thomas Perale's
 message of "Fri, 26 Jun 2026 09:01:40 +0200")
References: <877bnm7aye.fsf@dell.be.48ers.dk>
 <20260626070140.4195-1-thomas.perale@mind.be>
Date: Fri, 26 Jun 2026 11:35:25 +0200
Message-ID: <87y0g163vm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=FGQ3/zPRH7oItujmD3iyStLBc9A6VhmMKBj+B91tEG9WlmMaoE4NK+s1hTiPibuegIGeD6TKFfXjMV50pKn23eBBb5xNoM2tUikwIIQkwBvWUGt2LBluj6n1uAYW4Ng99lSr8BijG6qK+HrnvX86sWCriCHYEBtjp9f3KE7otRGVAkmQDxXVx7pI5eptjFKPTE6mG7xW62rAWndCzyhQOKmFR5Q31ZJVbCq44a52xNjadgEVee6BYFcIjS+zwQfOpAYXyNheaoOFn70Cq5hQAwTOkcYdVGKpDR9994wWVKWoiEZuf9gNVCz6uqer+2cspnVyt/Up69BDqxCHkA/FdA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=g+GrjvNs5o6P54VZd0BnVh12OIvVDIkM9FQAgV9JYKA=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=FGQ3/zPR
Subject: Re: [Buildroot] [PATCH 0/4] make utils/generate-cyclonedx runnable
 with Buildroot host packages
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

>>>>> "Thomas" == Thomas Perale <thomas.perale@mind.be> writes:

Hi,

 >> Then I think that the pragmatic solution is to drop those list type
 >> hints. Thomas, I think you originally added them, what do you say?

 > Sure we can remove it. That line doesn't add much right now.

OK, good! Quentin, can you send a patch removing them after verifying
that it then works?


 > But would that mean that in the future we need to make python 3.9 a potential
 > target for any new changes ? That would be more annoying in the long run.

I guess you mean python < 3.9? It is indeed always a tradeoff. Maybe we
could start requiring python >= 3.9 for the 2027.02.x series?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
