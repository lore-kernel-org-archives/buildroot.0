Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DAFD5B14E
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEA8D80ED3;
	Mon, 28 Oct 2024 20:40:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XPnzRlNxN944; Mon, 28 Oct 2024 20:40:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1ED8810DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1ED8810DE;
	Mon, 28 Oct 2024 20:40:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B4454EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D325810DE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HB3NWzaGcZMc for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:40:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5410780ED3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5410780ED3
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5410780ED3
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:40:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 883012000A;
 Mon, 28 Oct 2024 20:40:07 +0000 (UTC)
Date: Mon, 28 Oct 2024 21:40:06 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <20241028214006.43ad63c8@windsurf>
In-Reply-To: <20241028193915.787455-1-bernd@kuhls.net>
References: <20241028193915.787455-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730148007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=opfRX71JtLfrYmlYV8+MaicJF1XHWmQ38FvjivI/JpE=;
 b=jMHhkFLs4leaTzqMvTUv0krPGjsfpwEIPPeXrPdTghGhHz3i8D8WNCvZjvkVlbLlubVYG0
 iImq72qGe1iEfhYMNDcChpNjZB0jZWciwJqVZkB9vwah4bWkq4/xfhaWiL1LqFui6nCoEN
 84hMtqOKUFP/YBZIllSleq+L5Gr4UjZJSrw8iLBaMhTP/DIz0kzLeCQciZT/wnXLZAZIJD
 2w+SPYMOOCSLGmdO5nTehJmAzdJon4F+xMOvA+8IYNydQed/mUAJOhwMsI/Td0lla7ywvV
 KLkrmz5UyIqjC5VAgePVY45qKXLaHqMKmrroMyS/uNS/5vWVQSXzzeNIBE0fMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jMHhkFLs
Subject: Re: [Buildroot] [PATCH 1/1] package/libpng: fix arm build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Mon, 28 Oct 2024 20:39:15 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Bumping libpng to 1.6.44 with buildroot commit
> 583bb434ffe1eec0dbf6887dd719c3f41a6253e9
> causes a build failure on arm due to the upstream removal of
> the ASM implementation of ARM Neon optimizations.
> 
> Remove the corresponding configure options to fix the build error.
> 
> Fixes:
> http://autobuild.buildroot.net/results/021/02158525203d8c7f16a4a32637d44d6c87b7f333/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libpng/libpng.mk | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
> index 3e7fc42d82..09b4494909 100644
> --- a/package/libpng/libpng.mk
> +++ b/package/libpng/libpng.mk
> @@ -17,12 +17,6 @@ HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
>  LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config
>  LIBPNG_CONF_OPTS = --disable-tools
>  
> -ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_aarch64),y)
> -LIBPNG_CONF_OPTS += --enable-arm-neon
> -else
> -LIBPNG_CONF_OPTS += --disable-arm-neon
> -endif

Thanks for the research, but I'm afraid this fix is also not correct.
The NEON code has not been removed. What has been removed is the
assembly-written NEON code, but they still have NEON code that uses the
gcc intrinsics, that gets enabled by --enable-arm-neon.

However, this code is only available for softfp and hardfp ABIs, and
not soft-float. So the above condition should be changed to:

ifeq ($(BR2_aarch64),y)
LIBPNG_CONF_OPTS += --enable-arm-neon
else ifeq ($(BR2_ARM_CPU_HAS_NEON):$(BR2_ARM_SOFT_FLOAT),y:)
LIBPNG_CONF_OPTS += --enable-arm-neon
else
LIBPNG_CONF_OPTS += --disable-arm-neon
endif

should do the trick.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
