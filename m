Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35383F531CA
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 19:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A9ED60EFA;
	Mon, 13 Apr 2026 19:47:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0y70wKFh6NB3; Mon, 13 Apr 2026 19:47:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC84A60DDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776109677;
	bh=g1rvhx0yxRt5XZYX9cnEnoMzIpkb6R7WwxuVZQOYAdM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Vb4h83+Ko3ZLwg1C/Mf/tdY+v8wFWqlezm57m7Ha4MQoQNYbow+YCvOqYmo94wkXb
	 tURZlWEr8Bj2vGBNiFpeb7xyz6LN36P7cXDqjFZqGfg5/CAg1i2PiCRco0rRyWRr2k
	 Fzhw0iz4HP8etKjRaJoyIoK70JX3ubjBw33wbTOpSTwTMP81c9Hc6/frZnMoKPFQrF
	 VgmtcgLQWvZ/ZX6YgGxx4lb4qEAIFWdGc2rg+nrsYMgZIJ5FiPSr2TiBNwEDFGnFbC
	 knIbd/SBfc2tF8Uoctof5Kz8wCRLrubE1oh3LO2mdnoa9xfc11LIVpYRHbp/RoG4kU
	 +DwQdvF3CBCxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC84A60DDA;
	Mon, 13 Apr 2026 19:47:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 59139283
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A81483BB6
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:47:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SO16aV1t75Fl for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 19:47:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3F238832C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F238832C7
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F238832C7
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:47:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2BA4D5FFB4;
 Mon, 13 Apr 2026 21:47:48 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 13 Apr 2026 21:47:48 +0200
MIME-Version: 1.0
Date: Mon, 13 Apr 2026 21:47:48 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Giulio
 Benetti <giulio.benetti@benettiengineering.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260413082817.3553573-1-bernd@kuhls.net>
References: <20260413082817.3553573-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <f84a8276b43da312749cdfc0d9c63be2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776109672;
 bh=XzQAYUHZdyx/35mnSBV6Tbpue+i7YhUjsG1dmgAaqDc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=G/OWVOCefXx3CA3GYLA0BSlpPmXDcaIfCbd6oJE54wCpg1lKTUMRfsHUc6Mnowasx
 N7EzvhPfKcqCbyXlyCiJAxxjNf4WPW+T/QuvP9mdcOFGiorgFCvqa+T0frJ4iZnjeq
 K9y4nK1wCGF52w3wwxzG1sBnjZPVkPehwFsVlZsCDe85d1xd/E5g26PnNkpB1V+MPp
 1gj7hT+T6MDzv6sBAlqBsByQEyBZmcRKYqDOSYXKldQ5ebRn+qgCR22+/f+kRjE20Q
 7VgMpojORWGBacVsrqrnT759ojHu3/LbThW1VPJEHwGMjxXp9ddNCgaq8JpHGV+NuZ
 /PKBJ2RFhxebQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=G/OWVOCe
Subject: Re: [Buildroot] [PATCH 1/4] {linux, linux-headers}: bump 6.{1, 6, 12,
 18, 19}.x series
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

On 13/04/2026 10:28, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
