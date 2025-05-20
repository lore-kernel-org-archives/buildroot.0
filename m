Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB1DC3DA6D
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 20:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2518F40AD9;
	Tue, 20 May 2025 20:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNnMUSQv41uW; Tue, 20 May 2025 20:58:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 745E540B4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 745E540B4B;
	Tue, 20 May 2025 20:58:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CFDC2D4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 20:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1B9C4023A
 for <buildroot@buildroot.org>; Tue, 20 May 2025 20:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1TrQigdaQR4 for <buildroot@buildroot.org>;
 Tue, 20 May 2025 20:58:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DD5D84013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD5D84013F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD5D84013F
 for <buildroot@buildroot.org>; Tue, 20 May 2025 20:58:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 87BAD5FF95;
 Tue, 20 May 2025 22:58:08 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 20 May 2025 22:58:08 +0200
MIME-Version: 1.0
Date: Tue, 20 May 2025 22:58:08 +0200
From: Julien Olivain <ju.o@free.fr>
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20250519150409.25390-2-fl@n621.de>
References: <20250519150409.25390-1-fl@n621.de>
 <20250519150409.25390-2-fl@n621.de>
User-Agent: Webmail Free/1.6.10
Message-ID: <c25f2666b0eb33e0df60f57ace7f528e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747774689;
 bh=kxZmybwNWhTBK3Ow+JUlJVSg9qD1auhTkxPm3kol8Bk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j56KQGTV9KwrgSVW9m8+6y6B1e+Qz1p0+FWjeIO7cdaBCcuKHCAochypBszi2SxHO
 8oVtBFyDHRd8zq/Vtqcv7WVZUhh6C7hhh4cZEhuUHlwhn21cd6FLvhQPO0HSekm/sv
 sOOB/RYkOIK33hdqfEqmlh3BPZ6DgmtfaqJ76vg/sW/lSQjZU87xuLpBtlMtxPIvNv
 idK6wmTaqlKgsXptYbwnT9W9NJYuuCBxxlF/WFkGZkACau1zgW4suIXUKNe/PlF4B+
 pRtGrkCZdGjYP2Tc8NmqWv0ShttCgQZtrat3gSMOWIfHbvbMMD78oyeHlRSES020mt
 bKMzypGjFvHNA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=j56KQGTV
Subject: Re: [Buildroot] [PATCH 1/2] package/casync-nano: bump to version
 1.1.2
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

On 19/05/2025 17:04, Florian Larysch wrote:
> Fixes build issues when building against LibreSSL in particular:
> https://github.com/florolf/casync-nano/releases/tag/v1.1.2
> 
> Signed-off-by: Florian Larysch <fl@n621.de>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
