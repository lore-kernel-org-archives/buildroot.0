Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2DEC5AD49
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 19:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BECFA80A7A;
	Wed, 28 May 2025 19:52:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uVXxpziHxd7h; Wed, 28 May 2025 19:52:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57DED8078F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57DED8078F;
	Wed, 28 May 2025 19:52:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 216D4B66
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07DE860EED
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UNTZlvtZH09a for <buildroot@buildroot.org>;
 Wed, 28 May 2025 19:52:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F382A60EE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F382A60EE9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F382A60EE9
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:52:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 0F352B0054E;
 Wed, 28 May 2025 21:52:38 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 28 May 2025 21:52:38 +0200
MIME-Version: 1.0
Date: Wed, 28 May 2025 21:52:38 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?=
 <miquel.raynal@bootlin.com>, Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>
In-Reply-To: <20250527-fix_gmrender-v1-1-9a66d16c8167@bootlin.com>
References: <20250527-fix_gmrender-v1-1-9a66d16c8167@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <55de45e3eebd887b9a2b58c157c52db8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748461964;
 bh=xl+ye6mZoCCZv4yxJvu4TVZOXAAGYbgQJiwdbI1nXKg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LRQruXVYk3G6qtUSbikYz9RDPmFIO6s/HGc3glHnPS0nNGrm59i4lKjccxUbBISki
 GTu6th8l/3KsweSfx8nIeik2wNWRAcUKY1oebv+CgfraVSwjdTVs35o2vIlPcMZyrh
 qvetiiBd1VYclAZWurLfb+PFCKdMQcj03PolwA7wEsZix3v9sHwT3C5SqXWi2VOkze
 8/moy2nPnD+D7wT2WcIhFueyaOS3yGs1uSmwMDFVTTvO2oilzp3wo6FC0Sw0bhoYwa
 YBWm6EjgfNNVo9yd52R6H9DvV/ijmx4m+vacx49M3JtCMu/B158iQPu4cxN+VWm2yK
 dr957Vgdi8Dng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LRQruXVY
Subject: Re: [Buildroot] [PATCH] package/gmrender-resurrect: bump to version
 0.3
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

On 27/05/2025 21:23, Thomas Bonnefille via buildroot wrote:
> Version 0.3 (and 0.2) of gmrender-resurrect bring some bugfixes.
> 
> Fixes:
>     
> https://autobuild.buildroot.org/results/1e1/1e1e5a494bf1ca5ba920c4e06a1affff4ad61033//
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Since this bump is mostly bugfixes, I applied to master, thanks!

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
