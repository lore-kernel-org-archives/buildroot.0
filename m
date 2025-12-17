Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95677D66BA2
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 20:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D35D74068B;
	Wed, 17 Dec 2025 20:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id So5-kujIuBgO; Wed, 17 Dec 2025 20:17:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BC014060A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766002640;
	bh=0+m9MIVdLU6tBKQ4yWpypYBuR0VNZVV8cAnKq8EMGus=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ekgtppHhq79mXrfRHtO7lPgIzgL4N1T9QJ8iD2EQSlrCB5DVC9RmYjJPrOfMDl4Tv
	 8i1BPps2nRZ4MqDkr7JX2NuaR4Ic56azmjNluWA+GhSaLXjp4fEx4zsybfnY0wgTyI
	 U+0JGthHOwFRPCs3C7Ux5aUyrvdwvzRO5Opu00vrr2sJ/3riOpdKflN+JsQiwe2Ob6
	 0mW6MF8idIclE8FXE0PadEvtbk6Ka/qtMsV5LgGrumOg8q1JnoOr/y3DtxABqAxuEI
	 DPGNUY9JE9FK2KSdl/10N3Z0bjXrPDwtv7lyUdBC6bX5b0u4IPDeGptc/tebh1o14s
	 6qG56dpbId1VA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BC014060A;
	Wed, 17 Dec 2025 20:17:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 66DDA35B
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CD3981CBA
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fU0bhwpvjmai for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 20:17:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 67AF981CA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67AF981CA0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67AF981CA0
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:17:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id AF5A020039C;
 Wed, 17 Dec 2025 21:17:13 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Dec 2025 21:17:13 +0100
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 21:17:13 +0100
To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20251217081817.3779661-1-pkerbrat@free.fr>
References: <20251217081817.3779661-1-pkerbrat@free.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <ef1f8a77de1c363465f9e6f530ce1306@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766002634;
 bh=GmomWNDHv6q8vmmfVipRPW0IYVFTzW5TCZL4ZLwDakk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h1D66Z1/mpDtQw5N0VGUKy1yr1DtMVznuKEQhLFGhG9KICh5BU1XbYAzxg72ra32R
 9xedWTwC4omiY4fsjUP9U0THBefWuknbU2+ojinrASa9nzauIx9nMHS1jaCMt5akPc
 pBh5qEIPX5ed9AQn4BtYUjUmTq1j66INTr/lXUYTofciycmrK52tX3X212LakQNLhn
 dJERn4Iqm4chmzeLqB9X4/Eoji6EcVVbonMaRbINCK1PaBZPGOMuyr747PEhmDpcVk
 Vt4xC06Q63NDFjkr86O028cIoSZ+vwPiDnu42TirS87621q3r6ZDyBfkpUZ2/H8rd3
 ZuRhYJ41Icqxw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=h1D66Z1/
Subject: Re: [Buildroot] [PATCH 1/1] package/vim: bump package to version
 9.1.1989
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

On 17/12/2025 09:18, Pierre-Yves Kerbrat via buildroot wrote:
> Changelog:
> https://github.com/vim/vim/compare/v9.1.1684...v9.1.1989
> 
> Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
