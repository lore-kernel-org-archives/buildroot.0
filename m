Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7B5C55822
	for <buildroot@archiver.kernel.org>; Wed,  5 Aug 2026 08:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25E97607A2;
	Wed,  5 Aug 2026 08:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Ftja8Pg8fTQ; Wed,  5 Aug 2026 08:09:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C1EF606CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785917346;
	bh=NOMw72HPJMmo6emi9C80oqYW4g4ztf2f6qzr2QRCIVk=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gMmAs23132RFIrJSaWBXvE/csYRyNRQjwj5m8hTDaUXLi5N0sC0a0kLGywgDAa39i
	 jMaN1NaMcckqej4bFzOxD6yE9Add0SBJfFZ2Y0QxHffiqu8pVigK7/DmEGbuxyrGiT
	 nw+9MJEtiAd88rRPfujmkrxYD8TfG0L1Xz/XBdAOqN4uJTy3XAjxCvHCkK+tgWpkna
	 o37xvNvySOwSGAvaEx1LqiPOGZc5ESDPJB14qW/ATGoq/QSsLTxyV5S2Mb748dJRP1
	 csugWtdCM4ZfBpxLopmL58hDb4NfOp95l3/E0JM87MEx63GUaMFjLR5ZP+6KocEeHY
	 4Ftg5EzgJ0j9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C1EF606CA;
	Wed,  5 Aug 2026 08:09:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B61822B6
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 08:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C5CF606CA
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 08:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cCy_WIrvY8mY for <buildroot@buildroot.org>;
 Wed,  5 Aug 2026 08:09:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 918D9606C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 918D9606C0
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 918D9606C0
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 08:09:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3C9084E4104C
 for <buildroot@buildroot.org>; Wed,  5 Aug 2026 08:09:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0BA94602AB;
 Wed,  5 Aug 2026 08:09:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B06FA11C3439B; 
 Wed,  5 Aug 2026 10:08:54 +0200 (CEST)
Mime-Version: 1.0
Date: Wed, 05 Aug 2026 10:08:51 +0200
Message-Id: <DKGUUVXQBXS4.16HCDB4YDQXUW@bootlin.com>
Cc: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Bernd Kuhls" <bernd@kuhls.net>, <buildroot@buildroot.org>
X-Mailer: aerc 0.21.0
References: <20260719064839.3859632-1-bernd@kuhls.net>
In-Reply-To: <20260719064839.3859632-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1785917335; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=hswsAcH32xKE71lLxhxXMsPdrJn37zKAECrvP3v+dXY=;
 b=Tf744bMjonkqp3PISdH701tvT3umgCOArRfUEnOwSikQQV4fp89eVrfIGJPei88Q1FZGYj
 eYW4MYRa0YL9v+wfjWwkRZGjkAITmPXht05N10IWXzFyFCyMNTRw3vXR2sqARsWMsOkbEw
 NV5MNHkS+IjG0bzWETdk5UV+C2AqT/TYq1lkQsRp7f4hE9bOQWI9BmYy79/Fro5CkXjBdW
 5HUNuXvyQedA9Mbb1ByQr0TAYVdUQBAS1FPynUkA/MGpqqhAM+f7l1SyW5ZXtdI5fN6Xbt
 L+BZkFO2aj+fxGlumNTe3tu/QviH/poIS0Naur/vYT0qyM3AP6bd3fGpLYc4eA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Tf744bMj
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: disable valgrind when
 building with thumb1
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Sun Jul 19, 2026 at 8:48 AM CEST, Bernd Kuhls wrote:
> src/valgrind.h contains inline asm not compatible with thumb1 so we
> disable valgrind support for thumb1.
>
> Fixes:
> https://autobuild.buildroot.org/results/720bfa00ca926a398e901366e7ab20d08cfa9a81/
>
> Inspired by buildroot commit 26013972ce568e55a121c21a55afce45bc0675e9.
>
> The oldest build error of this kind dates back to 2022
> https://autobuild.buildroot.net/results/85d/85d8e725a31bc1a3c41b2e388a17ff439274d437/
> so a backport to LTS branches should be considered.
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Thanks for looking into this long-standing bug!

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
