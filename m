Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8952CC3ABCB
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 20:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E1B88125F;
	Mon, 12 May 2025 20:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GS96UkdghV3r; Mon, 12 May 2025 20:43:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FBCC81253
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FBCC81253;
	Mon, 12 May 2025 20:43:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EB85150
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3AA28125F
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EW-rVsLj_OfG for <buildroot@buildroot.org>;
 Mon, 12 May 2025 20:43:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D80D81228
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D80D81228
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D80D81228
 for <buildroot@buildroot.org>; Mon, 12 May 2025 20:43:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C8B985FFBA;
 Mon, 12 May 2025 22:43:00 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 12 May 2025 22:43:00 +0200
MIME-Version: 1.0
Date: Mon, 12 May 2025 22:43:00 +0200
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Martin Bark <martin@barkynet.com>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20250512163253.1521000-1-dario.binacchi@amarulasolutions.com>
References: <20250512163253.1521000-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <31f8372a05ef92531dc3e5cd34afd5ad@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747082584;
 bh=98b4Viuc5Y0SXKrpKEdgb/541xCF9VX4XobhRTrt+VQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MRxBaqHgoZMogl9Mb+2TyOQl6G0xnoUaOMTdpwWIC9FifRxPu4PSaONn0mfGoYWF1
 lMe3mnI2oDt6eMKF2J2wAeSJgHFMb6PghBdWoAQoXVwqbHu7Ifr+ZY2z1rAj0taY3A
 Yc7WssA2ii7dwZFXbJs/TAt8nowvoIiG23APXHpmE6aMPkILAIiUfr7YjbIDM7v1Km
 VGFrNe+xQ6x2HhWdtGpWEY28oVwPMBluDbJ414bGxi3FJfv/cIkFHI++nukTS0oxIs
 4vyrrS5m7kdDtH7/OcMvsLw3juGDYz1z0Be6exhZmH5d7T3wvgQcxZadeoR4MmKVs4
 e6G8COCInhNhg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MRxBaqHg
Subject: Re: [Buildroot] [PATCH 1/2] package/connman: bump to version 1.44
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

On 12/05/2025 18:32, Dario Binacchi wrote:
> Release notes:
> 
> - ver 1.44:
>   * Fix issue with handling oFono context integration.
>   * Fix issue with handling web context for online detection.
>   * Fix issue with handling flags used when deleting routes.
>   * Fix issue with handling PAC proxy integration.
> 
> - ver 1.43:
>   * Fix issue with device creation when using LTE.
>   * Fix issue with regulatory domain when powering up.
>   * Fix issue with resolving ISO3166 code from timezone data.
>   * Fix issue with handling DNS proxy zero termination of buffers.
>   * Fix issue with handling DHCP packet length in L3 mode.
>   * Fix issue with handling DHCP upper length checks.
>   * Fix issue with handling IPv6 and URL parsing.
>   * Fix issue with handling online check updates.
>   * Fix issue with handling proxy method and WISPr.
>   * Fix issue with handling default gateway setup.
>   * Add support for low-priority default routes.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
