Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC12AF364B1
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 20:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B56E7810CB;
	Thu,  9 Apr 2026 20:05:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TH6a30I9TuXQ; Thu,  9 Apr 2026 20:05:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C83FF80B6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775765128;
	bh=kYdlAK2Sx9TdefYBw/QQl31yS4jtBBm9IauJA3esbS8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mkprAhn5KAp8+lJm+dYQHpUAoJVcYnJ4tEqsP01zveNnMSezej8Z6D4kBtRS+QO1L
	 O/Yl3okLJ8APgUYxkFt0Z6FNBmtxtbyksC5sI447SZnESH0gxw73887scJ9ne7e5hV
	 IkfkSPZJyWMYga3tnPW+eFj1SeyOxpaV86P8aqAOGKDKpOMw8IEXU6+SycM1o7ggB6
	 k9hAU9AuwAd26ZCPhjiVfsw5JveX6FyHjz1KIDXHyM5+ESHvh7GXkUVuxSm9ykOs5v
	 xhwPXk0l7cjiwo9tqrbqy9sMZ8QoiwfZSqTI3969//W7MB4ArZ80LbJWeIm/DMIM2C
	 4tT1gWcXMf4uA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C83FF80B6B;
	Thu,  9 Apr 2026 20:05:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 707AA237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5612E605F9
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:05:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SJUDQo1tzbtu for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 20:05:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 91A1E605E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91A1E605E4
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91A1E605E4
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 20:05:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 56E752003C6;
 Thu,  9 Apr 2026 22:05:21 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 09 Apr 2026 22:05:21 +0200
MIME-Version: 1.0
Date: Thu, 09 Apr 2026 22:05:21 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Christophe Priouzeau
 <christophe.priouzeau@foss.st.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20260409174006.3948266-1-dario.binacchi@amarulasolutions.com>
References: <20260409174006.3948266-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <b40b122bd5ced1fb7d6f8a52db9c43fc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775765124;
 bh=Pbh31VIak2DafLUOU8KwcUlVa4cVFXRIGCiMnagnyQk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GG005kHwGfB+f7OVg0H5pVOmVZiwZLvLH/hYlLfSJ7jODKkDMbtL3zkfOPOBBftOR
 vSR9aj33qaKQS5vZNjm8XRIGHI1rIfbNL59GThohzXs/VJ7hmAhg+SpPR8EvsMnmya
 PJagRuBqPYgGALQfv7dmXAJG3i+qEIUmjyw9CL22FZhLsHl+Dygx1U+lo41IDE1Ax9
 mPw+yR1f5dwq1UMCXSbBswOUQVxMl7n1uF8QhUDvrxRVf4dPOvK/y/XsWg2mQkZM/E
 JotZh2ft+Q3NP0gRHj/KJQ+hh/pjeki55VboxF2LZc3MJtFResl0/NCZQxkhCgdP4K
 RfW4VgBR9f4dg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GG005kHw
Subject: Re: [Buildroot] [PATCH 1/1] configs/stm32f469_disco_{sd,
 xip}: bump Linux to 5.15.202
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

On 09/04/2026 19:40, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 5.15.202 and, for the SD
> configuration, also updates U-Boot to version 2026.04.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
