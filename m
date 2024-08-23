Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E842C52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 16:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E3AB81EE2;
	Fri, 23 Aug 2024 16:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B7vLtxeCi_hr; Fri, 23 Aug 2024 16:11:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51998840FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51998840FA;
	Fri, 23 Aug 2024 16:11:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83BB11BF31F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 16:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EC34840FA
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 16:11:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDE-ad7TOOZ1 for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 16:11:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 652FB81EE2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 652FB81EE2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 652FB81EE2
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 16:11:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D23B20002;
 Fri, 23 Aug 2024 16:11:43 +0000 (UTC)
Date: Fri, 23 Aug 2024 18:11:42 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240823181142.7daf0cf1@windsurf>
In-Reply-To: <20240822183742.3550055-1-dario.binacchi@amarulasolutions.com>
References: <20240822183742.3550055-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724429503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EPHd85BZzgydp1nD68odoIgRPxbrXiUJ8ZQv3vLLbGw=;
 b=WQHE3xSPb2+1mp7iFw3VDLzjdkpLwkC+snWDustMRNZJxqZbX6DTA80pn3IuDNB60RTiJe
 dxIEjRJW+z5z4sBccbx9VI/Sh9EAtSiaWV4xWn32Vlxw0CiSr+LotOR1XBTL+5rTFjU9Kb
 LOvMZsaBkId3jZaRRtx2DCPKmORusWd8+NVM01J9+T2wyAIKeUAL4gNpVso1NWsXVI6eD6
 K2VeCjz21+WawaYG3iB6hbIUKOQDi08DmFm4ziKpbFyVZhNhwePqJvC9VWYugiuwvDUVJV
 3Svslz4/2k4wR5mgGVlhT5R3H+InRUXFNYEo2ucgOF7b6w+ur+rP0CrfzBVR3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WQHE3xSP
Subject: Re: [Buildroot] [PATCH v3 0/3] tinyinit and
 stm32f746_disco_sd_defconfig
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
Cc: Damien Le Moal <dlemoal@kernel.org>, linux-amarula@amarulasolutions.com,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Dario,

On Thu, 22 Aug 2024 20:37:39 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Dario Binacchi (3):
>   package/tinyinit: new package
>   configs/stm32f746_disco_sd: new defconfig
>   board/canaan/k210-soc: use tinyinit as Linux init process

Thanks a lot. I was about to apply, but there are still a few things
that bother me. I'll reply to the individual patches.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
