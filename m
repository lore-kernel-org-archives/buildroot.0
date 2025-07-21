Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1EBC87FC5
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 06:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A41A61CAA;
	Mon, 21 Jul 2025 06:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AtHlKdtQIzAp; Mon, 21 Jul 2025 06:11:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BFD661CA3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BFD661CA3;
	Mon, 21 Jul 2025 06:11:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DBCE1F7
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 06:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3FA840B97
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 06:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5GA1S0SBIGx for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 06:11:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 09EFD40AE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09EFD40AE1
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 09EFD40AE1
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 06:11:04 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-32b561a861fso33936861fa.0
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 23:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753078262; x=1753683062;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XE7DpLM+Xv+9zWcPFOONkhJmt2xFJ2wbI+QbzjwtQcI=;
 b=ORsbOQk1X9LTDolGcfxsEVvAnYBlTd3OfpH693fCnNBEOMbXL5LeJ4RzomrQ99hx0M
 lsAHrrz06ABP/qnCM4EPGYf9nmIe2OR0qTi3WABzsMuW/BlMEpDpGcevhtAJOaZj4+KA
 32/UDFwhTerDn08Kklio83K3cjRVvKNY7akPc1Etvu5yfaNGVZflFBea3a1o7ovcpmfj
 hxLGGv6AMvU8tmHOchbezjKiAZd/AnLRfCWsR7XIp1qEBH3xHOkMnPl5kzGmohJYL4tQ
 c5D97ru5XCH2hDldhmRLtHg3BHuuT1fK2euJ2dVQnZocxEKj1u35vtVzcN6eUyFjnG2T
 c7dw==
X-Gm-Message-State: AOJu0YxJSWEqGcGio2DAPNzJHxi57Vb28IU5cvik7U0lR395HxZuhaQM
 LKxVMinYhuNj9FMq750IQLPvkn3+hEPnbAHjXqMQbNS6GHgd3+ZsmYs5UGDfDGi04OwVZvqOgcj
 jc+F73u/RPTBWG0MTLFsCANJBVkfQQw+dZw==
X-Gm-Gg: ASbGnctLlAdjKXHLqb92KEJSDSBAUgHG2dfwKVg47gR0my3nZzXyFa/Ev2Vu03e2qIw
 Jw5klpHGyVO51jDQLQp85KYLG6yqmViV1QxJqMaMnCisM0ii4kNsnIArbFoWRtJkdbSH6IXmW5A
 a04JrurmiqStyZaj2QyeZJtgYl86zHTfEFaiqvj8NO4GcGuuHESLHMRHtBAzpvEhK2a94GQudOW
 glJM4yn
X-Google-Smtp-Source: AGHT+IEttPd+ODkFX4KERwURDg6gtzzybXkpB3HHaWaAjj8VaszBm6m02vxEjmni2IkBtOJCjNH0yt8jbWJZJVoCvd8=
X-Received: by 2002:a05:651c:1683:b0:32a:ec98:e15c with SMTP id
 38308e7fff4ca-3308e547695mr53470761fa.19.1753078261854; Sun, 20 Jul 2025
 23:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250715081938.108853-1-heiko.thiery@gmail.com>
 <20250715081938.108853-2-heiko.thiery@gmail.com>
 <20250715140207.p5z2khln5cvfismv@bryanbrattlof.com>
In-Reply-To: <20250715140207.p5z2khln5cvfismv@bryanbrattlof.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 21 Jul 2025 08:10:49 +0200
X-Gm-Features: Ac12FXzoWVC9CY8KIjp6U3OAp1Mssmu9qaGaOCUko_Ov1UTYICJVCqhGOXaF4Jo
Message-ID: <CAEyMn7akwpuZkigJ1KcmCjXtm3oD_LNS7o_2KNSYkUbZRnP1fg@mail.gmail.com>
To: Bryan Brattlof <bb@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753078262; x=1753683062; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XE7DpLM+Xv+9zWcPFOONkhJmt2xFJ2wbI+QbzjwtQcI=;
 b=fDetX30Jo6kUCZkdE+QRYk5Uds7n7mrjPADRrnyKNnQi6L5Mq/a9TmOgfcGLtR8W/B
 S8q0PvYkX8sst6cWKaZ4mtb8daEKLbSEMWwKWzFY74k2qIIjJusLdhwRJ/Nmxstp39Ke
 TCJVq/dQzytdYksfN6LHsPX/rf5hBvr9YkSfl4XokPGDX6CXklIe6rRe0rSvc76EL+g4
 kOUILLbHY5W/41zgLrKTtxm4E9uUvz2bFAnWUur9+Por6n8VlV2c1M0jbEtzY1pnCx/M
 lJscmxUROdgrp4/d/kKPfZ8VninSRc5mnmZvBHjDnUVqAQL7GHKFofNG8XobTeiI1CiP
 nKxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fDetX30J
Subject: Re: [Buildroot] [PATCH v2] package/linux-firmware: add support for
 PowerVR rogue
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Michael Walle <michael@walle.cc>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Am Di., 15. Juli 2025 um 16:02 Uhr schrieb Bryan Brattlof <bb@ti.com>:
>
> On July 15, 2025 thus sayeth Heiko Thiery:
> > This "powervr" directory has been present in linux-firmware since
> > version 20231211.
> >
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> > ---
> > v2:
> >     - add entry to the hash file for LICENSE.powervr (Julien)
> >
> >  package/linux-firmware/Config.in           | 5 +++++
> >  package/linux-firmware/linux-firmware.hash | 1 +
> >  package/linux-firmware/linux-firmware.mk   | 5 +++++
> >  3 files changed, 11 insertions(+)
> >
>
> I don't do a lot with GPUs or VPUs but I seem to remember the GPU driver
> was kinda borked right now. It's no reason not to let the firmware in
> but I just wanted temper expectations before we start rendering some
> triangles :)

I know that the mainline support is not yet in a good shape. But there
is progress. So it is good to have the FW already available.

>
> Reviewed-by: Bryan Brattlof <bb@ti.com>
>
> ~Bryan

BR
Heiko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
