Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9124BC54FB3
	for <buildroot@archiver.kernel.org>; Thu, 29 May 2025 21:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A4416165B;
	Thu, 29 May 2025 21:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nEw3QbOJU7pD; Thu, 29 May 2025 21:06:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99B656166A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99B656166A;
	Thu, 29 May 2025 21:06:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 74873236
 for <buildroot@buildroot.org>; Thu, 29 May 2025 21:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71E3741F89
 for <buildroot@buildroot.org>; Thu, 29 May 2025 21:05:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVO8hMLtRnxz for <buildroot@buildroot.org>;
 Thu, 29 May 2025 21:05:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B36F741F83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B36F741F83
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B36F741F83
 for <buildroot@buildroot.org>; Thu, 29 May 2025 21:05:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E8FCAB00539;
 Thu, 29 May 2025 23:05:49 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 29 May 2025 23:05:49 +0200
MIME-Version: 1.0
Date: Thu, 29 May 2025 23:05:49 +0200
From: Julien Olivain <ju.o@free.fr>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Julien Corjon
 <corjon.j@ecagroup.com>, =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>
In-Reply-To: <20250518121131.2821530-2-arnout@rnout.be>
References: <20250518121131.2821530-1-arnout@rnout.be>
 <20250518121131.2821530-2-arnout@rnout.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <4f35956be34701741699c5079cbf18ec@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748552755;
 bh=C91n2I5g2QYF3dCu7wxv7/POfWglH4C8fWeHagou9EY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZhczeLJYJHW0f3DMtD0lp83gPnKeQpeLkO8LK2fR7+pQxvFisr3jaAAFtIc/K3P6r
 2Vtat1axcS2jN0bZKwDh9D7WtJt070ocXDWBhs5x0wQbZWQt1UsR6ymfr312swhQ2H
 b6g3meEJI7MJXV4EoHNw3+1uuZebYKmBa1CvKVFGAnw78MvoA1T9FmKbmmpGlWfJjR
 QQhhI0VNYv6JHP5gIWDL+0tvUVvkZ1C4nEYw3vkq75TzM1nRv8XqTq7M4mDDiNHPkM
 GPnXuidPwO/QnWKfmGMU8cLM97rFYMPPhemYplXB4i4bMKLaQf+2xOdsry/EV6VIgK
 HPJFfHpzYuztQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZhczeLJY
Subject: Re: [Buildroot] [PATCH 1/3] package/qt5/qt5declarative: fix build
 with GCC 15
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

On 18/05/2025 14:11, Arnout Vandecappelle via buildroot wrote:
> Add a patch that adds missing #include statements, which becomes an
> error in GCC 15.
> 
> Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
