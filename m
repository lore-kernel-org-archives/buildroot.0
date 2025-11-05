Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B85CCCF9F8
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 20:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD7C0613E6;
	Wed,  5 Nov 2025 20:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iYYjrIITWa7w; Wed,  5 Nov 2025 20:31:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCCAD613C3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCCAD613C3;
	Wed,  5 Nov 2025 20:31:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 371FA4C6
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:31:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D0E141277
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:31:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m1EoFrzYbmVa for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 20:31:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1EB5341276
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EB5341276
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1EB5341276
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:31:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2A1A2780368;
 Wed,  5 Nov 2025 21:31:44 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 05 Nov 2025 21:31:44 +0100
MIME-Version: 1.0
Date: Wed, 05 Nov 2025 21:31:44 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Michael Trimarchi <michael@amarulasolutions.com>
In-Reply-To: <20251104144400.1242876-1-dario.binacchi@amarulasolutions.com>
References: <20251104144400.1242876-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <845336230f8158234a3e55df5d38dd08@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762374707;
 bh=yblaVkenNpTcMrAQw0vOxR8iqvfGfDuZuUr2uSaxxwM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lS91GMcC2jrIwJRIqHoK4NnkGMGliB4sjbksyGQkndx/iafNLwM+ar9ur41zRS7QB
 BWpKpNBQX2QFBAag1q/L6PN2/RpiAZotbnVFQUaDFd9/yjABYdx65lo4z1BNYaNBxL
 bxyWYwxmYnoiWkk38dDRVTaX4LDjcRSuk/swtPLq1ImoUDO7OxzkwqXasNQ7Cb9kpB
 X5Gqo9NL0QLpT1jD1f+9CwoQjijMffuv8vUD6llo15uiOcBuRTdRhFfAE67jgNvRCu
 eCq7UzMudDmXvkbR4cQa6Rf/dWYa9RWPwX3JsqBpQpw2X90Ou71WlPjPJYhPkW1Qh8
 /iq+JMZ0R2cVA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=lS91GMcC
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx6ulz_bsh_smm_m2: bump Linux
 to 6.12.56 and U-Boot to 2025.10
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

On 04/11/2025 15:44, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.12.56 and U-Boot to
> version 2025.10.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Could you consider, in a followup patch, updating this defconfig
to switch to external Bootlin stable toolchain, please?

See for example:
https://gitlab.com/buildroot.org/buildroot/-/commit/dd3ef914867dca5e429bb25ee14445fb0c87baa5

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
