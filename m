Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (unknown [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8311BC38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 12:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16B7E80BDE;
	Mon, 31 Oct 2022 12:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16B7E80BDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kgHIAJmyyWa4; Mon, 31 Oct 2022 12:52:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B118E80B9B;
	Mon, 31 Oct 2022 12:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B118E80B9B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F45C1BF417
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 791FB404B2
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 791FB404B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k1VNpUytq1YG for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 12:52:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0FE840436
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0FE840436
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 12:52:27 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-13b6c1c89bdso13281404fac.13
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 05:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oNV7iHrDS7XJFuuBDIKX/d/3s3otr8LzFLpbyxjI2vE=;
 b=Ga1ew4xLXAwuJ187btjjNsg1aipP5cetJxBuwPRqQGSc9J3DIKHTWH0BR318WBop1c
 OJmXv29LTHBKezxhihaSyjD9oZQ+m9wjsE2XI1GhJDMhlnYXFv7EsqVgl5NyDKf0KK13
 NZ2rIsKUD1sCgM8b20dTofQjvYmE/bNcarpuKx+e7M0D6htUwziHRmvRsq3OnIVFKoGh
 G2SLxCTII/KrY4LLDsdl/NqHN2mhTBkWZiGv+FXcBupqTzmWAMih/yvRLTimuDkeBfoA
 9KdtoCbn60gxQ7rcJBhA+vBT/65pLkmGqOp4v6RDWDFNMRxDLZyPw3K+T2rznukQf1C3
 P9zA==
X-Gm-Message-State: ACrzQf2LRZ0HULV3GYqX7Dt07aH2uwGV2rnOM1wSiaH+QC/oQklHSfPQ
 oMSQcQouHPlMl1FxL/Fk6T1zNgpvll2nAAQyTCoXSA==
X-Google-Smtp-Source: AMsMyM4AO/qzpIOiS9cRRPpfe5pM1ZGvEDWPwaBysFwOjkl11liHqzBUmKkb6pgTyQ4K8oQsZz29egYel0TZslw+taQ=
X-Received: by 2002:a05:6870:238a:b0:127:9dba:7c82 with SMTP id
 e10-20020a056870238a00b001279dba7c82mr16991099oap.28.1667220746979; Mon, 31
 Oct 2022 05:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221031114643.6648-1-tim.gover@raspberrypi.com>
 <20221031123928.GB1058960@scaer>
In-Reply-To: <20221031123928.GB1058960@scaer>
From: Tim Gover <tim.gover@raspberrypi.com>
Date: Mon, 31 Oct 2022 12:52:15 +0000
Message-ID: <CAAvKZ67N24Hj7ejxQ7zueOQbsqq8WNNgLiZauM7GkMHLhN=kYw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oNV7iHrDS7XJFuuBDIKX/d/3s3otr8LzFLpbyxjI2vE=;
 b=dBMlfc+OlTAbHazE6ryLPD8/qdcSIPtaqCMW5OrawpZMZ82pDssxGy/izcAdBGh8U2
 umBdOPCRuWzy2LuNZet4zggrp2I098Cy6ffA5BtUUs6l4xrYqD0vBvcS7o4sMRAWStkX
 BBI/lAhps742ckU0vRJ8w14E89H5oymVStnoZUVxeh1qDkXNypryrPu4FKVxEsekWx9q
 k7A1ywcoVqRn5aeY7xqdM2CFVrQneF4NQAufJBIkUeVwdVzshoENySK+3mnI64s4UmuG
 1kbndWbz0B8YpvymRoKr9dFXxAInhYY0M/hWrCxQT/Z5ZuxYh+aFyD2u/DN9nW7Q2YM2
 3yUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com
 header.a=rsa-sha256 header.s=google header.b=dBMlfc+O
Subject: Re: [Buildroot] [PATCH 1/1] package/rpi-firmware: add
 overlays/README
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
Cc: Martin Bark <martin@barkynet.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 31 Oct 2022 at 12:39, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Tim, All,
>
> On 2022-10-31 11:46 +0000, Tim Gover spake thusly:
> > If a custom os_prefix directory is specified then the Raspberry Pi
> > firmware probes for the README file in overlays directory.
> >
> > Since the README file is small let's include it, otherwise,
>
> 197KiB is _not_ small. In fact, the README is bigger than every dtbo,
> and accounts for ~25% of the size of all dtbo combined.

Good point. Would you be happy with simply creating an empty or small
README file (a note indicating the purpose of the file) ?

> > the firmware won't recognize the overlays directory if the user
> > later moves it to an os_prefix specific sub-directory.
>
> What is the goal here, in the context of Buildroot, where we only
> install one set of overlays?
>
> If a user moved the overlays, they already have a script that does that,
> so they should also ensure that script properly prepares config.txt to
> specify the proper os_prefix, and so it is just a matter of adding a
> 'touch' on the README in the same script.

It's fairly common for non-expert users to modify the output of a
buildroot image
without re-building the image themselves. Adding a README file reduces
the risk of them being tripped up by this difference in behaviour.

>
> Regards,
> Yann E. MORIN.
>
> > From
> > https://www.raspberrypi.com/documentation/computers/config_txt.html#overlay_prefix
> >
> > Unless ${os_prefix}${overlay_prefix}README exists, overlays are shared
> > with the main OS (i.e. os_prefix is ignored).
> >
> > Signed-off-by: Tim Gover <tim.gover@raspberrypi.com>
> > ---
> >  package/rpi-firmware/rpi-firmware.mk | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
> > index d4d1d07b3f..908d7def6a 100644
> > --- a/package/rpi-firmware/rpi-firmware.mk
> > +++ b/package/rpi-firmware/rpi-firmware.mk
> > @@ -48,6 +48,7 @@ define RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
> >       $(foreach ovldtb,$(wildcard $(@D)/boot/overlays/*.dtbo), \
> >               $(INSTALL) -D -m 0644 $(ovldtb) $(BINARIES_DIR)/rpi-firmware/overlays/$(notdir $(ovldtb))
> >       )
> > +     $(INSTALL) -D -m 0644 $(@D)/boot/overlays/README $(BINARIES_DIR)/rpi-firmware/overlays/
> >       $(INSTALL) -D -m 0644 $(@D)/boot/overlays/overlay_map.dtb $(BINARIES_DIR)/rpi-firmware/overlays/
> >  endef
> >  else
> > --
> > 2.25.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
