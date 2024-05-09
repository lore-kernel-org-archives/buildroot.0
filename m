Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D499EC25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 15:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A24CE81A33;
	Thu,  9 May 2024 15:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KY9XyStCv_Ba; Thu,  9 May 2024 15:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A66FA83E04
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A66FA83E04;
	Thu,  9 May 2024 15:46:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61CBB1BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5ACBF41773
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 15:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6GP7W_Op70AS for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 15:46:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0CC814176B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CC814176B
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CC814176B
 for <buildroot@buildroot.org>; Thu,  9 May 2024 15:46:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47646C0004;
 Thu,  9 May 2024 15:46:41 +0000 (UTC)
Date: Thu, 9 May 2024 17:46:40 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240509174640.757b565d@windsurf>
In-Reply-To: <20240412222459.1630158-1-ju.o@free.fr>
References: <20240412222459.1630158-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715269601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YrKACY/Xnz6XTS8eejNmtoQxtsBCltUgBiUxOlYSA7g=;
 b=DyD+3ilaSy0XVnNB61YFo+t+izokhWH97NZ18579tkIC9JkNr30EKDvzLvYHBd8Huti+pJ
 AC+QQNM3J1yXzmjS1RNJlyRH6jxfXMMTI8/aO5xk1pAP+0hsX6aTOB9ZvfJ/tqvaJ/rDV0
 65TIbC1weNIQKioxqbWeMF4ln1XNcQavdt9JWpy92abVAjMQ62rH/W40QjASw+/bkD+fZD
 QG9jEAWBz3GKeAuz/lN9MfcYzvMbul/6GEsnI08NEtoLboAV8wFoKpy6tBBvEbIfrar64M
 OlIeI/F+XrhAEk9jA3OkQ/jvxVWnHbPCKpZk682HopbrQ4hpT46sl1sf8dZTGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DyD+3ila
Subject: Re: [Buildroot] [PATCH 1/2] package/lvm2: enable device-mapper in
 Kernel config
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

On Sat, 13 Apr 2024 00:24:58 +0200
Julien Olivain <ju.o@free.fr> wrote:

> LVM2 has a hard dependency on the device-mapper presence in the Kernel.
> This commit enables those mandatory Kernel configuration by defining
> the _LINUX_CONFIG_FIXUPS macro. This will make sure the final system
> image will end up in a working configuration.
> 
> This was suggested by Arnout in [1].
> 
> [1] https://lists.buildroot.org/pipermail/buildroot/2024-April/688776.html
> 
> Suggested-by: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/lvm2/lvm2.mk | 5 +++++
>  1 file changed, 5 insertions(+)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
