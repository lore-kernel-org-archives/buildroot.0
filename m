Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9561CD98DE
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 21:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92CB841BA8;
	Mon, 15 Jun 2026 21:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ri4e4M-qHLhv; Mon, 15 Jun 2026 21:32:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3412D41B8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781559179;
	bh=5f4e2WvKO964Xemnc9OGMlI5T+ONvSsQ33GvpW2o5r4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dJ418ez9DA4JgDLb/HcVbhmukehylCqVm7/4vCOV5eBPF08jpqCN78ebYM1jyiJOA
	 d2CTLjmtLjskAJZETtbE1blvbga1uTrEE6gDYZNBpJ2tHlLldPQNi5FcKb28jiekLR
	 Ac0RySFhTcJXtfMPoZa1cx+uJyqWxUYP79Zq6CSrFoOHOLcRjTBbxEZNK906BV73Pe
	 rr2MsQgE9m0h7uEBrLLAle38pIgs8wceMMYDTs27wOgwiGgG5NZTnR+uA1fsCjeH/x
	 gzq5flr2gm6h4la4BDxqMRqjBFoU0K07y2OrhaHwnM1piG34ptqHVPruigwUN6NAgp
	 EiaIloP2KKkVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3412D41B8F;
	Mon, 15 Jun 2026 21:32:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8CD56169
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EC05615E4
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpqBMnD-cdbg for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 21:32:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C36E7615E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C36E7615E2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C36E7615E2
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:32:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 788A65FFAA;
 Mon, 15 Jun 2026 23:32:50 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 15 Jun 2026 23:32:50 +0200
MIME-Version: 1.0
Date: Mon, 15 Jun 2026 23:32:50 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260615202559.1465158-1-bernd@kuhls.net>
References: <20260615202559.1465158-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <6dbb716e2fb89dac60a7e942e2fdae4a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781559174;
 bh=Y5BO3mxskgInDPLsRTCKraVkE84UNarkMFms0dzw4fY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ll29iTf4ceuxaIQ1FxNtrffg6uQkbtUiobgEsw9x8Q6bhMMNJDxbOma2meWtDO8vg
 nlyyvU5spyR67j/kBikKHVAbYioxJg8hZ3mI+7c2cpZct3amH1Bfxt4mEImotwyn2S
 /B+FpPdyroCGmSvuyTklW2YkwZraf012hp1G1KqPX3Vp9847FeF0RGH7+1499/kvNZ
 AWihlb3k957Vr/TkBINu6AXq3BXpkC+OIr41z7q7bBetQFM3XGHj3rhy4aYEyrqbWR
 /f2qnl/NTZ4nHbajwxkIcuA/pjWI2ARjsiSXqpwaYjdr1qG9judWi5tk3JjBz5P8bQ
 BnptgekJ2+7Cw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ll29iTf4
Subject: Re: [Buildroot] [PATCH 1/5] {linux, linux-headers}: bump 6.12.x,
 7.0.x, 6.18.x series
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

On 15/06/2026 22:25, Bernd Kuhls wrote:
> Update the latest kernel releases to:
> - 6.12.92 -> 6.12.93
> - 6.18.34 -> 6.18.35
> - 7.0.11 -> 7.0.12
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I applied this series on master, except the patch #3 selecting 
host-libelf.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
