Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFD8C982C1
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 07:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D407E60645;
	Thu, 17 Sep 2026 07:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dkVd-HxnR-sC; Thu, 17 Sep 2026 07:17:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7AE2E6061B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789629446;
	b=ftPwf/2UA8FZia44Yt8rdQn59m7Fk0zC8DqivGAypiskoPquhwNTC+8PasW42+2RILCx
	 ZhYH0rCTf+nSeo4JSQ50FGPdahYCVm3ZFy5HlY376NF/SQnMc/HfARh4yeO8NtWFaC8FL
	 kRUf5g3omlFihj6jhU1KX8WXTqztgrUzo0Cb3zR6RfK88yyg/xTf2J2ZTFr93Gav64U3c
	 24+6SyS9z8ag4X2bNrp4a6ed9VXWRFXLkIAasUiqlyRP9gA78jnpfadRJvbFqj+e9jlW5
	 OBIkIflkdgo7/nNGvZEcjz7OhbiHFRGrF8Tsv01t6mwkrcPCN6Bl0A1DAfWMl6V5uYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789629446;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=cHva5KwE650n4iM28YbbsX9/3/VRWNeTVT18FzvJkvM=;
	b=FVjM/CSd9R1d1kymAFJgK8SMnQpQCmcoVmu2eVG5kaaiQTm7hR7ZSJyitRIJohhwD5WK
	 hF8PYFnV0KhEHW6cSpopgpGutaYgJ8rvYYs0TMSCls/2Bm7z3lJlCOYtVOrwx3Mni5Fh7
	 ub7YabvTIqtQeii2EOJJzKB1UbKRA7cRwvMvm28n+yYG/unNWCC7RRXn3NnObwvveBKGJ
	 3vRH1jj5NKgRhSzpWL2ipChyBBcr7gNiv2TysZ3QAWMy9phv9V3jCuIuvue6G6fKPxElh
	 Yg9Y5gLwodxHEKynSgOd0h2Rppeh7z0y5oD1vMbwlGmATh+IAMmaNaDuZOFQUBdy12Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789629446;
	bh=cHva5KwE650n4iM28YbbsX9/3/VRWNeTVT18FzvJkvM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=A9KKV1/ay99GI5YJB8COlJS/ZfTdtt9O9Coptr6oWBArFyb82qz/cIa7BjuwWBfw6
	 9u4cQqwZREFHaw4or3gEaaRNdxv2m1eFPtz/bvrRuOYS1Kdr4fmSo5WdjiILos9XWJ
	 qxYNnga2SkTUxbHereIwu+p4zZXknuIPOVoFnh6W9E7PZUByCRvvMNWN2YOqJmUqFj
	 vn6cr0xL0fmy4/HkD+9cwR1GoIXwDr6Kw2RmOkXULyD5OJ68nCwQ9HxgIZuNRLpxg/
	 etqmDKBe1KUwfSYPnkTVarZSfFtfeKS1luNtY81+ZqutKnOKQuu2GezyHH8xgFyKDv
	 0XuFwez/xJjPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AE2E6061B;
	Thu, 17 Sep 2026 07:17:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E144E43A
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3E5D8084C
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MyoUZldRvSC6 for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 07:17:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 440D0808BD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789629443;
 b=avE0kmNUntyiqKuiSTsM6nGzGj/eeQBPG0v9rb/p3NQ03dk/UK4pmhAifUHoG/IRxAOy
 Q1tTw/RC28qqX7HehGvTvznmtWoENPuuP3O4FJ0LSz1dawAG5dl9gpTmzP1yZbivfIjZa
 KtJjxKsKBydp/iPaSFLE87ISW64eX0wptWNz9cLJwobU1wABwMDIEnKpBc6yd1CIm0q/v
 H9lv3D44XgQBdF1PZ9J8Ineqx9qDPjakXZEtdvw1mplWBAG0+/2KDbtmDmDjAwejTt1gu
 9SSd6idP49ZfKiFvYgKG7h6nl9elZQnuhUNX7Z9frd/yvIn4sMRjb7aD7N+U489rTcg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789629443;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=1i0G0sfhSJ3Kj0ucvYNh3IB8I6kufF0P+tVTXEZ7jq8=;
 b=K2yja3fW4sjlN4STlDjhtvGU3/bVL9w2M3b1yV4WLNecDxqPbnZtIrmIz01liPsyYlqO
 DmpupjCyIimlOXM+sfy6SRofZSaS0eQ5KiEn6bgTdf0a2QL4NFyfCs72qZndeDp3IdA8J
 xQFBPKPhXnTiaqiaXVRaDxiJJE1Sqdbnh4wkNKJXFb482nMeP1aS0ZhXBaUCRiHVPtBYw
 SB08KbRhhgDhYTD2AdL3yvg8ZpMnT/OODoAWdSa8d1em9Oog1r/dcwnJ8kZDhMLU9c8/1
 aDb95eLdcVqXWS2yUBHdKaKcNZe1X00AQeQY22JgiKafte5FxlMxzP8vLntXyS3ctjg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=I1qT2G0B; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 440D0808BD
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 07:17:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 847F3C63440;
 Thu, 17 Sep 2026 07:18:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3D3055FAA3;
 Thu, 17 Sep 2026 07:17:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2516211C7A20E; 
 Thu, 17 Sep 2026 09:17:18 +0200 (CEST)
Date: Thu, 17 Sep 2026 09:17:18 +0200
To: Christian Stewart <christian@aperture.us>
Cc: buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <aquTkXp-nFwMQPpZ@windsurf>
References: <CA+h8R2oed-F_NN0s0OA2yF1+YLZCsMp2+Vnb=TR+ANTZnHLeyQ@mail.gmail.com>
 <aqsEbnaZphecvrlt@windsurf>
 <CA+h8R2pMha93DcRCsknH4qJ+wL1RCgAqJF8g8=dFWVBz9gvLTg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2pMha93DcRCsknH4qJ+wL1RCgAqJF8g8=dFWVBz9gvLTg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [RFC PATCH v1 1/1] package/rtl8821cu: bump to
 version 2026-08-21
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, Sep 16, 2026 at 08:26:52PM -0700, Christian Stewart wrote:

> I sent with git send-email but using the Gmail API - which apparently
> still is forcing line-wrapping at 78 chars.
> 
> Will go back to sending with SMTP.
> 
> Was trying to use the API because the SMTP messages are marked with a
> red "dangerous" signal in Gmail and marked as inauthentic.
> 
> Is there some way to send patches via gmail that doesn't have these limitations?

On my side I'm not using Gmail, so unfortunately I cannot provide any
guidance on this specific topic. But I assume a number of other people
on this mailing list are using Gmail?

> And the RFC - oops, I just had the --rfc flag on for some reason.

No worries :-)

> Hmm, I guess yes, I think mentally I mixed this up with
> https://github.com/aircrack-ng/rtl8812AU

Easy to mix up all those out of tree realtek driver repos to be
honest. I wish there was a bit more consolidation, with people
submitting those drivers for integration in the upstream kernel, even
if they go in drivers/staging/ initially.

> which has a "THESE DRIVERS IS DEPRECATED." notice and aren't merging PRs
> 
> But - the morrownr one - I suppose is still maintained and would accept the PR.
> 
> Submitted: https://github.com/morrownr/8821cu-20210916/pull/213

Thx! I assume you will send a v2 of your patch? Or maybe even it's
already done (I haven't checked patchwork).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
