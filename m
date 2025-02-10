Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0DEC02198
	for <buildroot@archiver.kernel.org>; Mon, 10 Feb 2025 21:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FBD08218A;
	Mon, 10 Feb 2025 21:32:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVds5ce5oDbf; Mon, 10 Feb 2025 21:32:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 357FA82151
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 357FA82151;
	Mon, 10 Feb 2025 21:32:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10A61199
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 21:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 005A38214F
 for <buildroot@buildroot.org>; Mon, 10 Feb 2025 21:32:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UymJ_fGVL26G for <buildroot@buildroot.org>;
 Mon, 10 Feb 2025 21:32:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EAA668215D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAA668215D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAA668215D
 for <buildroot@busybox.net>; Mon, 10 Feb 2025 21:32:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 96E492003C1;
 Mon, 10 Feb 2025 22:32:47 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Feb 2025 22:32:47 +0100
MIME-Version: 1.0
Date: Mon, 10 Feb 2025 22:32:47 +0100
From: Julien Olivain <ju.o@free.fr>
To: Michael Fischer <mf@go-sys.de>
Cc: buildroot@busybox.net
In-Reply-To: <20250210091036.11790-1-mf@go-sys.de>
References: <20250210091036.11790-1-mf@go-sys.de>
User-Agent: Webmail Free/1.6.9
Message-ID: <d5c21dc53ab72f34872f83d216fa7406@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739223168;
 bh=RBKvYBvWWvDS33nSE2xJ1RuoPEEjpflUDfa5RMa8S20=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Pf24pVDwMcqZovoTQQ7wamg+QuvqP1ITCQ1eSpJq5XponaWrTVM/NlmL9ABk36MVf
 rUXsuIo3OJ4t8Z+umSqIWIUIPol9UEwftlY+7UXSuznkipkwb7sr4jRne9rhW69SyU
 5SicBOAYkOMXqJ++MkgTdpYXvxVet78SIpQYQiVaF/HYiLWnTYFlsYR30kBrrEsIHC
 +T2npY349ZHHW/MEwfLP6znI1B2iCZEmUjCNFkG0sIC5CbzTjj04Pr7yXB8mKKqQuC
 uHksw4UBzCogGkWrb2pykJrdahivjEYNB9GEtRVp0m/EZTv3eARoRYmFusWFb8GSwv
 zXpsMD9+CCg9A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Pf24pVDw
Subject: Re: [Buildroot] [PATCH] package/sdl2: bump version to 2.30.12
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/02/2025 10:10, Michael Fischer wrote:
> Release notes:
> https://github.com/libsdl-org/SDL/releases/tag/release-2.30.12
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
