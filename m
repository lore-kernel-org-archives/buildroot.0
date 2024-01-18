Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1964C47422
	for <buildroot@archiver.kernel.org>; Thu, 18 Jan 2024 12:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84225613F3;
	Thu, 18 Jan 2024 12:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84225613F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ut2kqZ-8cLbt; Thu, 18 Jan 2024 12:58:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8BB960C20;
	Thu, 18 Jan 2024 12:58:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8BB960C20
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A3551BF20F
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 12:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3373360C20
 for <buildroot@lists.busybox.net>; Thu, 18 Jan 2024 12:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3373360C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GhgnS6Xwvirb for <buildroot@lists.busybox.net>;
 Thu, 18 Jan 2024 12:58:25 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F9C560B90
 for <buildroot@buildroot.org>; Thu, 18 Jan 2024 12:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F9C560B90
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8717BE000C;
 Thu, 18 Jan 2024 12:58:21 +0000 (UTC)
Date: Thu, 18 Jan 2024 13:58:20 +0100
To: Stefan Ott via buildroot <buildroot@buildroot.org>
Message-ID: <20240118135820.6fcfebb5@windsurf>
In-Reply-To: <20240118002834.76578-1-stefan@ott.net>
References: <20240118002834.76578-1-stefan@ott.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1705582701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JGBf2XWzPGFCg0P4JHkq8VmWlMoHijqszTNEmdcxE34=;
 b=WmaTnvpNGHDo/R8Fp0eKZ1sdxw6msyp0wA/ccFESJWtthp4bWqeIpZLtg5ZLfep9EzKJDb
 DOmdbjYRicyzc4Zq4ioE5rE9zpl+70gGhCNd4c+RFLsEh6a6tNO0C7klgHH4YTvXLca7kb
 XQcw3U/TrgoQdugvJd7Q5ChwoOMq6+KaVnDh9/i6oMUueseBqHfws40ybIskyFEjijZG3X
 lh4p3BBY6jYUwyH4yX3yNS+q6U2PcBbNJ/Edme1EqP154ApvAr1PSTaEHG75cjMNuX/iAT
 OZpCrecerKZx7bTXpKf3SBtEbHmoguNuhU95X5TA1vpSOBLSchCkoJkteE5Aig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WmaTnvpN
Subject: Re: [Buildroot] [PATCH] package/sway: make systemd optional
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
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Thu, 18 Jan 2024 01:28:34 +0100
Stefan Ott via buildroot <buildroot@buildroot.org> wrote:

>  if BR2_PACKAGE_SWAY
>  
> +choice BR2_PACKAGE_SWAY_SD_BUS_PROVIDER
> +	prompt "Provider of the sd-bus library"
> +	default BR2_PACKAGE_SWAY_SD_BUS_PROVIDER_AUTO
> +
> +config BR2_PACKAGE_SWAY_SD_BUS_PROVIDER_AUTO
> +	bool "auto"
> +
> +config BR2_PACKAGE_SWAY_SD_BUS_PROVIDER_LIBSYSTEMD
> +	bool "libsystemd"
> +	depends on BR2_PACKAGE_SYSTEMD
> +
> +comment "The systemd backend needs systemd"
> +	depends on !BR2_PACKAGE_SYSTEMD
> +endchoice

Thanks for your patch! I am wondering if adding an option for this is
needed. Can't we just enable systemd support when BR2_PACKAGE_SYSTEMD=y?

I think the fact that your comments is worded as "The systemd backend
needs systemd" is a good hint that this dependency is obvious, and
there's no need to have an explicit option for it.


> -	-Dsd-bus-provider=libsystemd
> +	-Dman-pages=disabled
> +
> +ifeq ($(BR2_PACKAGE_SWAY_SD_BUS_PROVIDER_LIBSYSTEMD),y)
> +SWAY_CONF_OPTS += -Dsd-bus-provider=libsystemd

Is there another sd-bus-provider option value that should be set when
systemd is not available?

> +SWAY_DEPENDENCIES += systemd
> +endif

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
