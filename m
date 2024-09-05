Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960C7CD5BB8
	for <buildroot@archiver.kernel.org>; Thu,  5 Sep 2024 19:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CC3840114;
	Thu,  5 Sep 2024 19:37:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZRtbCVConXpc; Thu,  5 Sep 2024 19:37:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F24740175
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F24740175;
	Thu,  5 Sep 2024 19:37:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 347F61BF423
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21B42406F7
 for <buildroot@lists.busybox.net>; Thu,  5 Sep 2024 19:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id El7mdDbQocHY for <buildroot@lists.busybox.net>;
 Thu,  5 Sep 2024 19:37:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE4A040248
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE4A040248
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE4A040248
 for <buildroot@buildroot.org>; Thu,  5 Sep 2024 19:37:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B77671C0002;
 Thu,  5 Sep 2024 19:37:40 +0000 (UTC)
Date: Thu, 5 Sep 2024 21:37:39 +0200
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20240905213739.502a70bc@windsurf>
In-Reply-To: <20240904182619.3013605-1-festevam@gmail.com>
References: <20240904182619.3013605-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725565060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uYaiSKC2SlnkJD9fEA86R7sIQ2IclmsCN9HBuiEt8HA=;
 b=KOHB80Ij7z4p/9vFNmQ90HrMxxvHhAmHj5cXb6Meiww24Gw/v296VDdZaXt0xc6d5YJq69
 FexyHIrlgxwQcujtzTe5zWKf2LS3ZHLZzKn9+80qMnJVKS8OXAKQ0j90r4K3sWYGV9juAt
 NmZRp6TLdcZD/rEZGDZTtMIwSpXqTvKv/eNdmhrHkesL1ovioS/dzTCV35Lu67Tsm3akh8
 6wtdeYdnGulkHQ7Jt/XswRJq22d9UEbArYmfbxLw4Z4wfwdcXWtCI/HUTIeYm+dHvvSc9N
 VsaTij6HADN5GiXITWTX+ZINFx+LPgEdtYvnTRLGQs+TtSAHNuL+CakMgFnlgw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KOHB80Ij
Subject: Re: [Buildroot] [PATCH] configs/imx7dpico: update U-Boot and kernel
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  4 Sep 2024 15:26:19 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Update to U-Boot 2024.07 and kernel 6.6.48 versions.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/imx7dpico_defconfig | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Applied to next, thanks. However, it would be nice if you could enable
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y when bumping defconfigs. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
