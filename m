Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AEAC369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 19:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C526383422;
	Wed, 23 Apr 2025 19:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IiAmjqcmdde3; Wed, 23 Apr 2025 19:24:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2D2083268
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2D2083268;
	Wed, 23 Apr 2025 19:24:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6722C19F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4CEE083268
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:24:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GOrxhsMoUMqQ for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 19:24:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 66CF0831A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66CF0831A7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66CF0831A7
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:24:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 8D1BCB0051E;
 Wed, 23 Apr 2025 21:24:26 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 23 Apr 2025 21:24:26 +0200
MIME-Version: 1.0
Date: Wed, 23 Apr 2025 21:24:26 +0200
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Grzegorz Blach <grzegorz@blach.pl>
In-Reply-To: <20250423190643.3526208-1-peter@korsgaard.com>
References: <20250423190643.3526208-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <9072c2839a83e8e64dddd94ee8c17b64@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745436268;
 bh=akn16I6Td0G6z2deHyHHUIaB3IGpmML3jzyWVDmW5bw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b3fbvtbt5ZNl/XjY5t9uPQobWVy8YoBDslDJLcT93T1RlrJm1DvpLAFUe6AfrSv3Z
 zSbetIbUZyL18qUE+wE9+zpJ9yUw7/7UKla0bvRWU05PVoD5q6Okz9dSYrzTkGHhsv
 uF8M5yu2PKC9671+zDmitMg2diWCmv3ezkFWsU8xwfg5yvl4QacbmH9I8QVew1IjLM
 fI2oAcjpNYoCr5DHb16GgxqjFL3I2VMDE9fvRBG6kk6yBy6gAOKEZzAhq0I0zEj0gj
 kf5Oi2C7X+L6bh1eqWNcvuAh0qx/SVDz31Hps7YNUFPpoJGEstBVj6IeLLv5yyYDyD
 uWc87hH/Fe6yg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b3fbvtbt
Subject: Re: [Buildroot] [PATCH 1/2] package/graphicsmagick: security bump
 to version 1.3.45
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

On 23/04/2025 21:06, Peter Korsgaard wrote:
> 1.3.44 added the following security fixes:
> 
> * TIFF: Fixed multiple heap and stack buffer overflows (directed by
>   the source EXIF profile) while writing EXIF into the native TIFF
>   IFD.
> 
> * FITS: Fix problem that the FITS reader could return invalid image
>   frames with rows or columns set to zero. Other code in the library
>   crashes, or even asserts, if invalid image frames with rows or
>   columns set to zero are returned.
> 
> * Coverity fixes: Various fixes for Coverity issues raised after the
>   update to version 2023.12.2.
> 
> * Clang Analyzer (scan-build) fixes: Various fixes for new issues
>   discovered by Clang Analyzer.
> 
> https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/7046c344273c263a9b6e4901b910508aea3804b5
> 
> In addition 1.3.45 fixes a off-by-one issue introduced in 1.3.44:
> https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/96f765a2e3cebf0b70094da34d03b73c50c3aa63
> 
> Update the Copyright.txt hash for a change in copyright years:
> https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/f0bba104ee3859286ea8adfc2ff603fd64be5624
> https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/26fce892769e4a26247dd2db5b8dc0719ce20953
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
