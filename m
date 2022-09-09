Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1217ECAAD3
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 06:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E03084049E;
	Fri,  9 Sep 2022 06:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E03084049E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NN8gPiBtIXTt; Fri,  9 Sep 2022 06:54:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 022AA40323;
	Fri,  9 Sep 2022 06:54:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 022AA40323
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C54AA1BF3F7
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 06:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A69B460BCF
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 06:54:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A69B460BCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 74X3EP35oXyk for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 06:54:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F94360BB4
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F94360BB4
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 06:54:00 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id k10so1134053lfm.4
 for <buildroot@buildroot.org>; Thu, 08 Sep 2022 23:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ky3TqoFm8uJ4oXDz7wdajXToqszsQ8gEWCzbL0Wa418=;
 b=Mxtkm9X9h0DCE+4iz4D8FMAj5bURsCcjJmCPV/ogamGv9zkg8NAM/P9YJZAmv0bVDD
 uBsERQQM8fSA/dZ8uRCxu2QE8b04s+3whrJltB8xAt9PVrsmpXb8puPFMlrpuHJBkpKV
 mG+YIDvfpxeQSM5opUovhlwC4kJeRs9TXsN8zppfhyO9bEQVJEcWM/zzTtA3hEdBZrmi
 a5waJaRrsQhhfqddpSWZqVfDXRp+enIAm3VYHrkmlFopkVuz7uwDwUnWSoMqdzyHdy9q
 Tz9QCh6Hb0lsHU2OkDunmY+quuCbbBkoEoz9DNNH0q4CE/NVyHMHD6BaCVWRHNg/8+EQ
 BAVg==
X-Gm-Message-State: ACgBeo3xpYWnFBm0od5D/TS3fXBgIYrpzxnpIKh1bZ9RMTH7Cf6pzVog
 gfKpWSJz2KJzI5m3Fwl93v0DrNBh8Eqp9QwRg0Br8rXlkks=
X-Google-Smtp-Source: AA6agR5HmgL83HaDwt9FQP+q3flTi2NOBBGtAqBb2pKHBzufWhQWk+80ieVUFNULMvXVauOQ4j8aRprYL6/ns7De2pM=
X-Received: by 2002:a05:6512:6d5:b0:494:990f:a820 with SMTP id
 u21-20020a05651206d500b00494990fa820mr4202935lff.536.1662706435873; Thu, 08
 Sep 2022 23:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220908191904.823806-1-dario.binacchi@amarulasolutions.com>
 <20220908191904.823806-2-dario.binacchi@amarulasolutions.com>
 <e537c779-8ff0-676d-b642-971f79170f14@benettiengineering.com>
 <752089ce-ee11-84fd-db54-42d46cba7c27@benettiengineering.com>
In-Reply-To: <752089ce-ee11-84fd-db54-42d46cba7c27@benettiengineering.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 9 Sep 2022 08:53:45 +0200
Message-ID: <CABGWkvrYS8KxybPx0W_DMh0ceGEm3rpXsqkmY6bP7LHQFb1Ufw@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=ky3TqoFm8uJ4oXDz7wdajXToqszsQ8gEWCzbL0Wa418=;
 b=QzNY9llWPIxEX0K/JJaNPFXeiVEAS5yrNGBMYHE1mnPcrdjxqkFjsJii+0Ma5LLh+I
 bGVlOBZsUJakAm51wK36oFc5dzb/7cM4QVFb/nfPw6flIL8OLQPLDul6f7ww7TM2Gq1E
 QA0lCa8gqYTDNEL8BMYGEHd5u4vw6+MNEAhH8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=QzNY9llW
Subject: Re: [Buildroot] [PATCH v5 1/2] configs/imx8mn_bsh_smm_s2_defconfig:
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
Cc: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

On Thu, Sep 8, 2022 at 10:21 PM Giulio Benetti
<giulio.benetti@benettiengineering.com> wrote:
>
> I've forgotten:
> please set as superseded the previous 2 patchsets(V3 and V4) in
> patchwork:
> https://patchwork.ozlabs.org/project/buildroot/list/?submitter=83038

Done.

Thanks and regards,
Dario
>
> Thank you!
>
> Best regards
> --
> Giulio Benetti
> Benetti Engineering sas
>
> On 08/09/22 22:09, Giulio Benetti wrote:
> > Hi Dario, Ariel, Michael, All,
> >
> > On 08/09/22 21:19, Dario Binacchi wrote:
> >> BSH SMM S2 (SystemMaster S2) Board is an add-on board which provide
> >> input and output interfaces to a dedicated carrier board. It is designed
> >> mainly to provide graphical/video and connectivity interfaces to the
> >> appliance.
> >>
> >> Board support package includes the following components:
> >> - mainline Linux kernel 5.19.7
> >> - mainline U-Boot 2022-07
> >> - default packages from buildroot
> >>
> >> Patches applied to the Linux kernel and U-Boot have been submitted but
> >> not merged yet.
> >>
> >> https://www.apertis.org/reference_hardware/imx8mn_bsh_smm_s2pro_setup/
> >> The smm s2 board is basically the same as the pro except it boots from
> >> NAND instead of eMMC.
> >>
> >> Co-authored-by: Michael Trimarchi <michael@amarulasolutions.com>
> >> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> >> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > It looks all good to me now and I've rebuilt with utils/docker-run
> > successfully, so:
> > Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> >
> > I've also rebuilt successfully imx8mn_bsh_smm_s2_pro_defconfig.
> >
> > Best regards!
>


-- 

Dario Binacchi

Embedded Linux Developer

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
