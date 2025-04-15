Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88444C369B9
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 21:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 468654129E;
	Tue, 15 Apr 2025 21:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W4YvomiFoFm6; Tue, 15 Apr 2025 21:40:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 794524124F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 794524124F;
	Tue, 15 Apr 2025 21:40:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 17A03108
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 21:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 092744023E
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 21:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DvSJv_1e3_Kz for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 21:40:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6E6F1400CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E6F1400CB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6E6F1400CB
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 21:40:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 02F05B00596;
 Tue, 15 Apr 2025 23:40:47 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 15 Apr 2025 23:40:47 +0200
MIME-Version: 1.0
Date: Tue, 15 Apr 2025 23:40:47 +0200
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
In-Reply-To: <20250415200047.2256467-1-peter@korsgaard.com>
References: <20250415200047.2256467-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <e557a1640a070d74b749b727e0689018@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744753250;
 bh=AO8K020mtb5x/P1uht4Ow0OODyj20cX2y6oCWUW6QQ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m+siP4UXcXsFPy0vOtnxVeXIyAd9wIZQ92GtYL9oDMZXR3cilLSs3BJMjmW//FBl8
 YHcve5jopAxiKMaMfg2tEs/9yrZhf5CPJlaSz3IagE2QcJJB3DDgOW8KPLGKrngAlc
 3KkzgBN2+c7JVhi4z4Iyiuym8uJ3rzwq0XZ06MAN07/a0EOfqsft1wS/mFQAYQYnpY
 Gy98V5QcSEa0emYiSutiQLnUq0AC/S2nFoIkfMWT9eaDQezaJbEtIVoCTNiVektTXP
 pkb0uroAM6W/c/ylcIz9/6ZlD2FLuRyueiWF1oa4minZQrZ6lG+t+djl8qmyn8qffW
 9+QBJOgYXAKBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=m+siP4UX
Subject: Re: [Buildroot] [PATCH 1/2] package/libopenssl: add (proposed)
 upstream fix for parallel installation
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

On 15/04/2025 22:00, Peter Korsgaard wrote:
> The openssl developers have proposed a fix for the parallel 
> installation
> issue worked around by commit 27ab880ebb9a (package/libopenssl do not 
> build
> in parallel).
> 
> Add the fix here so the workaround can dropped again.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
