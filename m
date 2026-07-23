Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703EBC531F7
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 17:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B8E860AC0;
	Thu, 23 Jul 2026 17:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nvtl8vjhPslf; Thu, 23 Jul 2026 17:30:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E3D760AB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784827831;
	bh=U0WwxcMmcPsRUyWfgUhWM9u01fDZLL7052MqiC0iw/A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W5kmqIaESKYLn/qItiK8v9/PR6uNQ/+8MmYMyVG0TXsmiYhFN4AFk0bMh7qhuXXC5
	 7Ck/f89e0ijRrhIkPTR7wDH4BPlUus6IY13Fui5ZXMdt3hWRKhcQj7Mn5RoAWVpvyM
	 uj5FjvGjDmZwjpM+gp/d1O6S2h+Af1h2yQKCBAmoVoST2rUmMZwb6MI64FKWWVTRe5
	 5sDu3Mpr+pM2FyrSYJdSjgzP5EAcrA3+cC90AC68oAiCLvihyUmEBV2B8JtryQcD5g
	 sUAvvl/pu+AVrDBfCurOUfmvh5wijUGqUHaIqNP8PCLRGglRDHur7P697BFIFbEvDb
	 au6z50d9zG/IQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E3D760AB2;
	Thu, 23 Jul 2026 17:30:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5839B788
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 17:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D9BD80D50
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 17:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SXVmKeOHR95E for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 17:30:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E16680D09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E16680D09
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E16680D09
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 17:30:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2C22319F54D;
 Thu, 23 Jul 2026 19:30:20 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Jul 2026 19:30:20 +0200
MIME-Version: 1.0
Date: Thu, 23 Jul 2026 19:30:20 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260722220049.3618182-1-bernd@kuhls.net>
References: <20260722220049.3618182-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <75a1338e853faf6791565f8f6b94b02e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784827821;
 bh=CM5tTcHh+700oKjJQEkAl0cgFOggboUJATn8XhD9Hl0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NOKJC5ns4EGhXN+fQnpwpZHfzr0XM5hE5RMkKJvheCdH0tGH3r/hsgoNbC1YdvHch
 YarP9J1Qwv15WqT/MH9NKQT8ln3Nd4ER7DMf7SJp9tZQM7gqtPVroU6VG59fV7uduR
 KChvtNKc1U68I0D7yvxhlsWyS0IoVWC26IS7G2VknJD18DEPLE080sb7Bvwaxjd2rL
 iA/Of7vxxdw6sRHHJF2WWLPiJNM1kWBetFG4W/Ulc/aefkHEsMPx8jxQvMmpmPNwUk
 vBoEypet+z9ccFJiPzJrBn3YI4EPn6vwmAYIn+7H5cn27WhZ8OjxOeY1w6al8bfPZT
 he2NXnMvmioOg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NOKJC5ns
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version
 to 26.3.0
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

On 23/07/2026 00:00, Bernd Kuhls wrote:
> https://github.com/intel/media-driver/releases/tag/intel-media-26.3.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
