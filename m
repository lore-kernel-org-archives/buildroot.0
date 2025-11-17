Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50F1CEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 22:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B24AF40D1A;
	Mon, 17 Nov 2025 22:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WFyAYlVbdYNk; Mon, 17 Nov 2025 22:20:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6030412FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6030412FD;
	Mon, 17 Nov 2025 22:20:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E4DCD5
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 22:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BA2B8125D
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 22:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pVM-bB-uFpFM for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 22:20:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3FD96811D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FD96811D1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FD96811D1
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 22:20:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id C9A5D780333;
 Mon, 17 Nov 2025 23:20:13 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 17 Nov 2025 23:20:13 +0100
MIME-Version: 1.0
Date: Mon, 17 Nov 2025 23:20:13 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251117185838.4083475-1-bernd@kuhls.net>
References: <20251117185838.4083475-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <7565afe0ceb24f690d03714fae6413f8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763418014;
 bh=OxSpYzSZVLs/+AfL4F+jQGu36LaQc2X2tflB6C01NYs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=brDuw18uEMg8jW62wjaSPnPX6xDQWwc4lfCx+i4CS6uqql85EOENaFTLDkAvPsGqf
 9cQsPa8WbkZswN4tLo+6Y6yZkK66frpcg5eUePAS8SAuyypjtnowLH2TCT8MsjYX2G
 ICcSt3ELPmSwy7FaOaWsrIfN+1gjBjZX8qWd89Tvm6NdB4PZQ/dj7nyB3xgySXmZw6
 Yxi9sgC8x9lcBVrdWhd2qtolyrfCd1Tm9y9tBtRl9oWJ8C5Vn5cLKhaRy2f7n94Vpu
 ktxDzi3ncsfnQX5cQB/5IjzDpTEN7hhoO/MHi4DWL0zJuxUhFmLmxr7EeMogzIWndQ
 FC2DLjzEv9gWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=brDuw18u
Subject: Re: [Buildroot] [PATCH 1/3] package/libfreeglut: bump version to
 3.8.0
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

On 17/11/2025 19:58, Bernd Kuhls wrote:
> Changelog: https://github.com/freeglut/freeglut/blob/v3.8.0/ChangeLog
> 
> Removed all patches, they are included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
