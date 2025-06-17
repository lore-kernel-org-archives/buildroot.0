Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F89C71157
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 19:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5883F80CE6;
	Tue, 17 Jun 2025 19:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxawenzRM-Da; Tue, 17 Jun 2025 19:08:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A33A58215C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A33A58215C;
	Tue, 17 Jun 2025 19:08:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5366516B
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4532580CE4
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:08:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h82ADACo2r8A for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 19:08:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A20A680CE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A20A680CE6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A20A680CE6
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:08:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 0AB022003DE;
 Tue, 17 Jun 2025 21:08:07 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Jun 2025 21:08:07 +0200
MIME-Version: 1.0
Date: Tue, 17 Jun 2025 21:08:07 +0200
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20250617122445.2019214-1-neal.frager@amd.com>
References: <20250617122445.2019214-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <2af52ab1750d728446879205e0892a85@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750187296;
 bh=SbEbsG+9VlyPvi5crrJUoaDcrCt/2oHht8DpmvNECDs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IPuLyIqs8PWomK6qtCNmlJnzLEys+7C438y4Ys3eHOK9NlLjYe9rMJFOWodFRsqxp
 LoY2RfG0MyF3yAPZQ4HzMkC2xjN8J5YpPUNioUssTrZ9LNg/n5VDlRi8RJwUzX+CVf
 TmiNm0vPtZbpdqHZfJdYT86gzMhHLNym2pT/KJvHMdsq8sHY1f24wHnaLDaBB4hDry
 06lPGWfvY8mgNbYkA/v3irY381OmF9IkVBkLQ3XyO0x4MhgHhR1dfNokH8cfRXdBXD
 1ZogsANWul4EfUORyTbntQteKLtrr70HeQ88WeyNEV5qQDGT7uuS7ZkuhxF26CbA5+
 qDHGVW7l6TJVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IPuLyIqs
Subject: Re: [Buildroot] [PATCH v1 1/1] board/versal: add custom board
 documentation
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

On 17/06/2025 14:24, Neal Frager via buildroot wrote:
> The readme.txt file for versal boards does not have documentation for 
> working
> with custom boards.  This patch adds documentation for custom board 
> support.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
