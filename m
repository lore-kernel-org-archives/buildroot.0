Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BD8D15D85
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 21:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08DC841A56;
	Wed,  3 Dec 2025 21:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uD1IrlUl051p; Wed,  3 Dec 2025 21:39:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 737D141A2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764797953;
	bh=KkyEKd6rLX87KAk634nHoLpRUE9GNKEUzD4z7XcgIUA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f4JjwLXOWc/zauSEtDv/4N9NElqnW1Mg2b7uBd4b/iz5/igo3Vy+WBTErOAK1MVKE
	 LKND2Lq5U48/gtcsQjh0bvCYQ6SBvgpxcPR1sLiLKItsenDTRWPttORcGz4B0uAg0x
	 Y5yFVyRdAt8IrYP3f1zGsVuoTxyOQob76+0DvTkY+/k0l4jR/aL84IhWzA5efhIB5t
	 oR2P30088DufdkS/Ou2M9GnHUv/bgBjrAde66quZ/GOBnFqYE4u0+k24xFg2w+MiBY
	 H9rcHsFv9t3tRakwBQ81+ZzTavTiUsqO+nrGHsqrGSAh81AXOwVyXgHAN43FatOv8x
	 s+pflCyoCvzVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 737D141A2F;
	Wed,  3 Dec 2025 21:39:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 07D4CE4
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2D3240175
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:39:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmuXvS4L3rzB for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 21:39:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E724940156
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E724940156
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E724940156
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 21:39:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 384D8780368;
 Wed,  3 Dec 2025 22:39:05 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 03 Dec 2025 22:39:05 +0100
MIME-Version: 1.0
Date: Wed, 03 Dec 2025 22:39:05 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Sen Hastings <sen@hastings.org>
In-Reply-To: <20251203191409.4096911-1-peter@korsgaard.com>
References: <20251203191409.4096911-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <bb6b6b4903244ae58018dd8d200764c3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764797948;
 bh=1lAS4oUj8JgQboFYi+QD147eUDE0ZN9g8UOhOMSmKBQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PI34Y+Xdb2xGlgkJymveS7OlMVmGL++246l/Uq+EJfCD6LSoL55Y+IgAxW2QXcrFb
 yqxJSGfaG/yIJH7aD7L3my2/4hHM2KcyGcS6H4jwkhr7JJa6WUb47vidEry0gvdU81
 p0e6qvR8o0H67aSm8Gl8glqnb2Gus9puo1a9i3LDzlO47JB6YInAhJGjp/bKAFoiLN
 rsIbOWLOKGSHvgLPr2ILRcEUNe4Fc/B7WQ6CNYsHZ8H6yu4AmhTswzwt46sq8cTQ6i
 W1WP6YfxD8tok8D61ZE+y+QJK2wo0Qpt+jXL8ccfmJxZBmuYIY83slWjil56KQm/Ba
 vWBAbudDIXujA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PI34Y+Xd
Subject: Re: [Buildroot] [PATCH] support/scripts/pkg-stats: use an unique
 HTTP user-agent
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

On 03/12/2025 20:14, Peter Korsgaard wrote:
> As requested by the gnu.org admins:
> 
> "
> Since August 2024, we've been under DDoS attacks from common command 
> line
> tools.
> 
> To fix this, we would need to change the user-agent from "Python/3.11
> aiohttp/3.8.4" to "buildroot.org pkg-stats" instead.
> "
> 
> It indeed probably makes sense to use an unique user-agent string, so 
> rework
> the script to do that.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
