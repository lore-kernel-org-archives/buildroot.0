Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F89C25B74
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 19:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6962607D9;
	Mon, 13 May 2024 19:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_m6Pbd9SihD; Mon, 13 May 2024 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04762607A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04762607A8;
	Mon, 13 May 2024 19:36:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6938A1BF2CA
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56471607D9
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 19:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9e7CWXT4yzE for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 19:36:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 45957607A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45957607A8
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 45957607A8
 for <buildroot@buildroot.org>; Mon, 13 May 2024 19:36:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59482FF805;
 Mon, 13 May 2024 19:36:13 +0000 (UTC)
Date: Mon, 13 May 2024 21:36:12 +0200
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20240513213612.6a1dcf2f@windsurf>
In-Reply-To: <20240513123442.213242-1-festevam@gmail.com>
References: <20240513123442.213242-1-festevam@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715628973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wa4GaeL8kjDIHynZzPIo13BN2GTZuSl+wTjzvBvbf70=;
 b=NxwRRMPYQPmumanaZ+ksq6lPWaHpORGS+rVkXQE4+vwmZ80UxCKC7Cg93DRigUlDGKnCjd
 JzhmOfywCLWIdF2Qc8uKcB+duzZPdBNv8Hefi1MWl8D72LrZX2/ef0sYAnv5DSFIQBpZSm
 H9hb8boadzcHpmn17CXcUL2O7O0Y+QMOfbY49z92iZ/UwPVimV86yBX08iIJl+64oPGQZj
 1Jn3b+OE2t+H9CzVNJhqj4cfG0H4UNxWbxgbgYLXkepOc8VIrb3ItioCRecGk/TYtelcE5
 e6a2nsoHunLiNz/v7I424J2+b9e3MkhL2Fw5KFJZQdO+52lI6tR9Dt9whRPOGA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NxwRRMPY
Subject: Re: [Buildroot] [PATCH] configs/freescale_imx93evk: Update to NXP
 lf-6.6.3-1.0.0
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
Cc: ju.o@free.fr, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 13 May 2024 09:34:42 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Update kernel, TF-A and U-Boot repos to the NXP lf-6.6.3-1.0.0 versions.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  configs/freescale_imx93evk_defconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

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
