Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4577CCAC5B0
	for <buildroot@archiver.kernel.org>; Sat, 27 Sep 2025 11:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1435D42187;
	Sat, 27 Sep 2025 11:42:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQrLgVdMR6wh; Sat, 27 Sep 2025 11:42:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19FF14217C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19FF14217C;
	Sat, 27 Sep 2025 11:42:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD75212D
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 11:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3BFE4217C
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 11:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOzY0gAPoslH for <buildroot@buildroot.org>;
 Sat, 27 Sep 2025 11:42:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C7A3C41251
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7A3C41251
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7A3C41251
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 11:42:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 49B0BB0051E;
 Sat, 27 Sep 2025 13:42:36 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 27 Sep 2025 13:42:36 +0200
MIME-Version: 1.0
Date: Sat, 27 Sep 2025 13:42:36 +0200
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org, "Alvaro G . M" <alvaro.gamez@hazent.com>
In-Reply-To: <20250926105120.631224-1-yegorslists@googlemail.com>
References: <20250926105120.631224-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ede7c3683432c229e72c6cc3a01a2cf2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758973358;
 bh=2DvPJ8y/UoxH/xwu5HV3FLr5jssXHlrtljXunqm+4N4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=U5m0lg3djaFou22cstL8DsBDmW/3sUkaHT/NYegrsWF6pgcnrcZqgRiPgq1oeGIXa
 4bPe9cbsClwsGONmufeQiv0vXYMefZGTkOyslZldBBVdLikFXNkg4o1S5NcXHz0tKi
 yLbCGvQousejnR9dGMfR3cVckEaBZ/VvWyVt3VeTuPgo/G+K+pvDeENdgymn7wRLIj
 Yb6kT+kXANBAD1c1w9ri8Pg8cXPeMu7QupsHg2u3AOEbORIIHOVji77tT5QthikVy/
 KmVhg47ufU2LqPHAgfZO2pyN+xUYcEgXxLMVpKnFq1Qp0NY2CazUCnl4UZQfL7f9ke
 iScnORpzKLecQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U5m0lg3d
Subject: Re: [Buildroot] [PATCH] package/libxmlrpc: bump to version 1.67.00
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

On 26/09/2025 12:51, yegorslists@googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> For change log, see:
> 
> https://xmlrpc-c.sourceforge.io/change.html
> 
> Since version 1.65, Libxml2 was made the default XML parser. Hence,
> if libxml2 package is not selected, disable libxml2 support
> explicitly.
> 
> Remove already upstreamed patch.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
