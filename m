Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BFDCF2576
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 10:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A6BB40918;
	Sun, 13 Oct 2024 10:49:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEJbxOn1xXCN; Sun, 13 Oct 2024 10:49:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57DA140989
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57DA140989;
	Sun, 13 Oct 2024 10:49:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EEFA31BF35D
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE85980A56
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:49:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W46J68b6CrnW for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 10:49:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D4FCC80A55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4FCC80A55
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4FCC80A55
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 10:49:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B540660002;
 Sun, 13 Oct 2024 10:49:39 +0000 (UTC)
Date: Sun, 13 Oct 2024 12:49:38 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20241013124938.21f6172c@windsurf>
In-Reply-To: <20241012152417.986582-2-dario.binacchi@amarulasolutions.com>
References: <20241012152417.986582-1-dario.binacchi@amarulasolutions.com>
 <20241012152417.986582-2-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1728816580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D7jXd06ZIZrherVdTl65pVRrHLChoHUyUS6EJ0y2DEs=;
 b=IUBoGITkcd9GgOQBFazRMvHTgxT/My5s4kQRdjS7MEuaPMfGbNj+heV1YswV37+b3DK+cJ
 VDzI494JNq+lZ/vmfVGZKFvNAVMZQcmwDWIPguHccFpiSg7AFrMmTjKSg/oasSzfq/mvzQ
 8C9SgwyZTtpkJpC7zGrxbBYzdrOWxTRpTPkem5DGVe2TO9vLKabF/NtI/E1CMqTGi5sgGE
 kiejrZiAH4j5ngB4W+vO357qlXAjMzAXlOTBD63mzyFkTr8FpAYFWf+NuhEi0cBxzJ6Ndf
 WKrSVXJr9drC0Q71d1ZGjdU8h717g9teo4Vv76/Vh7cddczrI9v/0aB3hH0YPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IUBoGITk
Subject: Re: [Buildroot] [PATCH 2/2] DEVELOPERS: add Dario Binacchi for
 aespipe
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 12 Oct 2024 17:24:17 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 44b19474876b..5156302ddab1 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -795,6 +795,7 @@ F:	configs/imx8mn_bsh_smm_s2_defconfig
>  F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
>  F:	configs/stm32f746_disco_sd_defconfig
>  F:	configs/stm32f769_disco_sd_defconfig
> +F:	package/aespipe

Final / was missing, so I added it when applying. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
