Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAB8E9273E
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 16:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 025368194A;
	Mon, 29 Dec 2025 16:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AyPgQFQ360sf; Mon, 29 Dec 2025 16:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30574816F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767025945;
	bh=UokqST+w02lI6gPSKfUCzEHGORXZIe2zC+/GUPjE94Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Jr0wrg8jjCWHtU/UVmmPefXgRHp8UMX9GcnYtz8nxPVphdxiJ1FCJ7z2tVGSLP7bO
	 isczGgk18OEgrwyV6ueQKB6Xxh6Zr8z/YPnIP1q3VfWy81rT3Jopj3qgW6jRn1bu/0
	 jWpJDSVrEah+ei/Ecl8ewYAxHP3IxMRKauIHaliYZHOx3EnC0eQTC1argfBzg8H0vu
	 cu02lQm3rStjYYCbyHbeP8VdKwizmYbyBbbFRszR9R6TdHvtqZkQVAiH9wdg1uXNCj
	 gCSzsC0j5XzZdwu3+nwQPQR4ZWEte5/0hvZhiDr71bzQm/garH3MNxiWESWUEIIm3N
	 uR5bgPHigtWuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30574816F8;
	Mon, 29 Dec 2025 16:32:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EDC9AB9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE166816F8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1XgnqYmvDN2i for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 16:32:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF033816F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF033816F5
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF033816F5
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 16:32:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D0EDFC1D721;
 Mon, 29 Dec 2025 16:31:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 55FAF60725;
 Mon, 29 Dec 2025 16:32:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D3D71113B0619; Mon, 29 Dec 2025 17:32:09 +0100 (CET)
Date: Mon, 29 Dec 2025 17:31:55 +0100
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Fiona Klute <fiona.klute@gmx.de>, Paul Cercueil <paul@crapouillou.net>
Message-ID: <20251229173155.45fea45c@windsurf>
In-Reply-To: <20251227223733.2240054-1-fiona.klute@gmx.de>
References: <20251227223733.2240054-1-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767025935; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=M3Y6EdPU+5/8kRo4q5RxlPWI97thZCHprd1KUZcEUJs=;
 b=TG4lB9YVTGQST8smg/HW/9S0eP47T3GsWbqOVQ4hjk//oQcNKTHR9Wzb2iSNh0gYrIDcoP
 sNJaO6mYBgvvanC+jVl1dEsKLX67Is3BkXzglrvVtxOT7vdlaX9g8EDMs9HTtHJhgbtzoA
 aMhFrwMzHUXP2h3OVeA+/faCQglFU2KTx8THz5BV+WzLpQsUIpRnsliTzplHzkhmYnDvT/
 kATsZOA3tBfM0/Yj9m3lhavGpw/yk8LSU5x63ZHZcAowRG0FAio8zh6pVcsuFpnPJnICtP
 JQ5HWnq82rKH0XburzkKt1cdusYjs9uKYHH0d9/n8UTdJKMBMTP/C8yfZKSz5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=TG4lB9YV
Subject: Re: [Buildroot] [PATCH 1/2] package/libiio: refactor iiod init
 script
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 27 Dec 2025 23:37:32 +0100
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> * Fix check-package issues and remove .checkpackageignore entry
> 
> * Remove fixed wait in "restart", wait for process termination in
>   "stop" instead
> 
> * Print standard starting/stopping messages
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
>  .checkpackageignore    |  1 -
>  package/libiio/S99iiod | 62 ++++++++++++++++++++++++++++++------------
>  2 files changed, 44 insertions(+), 19 deletions(-)

Thanks, both applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
