Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D9CC531CC
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 17:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DAC360ABE;
	Thu, 23 Jul 2026 17:39:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6maws4sIjvD5; Thu, 23 Jul 2026 17:39:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F87160AA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784828353;
	bh=hGmlixtd2C1Vc6i+JnIpGpzA8+/UndYZs0lZx3VSvFM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KeWXypdIG1w7ZaxyznfUN9Sv+/8X2LTNORnSzRlFQV4Xez7eUq80KlYbgWxGlz5hp
	 gIeZN82eTXRuY42VRahiC7A0JPEzd63Cfx56U6KhgR0oD9g3ur0pxq7WJnAJ2Fc19j
	 fjY27Ycis9xWXPBWYVpKsD+jfhWgV8LvuqEO1p2+aZRQtUX56ZOmJlAKO8lKGO5xrl
	 od4h9+SFsf6sEDc+PAFNuEJH9wBgX9Sx53yifisY2s/nTDWZrDMGDVnTpfdEHeZzWU
	 njhbb0Iqb0ByFTh4Vk24RDRPJarMB/jfgi44otSnQVFztCRjoh6EZHxWoNuhK6bVnb
	 tkSrAQexGCNmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F87160AA6;
	Thu, 23 Jul 2026 17:39:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DD1E42A
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 17:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7AC081101
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 17:39:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kqLvYekchCMb for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 17:39:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 19D5C810CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19D5C810CC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19D5C810CC
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 17:39:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9FA3213F88F;
 Thu, 23 Jul 2026 19:38:59 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Jul 2026 19:38:59 +0200
MIME-Version: 1.0
Date: Thu, 23 Jul 2026 19:38:59 +0200
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Vadim Kochan <vadim4j@gmail.com>
In-Reply-To: <20260723115618.1882847-1-maxime@leroys.fr>
References: <20260723115618.1882847-1-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.17
Message-ID: <6997885af983a3017a1022b561d624fa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784828341;
 bh=5r7mSov0US5GQAD43il1+GTYnt6ayN3jYPFMqU85sFY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SGqpHxAZZn8L1ugkWHEQv5JdC8eQCaTRCrhK8nYr4PgESfvfyASYG1V4At9ztBmnT
 Ec5U3jKvkbnCwkXu+JCjC1ydM470aypZO1lDZ4io+ZW87yG8QDAaqAnTIM3q+Q/tPZ
 iXasY98eQi0MgwMqcmTld+6CcTNLPu2+cfVbNS2SNwr0Si4GymxIdLyUMbElcIK9RI
 uBJidFO37HudoRKq9y5/VOj3t81pBBGupgr2Ldq4xYVtCngs+1zqdoG9odEhKMIbk5
 d3051+L61e5rMMAwASTiB9hr1dcsashNfl+ngJDuzvi3HOO6B/RrBXhnWIm/Sl4/8W
 kRnln2A4KxeJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SGqpHxAZ
Subject: Re: [Buildroot] [PATCH] package/frr: bump version to 10.7.0
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

On 23/07/2026 13:56, Maxime Leroy wrote:
> For change logs, see:
> https://github.com/FRRouting/frr/releases/tag/frr-10.6.0
> https://github.com/FRRouting/frr/releases/tag/frr-10.6.1
> https://github.com/FRRouting/frr/releases/tag/frr-10.7.0
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
