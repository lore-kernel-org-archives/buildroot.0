Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D916EC8303F
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 13:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F2CD40E39;
	Thu, 28 Aug 2025 13:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YueTWS3V5TDh; Thu, 28 Aug 2025 13:18:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD9FF40E22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD9FF40E22;
	Thu, 28 Aug 2025 13:18:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D3BE1B0
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F1FE40DA3
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTuR4xELwkqD for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 13:18:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5756340CFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5756340CFB
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5756340CFB
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 13:18:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A3D78B9783E6; Thu, 28 Aug 2025 15:18:47 +0200 (CEST)
Message-ID: <72c9a794-cdc0-44e2-82a4-e20f13a93650@rnout.be>
Date: Thu, 28 Aug 2025 15:18:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Meena Murthy <meena.murthy@amarulasolutions.com>,
 Jan Kraval <jan.kraval@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
References: <20250819100455.3315327-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250819100455.3315327-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756387128; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=azCYViSr3W70/QqFqr88tYwm7OPK4mIPU/w6cEbSQP4=;
 b=VBup1TNG1TCAEQpswtEm0ddIpR31UI/98ipBPM5x0xQ4jd7UUZDmzc/oAcuaLnJeL7v/u1
 P3f826Rg9/6w+SEmzxK2kYoB90GyiEBiMQ4P7TLOt/HDACinTNUpL1JmjuiMG1cMlSuWxW
 WDsvV72kx6IknHfyklwnJ2NM6zQ8aYQks6mWkVX1dYl3FwWlwQm7pVaOaQkWIYWOfPvuM0
 83O3lfpX+4Cyx7WPnAkT4K7Ujl9hbh8HYwu2d5g2j1hnk8jW9K5+z9KAErnRAferac89zn
 6C8LfxNpGclw2a6mKh0XLdrHkS1/5u2efhZpVCkqHShJj/FAbx9Gpbzo83x/hg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=VBup1TNG
Subject: Re: [Buildroot] [PATCH] configs/orangepi_lite2: remove defconfig,
 broken
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/08/2025 12:04, Thomas Petazzoni via buildroot wrote:
> This defconfig no longer builds:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/11012274018
> 
> It has been broken for at least 2 months:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs?name=T%3Dorangepi_lite2&kind=BUILD
> 
> Unless a fix is provided, this defconfig will be removed.
> 
> Fixes:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/11012274018
> 
> Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
> Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Meena Murthy <meena.murthy@amarulasolutions.com>
> Cc: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
