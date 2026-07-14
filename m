Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8375C43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 08:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4882040932;
	Tue, 14 Jul 2026 08:26:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5h9d3X1IiDF6; Tue, 14 Jul 2026 08:26:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35928408EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784017602;
	bh=CcA17kh2jG3Yoi4gJ8P/bIJuzqs9cZpb823ofunYQgw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g88PCkqcfNFK2E9TwzrbaEl/K98HlM93rI+hDmYXnxhnZ3Y+S1YgTNtgmzjq3Xnqq
	 cAmHmJxxFaf8DFbuRRPOIc6QtJn/IIajhUZ+ygNN8Ysg1i2mOJRrSpl5kYRxVT4wYe
	 PbtVCrg8zQxTBi2dnN+91ghVhpdgTgTa8yrkmaB7O39z6vAf1/wUmBvNwwAPIc8JIJ
	 85SBx5N6CPDvzWDUSVH18jHmMVMaHefAnzlkwRyMnuVt10cDRquSiXlOzLdfO3u6po
	 7x0DZfHUylurbBBHn4EgASj5EZaChKIMo30DtGKnZHDkXBE6FWHJeFltR3yL6jdAkn
	 93jzK0L5NdWuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35928408EB;
	Tue, 14 Jul 2026 08:26:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 48D8096C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 08:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39FCC80CEB
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 08:26:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id scY8KCpUFgt9 for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 08:26:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1500B80CDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1500B80CDC
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1500B80CDC
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 08:26:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 77087780395;
 Tue, 14 Jul 2026 10:26:33 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jul 2026 10:26:33 +0200
MIME-Version: 1.0
Date: Tue, 14 Jul 2026 10:26:33 +0200
To: Christian Stewart <christian@aperture.us>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Perale <thomas.perale@mind.be>
In-Reply-To: <20260713203901.24229-1-christian@aperture.us>
References: <20260713203901.24229-1-christian@aperture.us>
User-Agent: Webmail Free/1.6.17
Message-ID: <6b24eae38d18d91ce74fb7c4935fe1ee@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784017597;
 bh=wSgmSMWo4Cbe4HxgdVoT6AEeU9pSOGfPGbFNz14v4fk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IYtzidsGo5XuiFlS5qoDTtIQ119X3hmxNRAlBrgKWds18tylAKDImsbjeq66uS7Rx
 ZMZppUnOe4+4M+gMV8GYRJjJPrfnjU4EMBWu18JpJ2oSwMKVvZPe88qQxEvY/tHNtV
 +xqGvvk9MJB+hxGmSQEgYHmvQhsMKp+1aOsX8zsrE2LZCaJ4HxalBn1KJgAwncRkc7
 FG3+6VOwX0TUlCrK5EXH99YKi9UzCTEWe5WjeVKdCb+LeRdEeB7C6lfNrpcQt3yYG9
 AgU+/Ovdob0FAs0PizCyGTda07Ch+tDyVlPnRoQk9lKxzz2LHhlZ5w7Lyj0vaRfyzN
 OunFDL3RH0lQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IYtzidsG
Subject: Re: [Buildroot] [PATCH v1 1/1] package/go: security bump to version
 1.26.5
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

On 13/07/2026 22:39, Christian Stewart via buildroot wrote:
> Fixes the following security issues:
> 
> CVE-2026-39822: os: root escape via symlink plus trailing slash
> 
> go1.26.5 (released 2026-07-07) includes security fixes to the 
> crypto/tls and os packages, as well as bug fixes to the compiler, the 
> runtime, the go command, and the net, os, and syscall packages.
> 
> https://go.dev/doc/devel/release#go1.26.5
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
