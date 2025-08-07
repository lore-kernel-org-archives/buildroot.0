Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98867C87FCB
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 01:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57B6684A42;
	Thu,  7 Aug 2025 01:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WD4uCswTocDs; Thu,  7 Aug 2025 01:17:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 948AD84A3D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 948AD84A3D;
	Thu,  7 Aug 2025 01:17:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC64131
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 01:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE53D6F4E2
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 01:17:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 82Ak6OaU727c for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 01:17:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C51106F4DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C51106F4DA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C51106F4DA
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 01:17:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 11A6D13F879;
 Thu,  7 Aug 2025 03:17:35 +0200 (CEST)
Received: from ip099.116-187-66.sogetel.net ([66.187.116.99:35798])
 via ip099.116-187-66.sogetel.net ([66.187.116.99]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 07 Aug 2025 03:17:35 +0200
MIME-Version: 1.0
Date: Thu, 07 Aug 2025 03:17:35 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250804180616.613019-1-dario.binacchi@amarulasolutions.com>
References: <20250804180616.613019-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ab2b2ecca66dd3ec854691ccb3a4d438@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754529458;
 bh=qjUIVocy92jBvN7Nxj8DfCqz9gKiEORhihxZAk9tpeQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CRfWnPPBBkhojT0Ly+7wbvE6KUdhmHiRNFwQ47nm+axfFcdWfExx1qvbgiLv8tPRl
 qlUrJK6DnV3mrop2LRCqITxF5Pmo2aFTWmqjzRQn1F8D4htCnXIGjBIGurwTq8PBtV
 vYV9ddX5ww8vExAOcwl7ITiFqe/xH3LGmCZ/XcaOxEEXv2HBINaQ5QcXpMs0aiAYhj
 mxoceaMf7QeEg/L/gHL8chz0//+A1mSTBeMPFFg1IhYqQzwn2NCt5SXIFJ6wyRCpF0
 e4T0BV17l+3pnrO27WDH5i8uUzhoo8sENCPgEFuC8bP8pkyx1Ks53jlpRBHLzNHGTo
 yx730FRODIiwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=CRfWnPPB
Subject: Re: [Buildroot] [PATCH 1/1] package/uuu: bump to version 1.5.219
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

On 04/08/2025 20:06, Dario Binacchi wrote:
> Release notes:
> https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.218
> https://github.com/nxp-imx/mfgtools/releases/tag/uuu_1.5.219
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

For info, I also removed the stale package patch which was included in
this new release. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/1c7948af337275ba3ec5ca9d2797fc4ba493da62

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
