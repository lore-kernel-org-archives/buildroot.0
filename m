Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194AFFF886F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 18:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64A5641599;
	Sun,  3 May 2026 18:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T3qfvUX_HH8D; Sun,  3 May 2026 18:03:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D45541590
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777831401;
	bh=wej4r1ZByewbqac1FeCpDfMsUvPo4JFwerJVm47dBZ4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nIwpLxMD31WddcHx3VJDhx3dIezS6pXJrwncykfFDw6Dha6e3p0J1jsQVwMzu0lGd
	 DvW4v91qbvmymjuO9D0ZhrSzSeBmnMB+8ikperzovf2M1Cc8qzQYscFKcQVLsLXIR8
	 689AFQ5GzPx/EztgUX32xjaWq7rEcGEt0pCAK9LAds4F1R10IQQ82Y33H3CBpp709a
	 Ot3yT8C80euHp/GJdTTJc/uCmRGIhmeLJ5TaiCTPHThHlLmG4/2Pl48C/P8OlqI2Ty
	 U9nINCza9tFMX8eUs13NfQQ7Mqy9JGj19NbFmg9TB1tcL/otO9SpTSkzYdLPGxC17L
	 mGv1754Bx385Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D45541590;
	Sun,  3 May 2026 18:03:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 650ED190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 18:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56B7C40752
 for <buildroot@buildroot.org>; Sun,  3 May 2026 18:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDzOqVjH2uo0 for <buildroot@buildroot.org>;
 Sun,  3 May 2026 18:03:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 877A54074C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 877A54074C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 877A54074C
 for <buildroot@buildroot.org>; Sun,  3 May 2026 18:03:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9BF3313F8CF;
 Sun,  3 May 2026 20:03:13 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 May 2026 20:03:13 +0200
MIME-Version: 1.0
Date: Sun, 03 May 2026 20:03:13 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Olivier Schonken
 <olivier.schonken@gmail.com>
In-Reply-To: <20260501053635.370157-1-bernd@kuhls.net>
References: <20260501053635.370157-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <669cd6e8edfbd681bf7de5c391186289@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777831396;
 bh=WvSGMoLcqCJLHAUuo7gnpDufUxeF6ECSmc3UeWrKkyg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sP6/3KPm1ZXbgLwu8XOD7p/aEeGzRSz44Wfl9PBWawhG7LqoedqF3riXhE5ZxCFQp
 zpJ9VSHItQnY22pYvc4sKhq8+udapP+61FGdqpjhc8yEmZzZz/Feq9QAiuRu9mHd/T
 q1T0n8SGwvIWn81K5oxzvSA5J+JSYIexFca8wHFmw0UKEyD/RIA0OgRR9VDhNDg6RZ
 auQgnxflciHgVEykR2P31thd+l5pQMfchxPpxAE2xh7s0OlQuelUT+kXgI9nVEjMTy
 QODskp8FOdTU1Ly2hRnvrE0vsJiI6OqeEaBTUDY7jKiCY+Qtr4l19+fsHSozNWZPYa
 ZW6tGVs5oe3mw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sP6/3KPm
Subject: Re: [Buildroot] [PATCH 1/1] package/cups: bump version to 2.4.19
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

On 01/05/2026 07:36, Bernd Kuhls wrote:
> https://github.com/OpenPrinting/cups/blob/v2.4.19/CHANGES.md
> 
> Added sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
