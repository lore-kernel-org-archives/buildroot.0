Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0F7F89251
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 11:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86C1B83EDE;
	Tue, 21 Apr 2026 11:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b7ZassOaBBvf; Tue, 21 Apr 2026 11:30:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4320183ED8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776771035;
	bh=mqrPeqxFzplh+imSAalsndt53z6VlLpkXwNbc2oNyuQ=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Lemhb35Z7zKLorEmJ7bOIZ/wwpLE/f+z8mV35IIFgMHgN3yyGbQX8lmACzrxBCiJl
	 lfG/zoztQ38Uii7L8WlrFgaSILR24ejsSJwOaXZCQnxMO6/E860zS1+kA1rEtRJY0o
	 Ezcu2GarEabg8IyPKRdottQCrySnPy0xnQaOev7a7i6SwJzB5djosCKl0QrKUeA4ke
	 TWBLIE9KZNjKIT2C/+XEYfaK5ier+vSPugb+0eF+Nb5Yb7eecifj0l66DjFTuKenTS
	 NrEcwTbzgtuNoZeDWXpI0qbHp3PnV5QGN/zrrgXAOV7rL5pRgizs1j2NlYhutcxOCo
	 0MgON9P8aEzTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4320183ED8;
	Tue, 21 Apr 2026 11:30:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 29DD1259
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 11:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07AD940CA8
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 11:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uk4mPKk9HkOY for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 11:30:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=obbardc@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EA93240834
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA93240834
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA93240834
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 11:30:32 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b9e00649769so577781566b.3
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 04:30:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776771031; cv=none;
 d=google.com; s=arc-20240605;
 b=Np0XyEdVccuuAM9S0Kk0I7rZHh7i+jbGpUXCrRd/P+9+7seR+RbsUuBQyF5b8s4SSP
 eTYt39Zv91RdnqDXPgatAXnsWP/MpmfO0rArMV25aHUF9Oey64IQrXLQMg+Hbctr6UNC
 QM2C6cfY9lR/ZdZq/5//Mz3nejiFrftTIMI4rB6EBBH8BDBQLt6tJQTPMEGPJUvigqzq
 jCoOVjqLNPLw5OMx68Iw8J0tPFXlgRfwxP1sHFQluqVnZ1JRDBZyqMuPjuKctdMS7p49
 frv2E1AVsdtKyx5IjbnU8dJeQiwE61MvRKS88eEXRxuT1b0A1AXuUeVH3nCPA8dnbWtc
 HhWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=OOt/MjatHsyfSoRfzH0VE4du1g5Jy8AjXwJdNYJbCK4=;
 fh=epjeFTPvZ6h5ICLt5+vxb2cv8LgDR4T9hl927jhpk/c=;
 b=CHz0hJliQsL5sOq81p/dg9y7GhA0ylA6XeVOz5YwiMoYhS3jQ37t7aX4d9Cd3/kPcA
 6LMf+RCzO/AmHNPK58g+neK6knoFAR0wwshwe/PEiCgFdlZ882NdyCCpvPq8zeJmrcz7
 XKKobUnRDVxVTQ/+clEA9Fgk6Ky/YchvQ2ubSRzJFPBcSdedwfapMkDiLbdC3EXcZjq6
 YuhEehf+97XWBNOK3pr07rP+RrXR/k726OqInl7XsVVx9CSkiRELZdDUIdun/NmeanNI
 ihNOrBjGD/cbKmtLspYiAD/wcOGCMnxukO1vg/ps8jkRTJ+m6GXlGY/+llEspjfGaKIM
 CskQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776771031; x=1777375831;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OOt/MjatHsyfSoRfzH0VE4du1g5Jy8AjXwJdNYJbCK4=;
 b=UbMKK00NQqjEh7mZk8rrUZhJKKypFiWiYlMh+05CFfRWMMVwepAO0rlurJKGPnLHhz
 t/hmbhF3FYnhIv2pN3NKJJqMOzUjXMTLYVEXUS/RUGM6pFMSEFatg8MqrTiHOBhX/UfX
 1xRZb0J8/JRd/opHqFMl4lA6/CMDP8NivrSES09Sr1oU49jlkQBMxMXSSLtmZoWvixim
 1t1QTYRsu2UUCukpJyEslnteYAG67ogLpJE5OfQrRisPUyw1X6Az/KP1o7F337X761my
 xmlmwjEsNGSZunfhyvoaHa9t0mj9ZIJz+2gY1ARh2Q58+onoJ2eQ3CGki7aMnWk3gX5m
 jLzQ==
X-Gm-Message-State: AOJu0YyB+gPEJ9j5yAJpF8hAM0yFEIPYJPssSDpWiGx3WZ6bYRTcdpg9
 VRrUG4vljUfVayk3hKE71AyCKCS9RgqR7EiUFW+AXBmKqSgGcAvwaIGvJGSpERtHw7mgBTb5GjE
 qqSxR+VRLrPFilc/WQiAUU7pldDWP0pA=
