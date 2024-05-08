Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CF6C19F4F
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 16:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6989A60C01;
	Wed,  8 May 2024 16:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYmlmcl04Lcn; Wed,  8 May 2024 16:32:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 842C460D55
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 842C460D55;
	Wed,  8 May 2024 16:32:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CBC841BF2B0
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B50EA60D55
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:32:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ldqod6h6ahRv for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 16:32:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A426460D4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A426460D4F
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A426460D4F
 for <buildroot@buildroot.org>; Wed,  8 May 2024 16:32:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA6C024000A;
 Wed,  8 May 2024 16:32:16 +0000 (UTC)
Date: Wed, 8 May 2024 18:32:16 +0200
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20240508183216.53a71af2@windsurf>
In-Reply-To: <20240508071328.45346-1-heiko.thiery@gmail.com>
References: <20240508071328.45346-1-heiko.thiery@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715185936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PMGNJQUjsnbcI8XFG0iFcgL4K8oK8ZpTXqnLdeX0aRM=;
 b=EPZ1nxQYHpGcpfo+nluT44V1PMRLa14nCqQSLcEsaZg4JfMqK1I2z6R/eqQfAf96sv/EbV
 e1T0wzTg9Dk3XOUWjhI+LJ3lHbLvBCfiN7DwcrAaF4Zx+7dLVaAZrtsM6J/BKfcrxj8LpP
 UTiRaNky+AAUpZH5KzGaueAe4wHWFA1vSqSdO8tqO3o6/MOzYdXPWfjd9i9yViddIul2J5
 ol3Y4JX3LstjgqdY4Pc48pbz3VasTxFVCZDaXOxWT6S5i5O5hQOKpovNyWrsWKMPDvDlNc
 wm+Kw8Y7pmV6dQOyK3HRUqNbrxQ9InwRnn97U3iNoZRViopiNTsSBP2aIoFRUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EPZ1nxQY
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add myself to python-yamllint
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

On Wed,  8 May 2024 09:13:29 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  DEVELOPERS | 3 +++
>  1 file changed, 3 insertions(+)

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
