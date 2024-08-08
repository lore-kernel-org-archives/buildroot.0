Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C181C52D71
	for <buildroot@archiver.kernel.org>; Thu,  8 Aug 2024 19:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6E9640D6F;
	Thu,  8 Aug 2024 19:54:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yKBaumahkaDt; Thu,  8 Aug 2024 19:54:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E89D240D4B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E89D240D4B;
	Thu,  8 Aug 2024 19:54:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 601AF1BF2A3
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 19:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CA4F40D4B
 for <buildroot@lists.busybox.net>; Thu,  8 Aug 2024 19:54:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JWJt4HTtBCPQ for <buildroot@lists.busybox.net>;
 Thu,  8 Aug 2024 19:54:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F328B40D2B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F328B40D2B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F328B40D2B
 for <buildroot@buildroot.org>; Thu,  8 Aug 2024 19:54:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAC2160002;
 Thu,  8 Aug 2024 19:54:51 +0000 (UTC)
Date: Thu, 8 Aug 2024 21:54:51 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20240808215451.4cf507b2@windsurf>
In-Reply-To: <20240808141747.1770035-1-adam.duskett@amarulasolutions.com>
References: <20240808141747.1770035-1-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723146892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cXh2cA4jJluzuFVWJ/EMda0mDLM+F0FMib/UGMvq0E8=;
 b=UMqNXeyCdvtZSvvkXOSw5uF5bXt3m8j8j5IQf8ANrHQ7xrYWaBOuShMO13hbrB0WmRuYU+
 rG9iRF2qL7gpvuvcMOtZsn7etLiNqoy0+B/MwdKGbVvww+KkSw5xwf7Gyh5GrB+GrfBsuB
 AKvdmzUOHAe+Bzhh25FXy19UyYknabYO/u+7dW/Q6wDr2aFC0PGY3cntz/EOTv2JwfStU3
 +WmvmVYFa83igsR1koEXZ0tuj2AsM5xFIBwJ3MI2DVkj1YjwZaoX5Due4zz6fhOQcFikID
 pEDvgdmaxtDPp5JWJFhX2xNSow5PrDvKzMCaNaGUSW2WQFBjbpz1gTT37CDa7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UMqNXeyC
Subject: Re: [Buildroot] [PATCH 1/5] package/depot-tools: bump version to
 75932421da2cd8b5807a4ac52ed2a6f46d7c2120
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

On Thu,  8 Aug 2024 16:17:43 +0200
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/depot-tools/depot-tools.hash | 2 +-
>  package/depot-tools/depot-tools.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks, series applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