X-Gm-Gg: AeBDiesHJFjHEoKML9u7Y0STgp9fRlStGBincdwe2/iCj8N8DPsZ6tD2qs5wu2bmJSv
 klwco/zquodlV9Sc91B6jyBfRrpACOIgj+7k3MYm5Enk0igyuR1KTcHo//+IrfgcMJE+snKkIFu
 UYnADRG2QrjK3LcyA6LOdCs8UerCXU13gjxyeU7udr4ynZcI/5iVN+9uZabC1dxHR35VbQkBKF1
 a+jnYljT/9y+enMnMLid/hujoC0SZDZw4c/gYoSnRqTVLNZ2dX88AU/hOf/d0dV1eEbhTsPQgEi
 6ddDE4Xc4EJb0AeUQFFl/AHUhskK7e1aq0X9gNyq6dYJeG5nMJ1YZgbKUKroyySlwlbWSPr3TX6
 OreEb2pgz7aI4nwuCsg1UDopqR7dOfMt5M0WvE88sfZwpK4VObYEFc2E1umWkN1WHIZSHoGiw4u
 GuFWEuSEyvLoD0Bg==
X-Received: by 2002:a17:906:eec6:b0:ba3:1150:94b1 with SMTP id
 a640c23a62f3a-ba41a24ffdcmr901665566b.29.1776771030502; Tue, 21 Apr 2026
 04:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260419-wip-obbardc-boot-efibootguard-initial-pkg-v2-0-1420c48f78fa@gmail.com>
 <fb2827a1-bd08-49a1-a52b-b4f5dc8aa881@siemens.com>
In-Reply-To: <fb2827a1-bd08-49a1-a52b-b4f5dc8aa881@siemens.com>
From: Christopher Obbard <obbardc@gmail.com>
Date: Tue, 21 Apr 2026 12:30:16 +0100
X-Gm-Features: AQROBzAwRCUKB7wuQ2-9XeiE_Wk6skEevXHS1bxM7gv-TvFPkpsOfZuYPB75i2g
Message-ID: <CAP03XermLX6+JHihMBLK83MvoTYA2pp0xZf3SHkc3MqTaKJc-A@mail.gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776771031; x=1777375831; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OOt/MjatHsyfSoRfzH0VE4du1g5Jy8AjXwJdNYJbCK4=;
 b=FIp9jwP/cfLUyBlmhFztVZy59zTeSAR5NLbZgSgOO8+DluxQlF6lehev5wlwB8kmrV
 aDYnDmxviBhkFjEDuAloxtt2DwcVvA02KkYWZ3fK2u59Mgptc12tGrkIErABmZWNLlDb
 UpboDvLlHonITBZIodi8ErqdHKNZieq6uS/l7Q9EoNdvOUxhFUAHRkaBfWYo0QIKy2pF
 q9Z/E7982BON63uj4w+8KVZXcPYIzESM7CIUl6ICEN0cv/kkz4mu+ekrTnlOfkFoj0qN
 j35L8b7jE8d/oMzuhDu7RZas/++uYf2kTqSuKJuyefG2o6eU5c2n9STWhiesdrgFeniK
 Op2A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=FIp9jwP/
Subject: Re: [Buildroot] [PATCH v2 0/2] Add efibootguard bootloader package
 & example recipe
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 efibootguard-dev@googlegroups.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Jan,

On Mon, 20 Apr 2026 at 10:15, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 19.04.26 02:20, Christopher Obbard wrote:
> > This patch series adds support for the efibootguard bootloader
> > (https://github.com/siemens/efibootguard) to buildroot. efibootguard
> > can be useful when designing systems using A/B slot-based upgrades.
> >
> > The first patch introduces the efibootguard bootloader package which
> > builds the EFI application, user-space applications and host
> > applications.
> >
> > The second patch adds an example recipe which demonstrates how to use
> > efibootguard in a typical EFI boot scenario. This may serve as a
> > reference for users looking to integrate efibootguard into their system.
> >
> > efibootguard can be built for multiple architectures, but for now this
> > patch series only builds for x86_64 (since that was what the project I
> > added efibootguard to used). Support for additional architectures
> > (including arm, aarch64 and riscv) will come in future follow-up patches.
> > I expect to do that once this series has been merged.
> >
> > The example recipe has been boot-tested on QEMU with OVMF firmware and
> > I have confirmed the image boots & runs as expected.
> >
> > Feedback welcome!
>
> Thanks for the recipes! Beside other archs, UKI and secure boot aren't
> in scope for this version either, right?

That's right. I was hoping to get some initial feedback from buildroot
maintainers to see if this
is in the correct shape before adding more features like other arch
builds, UKI and secureboot
in a follow-up patchset.

I also have a sample buildroot recipe to integrate a RAUC bundle with
efibootguard and
RAUC efibootguard integration:
https://github.com/obbardc/buildroot/tree/wip/obbardc/rauc-efibootguard
which is from https://github.com/rauc/rauc/pull/1450

I planned to submit that example to buildroot in a follow-up patchset
too, once the RAUC side is a bit further.


Cheers!

Chris
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
