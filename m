Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CC0C369D5
	for <buildroot@archiver.kernel.org>; Mon, 28 Apr 2025 20:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B04860D55;
	Mon, 28 Apr 2025 20:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 24gWyjNorX1u; Mon, 28 Apr 2025 20:10:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E23E860D89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E23E860D89;
	Mon, 28 Apr 2025 20:10:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4B5B117
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 20:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B02680BD0
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 20:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iFR2nuSOdV9n for <buildroot@buildroot.org>;
 Mon, 28 Apr 2025 20:10:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 111778132C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 111778132C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 111778132C
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 20:10:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2D0FA78034D;
 Mon, 28 Apr 2025 22:10:50 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 28 Apr 2025 22:10:50 +0200
MIME-Version: 1.0
Date: Mon, 28 Apr 2025 22:10:50 +0200
From: Julien Olivain <ju.o@free.fr>
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org
In-Reply-To: <20250428103506.147979-1-yegorslists@googlemail.com>
References: <20250428103506.147979-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <0b75e8a7355d7884b171c58a1b3f4555@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745871051;
 bh=32Q/1hiYIC8RilBOKxj951k2PDWJHhIshcWBkxEkjyU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=G7pBjYJLWCtdiBIzxd6F46JLcPHaJQLrIYTJLrHCYYS4yWBFHreN0XHD9xUogtpjM
 80z2kCFrBwkNiGHYxYNYjKEsZO4Jy5rirxeJTc8lhMN1DyCEa8W9ERHDefPbEzdmMw
 JO101Mjp74pa5OlqiRV3riXY949D7r0+Vr0PHR4jOog4IP/fBkII1UlnSoxymEx3MB
 t23DFR2zHRYePu6t2GUMYA0PQjyWTlhfq6yk1h0Ne4E1nlcQNaj63Jq0tgR97zc7aB
 mwMzT6d9mHq4D3YL69qCdUWil28tuycTOlz34L3JlBA38BDUnFHHkhP41fGlx9sCaL
 tUgYwDmgAjYbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G7pBjYJL
Subject: Re: [Buildroot] [PATCH] package/ncftp: bump to version 3.3.0
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

On 28/04/2025 12:35, yegorslists@googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Fixes:
> https://autobuild.buildroot.org/results/103b86c5473077cd95a245a762059a23f78c1a44/build-end.log
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
