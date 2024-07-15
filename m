Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595E3C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 20:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB3F7403D5;
	Mon, 15 Jul 2024 20:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T2htC_YTPS9K; Mon, 15 Jul 2024 20:11:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78EFF403E1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78EFF403E1;
	Mon, 15 Jul 2024 20:11:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B0F41BF3E8
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 20:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 377554096F
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 20:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMeo4VK5KxZt for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 20:11:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32f; helo=mail-ot1-x32f.google.com;
 envelope-from=kris@embeddedts.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 053EC40376
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 053EC40376
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 053EC40376
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 20:11:22 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-704156d0e0dso2526666a34.1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 13:11:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721074281; x=1721679081;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:reply-to:subject:message-id:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=26+sIs/ddq8IptE8bdpivJWsVvtoTeXo/dw2YqeztFs=;
 b=gyxiiWzIZw0fa6esaUP7i6JvLf44dmQsyTLtS3HeR+ybRfe2/lMplBZp7+46VUx98C
 kSAlI0awvYBxHxd9Ahkzr0Zos82orPdpyLM91MZbxKAENQbqu8Wq/nXJkkrrk64Tb0ib
 /HGe3kn73qkiT/wXZ9qv3iI8GUOXMbU5IMHNicimlXNiOh7+W94DxHhtO4UA0a79QcA8
 HJQof42gzCYLK83Ch4yxBsi+ddLtytjmDHMdZN/MEPDTs9Fl5ozOvwigyRZrGJs9HMhL
 qIMs71ukSBwC5CBJo0U+Cti5ukDlcYUUkUsHJS52pfK9so1xOdId8y3wjJr/CBMHCQcb
 eXNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkEKxspGm/XAn8ySorIEqlME3uNMPVT3gFkfaVkzyk9Kfs66SCVd8DpqP4dUghERiT+I5bJgN1LycvUYCUR+GjwkiAxkMPiA==
X-Gm-Message-State: AOJu0YyOdLSkkPsD3Z7nKEnboKN7M4Kl8KjQYLd8lNZoymN37Vtmx4Kg
 UkBtJ6M16tQESAKdDl4ZYnQrfxStQJzr9dgLvYzwuks6Pd6fXXrAtBAE8QZt+FNk3y6zzbJ3fZT
 uxcE=
X-Google-Smtp-Source: AGHT+IHcoFbDhLLDO6fKu1xHcjYY23sacXR937WFjkhg371iwtUornATWglqPyc+OW/NwzfaTmCdqA==
X-Received: by 2002:a05:6870:3048:b0:25e:1817:e4b7 with SMTP id
 586e51a60fabf-25eaebfacf7mr17051098fac.38.1721074281626; 
 Mon, 15 Jul 2024 13:11:21 -0700 (PDT)
Received: from [10.10.10.151] ([174.25.79.17])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7eb9c995sm4961442b3a.15.2024.07.15.13.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 13:11:21 -0700 (PDT)
X-Google-Original-From: Kris Bahnsen <kris@embeddedTS.com>
Message-ID: <bc23a512b541ddfa69d5d7de1d4d2cf2d5c01a1d.camel@embeddedTS.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Kris Bahnsen via
 buildroot <buildroot@buildroot.org>
Date: Mon, 15 Jul 2024 13:11:23 -0700
In-Reply-To: <20240715212442.367a9df9@windsurf>
References: <20240715180236.664036-1-giulio.benetti@benettiengineering.com>
 <27d046a7a40bbc72279aac3e5971d8d58842b55d.camel@embeddedTS.com>
 <20240715212442.367a9df9@windsurf>
Organization: embeddedTS
User-Agent: Evolution 3.38.3-1+deb11u2 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=embeddedts.com; s=google; t=1721074281; x=1721679081; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:reply-to:subject:message-id:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=26+sIs/ddq8IptE8bdpivJWsVvtoTeXo/dw2YqeztFs=;
 b=Pfm8kONcl9eO+teKu4brz++QRYYT0YEMzCF4YyiD2KYFpgInVXhpP4Xr59FjnesMKF
 4EyjInvM/xUezCIq8rNYi6IwvnkfN9qizGvVjmWSLxaORhdDDozoNR0Df/HBj8EOLm0M
 GY0eex3Q9UvZ37fiHTiJzX03Hqd1wh8L+2z/Y=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=embeddedts.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=embeddedts.com header.i=@embeddedts.com
 header.a=rsa-sha256 header.s=google header.b=Pfm8kONc
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: bump version to 2024.04
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: kris@embeddedTS.com
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 2024-07-15 at 21:24 +0200, Thomas Petazzoni wrote:
> On Mon, 15 Jul 2024 11:25:13 -0700
> Kris Bahnsen via buildroot <buildroot@buildroot.org> wrote:
> 
> > Be advised that this does NOT support "up to" Linux 6.6. The latest
> > updates from Microchip drop any backwards compatibility support,
> > which
> > is why we have not pushed this up to Buildroot yet.
> > 
> > I think this only will support kernels 6.2~6.6 and currently do not
> > believe it will compile against upstream Linux 6.9 (I tested it a
> > while
> > ago but don't remember the outcome as it wasn't important).
> > 
> > As I mentioned in my previous email responding to build failures,
> > we're
> > working on a solution to be able to handle backwards compatibility
> > with
> > 'backports' but are first catching up on other tasks.
> 
> So what can we do in the mean time? Support a few versions of the
> driver, and let the user chose?

At this time the driver that is in Buildroot, with the patches
submitted by Giulio, I believe will compile up to Linux 6.4. Most of
the testing we did on the latest driver updates was for Linux 6.6
(latest LTS), which did not cleanly compile with the existing patches
from Giulio which is why we pulled in the latest updates from
Microchip.

This patch could be modified to support the older linux4microchip-
2021.10-1 tag on Linux <= 6.4, and linux4microchip-2024.04 tag for
Linux == 6.6 But I'm not sure the best way to go about that other than
adding a Config 'choice' to select between the two, but that would put
the burden on the user to select the correct option.

But the issue also remains that it currently does not compile against
6.9 (I just confirmed this via a test) which I am not greenlit to put
time in to patching the driver solely for 6.9 at this time.

We are working on upstreaming platform support for many of our
products, but with how fiddly the WILC3000 driver is, we're going to
focus on that first so I hope to have a real solution sooner rather
than later.

> 
> Thomas


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
