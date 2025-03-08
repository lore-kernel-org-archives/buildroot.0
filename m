Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31936C28B28
	for <buildroot@archiver.kernel.org>; Sat,  8 Mar 2025 17:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDFAF82156;
	Sat,  8 Mar 2025 17:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uDjpCjfm4tI0; Sat,  8 Mar 2025 17:52:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E2418215D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E2418215D;
	Sat,  8 Mar 2025 17:52:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E98C894A
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 17:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5AA940194
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 17:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JH-7woYpQ23z for <buildroot@buildroot.org>;
 Sat,  8 Mar 2025 17:52:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B117F400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B117F400DA
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B117F400DA
 for <buildroot@buildroot.org>; Sat,  8 Mar 2025 17:52:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 550082003EF;
 Sat,  8 Mar 2025 18:52:17 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Mar 2025 18:52:17 +0100
MIME-Version: 1.0
Date: Sat, 08 Mar 2025 18:52:17 +0100
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250307212422.502634-1-giulio.benetti@benettiengineering.com>
References: <20250307212422.502634-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <7a065182e647de6e1a10f1b633f718de@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741456338;
 bh=vvzwqPC6Ep/MMiA7buD7GezKTGO2dKPwcF57j5PW3Nw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RZBPLdjX3GQ2vVCmCADS8qQmuCBU2ubPVKQGIYlvT/5Mjf2m4IS4omE94sOd2h36w
 Y6mgNgRBizS+ioCvWvdIz64a2rupqmwhP0I3WFj0RDJkfIfDKRzIQzBY+yOCzwSeJ7
 LGKRQZYcrf1Fi0FWjeTNV6etw4dwjZmc9mRFbres3ywcIobkjpJ8CMx3+AzdBTh762
 j7fyPbkzY77SvrJbSMYBE9wrH0pFS9C5kUeE6zOGv2yw2lpMA+NG7ZR3c+qgwP9WLO
 EitRLVDdnFvvMM0cWzhbzoSzYt32QSPmhOMEc0EGTdlVjhlqkSM1WsEOwDHDbTqIwC
 3cIltvuNHBH0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RZBPLdjX
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 10.4.0
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

On 07/03/2025 22:24, Giulio Benetti wrote:
> Release Notes:
> https://github.com/harfbuzz/harfbuzz/releases/tag/10.4.0
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
