Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573F1C44515
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 19:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2108F80D50;
	Mon, 20 Jul 2026 19:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WvP6XVb33xdg; Mon, 20 Jul 2026 19:43:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 548F980D39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784576614;
	bh=AqcxvYgukLiHbroQynWzh3cqJym4cbL7C+7ZNLWIK+E=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LmRSl/yCg5iEF6fr+CWHPsg34BsvVNodLXk5im7GNDS+yIEX7o5aKCgbhOPxOnxS6
	 DAM3aM0f0JHy9FbtZuQjLlxk/8cL105v9xEMilKyHBQARSrZxHF5vteTzoR1cO7VmE
	 Z6bQtNLvW7aISxd/DhEDTCy+XUf/ZS7CNXsCco2gTvMjh38Njqvv14L5IxpbZXJL2D
	 xKNspMt3NQo1hXb8T+4OKkL4iyBznHWw1H2gi4Nu7LAbjpQlvachgTFXPFDMQgPEvX
	 8AwLgiPzOusWBwuYCZ0OYshDCvNbjhv2RP+foOV3k88EhDTWmnWiVQuQiNuU45Dm49
	 CEhkoIaMBO/hQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 548F980D39;
	Mon, 20 Jul 2026 19:43:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BFDA7786
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2178606D6
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CLO3K_TWzJt for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 19:43:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D223C606A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D223C606A7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D223C606A7
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:43:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 1F7C413F88D;
 Mon, 20 Jul 2026 21:43:28 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 20 Jul 2026 21:43:28 +0200
MIME-Version: 1.0
Date: Mon, 20 Jul 2026 21:43:28 +0200
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <81e1623bc37fdedb5cd3e4b9268fa03b45af65a6.1784526170.git.yann.morin@orange.com>
References: <81e1623bc37fdedb5cd3e4b9268fa03b45af65a6.1784526170.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <d9c077fafedfe27cbdace3e36e37dea7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784576609;
 bh=bn+SgWGAtAPHNiF+GPSKO15dQsPaKs8mvnWKRF2CGDQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XJs0XQvcDkEPJemrypC70cSrODMow9rbuNsmYBLmBuJgCKiXkG68sggUS4ye2Cf1i
 pKEFfNxZqactOntsHw5/zczlegH2aV2thcActO+WOBqSQi2+18+mO8SUBpJfVPjzSt
 CNvo7UNzF1tiWpEW/0Yfn//8ws1BK3E9si+B5tcXIeslUCthrfdjkrK1LFSE5+JtDR
 DsX3K9by/1mGHL+vyB+4WkY/+aD5I2u9fZytBzAaicFpqCo2OvYIHPeHXbAaJGZFrH
 YqNfc3ARAiH6axKmI/0H1xEkRnEWeuAaSlQKuj8j8CI74pVYzYXYBVd03EpKBC8geY
 7T1af80WzCzDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XJs0XQvc
Subject: Re: [Buildroot] [PATCH] package/docker-credential-gcr: needs NPTL
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 20/07/2026 07:42, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> docker-credential-gcr calls pthread_getattr_np() which is only 
> available
> with NPTL; i.e. always available with glibc (where it originates from,
> since 2.2.3), always available with musl (which has had it since 0.9.10
> in 2013), and only available when uClibc has NPTL (since 1.0.0 in 
> 2015).
> 
> Fixes: 
> https://autobuild.buildroot.org/results/3ed18da254082b7823b49be4578274792bb7380e/
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
