Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01700C61D97
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 16:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E2CC817A9;
	Sun, 29 Jan 2023 16:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E2CC817A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ViZH3j8KexYP; Sun, 29 Jan 2023 16:53:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC62D817A4;
	Sun, 29 Jan 2023 16:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC62D817A4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E6D181BF476
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C11734051D
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 16:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C11734051D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ndv9rMpYZIsc for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 16:53:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 910E6400D9
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 910E6400D9
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:53:48 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id mc11so3295609ejb.10
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 08:53:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PEOsTlUjQ9aBfajULQctjaTrtl/X35Au5KDnJnE4fmQ=;
 b=nxeDWjQbhGoOFRZ3No7Jr6lFMs9dUAtvew3SBT90P9I77rjXaCwQvDyPgP6j6oQBHd
 SvE+babLPEN71MIA9BAQ12ttjKCcHLSNhftpaskVVEPqhwXWe2dF/EzngDrGUEG7/zrX
 xz+BaRus+SB16bND57N3LIYJAAfmEOKLRuGY7ZkgSbTX6TCCA+TxwHLr9nVHumamr7pt
 D+4iPYWpvYpxgLKCwBbpDD3EIUQpeeNhNH0o9xrlUCmmtuh8SeTtqHQX06+NCyNCrxHg
 2lJV7RVXm1ERRsfj51jAMhZe4HSVjhvdhzEVS8HRpl2LNCfF/ITttoWx9Zd7qXCqcnB3
 vlbA==
X-Gm-Message-State: AO0yUKUC275Ez5VgsczvLUWMKIO4eiZgFyA9jEBznf9mf0ocdvzEXbu4
 xYk37vJVeMsjylPQnmU4k5mXLlcYKbphOk+fpob5Cw==
X-Google-Smtp-Source: AK7set8dYbe9kN81ss9P8Z7tqfMJx1CaFOyrsbtT8CW/3IhCXzfz+AxzhY4U40SOA3Fg7D0+hd/5jYL6jEh30huKUDs=
X-Received: by 2002:a17:906:c347:b0:885:2e6:7c7c with SMTP id
 ci7-20020a170906c34700b0088502e67c7cmr891099ejb.218.1675011226835; Sun, 29
 Jan 2023 08:53:46 -0800 (PST)
MIME-Version: 1.0
References: <20230116215516.264468-1-dario.binacchi@amarulasolutions.com>
 <20230116215516.264468-2-dario.binacchi@amarulasolutions.com>
 <20230128232339.156536e9@windsurf>
In-Reply-To: <20230128232339.156536e9@windsurf>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sun, 29 Jan 2023 17:53:36 +0100
Message-ID: <CABGWkvpPKLCBvFbVQ0YdxOzVpGK086TAZhKDaKnOaPRS=uefxQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PEOsTlUjQ9aBfajULQctjaTrtl/X35Au5KDnJnE4fmQ=;
 b=fXIr2e1r6V+Vmpg7i9Ov6R59+OG+9R6E6sJp+/cNuTet0MimMGExRFbY4DwHlnr790
 fWpEtkjhFzO83hwBpEGP1Ed0RAT9PXnDyx7lnXq48RMKsnj8bpIh4pjUxMOc3l3JnWzU
 Hd/Hz3/74ZvtDS3XMuyqPZ0iNOLX1+zJ/04B0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=fXIr2e1r
Subject: Re: [Buildroot] [PATCH v9 1/2] configs/imx8mn_bsh_smm_s2_defconfig:
 new defconfig
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
Cc: buildroot@buildroot.org, Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 giulio.benetti@benettiengineering.com,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Sat, Jan 28, 2023 at 11:23 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello Dario,
>
> On Mon, 16 Jan 2023 22:55:15 +0100
> Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:
>
> > BSH SMM S2 (SystemMaster S2) Board is an add-on board which provide
> > input and output interfaces to a dedicated carrier board. It is designed
> > mainly to provide graphical/video and connectivity interfaces to the
> > appliance.
> >
> > Board support package includes the following components:
> > - mainline Linux kernel 6.1.6
> > - mainline U-Boot 2022-07
> > - default packages from buildroot
> >
> > https://www.apertis.org/reference_hardware/imx8mn_bsh_smm_s2pro_setup/
> > The smm s2 board is basically the same as the pro except it boots from
> > NAND instead of eMMC.
> >
> > Co-authored-by: Michael Trimarchi <michael@amarulasolutions.com>
> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > ---
> > Changes in v9:
> > - Bump Linux kernel to version 6.1.6.
> > - Remove the Linux kernel patches because they have been merged into
> >   the used version.
>
> Thanks, I've applied both patches. One interesting point to note is
> about the kernel configuration. Your Buildroot defconfig says to use
> the default ARM64 kernel configuration + apply a pretty huge fragment
> to disable lots of things:
>
>  board/bsh/imx8mn-bsh-smm-s2/linux.fragment    | 895 ++++++++++++++++++
>
> So you have a 895 lines fragment to disable lots of stuff. I was
> curious to see if this fragment was not *larger* than the actual
> resulting kernel configuration, as a defconfig, and indeed it is:
>
> $ wc -l output/build/linux-6.1.6/defconfig
> 816 output/build/linux-6.1.6/defconfig
>
> And still reading this defconfig, it is pretty clear that lots of
> options that are enabled are not relevant to your system, and could be
> disabled, making the defconfig even smaller.
>
> So overall, it looks like having a complete defconfig of your kernel
> configuration would be smaller than a fragment that disables zillions
> of things.

I will follow your suggestions to reduce the linux configuration.

Thanks and regards,

Dario

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
