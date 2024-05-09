Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA845C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 21:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACE5841FE2;
	Thu,  9 May 2024 21:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B4LaiqJibAUA; Thu,  9 May 2024 21:15:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D20641FFC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D20641FFC;
	Thu,  9 May 2024 21:15:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC8441BF427
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A910383E9E
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJJoQ52ZKL7b for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 21:15:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 934DC83E42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 934DC83E42
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 934DC83E42
 for <buildroot@buildroot.org>; Thu,  9 May 2024 21:15:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DB431BF204;
 Thu,  9 May 2024 21:15:06 +0000 (UTC)
Date: Thu, 9 May 2024 23:15:05 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20240509231505.186d7483@windsurf>
In-Reply-To: <f0d2f475-9fde-4437-9ea4-c3aee6752fa5@mind.be>
References: <20240426-refresh-busybox-config-v1-1-c70cb5b60243@microchip.com>
 <20240501221838.07cb2684@windsurf>
 <f0d2f475-9fde-4437-9ea4-c3aee6752fa5@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715289306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VML5gG8doh/inKlEJzTp5QBQH04B6tYnIiIPU3wRerI=;
 b=fpc0Avw4fkvWQBRTcy36VdsRj02ErRH1SSVAjEOhVr/B9bGosZvYRsHmpWbaxTz6gcqpjN
 yOtiQ10sm5z2c1vSfEgY3hj/MF1EzzcHJltPVO0TmDpF9HzEQXDErjXLuGe1T/IUqdiCRT
 QjazDm5M9o2S1uj23l1yk2sBbh172FfcBRORxCY66lVAb4kQaeRNGFwupQ1gDSqANPxg5j
 jYSvnb0X6vUD+e+5q48JmxRFX+ctOxfD1kEwM/zTUqwu/Ig2H7DUcr2kiwaDA/DsvU4uGJ
 CyrZBQO/i+yS1WpNzYQP3a17hiOIJktljOuyptKXgELMC+VXTR5PcJCXhS911g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fpc0Avw4
Subject: Re: [Buildroot] [PATCH] package/busybox: refresh busybox.config
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
Cc: Nayab Sayed <nayabbasha.sayed@microchip.com>,
 Nayab Sayed via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 9 May 2024 22:57:54 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > But then, why do we do that? udhcpc6 is not enabled in our
> > busybox.config. Due to this, when we refresh busybox.config, this
> > CONFIG_UDHCPC6_DEFAULT_SCRIPT gets dropped.  
> 
>   Uh, I guess I didn't notice that udhcpc6 wasn't enabled?

So, should we drop?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
