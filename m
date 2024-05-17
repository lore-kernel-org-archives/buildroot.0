Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CABC04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 07:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28DB441BF5;
	Fri, 17 May 2024 07:08:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dl88geFqPeWX; Fri, 17 May 2024 07:08:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20E73404B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20E73404B6;
	Fri, 17 May 2024 07:08:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5CA921BF45A
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 07:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48E2980DB0
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 07:08:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5-NULs9D5u5V for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 07:08:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 348B080D47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 348B080D47
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 348B080D47
 for <buildroot@buildroot.org>; Fri, 17 May 2024 07:08:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45841E0017;
 Fri, 17 May 2024 07:08:49 +0000 (UTC)
Date: Fri, 17 May 2024 09:08:48 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240517090848.4fdbc89b@windsurf>
In-Reply-To: <20240515164912.104672-1-dario.binacchi@amarulasolutions.com>
References: <20240515164912.104672-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715929729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TitzbfG2guopVODnBFnqsEf0cclOety4NpzCr7wiDmM=;
 b=GwF0RvORtCiRokBgm92bLAVIXqx1gDdftFmIQFEwVi5u6TIZAncpqjLDWEVmGWsqOxK4wA
 MFoGUybR83Yj2VJmXfMLgFbRMbt7osxi7AIS5qM1Huc9CZOqNd6OE96nfeEeB9MZSB2uQA
 KYZ0A9+7b9ZYoCkwfc7NT+KQjcl6P8Lr0w+PvLvCwopccdNJ1w92aU2jYWJI2rUtVY4gq0
 hNp0iD7TK1t8J9mUVy1M2EIWrR3A8JHI+CaWKwsLUIz7uYJeKB5AkGnmXfNb+pnz1aTNYq
 QN/yvR+qjpTSppT9/vnBr9g9LIYunYFnt4ZGX39g9AiaWBoVoFIQmUR/g60SfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GwF0RvOR
Subject: Re: [Buildroot] [PATCH 1/1] package/zxing-cpp: add options for
 enabling readers and/or writers
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Wed, 15 May 2024 18:49:12 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> +if BR2_PACKAGE_ZXING_CPP
> +
> +choice
> +	prompt "readers/writers support"
> +	default BR2_PACKAGE_ZXING_CPP_READERS_AND_WRITERS
> +	help
> +	  Select what you want to enable and then compile
> +
> +config BR2_PACKAGE_ZXING_CPP_READERS
> +	bool "readers only"
> +	help
> +	  Build with only readers (decoders) support
> +
> +config BR2_PACKAGE_ZXING_CPP_WRITERS
> +	bool "writers only"
> +	help
> +	  Build with only writers (encoders) support
> +
> +config BR2_PACKAGE_ZXING_CPP_READERS_AND_WRITERS
> +	bool "readers and writers"
> +	help
> +	  Build with readers and writers support
> +
> +endchoice

I don't think this should be a choice. Instead, it should be like this:

if BR2_PACKAGE_ZXING_CPP

config BR2_PACKAGE_ZXING_CPP_READERS
	bool "readers support"
	default y
	help
	  Build with readers (decoders) support

config BR2_PACKAGE_ZXING_CPP_WRITERS
	bool "writers support"
	default y
	help
	  Build with writers (encoders) support

endif

Could you rework your patch accordingly?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
