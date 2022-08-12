Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A460C00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 08:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F36FC61113;
	Fri, 12 Aug 2022 08:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F36FC61113
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03SZoGBAMeAq; Fri, 12 Aug 2022 08:51:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2785F610C4;
	Fri, 12 Aug 2022 08:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2785F610C4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67F9C1BF309
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 08:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4950B8340C
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 08:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4950B8340C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2VEBIAtmaRfc for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 08:51:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE866833C9
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE866833C9
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 08:51:28 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id w3so536847edc.2
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 01:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=HoiKZbjiIqR9LpWcqLuRrQqrHwPbff7pg9Xg+d41Hu0=;
 b=7Qe8479dGthURHP4KCh66UZ9+cSQu0A6iW8Hbw6yvhn3WCwXKumE8ooWBE9l9yhNM3
 nITu7NADou3fJat5SsNIxpLOeqL7zjJroVQ/HNk5XtocXfdm/O9SOyh9U7idWqvyYRW7
 ozNNpQwjhMLZxeNFF5yhLTxioYiA4hUZysVSnBN4luw0s9oszUUy5d9TBIZ1MT+QOQlA
 FuSWfwJoEBTvDeGcX0/ALm0san/G/OS1yBJ8g4oo/g0grYeeVTDbcMZYWff3Jfh51wCG
 qAIVWZekCDQYWTuzQ9BoWh3vdXOJYOQ1jLo2KFOuowHIptPrTTwWCgeTBUuiLJalF1xr
 22Og==
X-Gm-Message-State: ACgBeo2DYbaTxB+2xG/jAzgOZ4/NyXQd5cLpSIVZ9CXK3p+9EhwMxrya
 x5ZhRxeNEK38uwBfpb8Zi3xGgw==
X-Google-Smtp-Source: AA6agR7PpgQeI1yvyNXui33yqrnfd3OnVRgPQVUrSNq1um7MUEcphF1tdeR5cF4qLI1SiDVVjIKGwA==
X-Received: by 2002:a05:6402:42c3:b0:43d:682f:c0ca with SMTP id
 i3-20020a05640242c300b0043d682fc0camr2700006edc.334.1660294286596; 
 Fri, 12 Aug 2022 01:51:26 -0700 (PDT)
Received: from nitrogen.local (253.124-78-194.adsl-static.isp.belgacom.be.
 [194.78.124.253]) by smtp.gmail.com with ESMTPSA id
 w27-20020a1709060a1b00b0072ed72072aesm542212ejf.192.2022.08.12.01.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 01:51:25 -0700 (PDT)
Date: Fri, 12 Aug 2022 10:51:24 +0200
From: Bram Vlerick <bram.vlerick@openpixelsystems.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <YvYUjNF8t6h19g4H@nitrogen.local>
References: <20220811122011.716045-1-bram.vlerick@openpixelsystems.org>
 <20220811224144.78b1581a@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220811224144.78b1581a@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems-org.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=HoiKZbjiIqR9LpWcqLuRrQqrHwPbff7pg9Xg+d41Hu0=;
 b=xw0Vq0CCvCt7rA036tI6wPMnulzURss4out5uno4ea19uNEPX2E37Z2777AhIaLaId
 47Bxe+MbBHNrZC1pSeH8g04wvgWMlwVxRL2vQix4xMkFFA8WWkVhAlW7fYstJXJEZu/B
 vGWjzJfZ9N57SBosfqmDgNPi4Rygqy8RqLxbedKYX/tHbx/FriKcBMq78QgAGshNVsu0
 DnzHI2EINWzLRlUlyY/ny6qH8uKfLI4qs27n7JDAkg0OF0DJG/+jy/i65oh1jrj6vFwe
 gs+vf5wi1fztPTiVnqJh0webIER4wLwknRaB3PPbkrDEDaUksJcD51DmK38BtqhAZeLE
 5KzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=openpixelsystems-org.20210112.gappssmtp.com
 header.i=@openpixelsystems-org.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=xw0Vq0CC
Subject: Re: [Buildroot] [PATCH] package/freescale-imx/firmware-imx: allow
 lpddr4 firmware version override
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
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Gary Bisson <bisson.gary@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

I'm currently adding the suggested changes. With regards to the suggestion below.
The DDR3 and DDR4 already have a "hardcoded" version selected. What would be the
prefered approach, adding a default value in the firmware-imx.mk for both the DDR3
and DDR4 cases. Or would it be better to update the individual defconfig and add
the BR2_PACKAGE_FIRMWARE_IMX_DDR_VERSION variable to the configs?

On Thu, Aug 11, 2022 at 10:41:44PM +0200, Thomas Petazzoni wrote:

> it's not only LPDDR4 firmware files that can have versions, but also
> DDR3 and DDR4 ones.
> 
> So can we instead have:
> 
> config BR2_PACKAGE_FIRMWARE_IMX_DDR_VERSION
> 	string "DDR3/DDR4/LPDDR4 firmware version"
> 	help
> 	  ...
> 
> In the help text, perhaps state "leave empty for the default version",
> or something like that.
> 

Kind regards,
Bram
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
