Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DF2CA100F
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 21:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 392F060714;
	Mon, 22 Sep 2025 21:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6QqrSKrhogz; Mon, 22 Sep 2025 21:37:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 509CC606F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 509CC606F7;
	Mon, 22 Sep 2025 21:37:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F7062F4F
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 21:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0579A80C56
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 21:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AHcYfqNxe_Qp for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 21:37:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AB85A80B3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB85A80B3B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB85A80B3B
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 21:37:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6D0312003B4;
 Mon, 22 Sep 2025 23:37:20 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 22 Sep 2025 23:37:20 +0200
MIME-Version: 1.0
Date: Mon, 22 Sep 2025 23:37:20 +0200
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Dick Olsson <hi@senzilla.io>
In-Reply-To: <20250921155100.7033-1-fancp2007@gmail.com>
References: <20250921155100.7033-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <7c33e02dbb6e270f1c55bce255454448@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758577042;
 bh=0eq7AzmI0b2JKHPvyKX9L/SLd3BDoav+8VW0T7/7qto=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qo+ZHSJ6SaGevOKoTfiS8K9cKTS8PMBoOy9fTNYMmq+V3kPhrbpXwbIDuVRjGpse5
 7Y5nFSgS2DwySn1Bnd+70/sF/FNuiBwEOXPsaTmOR8XN1Ykao+Mhj1mqXihIpT+3Tk
 1l6SG11CF5M0l+Y1vDP5EuJ/Cl160G6wjEBRA+a70xf15Wo6bcm1yyYRO1sqT4wzcq
 Z6I+wHnDMUbDNKRGDjiEG9UbBGA7a2Z2lMoWMhERiNBsJLlnijYKiypWaeISwcWGQO
 HyExtsSgoIPvuPDsNbFOz26INwQmKxRffU6/S1OZlw2r19jFNCcl7JzKDDMlG4Lauc
 Ury47WizlVEJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qo+ZHSJ6
Subject: Re: [Buildroot] [PATCH] configs/pc_x86_64_{bios,
 efi}_defconfig: switch to kernel 6.12.47 LTS
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

On 21/09/2025 17:50, Scott Fan wrote:
> This commit adds BR2_DOWNLOAD_FORCE_CHECK_HASHES=y in the defconfig
> and adds custom hash files. The exception entry in .checkpackageignore
> is also removed.
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
