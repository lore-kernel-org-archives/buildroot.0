Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEB5C3DA4A
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 21:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3240F8204F;
	Thu,  1 Aug 2024 21:38:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fuXuOX-nWrmF; Thu,  1 Aug 2024 21:38:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25F4482065
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25F4482065;
	Thu,  1 Aug 2024 21:38:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 674DA1BF3F0
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5433440437
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 21:38:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qP--1UW-s5Lz for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 21:38:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1D3474029F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D3474029F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D3474029F
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 21:38:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 880ED20002;
 Thu,  1 Aug 2024 21:38:33 +0000 (UTC)
Date: Thu, 1 Aug 2024 23:38:32 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240801233832.2263c682@windsurf>
In-Reply-To: <20240801191505.44772-1-ju.o@free.fr>
References: <20240801191505.44772-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1722548313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ni2bkNlVRsTJPCwiE+yPhEs2BqXWCtpQgExoOF39gRQ=;
 b=PIKVIRb86rE/XpSAyx7A8hKo+UCMliOal5mGVxPd9F2QTepjnA9PIFBHKAp/O2uQhyIwEK
 mtuiRZMqXz3imjE75VyodDDJ1ogdjRq2zLrq8ZegLfN9w9OM/QCG767/W0HJbEM5l59Qs8
 AvbvzI/mIx+hTGhyxbEDHR9n3c3GfjvD5ELHiVCMNJPaUvxTImpz1SIo9lJ4UyRSA9GAnM
 /tyIfATP/uyQ8kDA40OHl/pgUDqdYcM1IWRNxurVbhPY8NbZR8f2k5nJ3eWJtLvJyC6f/S
 iRa8PI49J+MMRLHRxUFOL5iO5TPSlcu5B+Ybc1vjVdwrSjcYw2N4ks16furTaQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PIKVIRb8
Subject: Re: [Buildroot] [PATCH 1/1] package/freescale-imx/firmware-imx:
 bump version to 8.24
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  1 Aug 2024 21:15:05 +0200
Julien Olivain <ju.o@free.fr> wrote:

> This version is aligned with NXP Linux BSP version "lf-6.6.23-2.0.0".
> 
> License hashes changed because the LA_OPT_NXP_Software_License changed
> from "v49 September 2023" to "v56 April 2024".
> 
> Note: in this release, the package source archive name changed to
> include a revision. This commit adds a new _REVISION variable with the
> value published in the corresponding NXP BSP. See [1].
> 
> [1] https://github.com/nxp-imx/meta-imx/blob/rel_imx_6.6.23_2.0.0/meta-imx-bsp/recipes-bsp/firmware-imx/firmware-imx-8.24.inc#L10
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/freescale-imx/firmware-imx/firmware-imx.hash | 6 +++---
>  package/freescale-imx/firmware-imx/firmware-imx.mk   | 5 +++--
>  2 files changed, 6 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
