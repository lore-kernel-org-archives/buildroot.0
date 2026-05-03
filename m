Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8A3CD3424
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3823E61613;
	Sun,  3 May 2026 14:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TlovD6O03hHq; Sun,  3 May 2026 14:51:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 683956158B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819916;
	bh=fyjrOARA0ibrXBvsR8M0liK4jwQxDdoKo+PNtvWtO24=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Hp57V4mO8o9AqvYeRWgEriKgLu/hiJ/R607J2oOCs+XaQ31OM81NigxwV6zLIwpLr
	 WP40Q9e7EpvAH177Js8fFpLJRagoWgKPYFp5K+ZK2a0jf4v8fAWdttSX6dxABBzwM7
	 SGl1sheCuDLPu6LLbobdBDDf3v4A5Thxau+dJTw0TRv4tnqTs0CCtbntutltedqTs9
	 ZfoL93MP94JaJUQmJ7btLW4ls7Rd7DgeIVtiYh+PTegn6xkRsPFefGm2BKaz4JQf30
	 ghCipTm8X/3icgArUCSbpZSvFWybE1za/rUBkmjt8FDhMM9MdFRA/y+EFsnJ2Cevm0
	 kNO8rpQWEkoCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 683956158B;
	Sun,  3 May 2026 14:51:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA4D6127
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FF0761392
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rRKM0V5svQhD for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:51:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F1CD761613
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1CD761613
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1CD761613
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:51:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 960E019F5B2;
 Sun,  3 May 2026 16:51:32 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 May 2026 16:51:32 +0200
MIME-Version: 1.0
Date: Sun, 03 May 2026 16:51:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>, =?UTF-8?Q?Rapha=C3=ABl?=
 =?UTF-8?Q?_M=C3=A9lotte?= <raphael.melotte@mind.be>, =?UTF-8?Q?Fl?=
 =?UTF-8?Q?=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>, Grzegorz Blach
 <grzegorz@blach.pl>, Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>, James Hilliard
 <james.hilliard1@gmail.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Falco Hyfing
 <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>, Fiona Klute
 <fiona.klute@gmx.de>
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <0448b680ffedc83afeb144f2ec7e0179@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777819910;
 bh=VGrvpzuAgCKvcukC7QxESzckzeOAaZ5ge+chiVBptY8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mhfFg37M+Dwd1Z6MjBmpsr6VvkC6hILFJtyDeq6stgPJbFY/HGTrF86yqq8dhBfM1
 kYBiNdYwJfvxO5OGPpi+RIGlvuVqh1rAKzTaBxuWsiXH15DNk3/wDfjzpxGf78Fixg
 4sXcIOzKSzjR77giJjggW4Nrd9Kf/26+GndINls+kzzUYFIbtMJx/+H3lnuWBlOVfl
 VAGByrcFUXef8U4mGpPwZfVpPwlIgevQrISxsjoD7h8anNrQ5eecKVA5vN2H0S6odb
 7C1WXAp2s5BSZBUEX/pQRoMb20YcC55Eis4mCo5icozYs1HGGGy6cwhX1mdDyCOe6r
 ZBzKxE0skT9eQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mhfFg37M
Subject: Re: [Buildroot] [PATCH 01/75] package/python-aiohttp: bump version
 to 3.13.5
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

On 01/05/2026 14:29, Bernd Kuhls wrote:
> https://github.com/aio-libs/aiohttp/blob/v3.13.5/CHANGES.rst
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, with the exception of python-mypy bump (see my
specific answer for this patch).
I also removed "security" in the python-wheel bump.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
