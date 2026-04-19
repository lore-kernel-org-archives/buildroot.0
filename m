Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD55EA719B
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 13:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DFAE82332;
	Sun, 19 Apr 2026 13:56:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tteg1s7j9ruE; Sun, 19 Apr 2026 13:55:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0C1F8231B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776606958;
	bh=J72VwrrXhvzfl8ip8GSP5DInpHCvJWvRyDE2y82tEpI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dmoTtD4Za8Rgkj3zzDYwD3mIfFRee1ErGo5sWvNW8X/UfospprSKgoo41pBJc6OhY
	 iWDZs+m6Q5ERLeDI/BWDhWxRDMpwNscc0KkKs+fD+jU2pqmg64vkZyOk9VSN3ZtNKQ
	 SA7ShnwHcCUZls1nPCgd8uBpyu/h/WOJKJKTsw6HXs38eUSRi4WDC4Ptvq1irnb760
	 7tGRBiV3w+FKjIY+0ttw1OMejg/ailBzhBjMBFrkTzdFE4GlOkosiwRPwIeMX5nqFT
	 vNT3bGUTnNObIifX2pFQ6m8dXRUSoM1bCu6b2rMAl5w9Ka/6FoYD9MA1zTYglcK0UQ
	 zFqNFaCFyljhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0C1F8231B;
	Sun, 19 Apr 2026 13:55:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 28D0624D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 13:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EEAA40266
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 13:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EapQu3vELydn for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 13:55:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 182D2400AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 182D2400AF
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 182D2400AF
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 13:55:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 77C042003F2;
 Sun, 19 Apr 2026 15:55:53 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Apr 2026 15:55:53 +0200
MIME-Version: 1.0
Date: Sun, 19 Apr 2026 15:55:53 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260418212707.3778357-1-bernd@kuhls.net>
References: <20260418212707.3778357-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <c6cff140beb0bf67c3c6ea1ef55951f8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776606954;
 bh=iJP5RN8aN9TPlS+2f3hRyfnSU9x3DYLAgNADnNtFWVw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fZbHjQNJImeBb+qjc1Ue5+LRRYR/FLkjEcBpTuIDPy47LXrdzPKDOSNriy89+AceZ
 eHsC4jrBHceRJCRdq7fcfoUl5nriN9/52tdMhBHe8pSCYwAnRLPVhgdSHZfDxRVfNX
 wg2tVHpNobm4Ga2qHGcAT/vyW1MINcUUZ/lxkd/GzYEco3yG44FLVPodkkxMzH26Zu
 lRoTMvbTjITyfyh4rmqFMskQv2m9pit1uBMkNSGHoOJB6cQwqJ2dRtCV90sKs7Al87
 CwqXtUhubfQFQvVLoUbTyA7xbhuR5XlEryw/VrBuZMIAWlfKKTrFUsxEsWQ+h6aFcg
 UufDjqPjj5dMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fZbHjQNJ
Subject: Re: [Buildroot] [PATCH v2 1/1] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 18, 19}.x series
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

On 18/04/2026 23:27, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
